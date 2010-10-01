From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM 06/10] Incorporate PWM API code into KBuild
Date: Fri,  1 Oct 2010 10:17:47 -0500
Message-ID: <1285946271-17728-6-git-send-email-bgat@billgatliff.com>
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
 drivers/Kconfig       |    2 ++
 drivers/Makefile      |    2 ++
 drivers/leds/Kconfig  |   22 ++++++++++++++++------
 drivers/leds/Makefile |    2 ++
 drivers/pwm/Kconfig   |   28 ++++++++++++++++++++++++++++
 drivers/pwm/Makefile  |    6 ++++++
 6 files changed, 56 insertions(+), 6 deletions(-)
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile

diff --git a/drivers/Kconfig b/drivers/Kconfig
index a2b902f..60390cb 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -54,6 +54,8 @@ source "drivers/pps/Kconfig"
 
 source "drivers/gpio/Kconfig"
 
+source "drivers/pwm/Kconfig"
+
 source "drivers/w1/Kconfig"
 
 source "drivers/power/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index a2aea53..fa7ca1c 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -6,6 +6,8 @@
 #
 
 obj-y				+= gpio/
+obj-$(CONFIG_GENERIC_PWM)	+= pwm/
+
 obj-$(CONFIG_PCI)		+= pci/
 obj-$(CONFIG_PARISC)		+= parisc/
 obj-$(CONFIG_RAPIDIO)		+= rapidio/
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 3af2cde..b434fa3 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -249,12 +249,6 @@ config LEDS_DAC124S085
 	  This option enables support for DAC124S085 SPI DAC from NatSemi,
 	  which can be used to control up to four LEDs.
 
-config LEDS_PWM
-	tristate "PWM driven LED Support"
-	depends on HAVE_PWM
-	help
-	  This option enables support for pwm driven LEDs
-
 config LEDS_REGULATOR
 	tristate "REGULATOR driven LED support"
 	depends on REGULATOR
@@ -354,6 +348,14 @@ config LEDS_TRIGGER_HEARTBEAT
 	  load average.
 	  If unsure, say Y.
 
+config LEDS_TRIGGER_DIM
+	tristate "LED Dimmer Trigger"
+	depends on LEDS_TRIGGERS
+	help
+	  Regulates the brightness of an LED based on the 1-minute CPU
+	  load average. Ideal for PWM-driven LEDs.
+	  If unsure, say Y.
+
 config LEDS_TRIGGER_BACKLIGHT
 	tristate "LED backlight Trigger"
 	help
@@ -374,6 +376,14 @@ config LEDS_TRIGGER_GPIO
 
 	  If unsure, say N.
 
+config LEDS_TRIGGER_DIM
+       tristate "LED Dimmer Trigger"
+       depends on LEDS_TRIGGERS
+       help
+         Regulates the brightness of an LED based on the 1-minute CPU
+         load average.  Ideal for PWM-driven LEDs.
+         If unsure, say Y.
+
 config LEDS_TRIGGER_DEFAULT_ON
 	tristate "LED Default ON Trigger"
 	help
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 7d6b958..a4ccea4 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
 obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
 obj-$(CONFIG_LEDS_PCA9532)		+= leds-pca9532.o
 obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
+obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_LP3944)		+= leds-lp3944.o
 obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
 obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
@@ -46,6 +47,7 @@ obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
 obj-$(CONFIG_LEDS_TRIGGER_TIMER)	+= ledtrig-timer.o
 obj-$(CONFIG_LEDS_TRIGGER_IDE_DISK)	+= ledtrig-ide-disk.o
 obj-$(CONFIG_LEDS_TRIGGER_HEARTBEAT)	+= ledtrig-heartbeat.o
+obj-$(CONFIG_LEDS_TRIGGER_DIM)		+= ledtrig-dim.o
 obj-$(CONFIG_LEDS_TRIGGER_BACKLIGHT)	+= ledtrig-backlight.o
 obj-$(CONFIG_LEDS_TRIGGER_GPIO)		+= ledtrig-gpio.o
 obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+= ledtrig-default-on.o
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
new file mode 100644
index 0000000..0584c25
--- /dev/null
+++ b/drivers/pwm/Kconfig
@@ -0,0 +1,28 @@
+#
+# PWM infrastructure and devices
+#
+
+menuconfig GENERIC_PWM
+	tristate "PWM Support"
+	depends on SYSFS
+	help
+	  This enables PWM support through the generic PWM API.
+	  If unsure, say N.
+
+if GENERIC_PWM
+
+config ATMEL_PWM
+	tristate "Atmel AT32/AT91 PWM support"
+	depends on AVR32 || ARCH_AT91
+	help
+	  This option enables device driver support for the PWMC
+	  peripheral channels found on certain Atmel processors.
+	  If unsure, say N.
+
+config GPIO_PWM
+       tristate "PWM emulation using GPIO"
+       help
+         This option enables a single-channel PWM device using
+	 a kernel interval timer and a GPIO pin.  If unsure, say N.
+
+endif
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
new file mode 100644
index 0000000..e8cacc5
--- /dev/null
+++ b/drivers/pwm/Makefile
@@ -0,0 +1,6 @@
+#
+# Makefile for pwm devices
+#
+obj-y := pwm.o
+obj-$(CONFIG_ATMEL_PWM)		+= atmel-pwm.o
+obj-$(CONFIG_GPIO_PWM)		+= gpio.o
-- 
1.7.1
