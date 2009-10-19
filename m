From: Bill Gatliff <bgat@billgatliff.com>
Subject: [[RFC] 5/5] Incorporate PWM API code into KBuild
Date: Mon, 19 Oct 2009 15:32:46 -0500
Message-ID: <1255984366-26952-6-git-send-email-bgat@billgatliff.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com>
 <1255984366-26952-2-git-send-email-bgat@billgatliff.com>
 <1255984366-26952-3-git-send-email-bgat@billgatliff.com>
 <1255984366-26952-4-git-send-email-bgat@billgatliff.com>
 <1255984366-26952-5-git-send-email-bgat@billgatliff.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1255984366-26952-5-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>


Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
---
 drivers/Kconfig      |    2 ++
 drivers/Makefile     |    2 ++
 drivers/pwm/Kconfig  |   30 ++++++++++++++++++++++++++++++
 drivers/pwm/Makefile |    7 +++++++
 4 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 48bbdbe..ee45cf7 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -56,6 +56,8 @@ source "drivers/pps/Kconfig"
 
 source "drivers/gpio/Kconfig"
 
+source "drivers/pwm/Kconfig"
+
 source "drivers/w1/Kconfig"
 
 source "drivers/power/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index 6ee53c7..e6143f3 100644
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
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
new file mode 100644
index 0000000..0ead279
--- /dev/null
+++ b/drivers/pwm/Kconfig
@@ -0,0 +1,30 @@
+#
+# PWM infrastructure and devices
+#
+
+menuconfig GENERIC_PWM
+	tristate "PWM Support"
+	help
+	  This enables PWM support through the generic PWM library.
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
+	  Pulse Width Modulation is used many for purposes, including
+	  software controlled power-efficent backlights on LCD
+	  displays, motor control, and waveform generation.  If
+	  unsure, say N.
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
index 0000000..e42246b
--- /dev/null
+++ b/drivers/pwm/Makefile
@@ -0,0 +1,7 @@
+#
+# Makefile for pwm devices
+#
+obj-y := pwm.o
+
+obj-$(CONFIG_ATMEL_PWM)		+= atmel-pwm.o
+obj-$(CONFIG_GPIO_PWM)		+= gpio.o
\ No newline at end of file
-- 
1.6.3.3
