From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM 04/10] Implements PWM-based LED control
Date: Fri,  1 Oct 2010 10:17:45 -0500
Message-ID: <1285946271-17728-4-git-send-email-bgat@billgatliff.com>
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
 drivers/leds/Kconfig        |   19 +++-
 drivers/leds/leds-pwm.c     |  224 +++++++++++++++++++++++-------------------
 include/linux/pwm/pwm-led.h |   33 +++++++
 3 files changed, 169 insertions(+), 107 deletions(-)
 create mode 100644 include/linux/pwm/pwm-led.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index e411262..3af2cde 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -26,12 +26,19 @@ config LEDS_88PM860X
 	  This option enables support for on-chip LED drivers found on Marvell
 	  Semiconductor 88PM8606 PMIC.
 
-config LEDS_ATMEL_PWM
-	tristate "LED Support using Atmel PWM outputs"
-	depends on ATMEL_PWM
-	help
-	  This option enables support for LEDs driven using outputs
-	  of the dedicated PWM controller found on newer Atmel SOCs.
+config LEDS_PWM
+       tristate "Support for LEDs connected to Generic PWM channels"
+       depends on LEDS_CLASS && GENERIC_PWM
+       help
+         Enables support for LEDs connected to PWM devices that
+	 conform to the Generic PWM API.  This API allows drivers
+	 to adjust the brightness of the LED by varying the duty
+	 cycle of the signal at the PWM channel output, using PWM API
+	 commands, rather than merely turning them on and off.
+
+	 If your platform has devices with drivers that implement
+	 the Generic PWM API, and those devices have outputs that
+	 are connected to LEDs, then you probably want to say 'Y' here.
 
 config LEDS_LOCOMO
 	tristate "LED Support for Locomo device"
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index da3fa8d..ab064ac 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -1,153 +1,175 @@
 /*
- * linux/drivers/leds-pwm.c
+ * drivers/leds/leds-pwm.c
  *
- * simple PWM based LED control
+ * Copyright (C) 2010 Bill Gatliff <bgat@billgatliff.com>
+ * Copyright (C) 2009 Loutao Fu, Pengutronix <l.fu@pengutronix.de>
  *
- * Copyright 2009 Luotao Fu @ Pengutronix (l.fu@pengutronix.de)
+ * Based on leds-gpio.c by Raphael Assenat <raph@8d.com>
  *
- * based on leds-gpio.c by Raphael Assenat <raph@8d.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
+ * This program is Free Software.  You may redistribute and/or modify
+ * it under the terms of the GNU General Public License version 2, as
  * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+ * USA
  */
-
-#include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/fb.h>
-#include <linux/leds.h>
-#include <linux/err.h>
-#include <linux/pwm.h>
-#include <linux/leds_pwm.h>
 #include <linux/slab.h>
