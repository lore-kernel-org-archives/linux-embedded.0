From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM v3: 0/3] Proposal for a generic PWM API
Date: Thu, 10 Feb 2011 09:53:48 -0600
Message-ID: <1297353231-14475-1-git-send-email-bgat@billgatliff.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>

This patch series contains the third attempt at implementation of
a generic PWM device interface framework.  Think gpiolib, but for
devices and pseudo-devices that generate pulse-wave-modulated outputs.

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

 Documentation/pwm.txt    |  259 +++++++++++++++++++
 drivers/Kconfig          |    2 +
 drivers/Makefile         |    2 +
 drivers/pwm/Kconfig      |   28 ++
 drivers/pwm/Makefile     |    7 +
 drivers/pwm/atmel-pwmc.c |  520 ++++++++++++++++++++++++++++++++++++++
 drivers/pwm/gpio-pwm.c   |  354 ++++++++++++++++++++++++++
 drivers/pwm/pwm.c        |  619 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pwm/pwm.h  |  163 ++++++++++++
 9 files changed, 1954 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/pwm.txt
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/atmel-pwmc.c
 create mode 100644 drivers/pwm/gpio-pwm.c
 create mode 100644 drivers/pwm/pwm.c
 create mode 100644 include/linux/pwm/pwm.h

-- 
1.7.2.3
