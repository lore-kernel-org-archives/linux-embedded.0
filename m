From: Bill Gatliff <bgat@billgatliff.com>
Subject: [PWM PATCH 0/7] Generic PWM API
Date: Tue,  9 Feb 2010 14:46:27 -0600
Message-ID: <cover.1265748263.git.bgat@billgatliff.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bill Gatliff <bgat@billgatliff.com>

This series implements a generic PWM device API.

Bill Gatliff (7):
  API to consolidate PWM devices behind a common user and kernel
    interface
  Emulates PWM hardware using a high-resolution timer and a GPIO pin
  Expunge old Atmel PWMC driver, replacing it with one that conforms to
    the PWM API
  Implements PWM-based LED control
  LED "dim" trigger based on PWM control of the LED
  Incorporate PWM API code into KBuild
  PWM API driver for MPC52xx GPT peripheral

 Documentation/pwm.txt                     |  260 ++++++++++++
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c |  195 +++++++++-
 drivers/Kconfig                           |    2 +
 drivers/Makefile                          |    2 +
 drivers/leds/Kconfig                      |   33 +-
 drivers/leds/Makefile                     |    2 +
 drivers/leds/leds-pwm.c                   |  224 ++++++-----
 drivers/leds/ledtrig-dim.c                |   95 +++++
 drivers/misc/Makefile                     |    1 -
 drivers/misc/atmel_pwm.c                  |  409 ------------------
 drivers/pwm/Kconfig                       |   31 ++
 drivers/pwm/Makefile                      |    6 +
 drivers/pwm/atmel-pwm.c                   |  590 ++++++++++++++++++++++++++
 drivers/pwm/gpio.c                        |  312 ++++++++++++++
 drivers/pwm/pwm.c                         |  644 +++++++++++++++++++++++++++++
 include/linux/pwm.h                       |   31 --
 include/linux/pwm/pwm-led.h               |   33 ++
 include/linux/pwm/pwm.h                   |  170 ++++++++
 18 files changed, 2485 insertions(+), 555 deletions(-)
 create mode 100644 Documentation/pwm.txt
 create mode 100644 drivers/leds/ledtrig-dim.c
 delete mode 100644 drivers/misc/atmel_pwm.c
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/atmel-pwm.c
 create mode 100644 drivers/pwm/gpio.c
 create mode 100644 drivers/pwm/pwm.c
 delete mode 100644 include/linux/pwm.h
 create mode 100644 include/linux/pwm/pwm-led.h
 create mode 100644 include/linux/pwm/pwm.h
