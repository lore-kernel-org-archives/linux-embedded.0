From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v5 1/3] PWM: Implement a generic PWM framework
Date: Sun, 20 Feb 2011 17:46:56 -0500
Message-ID: <AANLkTimpo=N8GNZxwkqAWuXqOgvtmqyGcn596rOGSuZv@mail.gmail.com>
References: <1298175043-31727-1-git-send-email-bgat@billgatliff.com> <1298175043-31727-2-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=pLHMX9x/zfCGYRUGKQp7hCIcU4UQTqbR2LMtV/XICdM=;
        b=M4jiH3u9ZUoML6aM1B2ZeX0P2HMABbpheyp5yw7eCTyoiyH8tnPT/X9JvBo6dSo2UR
         +na8Jt4UkPc5itimsEGrySDs0hi/exyT9PnrLltc8Po0Av6igkYf9UrOkYrhqWsSeoCE
         YCxFftbja0Wq9ew7elIq5w8Wu4ijEqMrI1Mfc=
In-Reply-To: <1298175043-31727-2-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Sat, Feb 19, 2011 at 23:10, Bill Gatliff wrote:
> +void pwm_release(struct pwm_device *p)
> +{
> + =C2=A0 =C2=A0 =C2=A0 mutex_lock(&device_list_mutex);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!test_and_clear_bit(FLAG_REQUESTED, &p->fl=
ags)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG();
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;
> + =C2=A0 =C2=A0 =C2=A0 }

shouldnt that BUG be a WARN ?

> +int pwm_set(struct pwm_device *p, unsigned long period_ns,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long duty_ns, int activ=
e_high)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct pwm_config c =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .config_mask =3D (=
BIT(PWM_CONFIG_PERIOD_TICKS)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | BIT(PWM_CONFIG_DUTY_TICKS)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | BIT(PWM_CONFIG_POLARITY)),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .period_ticks =3D =
pwm_ns_to_ticks(p, period_ns),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .duty_ticks =3D pw=
m_ns_to_ticks(p, duty_ns),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .polarity =3D acti=
ve_high};

i think that brace needs to be uncuddled

> +static const struct attribute *pwm_attrs[] =3D
> +{
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_tick_hz.attr,

cuddle up that brace

> +static const struct attribute_group pwm_device_attr_group =3D {
> + =C2=A0 =C2=A0 =C2=A0 .attrs =3D (struct attribute **) pwm_attrs,
> +};

should attribute_group have its attrs member constified ?

> +static void __exit pwm_exit(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 destroy_workqueue(pwm_handler_workqueue);
> + =C2=A0 =C2=A0 =C2=A0 class_unregister(&pwm_class);
> +}
> +
> +#ifdef MODULE
> +module_init(pwm_init);
> +module_exit(pwm_exit);
> +MODULE_LICENSE("GPL");
> +#else
> +postcore_initcall(pwm_init);
> +#endif

i dont think you need this MODULE trickery.  common code already takes
care of this for you, and it'd let you avoid a warning about pwm_exit
being unused.
postcore_initcall(pwm_init);
module_exit(pwm_exit);
MODULE_LICENSE("GPL");

also, no MODULE_{INFO,AUTHOR} ?

> +struct pwm_device {
> + =C2=A0 =C2=A0 =C2=A0 struct pwm_device_ops *ops;

const ?

> +void pwm_callback(struct pwm_device *pwm);
> +int gpio_pwm_destroy(struct pwm_device *p);

seems a bit inconsistent ... sometimes you use "p", sometimes you use "=
pwm" ...
-mike
