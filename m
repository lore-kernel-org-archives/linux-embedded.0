From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v9 0/3] Implement a generic PWM framework
Date: Thu, 14 Apr 2011 10:12:51 -0500
Message-ID: <BANLkTik6Ftsy2yTA7LBKTUDJkqXPf4JeSA@mail.gmail.com>
References: <1301630392-20793-1-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1301630392-20793-1-git-send-email-bgat@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Guys:


Anyone have any comment on this patch series?  Is it finally ready for =
Linus?

Thanks!


b.g.


On Thu, Mar 31, 2011 at 10:59 PM, Bill Gatliff <bgat@billgatliff.com> w=
rote:
> This patch series contains the ninth attempt at implementation of a
> generic PWM device interface framework. =A0Think gpiolib, but for
> devices and pseudo-devices that generate pulse-wave-modulated outputs=
=2E
>
> Compared to the previous version, this patch series:
>
> =A0* Fixes an unbalanced get_device()/put_device()
>
> A git tree containing these patches may be found here:
>
> =A0 =A0http://git.billgatliff.com/pwm.git
>
>
> Regards,
>
>
> b.g.
>
> Bill Gatliff (3):
> =A0PWM: Implement a generic PWM framework
> =A0PWM: GPIO+hrtimer device emulation
> =A0PWM: Atmel PWMC driver
>
> =A0Documentation/pwm.txt =A0 =A0| =A0276 ++++++++++++++++++++++
> =A0MAINTAINERS =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A08 +
> =A0drivers/Kconfig =A0 =A0 =A0 =A0 =A0| =A0 =A02 +
> =A0drivers/Makefile =A0 =A0 =A0 =A0 | =A0 =A02 +
> =A0drivers/pwm/Kconfig =A0 =A0 =A0| =A0 29 +++
> =A0drivers/pwm/Makefile =A0 =A0 | =A0 =A07 +
> =A0drivers/pwm/atmel-pwmc.c | =A0452 ++++++++++++++++++++++++++++++++=
++++
> =A0drivers/pwm/gpio-pwm.c =A0 | =A0332 ++++++++++++++++++++++++++
> =A0drivers/pwm/pwm.c =A0 =A0 =A0 =A0| =A0580 ++++++++++++++++++++++++=
++++++++++++++++++++++
> =A0include/linux/pwm/pwm.h =A0| =A0143 ++++++++++++
> =A010 files changed, 1831 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/pwm.txt
> =A0create mode 100644 drivers/pwm/Kconfig
> =A0create mode 100644 drivers/pwm/Makefile
> =A0create mode 100644 drivers/pwm/atmel-pwmc.c
> =A0create mode 100644 drivers/pwm/gpio-pwm.c
> =A0create mode 100644 drivers/pwm/pwm.c
> =A0create mode 100644 include/linux/pwm/pwm.h
>
> --
> 1.7.4.1
>
>



--=20
Bill Gatliff
bgat@billgatliff.com
