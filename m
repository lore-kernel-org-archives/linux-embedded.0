From: "H Hartley Sweeten" <hartleys@visionengravers.com>
Subject: RE: [PWM PATCH 0/5] Implements a common PWM API
Date: Tue, 2 Feb 2010 12:44:23 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909020E99C5@mi8nycmail19.Mi8.com>
References: <cover.1265094517.git.bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <cover.1265094517.git.bgat@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Tuesday, February 02, 2010 12:15 AM, Bill Gatliff wrote:
> This patch series implements a common PWM API.  This series incorporates
> the feedback from the linux-embedded mailing list and elsewhere; the author
> greatly appreciates the efforts of everyone who reviewed the previous version
> of this code.
> 
> Bill Gatliff (5):
>   API to consolidate PWM devices behind a common user and kernel
>     interface
>   Emulates PWM hardware using a high-resolution timer and a GPIO pin
>   Expunge old Atmel PWMC driver, replacing it with one that conforms to
>     the PWM API
>   PWM-based LED control
>   LED "dimmer" trigger
> 
>  Documentation/pwm.txt       |  260 ++++++++++++++++++
>  drivers/leds/leds-pwm.c     |  224 +++++++++-------
>  drivers/leds/ledtrig-dim.c  |   95 +++++++
>  drivers/misc/Makefile       |    6 +-
>  drivers/misc/atmel_pwm.c    |  409 ----------------------------
>  drivers/pwm/atmel-pwm.c     |  589 ++++++++++++++++++++++++++++++++++++++++
>  drivers/pwm/gpio.c          |  307 +++++++++++++++++++++
>  drivers/pwm/pwm.c           |  633 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pwm.h         |   31 --
>  include/linux/pwm/pwm-led.h |   34 +++
>  include/linux/pwm/pwm.h     |  170 ++++++++++++
>  11 files changed, 2217 insertions(+), 541 deletions(-)
>  create mode 100644 Documentation/pwm.txt
>  create mode 100644 drivers/leds/ledtrig-dim.c
>  delete mode 100644 drivers/misc/atmel_pwm.c
>  create mode 100644 drivers/pwm/atmel-pwm.c
>  create mode 100644 drivers/pwm/gpio.c
>  create mode 100644 drivers/pwm/pwm.c
>  delete mode 100644 include/linux/pwm.h
>  create mode 100644 include/linux/pwm/pwm-led.h
>  create mode 100644 include/linux/pwm/pwm.h

I think the following files/patches are missing from this series:

drivers/Kconfig
drivers/Makefile
drivers/leds/Kconfig
drivers/leds/Makefile
drivers/pwm/Kconfig
drivers/pwm/Makefile

Regards,
Hartley
