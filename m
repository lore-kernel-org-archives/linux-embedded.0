From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [[RFC] 1/5] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Mon, 19 Oct 2009 20:59:24 -0500
Message-ID: <4ADD197C.2090808@billgatliff.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <8bd0f97a0910191529p690e10d9l9d6d22c2a02e67fb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0910191529p690e10d9l9d6d22c2a02e67fb@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
>   
>> +A generic PWM device framework must accomodate the substantial
>>     
>
> accommodate
>   

Heh, and to think I sometimes get paid to write!  :)

Similar and redundant feedback [snipped]


>> +synchronize, unsynchronize -- (optional) Callbacks to
>> +synchronize/unsynchronize channels.
>>     
>
> perhaps use desynchronize instead ?
>   

I like that idea.

>   
>> --- /dev/null
>> +++ b/drivers/pwm/pwm.c
>> @@ -0,0 +1,692 @@
>> +#define DEBUG 99
>>     
>
> whoops again
>   

Grr.  ADHD guys shouldn't code without their caffeine!  :)


>> +int pwm_register(struct pwm_device *pwm)
>> +{
>> +       p = kcalloc(pwm->nchan, sizeof(struct pwm_channel), GFP_KERNEL);
>>     
>
> sizeof(*p)
>   

Good catch.


>> +       pr_info("%s: %d channel%s\n", pwm->bus_id, pwm->nchan,
>> +               pwm->nchan > 1 ? "s" : "");
>>     
>
> dev_info(pwm->dev, ....)
>   

Yep.  I wonder what I was thinking at the time?  :)

