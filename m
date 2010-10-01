From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM 08/10] Initial support for PXA PWM peripheral; compile-tested only
Date: Fri,  1 Oct 2010 10:17:49 -0500
Message-ID: <1285946271-17728-8-git-send-email-bgat__4144.11089518598$1285947958$gmane$org@billgatliff.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org, linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>

Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
---
 drivers/pwm/pxa-pwm.c |  322 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 322 insertions(+), 0 deletions(-)
 create mode 100644 drivers/pwm/pxa-pwm.c

diff --git a/drivers/pwm/pxa-pwm.c b/drivers/pwm/pxa-pwm.c
new file mode 100644
index 0000000..937ab41
--- /dev/null
+++ b/drivers/pwm/pxa-pwm.c
@@ -0,0 +1,322 @@
+/*
+ * drivers/pwm/pxa-pwm.c
+ *
+ * Driver for PXA PWM controllers
+ *
+ * Copyright (c) 2010 Bill Gatliff <bgat@billgatliff.com>
+ * Copyright (c) 2008 Eric Miao (eric.miao@marvell.com>
+ *
+ * This program is free software; you may redistribute and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/pwm/pwm.h>
+
+#include <asm/div64.h>
+
+#define HAS_SECONDARY_PWM	0x10
+
+static const struct platform_device_id pxa_pwm_id_table[] = {
+	/*   PWM    has_secondary_pwm? */
+	{ "pxa25x-pwm", 0 },
+	{ "pxa27x-pwm", 0 | HAS_SECONDARY_PWM },
+	{ "pxa168-pwm", 1 },
+	{ "pxa910-pwm", 1 },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, pxa_pwm_id_table);
+
+/* PWM registers and bits definitions */
+enum {
+	PWMCR = 0,
+	PWMDCR = 0x4,
+	PWMPCR = 0x8,
+
+	PWMCR_SD = (1 << 6),
+	PWMDCR_FD = (1 << 10),
+};
+
+struct pxa_pwm {
+	struct pwm_device	pwm;
+	spinlock_t		lock;
+
+	struct clk	*clk;
+	int		clk_enabled;
+	void __iomem	*mmio_base;
+};
+
+static inline struct pxa_pwm *to_pxa_pwm(const struct pwm_channel *p)
+{
+	return container_of(p->pwm, struct pxa_pwm, pwm);
+}
+
+static inline int __pxa_pwm_enable(struct pwm_channel *p)
+{
+	struct pxa_pwm *pxa = to_pxa_pwm(p);
+	int ret = 0;
+
+	/* TODO: does the hardware really permit independent control
+	 * of both the primary and secondary (if present) channels?
+	 * According to Eric Miao's code, it doesn't--- or he didn't
+	 * use it that way.  Revisit, looking for ways to
+	 * independently control either channel.
+	 */
+
+	if (!pxa->clk_enabled) {
+		ret = clk_enable(pxa->clk);
+		if (ret)
+			return ret;
+
+		pxa->clk_enabled = 1;
+	}
+
+	return ret;
+}
+
+static inline int __pxa_pwm_disable(struct pwm_channel *p)
+{
+	struct pxa_pwm *pxa = to_pxa_pwm(p);
+
+	/* TODO: This is how Eric Miao did it, but I'm concerned that
+	 * this won't always drive the PWM output signal to its
+	 * inactive state. Revisit.
+	 */
+
+	if (pxa->clk_enabled) {
+		clk_disable(pxa->clk);
+		pxa->clk_enabled = 0;
+	}
+
+	return 0;
+}
+
+/*
+ * period_ns = 10^9 * (PRESCALE + 1) * (PV + 1) / PWM_CLK_RATE
+ * duty_ns   = 10^9 * (PRESCALE + 1) * DC / PWM_CLK_RATE
+ */
+static int __pxa_config_duty_ticks(struct pwm_channel *p,
+				   struct pwm_channel_config *c)
+{
+	struct pxa_pwm *pxa = to_pxa_pwm(p);
+	void *io;
+
+	p->duty_ticks = c->duty_ticks;
+	io = pxa->mmio_base + (p->chan * 0x10);
+
+	/* NOTE: The clock to the PWM peripheral must be running in
+	 * order to write to the peripheral control registers.
+	 *
+	 * TODO: What does setting PWMPC == PWMDC do? What about PWMDC
+	 * == 0 and/or PWMPC == 0?  Investigate.
+	 */
+	clk_enable(pxa->clk);
+	if (p->duty_ticks == p->period_ticks)
+		__raw_writel(PWMDCR_FD, io + PWMDCR);
+	else
+		__raw_writel(p->duty_ticks, io + PWMDCR);
+	clk_disable(pxa->clk);
+
+	return 0;
+}
+
+static int __pxa_config_period_ticks(struct pwm_channel *p,
+				     struct pwm_channel_config *c)
+{
+	struct pxa_pwm *pxa = to_pxa_pwm(p);
+	void *io;
+	unsigned long prescale, pv;
+
+	prescale = (c->period_ticks - 1) / 1024;
+	if (prescale > 63)
+		return -EINVAL;
+
+	pv = c->period_ticks / (prescale + 1) - 1;
+	p->period_ticks = c->period_ticks;
+
+	io = pxa->mmio_base + (p->chan * 0x10);
+
+	/* NOTE: the clock to PWM has to be enabled first
+	 * before writing to the registers.
+	 *
+	 * TODO: see also the TODOs in __pxa_config_duty_ticks().
+	 */
+	clk_enable(pxa->clk);
+	__raw_writel(prescale, io + PWMCR);
+	if (p->period_ticks == p->duty_ticks)
+		__raw_writel(PWMDCR_FD, io + PWMDCR);
+	__raw_writel(pv, io + PWMPCR);
+	clk_disable(pxa->clk);
+
+	return 0;
+}
+
+static int pxa_pwm_request(struct pwm_channel *p)
+{
+	struct pxa_pwm *pxa = to_pxa_pwm(p);
+
+	p->tick_hz = clk_get_rate(pxa->clk);
+	return 0;
+}
+
+
+static int pxa_pwm_config_nosleep(struct pwm_channel *p,
+				  struct pwm_channel_config *c)
+{
+	int ret = 0;
+	unsigned long flags;
+
+	if (!(c->config_mask & (PWM_CONFIG_STOP
+				| PWM_CONFIG_START
+				| PWM_CONFIG_DUTY_TICKS
+				| PWM_CONFIG_PERIOD_TICKS)))
+		return -EINVAL;
+
+	spin_lock_irqsave(&p->lock, flags);
+
+	if (c->config_mask & PWM_CONFIG_STOP)
+		__pxa_pwm_disable(p);
+
+	if (c->config_mask & PWM_CONFIG_PERIOD_TICKS)
+		__pxa_config_period_ticks(p, c);
+
+	if (c->config_mask & PWM_CONFIG_DUTY_TICKS)
+		__pxa_config_duty_ticks(p, c);
+
+	if (c->config_mask & PWM_CONFIG_START)
+		__pxa_pwm_enable(p);
+
+	spin_unlock_irqrestore(&p->lock, flags);
+	return ret;
+}
+
+static int pxa_pwm_config(struct pwm_channel *p,
+			  struct pwm_channel_config *c)
+{
+	return pxa_pwm_config_nosleep(p, c);
+}
+
+static int __init pxa_pwm_probe(struct platform_device *pdev)
+{
+	const struct platform_device_id *id = platform_get_device_id(pdev);
+	struct pxa_pwm *pxa;
+	struct resource *r;
+	int ret = 0;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR_OR_NULL(r)) {
+		dev_err(&pdev->dev, "error, missing mmio_base resource\n");
+		return -EINVAL;
+	}
+
+	r = request_mem_region(r->start, resource_size(r), pdev->name);
+	if (IS_ERR_OR_NULL(r)) {
+		dev_err(&pdev->dev, "error, failed to request mmio_base resource\n");
+		return -EBUSY;
+	}
+
+	pxa = kzalloc(sizeof *pxa, GFP_KERNEL);
+	if (IS_ERR_OR_NULL(pxa)) {
+		dev_err(&pdev->dev, "failed to allocate memory\n");
+		ret = -ENOMEM;
+		goto err_kzalloc;
+	}
+
+	pxa->mmio_base = ioremap(r->start, resource_size(r));
+	if (IS_ERR_OR_NULL(pxa->mmio_base)) {
+		dev_err(&pdev->dev, "error, failed to ioremap() registers\n");
+		ret = -ENODEV;
+		goto err_ioremap;
+	}
+
+	pxa->clk = clk_get(&pdev->dev, NULL);
+	if (IS_ERR_OR_NULL(pxa->clk)) {
+		ret = PTR_ERR(pxa->clk);
+		if (!ret)
+			ret = -EINVAL;
+		goto err_clk_get;
+	}
+	pxa->clk_enabled = 0;
+
+	spin_lock_init(&pxa->lock);
+
+	pxa->pwm.dev = &pdev->dev;
+	pxa->pwm.bus_id = dev_name(&pdev->dev);
+	pxa->pwm.owner = THIS_MODULE;
+	pxa->pwm.request = pxa_pwm_request;
+	pxa->pwm.config_nosleep = pxa_pwm_config_nosleep;
+	pxa->pwm.config = pxa_pwm_config;
+
+	if (id->driver_data & HAS_SECONDARY_PWM)
+		pxa->pwm.nchan = 2;
+	else
+		pxa->pwm.nchan = 1;
+
+	ret =  pwm_register(&pxa->pwm);
+
+	if (ret)
+		goto err_pwm_register;
+
+	platform_set_drvdata(pdev, pxa);
+	return 0;
+
+err_pwm_register:
+	clk_put(pxa->clk);
+err_clk_get:
+	iounmap(pxa->mmio_base);
+err_ioremap:
+	kfree(pxa);
+err_kzalloc:
+	release_mem_region(r->start, resource_size(r));
+	return ret;
+}
+
+static int __exit pxa_pwm_remove(struct platform_device *pdev)
+{
+	struct pxa_pwm *pxa = platform_get_drvdata(pdev);
+
+	if (IS_ERR_OR_NULL(pxa))
+		return -ENODEV;
+
+	pwm_unregister(&pxa->pwm);
+	clk_put(pxa->clk);
+	iounmap(pxa->mmio_base);
+	kfree(pxa);
+	platform_set_drvdata(pdev, NULL);
+	return 0;
+}
+
+static struct platform_driver pwm_driver = {
+	.driver		= {
+		.name	= "pxa25x-pwm",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= pxa_pwm_probe,
+	.remove		= pxa_pwm_remove,
+	.id_table	= pxa_pwm_id_table,
+};
+
+static int __init pxa_pwm_init(void)
+{
+	return platform_driver_register(&pwm_driver);
+}
+/* TODO: do we have to do this at arch_initcall? */
+module_init(pxa_pwm_init);
+
+static void __exit pxa_pwm_exit(void)
+{
+	platform_driver_unregister(&pwm_driver);
+}
+module_exit(pxa_pwm_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Bill Gatliff <bgat@billgatliff.com>");
+MODULE_AUTHOR("Eric Miao (eric.miao@marvell.com>");
+MODULE_DESCRIPTION("Platform and PWM API drivers for PXA PWM peripheral");
-- 
1.7.1
