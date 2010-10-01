From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM 10/10] Expunge previous driver for PXA PWM
Date: Fri,  1 Oct 2010 10:17:51 -0500
Message-ID: <1285946271-17728-10-git-send-email-bgat@billgatliff.com>
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
 arch/arm/mach-pxa/Kconfig  |   26 ++--
 arch/arm/plat-pxa/Makefile |    1 -
 arch/arm/plat-pxa/pwm.c    |  304 --------------------------------------------
 drivers/pwm/Kconfig        |    8 +
 drivers/pwm/Makefile       |    1 +
 5 files changed, 22 insertions(+), 318 deletions(-)
 delete mode 100644 arch/arm/plat-pxa/pwm.c

diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 7aefb90..74a55fd 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -13,13 +13,13 @@ config ARCH_LUBBOCK
 config MACH_MAINSTONE
 	bool "Intel HCDDBBVA0 Development Platform (aka Mainstone)"
 	select PXA27x
-	select HAVE_PWM
+	select GENERIC_PWM
 	select PXA_HAVE_BOARD_IRQS
 
 config MACH_ZYLONITE
 	bool
 	select PXA3xx
-	select HAVE_PWM
+	select GENERIC_PWM
 	select PXA_HAVE_BOARD_IRQS
 
 config MACH_ZYLONITE300
@@ -60,7 +60,7 @@ config ARCH_VIPER
 	select PXA25x
 	select ISA
 	select I2C_GPIO
-	select HAVE_PWM
+	select GENERIC_PWM
 	select PXA_HAVE_BOARD_IRQS
 	select PXA_HAVE_ISA_IRQS
 	select ARCOM_PCMCIA
@@ -110,7 +110,7 @@ config MACH_CM_X300
 	select PXA3xx
 	select CPU_PXA300
 	select CPU_PXA310
-	select HAVE_PWM
+	select GENERIC_PWM
 
 config MACH_CAPC7117
 	bool "Embedian CAPC-7117 evaluation kit based on the MXM-8x10 CoM"
@@ -205,7 +205,7 @@ config TRIZEPS_PCMCIA
 config MACH_LOGICPD_PXA270
 	bool "LogicPD PXA270 Card Engine Development Platform"
 	select PXA27x
-	select HAVE_PWM
+	select GENERIC_PWM
 	select PXA_HAVE_BOARD_IRQS
 
 config MACH_PCM027
@@ -216,7 +216,7 @@ config MACH_PCM027
 
 config MACH_PCM990_BASEBOARD
 	bool "PHYTEC PCM-990 development board"
-	select HAVE_PWM
+	select GENERIC_PWM
 	depends on MACH_PCM027
 
 choice
@@ -273,7 +273,7 @@ config MACH_H4700
 	bool "HP iPAQ hx4700"
 	select PXA27x
 	select IWMMXT
-	select HAVE_PWM
+	select GENERIC_PWM
 	select PXA_HAVE_BOARD_IRQS
 
 config MACH_H5000
@@ -288,14 +288,14 @@ config MACH_MAGICIAN
 	bool "Enable HTC Magician Support"
 	select PXA27x
 	select IWMMXT
-	select HAVE_PWM
+	select GENERIC_PWM
 	select PXA_HAVE_BOARD_IRQS
 
 config MACH_MIOA701
 	bool "Mitac Mio A701 Support"
 	select PXA27x
 	select IWMMXT
-	select HAVE_PWM
+	select GENERIC_PWM
 	select GPIO_SYSFS
 	help
 	  Say Y here if you intend to run this kernel on a
@@ -306,7 +306,7 @@ config PXA_EZX
 	bool "Motorola EZX Platform"
 	select PXA27x
 	select IWMMXT
-	select HAVE_PWM
+	select GENERIC_PWM
 	select PXA_HAVE_BOARD_IRQS
 
 config MACH_EZX_A780
@@ -345,7 +345,7 @@ config MACH_MP900C
 
 config ARCH_PXA_PALM
 	bool "PXA based Palm PDAs"
