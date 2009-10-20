From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [[RFC] 2/5] Emulates PWM hardware using a high-resolution timer
 and a GPIO pin
Date: Mon, 19 Oct 2009 20:47:13 -0500
Message-ID: <4ADD16A1.6010508@billgatliff.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com> <8bd0f97a0910191456n1b8f1aabr9b54b1126b2ec0c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0910191456n1b8f1aabr9b54b1126b2ec0c6@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
>   
>> --- /dev/null
>> +++ b/drivers/pwm/gpio.c
>> @@ -0,0 +1,318 @@
>> +#define DEBUG 99
>>     
>
> whoops
>
>   

Indeed!


>> +       pr_debug("%s:%d start, %lu ticks\n",
>> +                dev_name(p->pwm->dev), p->chan, p->duty_ticks);
>>     
>
> you already have a struct device, so this is just odd.  use dev_dbg()
> instead and let it worry about dev_name() stuff.  plus you're already
> using dev_dbg() in the rest of the code, so i guess you just forgot
> about this.
>   

Yea, I think so.

>> +       case PWM_CONFIG_START:
>> +               if (!hrtimer_active(&gp->t)) {
>> +                       gpio_pwm_start(p);
>> +               }
>>     
>
> dont really need those braces
>   

Agreed.

>> +       struct gpio_pwm *gp = container_of(p->pwm, struct gpio_pwm, pwm);
>>     
>
> helper macro for this ?
>   

Ditto.

>> +static int
>> +gpio_pwm_config(struct pwm_channel *p,
>> +               struct pwm_channel_config *c)
>> +{
>> +       struct gpio_pwm *gp = container_of(p->pwm, struct gpio_pwm, pwm);
>> +       int was_on = 0;
>> +
>> +       if (p->pwm->config_nosleep) {
>> +               if (!p->pwm->config_nosleep(p, c))
>> +                       return 0;
>> +       }
>> +
>> +       might_sleep();
>>     
>
> shouldnt this be above the config_n
>   

Actually, not.  In this example I'm hoping that the requested action can 
be handled by the config_nosleep code, and if it can then I just 
return.  Otherwise, I go through the might_sleep and then into the code 
that might actually sleep.

But, I think the upper-level code might already do this same thing, so 
the above might be entirely redundant.  I'll have to check on that.


>> +static int __init
>> +gpio_pwm_probe(struct platform_device *pdev)
>>     
>
> __devinit
>   

Yep.

>> +static struct platform_driver gpio_pwm_driver = {
>> +       .driver = {
>> +               .name = "gpio_pwm",
>> +               .owner = THIS_MODULE,
>> +       },
>>     
>
> dont need the explicit .owner ?
>   

Again, not sure.


>   
>> +static void gpio_pwm_exit(void)
>>     
>
> __exit
>   

I think so, yes.


>> +MODULE_DESCRIPTION("PWM output using GPIO and an itimer");
>>     
>
> itimer -> hrtimer ?
>   

Yep.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
