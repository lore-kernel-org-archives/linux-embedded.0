From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [[RFC] 1/5] API to consolidate PWM devices behind a common user 
	and kernel interface
Date: Mon, 19 Oct 2009 18:29:00 -0400
Message-ID: <8bd0f97a0910191529p690e10d9l9d6d22c2a02e67fb@mail.gmail.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-2-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=jyb3101SKX2LOfQ05wQYtAkWSxN/mAIslg5ZikrIS1o=;
        b=oj0fAIvJIQE4+jo5oJ3I9jncZ1OgKuZcuVwlYa2i7X2m88zf9rdDdVZkcvGzlmESyD
         /xCQI8zYkL6qrctb21PhsUujNWzCkamhybb9e9dgvdQe/sCdC/e2gHvPzEzcjkgije4O
         9wI/XySDzbWs6iLTESWOjmcjqkZROnFP7GiAY=
In-Reply-To: <1255984366-26952-2-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
> +A generic PWM device framework must accomodate the substantial

accommodate

> +be accomodated by the Generic PWM Device API framework.

accommodated

> +bus_id -- the plaintext name of the device. =C2=A0Users will bind to=
 a

plain text

> +synchronize, unsynchronize -- (optional) Callbacks to
> +synchronize/unsynchronize channels.

perhaps use desynchronize instead ?

> --- /dev/null
> +++ b/drivers/pwm/pwm.c
> @@ -0,0 +1,692 @@
> +#define DEBUG 99

whoops again

> +int pwm_register(struct pwm_device *pwm)
> +{
> + =C2=A0 =C2=A0 =C2=A0 p =3D kcalloc(pwm->nchan, sizeof(struct pwm_ch=
annel), GFP_KERNEL);

sizeof(*p)

> + =C2=A0 =C2=A0 =C2=A0 pr_info("%s: %d channel%s\n", pwm->bus_id, pwm=
->nchan,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm->nchan > 1 ? "=
s" : "");

dev_info(pwm->dev, ....)

> +static struct pwm_device *
> +__pwm_find_device(const char *bus_id)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct pwm_device *p;
> +
> + =C2=A0 =C2=A0 =C2=A0 list_for_each_entry(p, &pwm_device_list, list)
> + =C2=A0 =C2=A0 =C2=A0 {

cuddle that brace

> +struct pwm_channel *
> +pwm_request(const char *bus_id,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int chan,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *requester)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct pwm_device *p;
> +
> + =C2=A0 =C2=A0 =C2=A0 pr_debug("%s: %s:%d returns %p\n", __func__,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus_id, chan=
, &p->channels[chan]);
> +       pr_debug("%s: %s:%d returns NULL\n",
> +                __func__, bus_id, chan);

dev_dbg(p->dev, ....);

> +void pwm_free(struct pwm_channel *p)
> +{
> + =C2=A0 =C2=A0 =C2=A0 pr_debug("%s: %s:%d free\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, p-=
>pwm->bus_id, p->chan);

dev_dbg(p->dev, ....);

> +unsigned long pwm_ns_to_ticks(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long nsecs)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long long ticks;
> +
> + =C2=A0 =C2=A0 =C2=A0 ticks =3D nsecs;
> + =C2=A0 =C2=A0 =C2=A0 ticks *=3D p->tick_hz;
> + =C2=A0 =C2=A0 =C2=A0 do_div(ticks, 1000000000);
> + =C2=A0 =C2=A0 =C2=A0 return ticks;
> +}
> +EXPORT_SYMBOL(pwm_ns_to_ticks);

perhaps better as a static inline in the header ?

> +unsigned long pwm_ticks_to_ns(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long ticks)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long long ns;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!p->tick_hz)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 ns =3D ticks;
> + =C2=A0 =C2=A0 =C2=A0 ns *=3D 1000000000UL;
> + =C2=A0 =C2=A0 =C2=A0 do_div(ns, p->tick_hz);
> + =C2=A0 =C2=A0 =C2=A0 return ns;
> +}
> +EXPORT_SYMBOL(pwm_ticks_to_ns);

this one too

> +static void
> +pwm_config_percent_to_ticks(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct pwm_channel_config *c)
> +{
> + =C2=A0 =C2=A0 =C2=A0 if (c->config_mask & PWM_CONFIG_DUTY_PERCENT) =
{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c->config_mask=
 & PWM_CONFIG_PERIOD_TICKS)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 c->duty_ticks =3D c->period_ticks;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 c->duty_ticks =3D p->period_ticks;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c->duty_ticks *=3D=
 c->duty_percent;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c->duty_ticks /=3D=
 100;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c->config_mask &=3D=
 ~PWM_CONFIG_DUTY_PERCENT;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c->config_mask |=3D=
 PWM_CONFIG_DUTY_TICKS;
> + =C2=A0 =C2=A0 =C2=A0 }
> +}