-	select HAVE_PWM
+	select GENERIC_PWM
 
 config MACH_PALM27X
 	bool
@@ -442,7 +442,7 @@ config MACH_RAUMFELD_RC
 	bool "Raumfeld Controller"
 	select PXA3xx
 	select CPU_PXA300
-	select HAVE_PWM
+	select GENERIC_PWM
 
 config MACH_RAUMFELD_CONNECTOR
 	bool "Raumfeld Connector"
@@ -605,7 +605,7 @@ config MACH_E800
 config MACH_ZIPIT2
 	bool "Zipit Z2 Handheld"
 	select PXA27x
-	select HAVE_PWM
+	select GENERIC_PWM
 	select PXA_HAVE_BOARD_IRQS
 
 endmenu
diff --git a/arch/arm/plat-pxa/Makefile b/arch/arm/plat-pxa/Makefile
index 4aacdd1..35ced88 100644
--- a/arch/arm/plat-pxa/Makefile
+++ b/arch/arm/plat-pxa/Makefile
@@ -8,5 +8,4 @@ obj-$(CONFIG_GENERIC_GPIO)	+= gpio.o
 obj-$(CONFIG_PXA3xx)		+= mfp.o
 obj-$(CONFIG_ARCH_MMP)		+= mfp.o
 
-obj-$(CONFIG_HAVE_PWM)		+= pwm.o
 obj-$(CONFIG_PXA_SSP)		+= ssp.o
