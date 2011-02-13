From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v4 2/3] PWM: GPIO+hrtimer device emulation
Date: Sat, 12 Feb 2011 21:53:37 -0500
Message-ID: <AANLkTimNuz245U64MBzGNpop7oVVnVpZ04UUA=7p5CLj@mail.gmail.com>
References: <1297563323-24074-1-git-send-email-bgat@billgatliff.com> <1297563323-24074-3-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=J2Jp5252UvM2sl5bc0QFSr5+t7sLKhT2iwFYERyEBmQ=;
        b=OujzTdvz67Rj+IZN8GCfLvYQz+KdC12dSUV9xtbjU1bGdBnhx5lXr8zaYdeJKX91/o
         f//Q7d3IKSe62NGjEZgRlOwhkLmXxMyCmtU6ip88uWuQcapYaU/mrppdL1w2f7OPSHmp
         jJg+pBztuXHdm2e5187NoPouip/8NqDbzPnTc=
In-Reply-To: <1297563323-24074-3-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Sat, Feb 12, 2011 at 21:15, Bill Gatliff wrote:
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> +config GPIO_PWM
> + =C2=A0 =C2=A0 =C2=A0 tristate "GPIO+hrtimer PWM device emulation"
> + =C2=A0 =C2=A0 =C2=A0 depends on GENERIC_PWM
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This option enables code that emulates =
a single-channel
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 PWM device using a high-resolution time=
r and a GPIO
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 pin. =C2=A0The PWM framework allows you=
 to create as many
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 of these devices as desired, subject to=
 CPU overhead
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 and GPIO pin availability. =C2=A0If uns=
ure, say N.

document the module name in the help ?

> --- /dev/null
> +++ b/drivers/pwm/gpio-pwm.c
> +#define DRIVER_NAME "gpio-pwm"

use KBUILD_MODNAME instead ?

> +static void gpio_pwm_work (struct work_struct *work)

no space before the "("

> +static struct pwm_device_ops gpio_pwm_device_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .config =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D gpio_p=
wm_config,
> + =C2=A0 =C2=A0 =C2=A0 .config_nosleep =3D gpio_pwm_config_nosleep,
> + =C2=A0 =C2=A0 =C2=A0 .request =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D gpio_p=
wm_request,
> +};

is this struct not constified ?  same for some of the other structs in
this file ...

> + =C2=A0 =C2=A0 =C2=A0 gp =3D kzalloc(sizeof(*gp), GFP_KERNEL);
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR_OR_NULL(gp))

i dont think the kmalloc funcs return a pointer error.  it's either
NULL or it's a valid pointer.  this comes up a few times ...

> +EXPORT_SYMBOL(gpio_pwm_create);
> +EXPORT_SYMBOL(gpio_pwm_destroy);

are people expected to call these directly ?  is that useful if they
cant call any of the config funcs ?
-mike
