From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM v9 0/3] Implement a generic PWM framework
Date: Thu, 31 Mar 2011 22:59:49 -0500
Message-ID: <1301630392-20793-1-git-send-email-bgat@billgatliff.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>

This patch series contains the ninth attempt at implementation of a
generic PWM device interface framework.  Think gpiolib, but for
devices and pseudo-devices that generate pulse-wave-modulated outputs.

Compared to the previous version, this patch series:

 * Fixes an unbalanced get_device()/put_device()

A git tree containing these patches may be found here:

    http://git.billgatliff.com/pwm.git


Regards,


b.g.

Bill Gatliff (3):
  PWM: Implement a generic PWM framework
  PWM: GPIO+hrtimer device emulation
  PWM: Atmel PWMC driver

 Documentation/pwm.txt    |  276 ++++++++++++++++++++++
 MAINTAINERS              |    8 +
 drivers/Kconfig          |    2 +
 drivers/Makefile         |    2 +
 drivers/pwm/Kconfig      |   29 +++
 drivers/pwm/Makefile     |    7 +
 drivers/pwm/atmel-pwmc.c |  452 ++++++++++++++++++++++++++++++++++++
 drivers/pwm/gpio-pwm.c   |  332 ++++++++++++++++++++++++++
 drivers/pwm/pwm.c        |  580 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pwm/pwm.h  |  143 ++++++++++++
 10 files changed, 1831 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/pwm.txt
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/atmel-pwmc.c
 create mode 100644 drivers/pwm/gpio-pwm.c
 create mode 100644 drivers/pwm/pwm.c
 create mode 100644 include/linux/pwm/pwm.h

-- 
1.7.4.1
