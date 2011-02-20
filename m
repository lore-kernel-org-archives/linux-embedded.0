From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v5 3/3] PWM: Atmel PWMC driver
Date: Sun, 20 Feb 2011 17:31:28 -0500
Message-ID: <AANLkTik_LqXS1DA-y3xOjXOCn_h7aNoZ533F+CK=ruZR@mail.gmail.com>
References: <1298175043-31727-1-git-send-email-bgat@billgatliff.com> <1298175043-31727-4-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=VXcRrD/niXYA/GNbSH8Pg3SmwJKg+c4iKRKbOu6GT0U=;
        b=S3gqIfoAVOm3ih5O2bBd9MvPZidz1nfBUjrcNMq+03kNeut3ugoJ+UPiSY5Vo5CFxg
         lDV4UeT5palDSr8dNYJvtiEzwnpGo7Cy3ncpaz2+hulUoXI4HcySxpJmjl2G8XwDIf16
         4WlexVFwrEW/Uirf/pbZ9mxv1OQpDxVZWUGUU=
In-Reply-To: <1298175043-31727-4-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Sat, Feb 19, 2011 at 23:10, Bill Gatliff wrote:
> +static inline void pwmc_writel(const struct atmel_pwmc *p, unsigned =
offset, u32 val)
> +static inline u32 pwmc_readl(const struct atmel_pwmc *p, unsigned of=
fset)
> +static inline void pwmc_chan_writel(const struct pwm_device *p,
> +                                   u32 offset, u32 val)
> +static inline u32 pwmc_chan_readl(const struct pwm_device *p, u32 of=
fset)
> +static inline int __atmel_pwmc_is_on(struct pwm_device *p)
> +static inline void __atmel_pwmc_stop(struct pwm_device *p)
> +static inline void __atmel_pwmc_start(struct pwm_device *p)
> +static inline int __atmel_pwmc_config_polarity(struct pwm_device *p,
> +                                             struct pwm_config *c)
> +static inline int __atmel_pwmc_config_duty_ticks(struct pwm_device *=
p,
> +                                               struct pwm_config *c)
> +static inline int __atmel_pwmc_config_period_ticks(struct pwm_device=
 *p,
> +                                                 struct pwm_config *=
c)

seems like a lot of unnecessary inlines.  while the first two might
make sense since they're really just redirecting to the read/write i/o
api, the rest are quite a bit bigger.

> +static inline int __atmel_pwmc_config_polarity(struct pwm_device *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 struct pwm_config *c)
> +static inline int __atmel_pwmc_config_duty_ticks(struct pwm_device *=
p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 struct pwm_config *c)
> +static inline int __atmel_pwmc_config_period_ticks(struct pwm_device=
 *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pwm_config *c)

these funcs always return 0 and the callers never check the return
value, so i guess these should return void instead

> +static int atmel_pwmc_stop_sync(struct pwm_device *p)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct atmel_pwmc *ap =3D pwm_get_drvdata(p);
> + =C2=A0 =C2=A0 =C2=A0 int was_on =3D __atmel_pwmc_is_on(p);
> + =C2=A0 =C2=A0 =C2=A0 int chan =3D p - &ap->p[0];
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (was_on) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 init_completion(&ap->complete);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 set_bit(FLAG_STOP, &p->flags);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pwmc_writel(ap, PWMC_IER, BIT(chan));
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dev_dbg(p->dev, "waiting on stop_sync completion...\n");
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ret =3D wait_for_completion_interruptible(&ap->complete);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dev_dbg(p->dev, "stop_sync complete (%d)\n", ret);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (test_bit(=
=46LAG_STOP, &p->flags));
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return was_on;
> +}

if you changed this to return immediately when !was_on, then you
wouldnt need to indent the entire block.

> + =C2=A0 =C2=A0 =C2=A0 ap->iobase =3D ioremap_nocache(r->start, r->en=
d - r->start + 1);

isnt there a resource_size helper ?

> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR_OR_NULL(ap->iobase)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_ioremap;
> + =C2=A0 =C2=A0 =C2=A0 }

i dont think any of the io funcs return PTR_ERR.  they all return NULL
or a valid address.

> + =C2=A0 =C2=A0 =C2=A0 for (chan =3D 0; chan < NCHAN; chan++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ap->p[chan].ops =3D=
 &ap->ops;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_set_drvdata(&a=
p->p[chan], ap);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D pwm_regist=
er(&ap->p[chan], &pdev->dev, chan);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto err_pwm_register;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> +err_pwm_register:
> + =C2=A0 =C2=A0 =C2=A0 for (chan =3D 0; chan < chan; chan++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pwm_is_registe=
red(&ap->p[chan]))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pwm_unregister(&ap->p[chan]);
> + =C2=A0 =C2=A0 =C2=A0 }

if you wanted to be tricky, you could just have the unwind not change
the value of "chan".
while (--chan > 0)
    pwm_unregister(&ap->p[chan]);

otherwise, the "chan < chan" test makes no sense in the for loop.

> +static int __devexit atmel_pwmc_remove(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct atmel_pwmc *ap =3D platform_get_drvdata=
(pdev);
> + =C2=A0 =C2=A0 =C2=A0 int chan;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (chan =3D 0; chan < NCHAN; chan++)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pwm_is_registe=
red(&ap->p[chan]))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pwm_unregister(&ap->p[chan]);

why do you test if it's registered ?  the probe function will abort if
any do not register properly.
-mike