diff --git a/arch/arm/plat-pxa/pwm.c b/arch/arm/plat-pxa/pwm.c
deleted file mode 100644
index ef32686..0000000
--- a/arch/arm/plat-pxa/pwm.c
+++ /dev/null
@@ -1,304 +0,0 @@
-/*
- * linux/arch/arm/mach-pxa/pwm.c
- *
- * simple driver for PWM (Pulse Width Modulator) controller
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * 2008-02-13	initial version
- * 		eric miao <eric.miao@marvell.com>
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/err.h>
-#include <linux/clk.h>
-#include <linux/io.h>
-#include <linux/pwm.h>
-
-#include <asm/div64.h>
-
-#define HAS_SECONDARY_PWM	0x10
-#define PWM_ID_BASE(d)		((d) & 0xf)
-
-static const struct platform_device_id pwm_id_table[] = {
-	/*   PWM    has_secondary_pwm? */
-	{ "pxa25x-pwm", 0 },
-	{ "pxa27x-pwm", 0 | HAS_SECONDARY_PWM },
-	{ "pxa168-pwm", 1 },
-	{ "pxa910-pwm", 1 },
-	{ },
-};
-MODULE_DEVICE_TABLE(platform, pwm_id_table);
-
-/* PWM registers and bits definitions */
-#define PWMCR		(0x00)
-#define PWMDCR		(0x04)
-#define PWMPCR		(0x08)
-
-#define PWMCR_SD	(1 << 6)
-#define PWMDCR_FD	(1 << 10)
-
-struct pwm_device {
-	struct list_head	node;
-	struct pwm_device	*secondary;
-	struct platform_device	*pdev;
-
-	const char	*label;
-	struct clk	*clk;
-	int		clk_enabled;
-	void __iomem	*mmio_base;
-
-	unsigned int	use_count;
-	unsigned int	pwm_id;
-};
-
-/*
- * period_ns = 10^9 * (PRESCALE + 1) * (PV + 1) / PWM_CLK_RATE
- * duty_ns   = 10^9 * (PRESCALE + 1) * DC / PWM_CLK_RATE
- */
-int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns)
-{
-	unsigned long long c;
-	unsigned long period_cycles, prescale, pv, dc;
-
-	if (pwm == NULL || period_ns == 0 || duty_ns > period_ns)
-		return -EINVAL;
-
-	c = clk_get_rate(pwm->clk);
-	c = c * period_ns;
-	do_div(c, 1000000000);
-	period_cycles = c;
-
-	if (period_cycles < 1)
-		period_cycles = 1;
-	prescale = (period_cycles - 1) / 1024;
-	pv = period_cycles / (prescale + 1) - 1;
-
-	if (prescale > 63)
-		return -EINVAL;
-
-	if (duty_ns == period_ns)
-		dc = PWMDCR_FD;
-	else
-		dc = (pv + 1) * duty_ns / period_ns;
-
-	/* NOTE: the clock to PWM has to be enabled first
-	 * before writing to the registers
-	 */
-	clk_enable(pwm->clk);
-	__raw_writel(prescale, pwm->mmio_base + PWMCR);
-	__raw_writel(dc, pwm->mmio_base + PWMDCR);
-	__raw_writel(pv, pwm->mmio_base + PWMPCR);
-	clk_disable(pwm->clk);
-
-	return 0;
-}
-EXPORT_SYMBOL(pwm_config);
-
-int pwm_enable(struct pwm_device *pwm)
-{
-	int rc = 0;
-
-	if (!pwm->clk_enabled) {
-		rc = clk_enable(pwm->clk);
-		if (!rc)
-			pwm->clk_enabled = 1;
-	}
-	return rc;
-}
-EXPORT_SYMBOL(pwm_enable);
-
-void pwm_disable(struct pwm_device *pwm)
-{
-	if (pwm->clk_enabled) {
-		clk_disable(pwm->clk);
-		pwm->clk_enabled = 0;
-	}
-}
-EXPORT_SYMBOL(pwm_disable);
-
-static DEFINE_MUTEX(pwm_lock);
-static LIST_HEAD(pwm_list);
-
-struct pwm_device *pwm_request(int pwm_id, const char *label)
-{
-	struct pwm_device *pwm;
-	int found = 0;
-
-	mutex_lock(&pwm_lock);
-
-	list_for_each_entry(pwm, &pwm_list, node) {
-		if (pwm->pwm_id == pwm_id) {
-			found = 1;
-			break;
-		}
-	}
-
-	if (found) {
-		if (pwm->use_count == 0) {
-			pwm->use_count++;
-			pwm->label = label;
-		} else
-			pwm = ERR_PTR(-EBUSY);
-	} else
-		pwm = ERR_PTR(-ENOENT);
-
-	mutex_unlock(&pwm_lock);
-	return pwm;
-}
-EXPORT_SYMBOL(pwm_request);
-
-void pwm_free(struct pwm_device *pwm)
-{
-	mutex_lock(&pwm_lock);
-
-	if (pwm->use_count) {
-		pwm->use_count--;
-		pwm->label = NULL;
-	} else
-		pr_warning("PWM device already freed\n");
-
-	mutex_unlock(&pwm_lock);
-}
-EXPORT_SYMBOL(pwm_free);
-
-static inline void __add_pwm(struct pwm_device *pwm)
-{
-	mutex_lock(&pwm_lock);
-	list_add_tail(&pwm->node, &pwm_list);
-	mutex_unlock(&pwm_lock);
-}
-
-static int __devinit pwm_probe(struct platform_device *pdev)
-{
-	const struct platform_device_id *id = platform_get_device_id(pdev);
-	struct pwm_device *pwm, *secondary = NULL;
-	struct resource *r;
-	int ret = 0;
-
-	pwm = kzalloc(sizeof(struct pwm_device), GFP_KERNEL);
-	if (pwm == NULL) {
-		dev_err(&pdev->dev, "failed to allocate memory\n");
-		return -ENOMEM;
-	}
-
-	pwm->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(pwm->clk)) {
-		ret = PTR_ERR(pwm->clk);
-		goto err_free;
-	}
-	pwm->clk_enabled = 0;
-
-	pwm->use_count = 0;
-	pwm->pwm_id = PWM_ID_BASE(id->driver_data) + pdev->id;
-	pwm->pdev = pdev;
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (r == NULL) {
-		dev_err(&pdev->dev, "no memory resource defined\n");
-		ret = -ENODEV;
-		goto err_free_clk;
-	}
-
-	r = request_mem_region(r->start, resource_size(r), pdev->name);
-	if (r == NULL) {
-		dev_err(&pdev->dev, "failed to request memory resource\n");
-		ret = -EBUSY;
-		goto err_free_clk;
-	}
-
-	pwm->mmio_base = ioremap(r->start, resource_size(r));
-	if (pwm->mmio_base == NULL) {
-		dev_err(&pdev->dev, "failed to ioremap() registers\n");
-		ret = -ENODEV;
-		goto err_free_mem;
-	}
-
-	if (id->driver_data & HAS_SECONDARY_PWM) {
-		secondary = kzalloc(sizeof(struct pwm_device), GFP_KERNEL);
-		if (secondary == NULL) {
-			ret = -ENOMEM;
-			goto err_free_mem;
-		}
-
-		*secondary = *pwm;
-		pwm->secondary = secondary;
-
-		/* registers for the second PWM has offset of 0x10 */
-		secondary->mmio_base = pwm->mmio_base + 0x10;
-		secondary->pwm_id = pdev->id + 2;
-	}
-
-	__add_pwm(pwm);
-	if (secondary)
-		__add_pwm(secondary);
-
-	platform_set_drvdata(pdev, pwm);
-	return 0;
-
-err_free_mem:
-	release_mem_region(r->start, resource_size(r));
-err_free_clk:
-	clk_put(pwm->clk);
-err_free:
-	kfree(pwm);
-	return ret;
-}
-
-static int __devexit pwm_remove(struct platform_device *pdev)
-{
-	struct pwm_device *pwm;
-	struct resource *r;
-
-	pwm = platform_get_drvdata(pdev);
-	if (pwm == NULL)
-		return -ENODEV;
-
-	mutex_lock(&pwm_lock);
-
-	if (pwm->secondary) {
-		list_del(&pwm->secondary->node);
-		kfree(pwm->secondary);
-	}
-
-	list_del(&pwm->node);
-	mutex_unlock(&pwm_lock);
-
-	iounmap(pwm->mmio_base);
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(r->start, resource_size(r));
-
-	clk_put(pwm->clk);
-	kfree(pwm);
-	return 0;
-}
-
-static struct platform_driver pwm_driver = {
-	.driver		= {
-		.name	= "pxa25x-pwm",
-		.owner	= THIS_MODULE,
-	},
-	.probe		= pwm_probe,
-	.remove		= __devexit_p(pwm_remove),
-	.id_table	= pwm_id_table,
-};
-
-static int __init pwm_init(void)
-{
-	return platform_driver_register(&pwm_driver);
-}
-arch_initcall(pwm_init);
-
-static void __exit pwm_exit(void)
-{
-	platform_driver_unregister(&pwm_driver);
-}
-module_exit(pwm_exit);
-
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 0584c25..def003b 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -19,6 +19,14 @@ config ATMEL_PWM
 	  peripheral channels found on certain Atmel processors.
 	  If unsure, say N.
 
+config PXA_PWM
+        tristate "PXA2xx PWM support"
+	depends on PXA2xx || PXA3xx
+	help
+	  This option enables device driver support for the PWM
+	  peripheral device found on certain PXA2xx/PXA3xx
+	  microcontrollers.  If unsure, say N.
+
 config GPIO_PWM
        tristate "PWM emulation using GPIO"
        help
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 5f29752..03ae2cd 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -3,4 +3,5 @@
 #
 obj-$(CONFIG_GENERIC_PWM)	+= pwm.o
 obj-$(CONFIG_ATMEL_PWM)		+= atmel-pwm.o
+obj-$(CONFIG_PXA_PWM)		+= pxa-pwm.o
 obj-$(CONFIG_GPIO_PWM)		+= gpio.o
-- 
1.7.1
