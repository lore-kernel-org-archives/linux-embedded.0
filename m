From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [[RFC] 2/5] Emulates PWM hardware using a high-resolution timer 
	and a GPIO pin
Date: Mon, 19 Oct 2009 17:56:13 -0400
Message-ID: <8bd0f97a0910191456n1b8f1aabr9b54b1126b2ec0c6@mail.gmail.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=aovpjiAYy5GpmHra0EVHl0sOq4fuWC8gBQttGZyTcKE=;
        b=KUNBsO8kwwXzR4xoheUJv/eJBkccdtddCcLvel2uJmqxz7uTBLkokmb+3EzHxDTt+M
         FUSMB6fejStYl+xpOyXQHrM1ks47TA94E6At6LUsI/kjUaG8ZhE/CT/OzaqF19dT+eHP
         FbQKAckKAbXGg3CcunL8zfWVanDW6Ni/+8wrU=
In-Reply-To: <1255984366-26952-3-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
> --- /dev/null
> +++ b/drivers/pwm/gpio.c
> @@ -0,0 +1,318 @@
> +#define DEBUG 99

whoops

> + =C2=A0 =C2=A0 =C2=A0 pr_debug("%s:%d start, %lu ticks\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_name(p->=
pwm->dev), p->chan, p->duty_ticks);

you already have a struct device, so this is just odd.  use dev_dbg()
instead and let it worry about dev_name() stuff.  plus you're already
using dev_dbg() in the rest of the code, so i guess you just forgot
about this.

> + =C2=A0 =C2=A0 =C2=A0 case PWM_CONFIG_START:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!hrtimer_activ=
e(&gp->t)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 gpio_pwm_start(p);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }

dont really need those braces

> + =C2=A0 =C2=A0 =C2=A0 struct gpio_pwm *gp =3D container_of(p->pwm, s=
truct gpio_pwm, pwm);

helper macro for this ?

> +static int
> +gpio_pwm_config(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pwm_channel=
_config *c)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct gpio_pwm *gp =3D container_of(p->pwm, s=
truct gpio_pwm, pwm);
> + =C2=A0 =C2=A0 =C2=A0 int was_on =3D 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (p->pwm->config_nosleep) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!p->pwm->confi=
g_nosleep(p, c))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return 0;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 might_sleep();

shouldnt this be above the config_n

> +static int __init
> +gpio_pwm_probe(struct platform_device *pdev)

__devinit

> +static struct platform_driver gpio_pwm_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "gpio_pw=
m",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MO=
DULE,
> + =C2=A0 =C2=A0 =C2=A0 },

dont need the explicit .owner ?

> +static void gpio_pwm_exit(void)

__exit

> +MODULE_DESCRIPTION("PWM output using GPIO and an itimer");

itimer -> hrtimer ?
-mike
