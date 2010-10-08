From: sugumar <sugumar@ti.com>
Subject: [PATCH 4/4] davinci: da850/omap-l138 evm: Platform support for backlight driver
Date: Fri,  8 Oct 2010 18:48:01 +0530
Message-ID: <1286543881-32141-1-git-send-email-sugumar@ti.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: davinci-linux-open-source@linux.davincidsp.com, sugumar <sugumar@ti.com>

on DA850/OMAP-L138 EVM, eCAP module is used to control the LCD
backlight. This patch registers the backlight device as platform device,
confgiures the pins for PWM output and also sets the backlight specific
data such as period, maximum intensity and default brightness.

Signed-off-by: sugumar <sugumar@ti.com>
---
 arch/arm/mach-davinci/board-da850-evm.c |   37 +++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index b280efb..fe88e37 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -37,6 +37,7 @@
 #include <mach/nand.h>
 #include <mach/mux.h>
 
+#include <linux/pwm_backlight.h>
 #define DA850_EVM_PHY_MASK		0x1
 #define DA850_EVM_MDIO_FREQUENCY	2200000 /* PHY bus frequency */
 
@@ -48,6 +49,28 @@
 
 #define DA850_MII_MDIO_CLKEN_PIN	GPIO_TO_PIN(2, 6)
 
+
+#define DAVINCI_BACKLIGHT_MAX_BRIGHTNESS	250
+#define DAVINVI_BACKLIGHT_DEFAULT_BRIGHTNESS	250
+#define DAVINCI_PWM_PERIOD_NANO_SECONDS		(1000000 * 10)
+
+static struct platform_pwm_backlight_data da850evm_backlight_data = {
+	.pwm_id		= "ecap.2",
+	.ch		= 0,
+	.max_brightness	= DAVINCI_BACKLIGHT_MAX_BRIGHTNESS,
+	.dft_brightness	= DAVINVI_BACKLIGHT_DEFAULT_BRIGHTNESS,
+	.pwm_period_ns	= DAVINCI_PWM_PERIOD_NANO_SECONDS,
+};
+
+static struct platform_device da850evm_backlight = {
+	.name	= "pwm-backlight",
+	.id	= -1,
+	.dev	= {
+	.platform_data	= &da850evm_backlight_data,
+	},
+};
+
+
 static struct mtd_partition da850_evm_norflash_partition[] = {
 	{
 		.name           = "bootloaders + env",
@@ -633,6 +656,20 @@ static int __init da850_evm_config_emac(void)
 		pr_warning("da850_evm_init: emac registration failed: %d\n",
 				ret);
 
+	ret = davinci_cfg_reg(DA850_ECAP2_APWM2);
+	if (ret)
+		pr_warning("da850_evm_init:ecap mux failed: %d\n", ret);
+
+	ret = da850_register_ecap();
+	if (ret)
+		pr_warning("da850_evm_init: eCAP registration failed: %d\n",
+			ret);
+
+	ret = platform_device_register(&da850evm_backlight);
+	if (ret)
+		pr_warning("da850_evm_init: backlight device registration "
+			"failed: %d\n", ret);
+
 	return 0;
 }
 device_initcall(da850_evm_config_emac);
-- 
1.5.6
