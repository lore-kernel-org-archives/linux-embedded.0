From: Bill Gatliff <bgat@billgatliff.com>
Subject: [[RFC] 0/5] Generic PWM API Proposal
Date: Mon, 19 Oct 2009 15:32:41 -0500
Message-ID: <1255984366-26952-1-git-send-email-bgat@billgatliff.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>


This patch series extends the existing PWM API into something more
generic, and adds support for hotplugging.  A driver for the Atmel
SAM9263 PWMC peripheral is provided, as well as a "leds-pwm" wedge
and an "led-dim" trigger that allow the LED API to take advantage
of this new API.  The code has been run-tested on a SAM9263 platform,
the OMAP3430 Beagleboard platform, and a few others.

The motivation for creating this API is the author's need for hotpluggable
PWM devices, including i2c GPIO expander chips.  The existing PWM API's
use of integers to enumerate PWM channels was problematic for generic
hotplug situations, so the new API creates pwm_device and pwm_channel
structures.  Under the new API, PWM channels are identified by the platform
device's bus_id plus an integer channel selector for that device.

The API does not deal with I/O line multiplexing.  It assumes that the
platform code or bootloader have set up the output lines as necessary.

The proposed API targets the most basic capabilities required by PWM signals,
namely the ability to vary the period and duty cycle of the waveform.  The
author believes that other, more-sophisticated features like channel
synchronization, frequency slewing, end-of-period interrupts, etc. that
are necessary for applications like motor control can be added without
substantially altering the proposed API.  Testing of these features
will in some cases require hardware that the author does not currently have
access to.  (Hint, hint).

The author wishes to express his appreciation to Russell King, David Brownell,
Ulf Samuelsson, Eric Maio, Haavard Skinnemoen, and others who helped him
formulate the API and reviewed early releases of the code.

Bill Gatliff (5):
  API to consolidate PWM devices behind a common user and kernel
    interface
  Emulates PWM hardware using a high-resolution timer and a GPIO pin
  Expunge old Atmel PWMC driver, replacing it with one that conforms to
    the PWM API
  An LED "dimmer" trigger, which uses the PWM API to vary the
    brightness of an LED according to system load
  Incorporate PWM API code into KBuild

 Documentation/pwm.txt      |  258 ++++++++++++++++
 drivers/Kconfig            |    2 +
 drivers/Makefile           |    2 +
 drivers/leds/Kconfig       |   32 ++-
 drivers/leds/Makefile      |    3 +
 drivers/leds/leds-pwm.c    |  224 ++++++++-------
 drivers/leds/ledtrig-dim.c |   95 ++++++
 drivers/misc/Makefile      |    6 +-
 drivers/misc/atmel_pwm.c   |  409 --------------------------
 drivers/pwm/Kconfig        |   30 ++
 drivers/pwm/Makefile       |    7 +
 drivers/pwm/atmel-pwm.c    |  633 ++++++++++++++++++++++++++++++++++++++++
 drivers/pwm/gpio.c         |  318 ++++++++++++++++++++
 drivers/pwm/pwm.c          |  692 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pwm-led.h    |   34 +++
 include/linux/pwm.h        |  179 ++++++++++--
 16 files changed, 2384 insertions(+), 540 deletions(-)
 create mode 100644 Documentation/pwm.txt
 create mode 100644 drivers/leds/ledtrig-dim.c
 delete mode 100644 drivers/misc/atmel_pwm.c
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/atmel-pwm.c
 create mode 100644 drivers/pwm/gpio.c
 create mode 100644 drivers/pwm/pwm.c
 create mode 100644 include/linux/pwm-led.h
