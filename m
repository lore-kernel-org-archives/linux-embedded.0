From: sugumar <sugumar@ti.com>
Subject: [PATCH 1/4] davinci: da8xx: eCAP driver for PWM signal generation
Date: Fri,  8 Oct 2010 18:47:06 +0530
Message-ID: <1286543826-32050-1-git-send-email-sugumar@ti.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: davinci-linux-open-source@linux.davincidsp.com, sugumar <sugumar@ti.com>

OMAPL138/DA850 contains three instances of eCAP module. Each eCAP
module has one dedicated pin that can be used either in capture
mode(input) or in PWM mode. For more information on eCAP module
operation, please refer to the following url.

	http://focus.ti.com/lit/ug/sprufl2a/sprufl2a.pdf

This patch adds eCAP driver support for PWM signal generation.

Signed-off-by: sugumar <sugumar@ti.com>
---
 drivers/pwm/Kconfig  |   10 ++
 drivers/pwm/Makefile |    1 +
 drivers/pwm/ecap.c   |  330 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 341 insertions(+), 0 deletions(-)
 create mode 100644 drivers/pwm/ecap.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index def003b..6f32dd6 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -33,4 +33,14 @@ config GPIO_PWM
          This option enables a single-channel PWM device using
 	 a kernel interval timer and a GPIO pin.  If unsure, say N.
 
+config ECAP_PWM
+	tristate "eCAP PWM support"
+	depends on ARCH_DAVINCI_DA8XX
+	help
+	  This option enables device driver support for eCAP module found
+	  on DA8xx Processors. eCAP module is used to geenrate wide range
+	  of PWM waveforms. Maximum frequency generated is equal to half
+	  the system clock frequency.
+	  Say Y to enable the eCAP support. If you want to build it as a
+	  module, Say M.
 endif
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 03ae2cd..6f02c9b 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_GENERIC_PWM)	+= pwm.o
 obj-$(CONFIG_ATMEL_PWM)		+= atmel-pwm.o
 obj-$(CONFIG_PXA_PWM)		+= pxa-pwm.o
 obj-$(CONFIG_GPIO_PWM)		+= gpio.o
