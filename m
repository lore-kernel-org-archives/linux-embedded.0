From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PATCH 6/6] [PWM] New LED driver and trigger that use PWM API
Date: Wed, 15 Oct 2008 13:14:41 -0500
Message-ID: <fb0cd7f9cf6dadc1316dd67329bf7b38885907c9.1224093510.git.bgat@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <cover.1224093510.git.bgat@billgatliff.com>
In-Reply-To: <cover.1224093510.git.bgat@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>

The leds-pwm driver maps LED API calls into PWM API calls.  Both
brighness_get/set and blink_set are supported.

Some LED API entry points are not sleep-safe, which will cause problems
with PWM implementations that require sleeping during hardware state
updates.  The Atmel PWMC driver avoids these cases; other driver
implementations must be aware.

The ledtrig-dim trigger maps current system load to an LED brighness of
0-100% for system loads in the range 0-1 as reported by avenrun[].  If the
LED associated with the trigger is a suitable PWM output, then the user
will see the brightness of the LED change as system load changes.

Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
---
 drivers/leds/Kconfig       |   24 +++++--
 drivers/leds/Makefile      |    2 +
 drivers/leds/leds-pwm.c    |  167 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/leds/ledtrig-dim.c |   95 +++++++++++++++++++++++++
 include/linux/pwm-led.h    |   34 +++++++++
 5 files changed, 317 insertions(+), 5 deletions(-)
 create mode 100644 drivers/leds/leds-pwm.c
 create mode 100644 drivers/leds/ledtrig-dim.c
 create mode 100644 include/linux/pwm-led.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index e3e4042..3339a4c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -17,12 +17,12 @@ config LEDS_CLASS
 
 comment "LED drivers"
 
-config LEDS_ATMEL_PWM
-	tristate "LED Support using Atmel PWM outputs"
-	depends on LEDS_CLASS && ATMEL_PWM
+config LEDS_CORGI
+	tristate "LED Support for the Sharp SL-C7x0 series"
+	depends on LEDS_CLASS && PXA_SHARP_C7xx
 	help
-	  This option enables support for LEDs driven using outputs
-	  of the dedicated PWM controller found on newer Atmel SOCs.
+	  This option enables support for the LEDs on Sharp Zaurus
+	  SL-C7x0 series (C700, C750, C760, C860).
 
 config LEDS_LOCOMO
 	tristate "LED Support for Locomo device"
@@ -113,6 +113,12 @@ config LEDS_GPIO
 	  outputs. To be useful the particular board must have LEDs
 	  and they must be connected to the GPIO lines.
 
+config LEDS_PWM
+       tristate "LED Support for PWM connected LEDs"
+       depends on LEDS_CLASS && GENERIC_PWM
+       help
+         Enables support for LEDs connected to PWM outputs.
+
 config LEDS_CM_X270
 	tristate "LED Support for the CM-X270 LEDs"
 	depends on LEDS_CLASS && MACH_ARMCORE
@@ -184,6 +190,14 @@ config LEDS_TRIGGER_IDE_DISK
 	  This allows LEDs to be controlled by IDE disk activity.
 	  If unsure, say Y.
 
+config LEDS_TRIGGER_DIM
+	tristate "LED Dimmer Trigger"
+	depends on LEDS_TRIGGERS
+	help
+	  Regulates the brightness of an LED based on the 1-minute CPU
+	  load average.  Ideal for PWM-driven LEDs.
+	  If unsure, say Y.
+
 config LEDS_TRIGGER_HEARTBEAT
 	tristate "LED Heartbeat Trigger"
 	depends on LEDS_TRIGGERS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index eb186c3..3a16e37 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
 obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
 obj-$(CONFIG_LEDS_PCA9532)		+= leds-pca9532.o
 obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
+obj-$(CONFIG_LEDS_PWM)					+= leds-pwm.o
 obj-$(CONFIG_LEDS_CM_X270)              += leds-cm-x270.o
 obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
 obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
@@ -26,5 +27,6 @@ obj-$(CONFIG_LEDS_PCA955X)		+= leds-pca955x.o
 # LED Triggers
 obj-$(CONFIG_LEDS_TRIGGER_TIMER)	+= ledtrig-timer.o
 obj-$(CONFIG_LEDS_TRIGGER_IDE_DISK)	+= ledtrig-ide-disk.o
