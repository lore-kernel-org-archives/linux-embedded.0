From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM v7 0/3] Implement a generic PWM framework
Date: Wed,  9 Mar 2011 14:13:13 -0600
Message-ID: <1299701596-24665-1-git-send-email-bgat@billgatliff.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>

This patch series contains the seventh attempt at implementation of
a generic PWM device interface framework.  Think gpiolib, but for
devices and pseudo-devices that generate pulse-wave-modulated outputs.

Compared to the previous version, this patch series:

 * Removes callback functionality
 * Adds sysfs interface documentation
 * Cleans up attribute management
 * Various minor edits and bugfixes

A git tree containing these patches may be found here:

    http://git.billgatliff.com/pwm.git
    git://git.billgatliff.com/pwm.git

Functionally-speaking, this series has regressed somewhat from
previous versions because I am currently focusing my attention on the
API itself.  I include implementations only for GPIO+hrtimer devices
and the Atmel PWMC peripheral as references in this series; I will
post patches for LED drivers, PXA, Samsung, etc. devices once I know
that the API itself is on its way to mainline.  (I believe that the
two reference implementations sufficiently confirm the utility of the
API itself).

Conversion of existing machines and platforms to this API is
relatively straightforward, but must be done in conjunction with the
various users of PWM (LEDs, etc.) because PWM devices will now be
referenced by struct pwm_device structures, rather than integers.
Thus, there is potentially significant effort involved because
platform data structures, etc. must be updated.  I have (re)started
that effort twice already, and I prefer not to do so again until the
target API is stable.

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

 Documentation/pwm.txt    |  289 +++++++++++++++++++++
 MAINTAINERS              |    8 +
 drivers/Kconfig          |    2 +
 drivers/Makefile         |    2 +
 drivers/pwm/Kconfig      |   29 ++
 drivers/pwm/Makefile     |    7 +
 drivers/pwm/atmel-pwmc.c |  449 ++++++++++++++++++++++++++++++++
 drivers/pwm/gpio-pwm.c   |  336 ++++++++++++++++++++++++
 drivers/pwm/pwm.c        |  633 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pwm/pwm.h  |  153 +++++++++++
 10 files changed, 1908 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/pwm.txt
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/atmel-pwmc.c
 create mode 100644 drivers/pwm/gpio-pwm.c
 create mode 100644 drivers/pwm/pwm.c
 create mode 100644 include/linux/pwm/pwm.h

-- 
1.7.2.3