if you returned when the mask doesnt match, then you wouldnt need to
indent the rest of the func

> +int pwm_config(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pwm_channel_=
config *c)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (unlikely(!p->pwm->config)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug("%s: %s:%=
d has no config handler (-EINVAL)\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0__func__, p->pwm->bus_id, p->chan);

dev_dbg(p->dev, ....);

> + =C2=A0 =C2=A0 =C2=A0 switch (c->config_mask & (PWM_CONFIG_PERIOD_TI=
CKS
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | PWM_CONFIG_DUTY_TICKS)) {
> + =C2=A0 =C2=A0 =C2=A0 case PWM_CONFIG_PERIOD_TICKS:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p->duty_ticks =
> c->period_ticks) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ret =3D -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto err;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case PWM_CONFIG_DUTY_TICKS:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p->period_tick=
s < c->duty_ticks) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ret =3D -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto err;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case PWM_CONFIG_DUTY_TICKS | PWM_CONFIG_PERIOD=
_TICKS:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c->duty_ticks =
> c->period_ticks) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ret =3D -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto err;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;

unless i missed something, the first and third case is the same.  so
probably better (compiled code wise) to write an if statement.

> + =C2=A0 =C2=A0 =C2=A0 pr_debug("%s: config_mask %d period_ticks %lu =
duty_ticks %lu"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0" polarity %=
d duty_ns %lu period_ns %lu duty_percent %d\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, c-=
>config_mask, c->period_ticks, c->duty_ticks,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c->polarity,=
 c->duty_ns, c->period_ns, c->duty_percent);

dev_dbg(p->dev, ....);

> +int pwm_set_period_ns(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 unsigned long period_ns)
> +unsigned long pwm_get_period_ns(struct pwm_channel *p)
> +int pwm_set_duty_ns(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsi=
gned long duty_ns)
> +unsigned long pwm_get_duty_ns(struct pwm_channel *p)
> +int pwm_set_duty_percent(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0int percent)
> +int pwm_set_polarity(struct pwm_channel *p,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
int active_high)
> +int pwm_start(struct pwm_channel *p)
> +int pwm_stop(struct pwm_channel *p)

these all look like they should static inlines

> +static void __pwm_callback(struct pwm_channel *p)
> +{
> + =C2=A0 =C2=A0 =C2=A0 queue_work(pwm_handler_workqueue, &p->handler_=
work);
> + =C2=A0 =C2=A0 =C2=A0 pr_debug("%s:%d handler %p scheduled with data=
 %p\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p->pwm->bus_=
id, p->chan, p->handler, p->handler_data);

dev_dbg(p->dev, ....);

> +static struct class pwm_class =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =3D "pwm",
> + =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MODULE,
> +
> + =C2=A0 =C2=A0 =C2=A0 .class_attrs =3D pwm_class_attrs,
> +};

spurious new line ?

> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -1,31 +1,170 @@
> =C2=A0#ifndef __LINUX_PWM_H
> =C2=A0#define __LINUX_PWM_H
>
> -struct pwm_device;
> -
> =C2=A0/*
> - * pwm_request - request a PWM device
> + * include/linux/pwm.h

header #ifdef should really be after the comment blob

> + =C2=A0 =C2=A0 =C2=A0 PWM_CONFIG_DUTY_TICKS =3D BIT(0),
> + =C2=A0 =C2=A0 =C2=A0 PWM_CONFIG_PERIOD_TICKS =3D BIT(1),
> + =C2=A0 =C2=A0 =C2=A0 PWM_CONFIG_POLARITY =3D BIT(2),
> + =C2=A0 =C2=A0 =C2=A0 PWM_CONFIG_START =3D BIT(3),
> + =C2=A0 =C2=A0 =C2=A0 PWM_CONFIG_STOP =3D BIT(4),
>
> + =C2=A0 =C2=A0 =C2=A0 PWM_CONFIG_HANDLER =3D BIT(5),
> +
> + =C2=A0 =C2=A0 =C2=A0 PWM_CONFIG_DUTY_NS =3D BIT(6),

spurious new lines ?

> +enum {
> + =C2=A0 =C2=A0 =C2=A0 FLAG_REQUESTED =3D 0,
> + =C2=A0 =C2=A0 =C2=A0 FLAG_STOP =3D 1,
> +};

this is weird ... you're doing things like:
    if (pwm->channels[wchan].flags & FLAG_REQUESTED) {
    if (test_and_set_bit(FLAG_REQUESTED, &p->flags))

but FLAG_REQUESTED is 0 ...
-mike
