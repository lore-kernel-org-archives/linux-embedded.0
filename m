From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM v6 0/3] Implement a generic PWM framework
Date: Sun, 20 Feb 2011 21:35:42 -0600
Message-ID: <1298259345-9794-1-git-send-email-bgat@billgatliff.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>

This patch series contains the sixth attempt at implementation of
a generic PWM device interface framework.  Think gpiolib, but for
devices and pseudo-devices that generate pulse-wave-modulated outputs.

Compared to the previous version, this patch series:

  * Cleans up error handling in atmel-pwmc device registration and removal
  * Removes excessive inlines from atmel-pwmc implementation
  * Drops unnecessary IS_ERR_OR_NULL test from ioremap return value
  * Removes Atmel PWMC's Kconfig patch from the gpio-pwm patch file

Functionally-speaking, this series has regressed somewhat from
previous versions because I am currently focusing my attention on the
API itself.  I include only implementations for GPIO+hrtimer devices
and the Atmel PWMC peripheral as references in this series; I will
post patches for LED drivers, PXA, Samsung, etc. devices once I know
that the API itself is on its way to mainline.  (I believe that the
two reference implementations sufficiently confirm the utility of the
API itself).

The code in this series is significantly clearer and more
straightforward than previous versions.  Thanks to everyone who helped
me with this refactoring!  I'm pretty convinced that the code you see
here is at last suitable for pulling into mainline.

Finally, the attached code CAN be used to control devices that drive
stepper motors and the like, but doing so is discouraged as I am
anticipating a request to develop an API specifically for such
situations.


Regards,


b.g.


Bill Gatliff (3):
  PWM: Implement a generic PWM framework
  PWM: GPIO+hrtimer device emulation
  PWM: Atmel PWMC driver

 Documentation/pwm.txt    |  277 +++++++++++++++++++++
 drivers/Kconfig          |    2 +
 drivers/Makefile         |    2 +
 drivers/pwm/Kconfig      |   29 +++
 drivers/pwm/Makefile     |    7 +
 drivers/pwm/atmel-pwmc.c |  494 +++++++++++++++++++++++++++++++++++++
 drivers/pwm/gpio-pwm.c   |  348 ++++++++++++++++++++++++++
 drivers/pwm/pwm.c        |  610 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pwm/pwm.h  |  155 ++++++++++++
 9 files changed, 1924 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/pwm.txt
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/atmel-pwmc.c
 create mode 100644 drivers/pwm/gpio-pwm.c
 create mode 100644 drivers/pwm/pwm.c
 create mode 100644 include/linux/pwm/pwm.h

-- 
1.7.2.3