>> +static struct pwm_device *
>> +__pwm_find_device(const char *bus_id)
>> +{
>> +       struct pwm_device *p;
>> +
>> +       list_for_each_entry(p, &pwm_device_list, list)
>> +       {
>>     
>
> cuddle that brace
>   

Yep.

>> +struct pwm_channel *
>> +pwm_request(const char *bus_id,
>> +           int chan,
>> +           const char *requester)
>> +{
>> +       struct pwm_device *p;
>> +
>> +       pr_debug("%s: %s:%d returns %p\n", __func__,
>> +                bus_id, chan, &p->channels[chan]);
>> +       pr_debug("%s: %s:%d returns NULL\n",
>> +                __func__, bus_id, chan);
>>     
>
> dev_dbg(p->dev, ....);
>   

Yep again, and again...

>   
>> +unsigned long pwm_ns_to_ticks(struct pwm_channel *p,
>> +                             unsigned long nsecs)
>> +{
>> +       unsigned long long ticks;
>> +
>> +       ticks = nsecs;
>> +       ticks *= p->tick_hz;
>> +       do_div(ticks, 1000000000);
>> +       return ticks;
>> +}
>> +EXPORT_SYMBOL(pwm_ns_to_ticks);
>>     
>
> perhaps better as a static inline in the header ?
>   

I guess that wouldn't negatively affect modules using the function, so I 
think I agree.


>> +unsigned long pwm_ticks_to_ns(struct pwm_channel *p,
>> +                             unsigned long ticks)
>> +{
>> +       unsigned long long ns;
>> +
>> +       if (!p->tick_hz)
>> +               return 0;
>> +
>> +       ns = ticks;
>> +       ns *= 1000000000UL;
>> +       do_div(ns, p->tick_hz);
>> +       return ns;
>> +}
>> +EXPORT_SYMBOL(pwm_ticks_to_ns);
>>     
>
> this one too
>   

Yep.

>> +static void
>> +pwm_config_percent_to_ticks(struct pwm_channel *p,
>> +                           struct pwm_channel_config *c)
>> +{
>> +       if (c->config_mask & PWM_CONFIG_DUTY_PERCENT) {
>> +               if (c->config_mask & PWM_CONFIG_PERIOD_TICKS)
>> +                       c->duty_ticks = c->period_ticks;
>> +               else
>> +                       c->duty_ticks = p->period_ticks;
>> +
>> +               c->duty_ticks *= c->duty_percent;
>> +               c->duty_ticks /= 100;
>> +               c->config_mask &= ~PWM_CONFIG_DUTY_PERCENT;
>> +               c->config_mask |= PWM_CONFIG_DUTY_TICKS;
>> +       }
>> +}
>>     
>
> if you returned when the mask doesnt match, then you wouldnt need to
> indent the rest of the func
>   

That's a habit I learned in my early days when I had an emulator that 
really didn't like multiple exit points from functions.  And it's been a 
hard habit to break!

>> +int pwm_config(struct pwm_channel *p,
>> +              struct pwm_channel_config *c)
>> +{
>> +       int ret = 0;
>> +
>> +       if (unlikely(!p->pwm->config)) {
>> +               pr_debug("%s: %s:%d has no config handler (-EINVAL)\n",
>> +                        __func__, p->pwm->bus_id, p->chan);
>>     
>
> dev_dbg(p->dev, ....);
>
>   
>> +       switch (c->config_mask & (PWM_CONFIG_PERIOD_TICKS
>> +                                 | PWM_CONFIG_DUTY_TICKS)) {
>> +       case PWM_CONFIG_PERIOD_TICKS:
>> +               if (p->duty_ticks > c->period_ticks) {
>> +                       ret = -EINVAL;
>> +                       goto err;
>> +               }
>> +               break;
>> +       case PWM_CONFIG_DUTY_TICKS:
>> +               if (p->period_ticks < c->duty_ticks) {
>> +                       ret = -EINVAL;
>> +                       goto err;
>> +               }
>> +               break;
>> +       case PWM_CONFIG_DUTY_TICKS | PWM_CONFIG_PERIOD_TICKS:
>> +               if (c->duty_ticks > c->period_ticks) {
>> +                       ret = -EINVAL;
>> +                       goto err;
>> +               }
>> +               break;
>>     
>
> unless i missed something, the first and third case is the same.  so
> probably better (compiled code wise) to write an if statement.
>   

Yea.  Can you tell that code has been "refactored"?  :)

>> +       pr_debug("%s: config_mask %d period_ticks %lu duty_ticks %lu"
>> +                " polarity %d duty_ns %lu period_ns %lu duty_percent %d\n",
>> +                __func__, c->config_mask, c->period_ticks, c->duty_ticks,
>> +                c->polarity, c->duty_ns, c->period_ns, c->duty_percent);
>>     
>
> dev_dbg(p->dev, ....);
>   

Yep.

>> +int pwm_set_period_ns(struct pwm_channel *p,
>> +                     unsigned long period_ns)
>> +unsigned long pwm_get_period_ns(struct pwm_channel *p)
>> +int pwm_set_duty_ns(struct pwm_channel *p,
>> +                   unsigned long duty_ns)
>> +unsigned long pwm_get_duty_ns(struct pwm_channel *p)
>> +int pwm_set_duty_percent(struct pwm_channel *p,
>> +                        int percent)
>> +int pwm_set_polarity(struct pwm_channel *p,
>> +                    int active_high)
>> +int pwm_start(struct pwm_channel *p)
>> +int pwm_stop(struct pwm_channel *p)
>>     
>
> these all look like they should static inlines
>   

I'll double-check each one, but I think you might be right.

>> +static void __pwm_callback(struct pwm_channel *p)
>> +{
>> +       queue_work(pwm_handler_workqueue, &p->handler_work);
>> +       pr_debug("%s:%d handler %p scheduled with data %p\n",
>> +                p->pwm->bus_id, p->chan, p->handler, p->handler_data);
>>     
>
> dev_dbg(p->dev, ....);
>   

Yep.


>> +static struct class pwm_class = {
>> +       .name = "pwm",
>> +       .owner = THIS_MODULE,
>> +
>> +       .class_attrs = pwm_class_attrs,
>> +};
>>     
>
> spurious new line ?
>   

Mentally, I separate the two activities and I guess my code reflects 
that.  :)


>> --- a/include/linux/pwm.h
>> +++ b/include/linux/pwm.h
>> @@ -1,31 +1,170 @@
>>  #ifndef __LINUX_PWM_H
>>  #define __LINUX_PWM_H
>>
>> -struct pwm_device;
>> -
>>  /*
>> - * pwm_request - request a PWM device
>> + * include/linux/pwm.h
>>     
>
> header #ifdef should really be after the comment blob
>   

Agreed.


>> +       PWM_CONFIG_DUTY_TICKS = BIT(0),
>> +       PWM_CONFIG_PERIOD_TICKS = BIT(1),
>> +       PWM_CONFIG_POLARITY = BIT(2),
>> +       PWM_CONFIG_START = BIT(3),
>> +       PWM_CONFIG_STOP = BIT(4),
>>
>> +       PWM_CONFIG_HANDLER = BIT(5),
>> +
>> +       PWM_CONFIG_DUTY_NS = BIT(6),
>>     
>
> spurious new lines ?
>   

More subtle mental "compartmentalizing" that needs to go away now that 
the code has stabilized.

>> +enum {
>> +       FLAG_REQUESTED = 0,
>> +       FLAG_STOP = 1,
>> +};
>>     
>
> this is weird ... you're doing things like:
>     if (pwm->channels[wchan].flags & FLAG_REQUESTED) {
>     if (test_and_set_bit(FLAG_REQUESTED, &p->flags))
>
> but FLAG_REQUESTED is 0 ...
>   

Yea, that first example is obviously very, very wrong.  The enumerations 
are supposed to be bit positions.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