+obj-$(CONFIG_ECAP_PWM)		+= ecap.o
diff --git a/drivers/pwm/ecap.c b/drivers/pwm/ecap.c
new file mode 100644
index 0000000..763586e
--- /dev/null
+++ b/drivers/pwm/ecap.c
@@ -0,0 +1,330 @@
+/*
+ * eCAP driver for PWM output generation
+ *
+ * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation version 2.
+ *
+ * This program is distributed .as is. WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/pwm/pwm.h>
+#include <linux/slab.h>
+
+#define TIMER_CTR_REG			0x0
+#define CAPTURE_2_REG			0x0c
+#define CAPTURE_3_REG			0x10
+#define CAPTURE_4_REG			0x14
+#define CAPTURE_CTRL2_REG		0x2A
+
+#define ECTRL2_SYNCOSEL_MASK		(0x03 << 6)
+
+#define ECTRL2_MDSL_ECAP		BIT(9)
+#define ECTRL2_CTRSTP_FREERUN		BIT(4)
+#define ECTRL2_PLSL_LOW			BIT(10)
+#define ECTRL2_SYNC_EN			BIT(5)
+
+struct ecap_pwm {
+	struct pwm_device	pwm;
+	spinlock_t	lock;
+	struct clk	*clk;
+	int	clk_enabled;
+	void __iomem	*mmio_base;
+};
+
+static inline struct ecap_pwm *to_ecap_pwm(const struct pwm_channel *p)
+{
+	return container_of(p->pwm, struct ecap_pwm, pwm);
+}
+
+static int ecap_pwm_stop(struct pwm_channel *p)
+{
+	unsigned long flags;
+	struct ecap_pwm *ep = to_ecap_pwm(p);
+
+	clk_enable(ep->clk);
+
+	spin_lock_irqsave(&p->lock, flags);
+	__raw_writew(__raw_readw(ep->mmio_base + CAPTURE_CTRL2_REG) &
+		~BIT(4), ep->mmio_base + CAPTURE_CTRL2_REG);
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	clk_disable(ep->clk);
+	if (ep->clk_enabled) {
+		clk_disable(ep->clk);
+		ep->clk_enabled = 0;
+	}
+
+	return 0;
+}
+
+static int ecap_pwm_start(struct pwm_channel *p)
+{
+	int ret = 0;
+	unsigned long flags;
+	struct ecap_pwm *ep = to_ecap_pwm(p);
+
+	clk_enable(ep->clk);
+
+	spin_lock_irqsave(&p->lock, flags);
+	__raw_writew(__raw_readw(ep->mmio_base + CAPTURE_CTRL2_REG) |
+		BIT(4), ep->mmio_base + CAPTURE_CTRL2_REG);
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	clk_disable(ep->clk);
+	if (!ep->clk_enabled) {
+		ret = clk_enable(ep->clk);
+		if (ret)
+			return ret;
+		ep->clk_enabled = 1;
+	}
+
+	return ret;
+}
+
+static int ecap_pwm_set_polarity(struct pwm_channel *p, char pol)
+{
+	unsigned long flags;
+	struct ecap_pwm *ep = to_ecap_pwm(p);
+
+	clk_enable(ep->clk);
+
+	spin_lock_irqsave(&p->lock, flags);
+	 __raw_writew(__raw_readw(ep->mmio_base + CAPTURE_CTRL2_REG) &
+		 (~BIT(10) | pol), ep->mmio_base + CAPTURE_CTRL2_REG);
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	clk_disable(ep->clk);
+	return 0;
+}
+
+static int ecap_pwm_unsynchronize(struct pwm_channel *p)
+{
+	unsigned long flags;
+	struct ecap_pwm *ep = to_ecap_pwm(p);
+
+	clk_enable(ep->clk);
+
+	spin_lock_irqsave(&p->lock, flags);
+	 __raw_writew(__raw_readw(ep->mmio_base + CAPTURE_CTRL2_REG) &
+		 (~ECTRL2_SYNCOSEL_MASK | 0x2 << 6) & ~ECTRL2_SYNC_EN,
+			ep->mmio_base + CAPTURE_CTRL2_REG);
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	clk_disable(ep->clk);
+	return 0;
+}
+
+static int ecap_pwm_synchronize(struct pwm_channel *p)
+{
+	unsigned long flags;
+	struct ecap_pwm *ep = to_ecap_pwm(p);
+
+	clk_enable(ep->clk);
+
+	spin_lock_irqsave(&p->lock, flags);
+	 __raw_writew(__raw_readw(ep->mmio_base + CAPTURE_CTRL2_REG) &
+		 ((~ECTRL2_SYNCOSEL_MASK) | ECTRL2_SYNC_EN),
+			ep->mmio_base + CAPTURE_CTRL2_REG);
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	clk_disable(ep->clk);
+	return 0;
+}
+
+static int ecap_pwm_config_period(struct pwm_channel *p)
+{
+	unsigned long flags;
+	struct ecap_pwm *ep = to_ecap_pwm(p);
+
+	 clk_enable(ep->clk);
+
+	spin_lock_irqsave(&p->lock, flags);
+	__raw_writel((p->period_ticks) - 1, ep->mmio_base + CAPTURE_3_REG);
+	__raw_writew(ECTRL2_MDSL_ECAP | ECTRL2_SYNCOSEL_MASK |
+		 ECTRL2_CTRSTP_FREERUN, ep->mmio_base + CAPTURE_CTRL2_REG);
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	clk_disable(ep->clk);
+	return 0;
+}
+
+
+static int ecap_pwm_config_duty(struct pwm_channel *p)
+{
+	unsigned long flags;
+	struct ecap_pwm *ep = to_ecap_pwm(p);
+
+	clk_enable(ep->clk);
+
+	spin_lock_irqsave(&p->lock, flags);
+	__raw_writew(ECTRL2_MDSL_ECAP | ECTRL2_SYNCOSEL_MASK |
+	 ECTRL2_CTRSTP_FREERUN, ep->mmio_base + CAPTURE_CTRL2_REG);
+	if (p->duty_ticks > 0) {
+		__raw_writel(p->duty_ticks, ep->mmio_base + CAPTURE_4_REG);
+	} else {
+	__raw_writel(p->duty_ticks, ep->mmio_base + CAPTURE_2_REG);
+	__raw_writel(0, ep->mmio_base + TIMER_CTR_REG);
+	}
+	spin_unlock_irqrestore(&p->lock, flags);
+
+	clk_disable(ep->clk);
+	return 0;
+}
+
+static int ecap_pwm_config(struct pwm_channel *p,
+				struct pwm_channel_config *c)
+{
+	int ret = 0;
+	switch (c->config_mask) {
+
+	case PWM_CONFIG_DUTY_TICKS:
+		p->duty_ticks = c->duty_ticks;
+		ret = ecap_pwm_config_duty(p);
+		break;
+
+	case PWM_CONFIG_PERIOD_TICKS:
+		p->period_ticks = c->period_ticks;
+		ret = ecap_pwm_config_period(p);
+		break;
+
+	case PWM_CONFIG_POLARITY:
+		ret = ecap_pwm_set_polarity(p, c->polarity);
+		break;
+
+	case PWM_CONFIG_START:
+		ret = ecap_pwm_start(p);
+		break;
+
+	case PWM_CONFIG_STOP:
+		ret = ecap_pwm_stop(p);
+		break;
+	}
+
+	return ret;
+}
+
+static int ecap_pwm_request(struct pwm_channel *p)
+{
+	struct ecap_pwm *ep = to_ecap_pwm(p);
+
+	p->tick_hz = clk_get_rate(ep->clk);
+	return 0;
+}
+
+static int __init ecap_probe(struct platform_device *pdev)
+{
+	struct ecap_pwm *ep = NULL;
+	struct resource *r;
+	int ret = 0;
+
+	ep = kzalloc(sizeof(*ep), GFP_KERNEL);
+	if (!ep) {
+		dev_err(&pdev->dev, "failed to allocate memory\n");
+		ret = -ENOMEM;
+		goto err_ecap_pwm_alloc;
+	}
+
+	ep->clk = clk_get(&pdev->dev, "ecap");
+	if (IS_ERR(ep->clk)) {
+		ret = PTR_ERR(ep->clk);
+		goto err_free;
+	}
+
+	spin_lock_init(&ep->lock);
+	ep->pwm.dev = &pdev->dev;
+	ep->pwm.bus_id = dev_name(&pdev->dev);
+	ep->pwm.owner = THIS_MODULE;
+	ep->pwm.config = ecap_pwm_config;
+	ep->pwm.request = ecap_pwm_request;
+	ep->pwm.nchan = 1;
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(&pdev->dev, "no memory resource defined\n");
+		ret = -ENODEV;
+		goto err_free_clk;
+	}
+
+	r = request_mem_region(r->start, resource_size(r), pdev->name);
+	if (!r) {
+		dev_err(&pdev->dev, "failed to request memory resource\n");
+		ret = -EBUSY;
+		goto err_free_clk;
+	}
+
+	ep->mmio_base = ioremap(r->start, resource_size(r));
+	if (!ep->mmio_base) {
+		dev_err(&pdev->dev, "failed to ioremap() registers\n");
+		ret = -ENODEV;
+		goto err_free_mem;
+	}
+
+	ret =  pwm_register(&ep->pwm);
+	platform_set_drvdata(pdev, ep);
+	return 0;
+
+err_free_mem:
+	release_mem_region(r->start, resource_size(r));
+err_free_clk:
+	clk_put(ep->clk);
+err_free:
+	kfree(ep);
+err_ecap_pwm_alloc:
+	return ret;
+}
+
+static int __devexit ecap_remove(struct platform_device *pdev)
+{
+	struct ecap_pwm *ep = platform_get_drvdata(pdev);
+	struct resource *r;
+
+	ep = platform_get_drvdata(pdev);
+	if (!ep)
+		return -ENODEV;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	release_mem_region(r->start, resource_size(r));
+	platform_set_drvdata(pdev, NULL);
+	pwm_unregister(&ep->pwm);
+	iounmap(ep->mmio_base);
+	clk_put(ep->clk);
+	kfree(ep);
+
+	return 0;
+}
+
+static struct platform_driver ecap_driver = {
+	.driver	= {
+		.name	= "ecap",
+		.owner	= THIS_MODULE,
+	},
+	.probe	= ecap_probe,
+	.remove	= __devexit_p(ecap_remove),
+};
+
+static int __init ecap_init(void)
+{
+	return platform_driver_register(&ecap_driver);
+}
+
+static void __exit ecap_exit(void)
+{
+	platform_driver_unregister(&ecap_driver);
+}
+
+module_init(ecap_init);
+module_exit(ecap_exit);
+
+MODULE_AUTHOR("sugumar <sugumar@ti.com>");
+MODULE_ALIAS("platform:ecap");
+MODULE_LICENSE("GPL v2");
-- 
1.5.6