+obj-$(CONFIG_LEDS_TRIGGER_DIM)		+= ledtrig-dim.o
 obj-$(CONFIG_LEDS_TRIGGER_HEARTBEAT)	+= ledtrig-heartbeat.o
 obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+= ledtrig-default-on.o
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
new file mode 100644
index 0000000..3103dc3
--- /dev/null
+++ b/drivers/leds/leds-pwm.c
@@ -0,0 +1,167 @@
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/leds.h>
+#include <linux/io.h>
+#include <linux/pwm.h>
+#include <linux/pwm-led.h>
+
+
+struct led_pwm {
+	struct led_classdev	led;
+	struct pwm_channel	*pwm;
+	int percent;
+};
+
+
+static void
+led_pwm_brightness_set(struct led_classdev *c,
+		       enum led_brightness b)
+{
+	struct led_pwm *led;
+	int percent;
+
+	percent = (b * 100) / (LED_FULL - LED_OFF);
+	led = container_of(c, struct led_pwm, led);
+	led->percent = percent;
+	pwm_set_duty_percent(led->pwm, percent);
+}
+
+
+static enum led_brightness
+led_pwm_brightness_get(struct led_classdev *c)
+{
+	struct led_pwm *led;
+	led = container_of(c, struct led_pwm, led);
+	return led->percent;
+}
+
+
+static int
+led_pwm_blink_set(struct led_classdev *c,
+		  unsigned long *on_ms,
+		  unsigned long *off_ms)
+{
+	struct led_pwm *led;
+	struct pwm_channel_config cfg;
+
+	led = container_of(c, struct led_pwm, led);
+
+	if (*on_ms == 0 && *off_ms == 0) {
+		*on_ms = 1000UL;
+		*off_ms = 1000UL;
+	}
+
+	cfg.config_mask = PWM_CONFIG_DUTY_NS
+		| PWM_CONFIG_PERIOD_NS;
+
+	cfg.duty_ns = *on_ms * 1000000UL;
+	cfg.period_ns = (*on_ms + *off_ms) * 1000000UL;
+
+	return pwm_config(led->pwm, &cfg);
+}
+
+
+static int __init
+led_pwm_probe(struct platform_device *pdev)
+{
+	struct pwm_led_platform_data *pdata = pdev->dev.platform_data;
+	struct led_pwm *led;
+	struct device *d = &pdev->dev;
+	int ret;
+
+	if (!pdata || !pdata->led_info)
+		return -EINVAL;
+
+	if (!try_module_get(d->driver->owner))
+		return -ENODEV;
+
+	led = kzalloc(sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->pwm = pwm_request(pdata->bus_id, pdata->chan,
+			       pdata->led_info->name);
+	if (!led->pwm) {
+		ret = -EINVAL;
+		goto err_pwm_request;
+	}
+
+	platform_set_drvdata(pdev, led);
+
+	led->led.name = pdata->led_info->name;
+	led->led.default_trigger = pdata->led_info->default_trigger;
+	led->led.brightness_set = led_pwm_brightness_set;
+	led->led.brightness_get = led_pwm_brightness_get;
+	led->led.blink_set = led_pwm_blink_set;
+	led->led.brightness = LED_OFF;
+
+	ret = pwm_config(led->pwm, pdata->config);
+	if (ret)
+		goto err_pwm_config;
+	pwm_start(led->pwm);
+
+	ret = led_classdev_register(&pdev->dev, &led->led);
+	if (ret < 0)
+		goto err_classdev_register;
+
+	return 0;
+
+err_classdev_register:
+	pwm_stop(led->pwm);
+err_pwm_config:
+	pwm_free(led->pwm);
+err_pwm_request:
+	kfree(led);
+
+	return ret;
+}
+
+
+static int
+led_pwm_remove(struct platform_device *pdev)
+{
+	struct led_pwm *led = platform_get_drvdata(pdev);
+	struct device *d = &pdev->dev;
+
+	led_classdev_unregister(&led->led);
+
+	if (led->pwm) {
+		pwm_stop(led->pwm);
+		pwm_free(led->pwm);
+	}
+
+	kfree(led);
+	module_put(d->driver->owner);
+
+	return 0;
+}
+
+
+static struct platform_driver led_pwm_driver = {
+	.driver = {
+		.name =		"leds-pwm",
+		.owner =	THIS_MODULE,
+	},
+	.probe = led_pwm_probe,
+	.remove = led_pwm_remove,
+};
+
+
+static int __init led_pwm_modinit(void)
+{
+	return platform_driver_register(&led_pwm_driver);
+}
+module_init(led_pwm_modinit);
+
+
+static void __exit led_pwm_modexit(void)
+{
+	platform_driver_unregister(&led_pwm_driver);
+}
+module_exit(led_pwm_modexit);
+
+
+MODULE_AUTHOR("Bill Gatliff <bgat@billgatliff.com>");
+MODULE_DESCRIPTION("Driver for LEDs with PWM-controlled brightness");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:leds-pwm");
diff --git a/drivers/leds/ledtrig-dim.c b/drivers/leds/ledtrig-dim.c
new file mode 100644
index 0000000..299865b
--- /dev/null
+++ b/drivers/leds/ledtrig-dim.c
@@ -0,0 +1,95 @@
+/*
+ * LED Dim Trigger
+ *
+ * Copyright (C) 2008 Bill Gatliff <bgat@billgatliff.com>
+ *
+ * "Dims" an LED based on system load.  Derived from Atsushi Nemoto's
+ * ledtrig-heartbeat.c.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/timer.h>
+#include <linux/sched.h>
+#include <linux/leds.h>
+
+#include "leds.h"
+
+struct dim_trig_data {
+	struct timer_list timer;
+};
+
+
+static void
+led_dim_function(unsigned long data)
+{
+	struct led_classdev *led_cdev = (struct led_classdev *)data;
+	struct dim_trig_data *dim_data = led_cdev->trigger_data;
+	unsigned int brightness;
+
+	brightness = ((LED_FULL - LED_OFF) * avenrun[0]) / EXP_1;
+	if (brightness > LED_FULL)
+		brightness = LED_FULL;
+
+	led_set_brightness(led_cdev, brightness);
+	mod_timer(&dim_data->timer, jiffies + msecs_to_jiffies(500));
+}
+
+
+static void
+dim_trig_activate(struct led_classdev *led_cdev)
+{
+	struct dim_trig_data *dim_data;
+
+	dim_data = kzalloc(sizeof(*dim_data), GFP_KERNEL);
+	if (!dim_data)
+		return;
+
+	led_cdev->trigger_data = dim_data;
+	setup_timer(&dim_data->timer,
+		    led_dim_function, (unsigned long)led_cdev);
+	led_dim_function(dim_data->timer.data);
+}
+
+
+static void
+dim_trig_deactivate(struct led_classdev *led_cdev)
+{
+	struct dim_trig_data *dim_data = led_cdev->trigger_data;
+
+	if (dim_data) {
+		del_timer_sync(&dim_data->timer);
+		kfree(dim_data);
+	}
+}
+
+
+static struct led_trigger dim_led_trigger = {
+	.name     = "dim",
+	.activate = dim_trig_activate,
+	.deactivate = dim_trig_deactivate,
+};
+
+
+static int __init dim_trig_init(void)
+{
+	return led_trigger_register(&dim_led_trigger);
+}
+module_init(dim_trig_init);
+
+
+static void __exit dim_trig_exit(void)
+{
+	led_trigger_unregister(&dim_led_trigger);
+}
+module_exit(dim_trig_exit);
+
+
+MODULE_AUTHOR("Bill Gatliff <bgat@billgatliff.com>");
+MODULE_DESCRIPTION("Dim LED trigger");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/pwm-led.h b/include/linux/pwm-led.h
new file mode 100644
index 0000000..92363c8
--- /dev/null
+++ b/include/linux/pwm-led.h
@@ -0,0 +1,34 @@
+#ifndef __LINUX_PWM_LED_H
+#define __LINUX_PWM_LED_H
+
+/*
+ * include/linux/pwm-led.h
+ *
+ * Copyright (C) 2008 Bill Gatliff
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
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
1.5.6.5