-
-struct led_pwm_data {
-	struct led_classdev	cdev;
-	struct pwm_device	*pwm;
-	unsigned int 		active_low;
-	unsigned int		period;
+#include <linux/leds.h>
+#include <linux/io.h>
+#include <linux/pwm/pwm.h>
+#include <linux/pwm/pwm-led.h>
+
+struct led_pwm {
+	struct led_classdev	led;
+	struct pwm_channel	*pwm;
+	int percent;
 };
 
-static void led_pwm_set(struct led_classdev *led_cdev,
-	enum led_brightness brightness)
+static inline struct led_pwm *to_led_pwm(const struct led_classdev *c)
+{
+	return container_of(c, struct led_pwm, led);
+}
+
+static void
+led_pwm_brightness_set(struct led_classdev *c,
+		       enum led_brightness b)
+{
+	struct led_pwm *led = to_led_pwm(c);
+	int percent;
+
+	percent = (b * 100) / (LED_FULL - LED_OFF);
+	led->percent = percent;
+	pwm_set_duty_percent(led->pwm, percent);
+}
+
+static enum led_brightness
+led_pwm_brightness_get(struct led_classdev *c)
 {
-	struct led_pwm_data *led_dat =
-		container_of(led_cdev, struct led_pwm_data, cdev);
-	unsigned int max = led_dat->cdev.max_brightness;
-	unsigned int period =  led_dat->period;
-
-	if (brightness == 0) {
-		pwm_config(led_dat->pwm, 0, period);
-		pwm_disable(led_dat->pwm);
-	} else {
-		pwm_config(led_dat->pwm, brightness * period / max, period);
-		pwm_enable(led_dat->pwm);
+	struct led_pwm *led = to_led_pwm(c);
+	return led->percent;
+}
+
+static int
+led_pwm_blink_set(struct led_classdev *c,
+		  unsigned long *on_ms,
+		  unsigned long *off_ms)
+{
+	struct led_pwm *led = to_led_pwm(c);
+	struct pwm_channel_config cfg;
+
+	if (*on_ms == 0 && *off_ms == 0) {
+		*on_ms = 1000UL;
+		*off_ms = 1000UL;
 	}
+
+	cfg.config_mask = PWM_CONFIG_DUTY_NS
+		| PWM_CONFIG_PERIOD_NS;
+
+	cfg.duty_ns = *on_ms * 1000000UL;
+	cfg.period_ns = (*on_ms + *off_ms) * 1000000UL;
+
+	return pwm_config(led->pwm, &cfg);
 }
 
-static int led_pwm_probe(struct platform_device *pdev)
+static int __devinit
+led_pwm_probe(struct platform_device *pdev)
 {
-	struct led_pwm_platform_data *pdata = pdev->dev.platform_data;
-	struct led_pwm *cur_led;
-	struct led_pwm_data *leds_data, *led_dat;
-	int i, ret = 0;
+	struct pwm_led_platform_data *pdata = pdev->dev.platform_data;
+	struct led_pwm *led;
+	int ret;
 
-	if (!pdata)
-		return -EBUSY;
+	if (!pdata || !pdata->led_info)
+		return -EINVAL;
 
-	leds_data = kzalloc(sizeof(struct led_pwm_data) * pdata->num_leds,
-				GFP_KERNEL);
-	if (!leds_data)
+	led = kzalloc(sizeof(*led), GFP_KERNEL);
+	if (!led)
 		return -ENOMEM;
 
-	for (i = 0; i < pdata->num_leds; i++) {
-		cur_led = &pdata->leds[i];
-		led_dat = &leds_data[i];
-
-		led_dat->pwm = pwm_request(cur_led->pwm_id,
-				cur_led->name);
-		if (IS_ERR(led_dat->pwm)) {
-			dev_err(&pdev->dev, "unable to request PWM %d\n",
-					cur_led->pwm_id);
-			goto err;
-		}
-
-		led_dat->cdev.name = cur_led->name;
-		led_dat->cdev.default_trigger = cur_led->default_trigger;
-		led_dat->active_low = cur_led->active_low;
-		led_dat->period = cur_led->pwm_period_ns;
-		led_dat->cdev.brightness_set = led_pwm_set;
-		led_dat->cdev.brightness = LED_OFF;
-		led_dat->cdev.max_brightness = cur_led->max_brightness;
-		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
-
-		ret = led_classdev_register(&pdev->dev, &led_dat->cdev);
-		if (ret < 0) {
-			pwm_free(led_dat->pwm);
-			goto err;
-		}
+	led->pwm = pwm_request(pdata->bus_id, pdata->chan,
+			       pdata->led_info->name);
+	if (!led->pwm) {
+		ret = -EINVAL;
+		goto err_pwm_request;
 	}
 
-	platform_set_drvdata(pdev, leds_data);
+	platform_set_drvdata(pdev, led);
 
-	return 0;
+	led->led.name = pdata->led_info->name;
+	led->led.default_trigger = pdata->led_info->default_trigger;
+	led->led.brightness_set = led_pwm_brightness_set;
+	led->led.brightness_get = led_pwm_brightness_get;
+	led->led.blink_set = led_pwm_blink_set;
+	led->led.brightness = LED_OFF;
 
-err:
-	if (i > 0) {
-		for (i = i - 1; i >= 0; i--) {
-			led_classdev_unregister(&leds_data[i].cdev);
-			pwm_free(leds_data[i].pwm);
-		}
-	}
+	ret = pwm_config(led->pwm, pdata->config);
+	if (ret)
+		goto err_pwm_config;
+	pwm_start(led->pwm);
+
+	ret = led_classdev_register(&pdev->dev, &led->led);
+	if (ret < 0)
+		goto err_classdev_register;
 
-	kfree(leds_data);
+	return 0;
+
+err_classdev_register:
+	pwm_stop(led->pwm);
+err_pwm_config:
+	pwm_release(led->pwm);
+err_pwm_request:
+	kfree(led);
 
 	return ret;
 }
 
-static int __devexit led_pwm_remove(struct platform_device *pdev)
+static int __devexit
+led_pwm_remove(struct platform_device *pdev)
 {
-	int i;
-	struct led_pwm_platform_data *pdata = pdev->dev.platform_data;
-	struct led_pwm_data *leds_data;
+	struct led_pwm *led = platform_get_drvdata(pdev);
 
-	leds_data = platform_get_drvdata(pdev);
+	led_classdev_unregister(&led->led);
 
-	for (i = 0; i < pdata->num_leds; i++) {
-		led_classdev_unregister(&leds_data[i].cdev);
-		pwm_free(leds_data[i].pwm);
+	if (led->pwm) {
+		pwm_stop(led->pwm);
+		pwm_release(led->pwm);
 	}
 
-	kfree(leds_data);
+	kfree(led);
 
 	return 0;
 }
 
 static struct platform_driver led_pwm_driver = {
-	.probe		= led_pwm_probe,
-	.remove		= __devexit_p(led_pwm_remove),
-	.driver		= {
-		.name	= "leds_pwm",
-		.owner	= THIS_MODULE,
+	.driver = {
+		.name =		"leds-pwm",
+		.owner =	THIS_MODULE,
 	},
+	.probe = led_pwm_probe,
+	.remove = led_pwm_remove,
 };
 
-static int __init led_pwm_init(void)
+static int __init led_pwm_modinit(void)
 {
 	return platform_driver_register(&led_pwm_driver);
 }
+module_init(led_pwm_modinit);
 
-static void __exit led_pwm_exit(void)
+static void __exit led_pwm_modexit(void)
 {
 	platform_driver_unregister(&led_pwm_driver);
 }
+module_exit(led_pwm_modexit);
 
-module_init(led_pwm_init);
-module_exit(led_pwm_exit);
-
-MODULE_AUTHOR("Luotao Fu <l.fu@pengutronix.de>");
-MODULE_DESCRIPTION("PWM LED driver for PXA");
+MODULE_AUTHOR("Bill Gatliff <bgat@billgatliff.com>");
+MODULE_DESCRIPTION("Driver for LEDs with PWM-controlled brightness");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:leds-pwm");
diff --git a/include/linux/pwm/pwm-led.h b/include/linux/pwm/pwm-led.h
new file mode 100644
index 0000000..8ffeecc
--- /dev/null
+++ b/include/linux/pwm/pwm-led.h
@@ -0,0 +1,33 @@
+/*
+ * include/linux/pwm-led.h
+ *
+ * Copyright (C) 2008 Bill Gatliff <bgat@billgatliff.com>
+ *
+ * This program is free software; you may redistribute and/or modify
+ * it under the terms of the GNU General Public License version 2, as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+ * USA
+ */
+#ifndef __LINUX_PWM_LED_H
+#define __LINUX_PWM_LED_H
+
+struct led_info;
+struct pwm_channel_config;
+
+struct pwm_led_platform_data {
+	const char *bus_id;
+	int chan;
+	struct pwm_channel_config *config;
+	struct led_info *led_info;
+};
+
+#endif /* __LINUX_PWM_LED_H */
-- 
1.7.1
