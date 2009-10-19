From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [[RFC] 4/5] An LED "dimmer" trigger, which uses the PWM API to 
	vary the brightness of an LED according to system load
Date: Mon, 19 Oct 2009 17:51:21 -0400
Message-ID: <8bd0f97a0910191451w89d80ffx9afcdbe31dad0cc7@mail.gmail.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-4-git-send-email-bgat@billgatliff.com> <1255984366-26952-5-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=OQLG79JHAgK/FsqOIGnmigBI8t1dfssSPvoAkTXaRoM=;
        b=KYCAyxvvXA06NVr9tDeBmEBvUzmHIEw8x9Li7snWAMkm63fHis1N6SwcSu6qYLS/K3
         TpK388urnJbG/c1TPjbK/yk6lW+FVl8yYUPUQG9uGGWwMcDv3/nNjmOXS62VjxggWJNq
         9Dq1/cCXhJfG2pwW/fH6NY+7zz7Nw4nPYKDzA=
In-Reply-To: <1255984366-26952-5-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -1,153 +1,167 @@
> -/*
> - * linux/drivers/leds-pwm.c
> - *
> - * simple PWM based LED control
> - *
> - * Copyright 2009 Luotao Fu @ Pengutronix (l.fu@pengutronix.de)
> - *
> - * based on leds-gpio.c by Raphael Assenat <raph@8d.com>
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */

this should not be removed.  if you wanted to add your copyright line,
then that's fine, but the rest needs to stay.

> =C2=A0#include <linux/pwm.h>
> +#include <linux/pwm-led.h>

if there's going to be a bunch of new pwm related headers, perhaps a
subdir makes more sense: linux/pwm/xxx

> +static void
> +led_pwm_brightness_set(struct led_classdev *c,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0enum led_brightness b)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct led_pwm *led;
> + =C2=A0 =C2=A0 =C2=A0 int percent;
> +
> + =C2=A0 =C2=A0 =C2=A0 percent =3D (b * 100) / (LED_FULL - LED_OFF);
> + =C2=A0 =C2=A0 =C2=A0 led =3D container_of(c, struct led_pwm, led);

instead of using container_of() everywhere, why not add a helper macro
that turns a led_classev into a led_pwm

> +static int __init
> +led_pwm_probe(struct platform_device *pdev)

probe functions are typical __devinit

> + =C2=A0 =C2=A0 =C2=A0 if (!try_module_get(d->driver->owner))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;

is this really needed ?

> -static int __devexit led_pwm_remove(struct platform_device *pdev)
> +static int
> +led_pwm_remove(struct platform_device *pdev)

looks like you lost the __devexit markings

> =C2=A0static struct platform_driver led_pwm_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 "leds-pwm",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D =C2=A0 =
=C2=A0 =C2=A0 =C2=A0THIS_MODULE,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},

i dont think platform_drivers need to explicitly set their owner.  i
thought that was all handled for you.

> --- /dev/null
> +++ b/include/linux/pwm-led.h
> @@ -0,0 +1,34 @@
> +#ifndef __LINUX_PWM_LED_H
> +#define __LINUX_PWM_LED_H
> +
> +/*
> + * include/linux/pwm-led.h

the ifdef protection typically goes after the header comment blob, not =
before
-mike
