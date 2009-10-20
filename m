From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [[RFC] 4/5] An LED "dimmer" trigger, which uses the PWM API to
 vary the brightness of an LED according to system load
Date: Mon, 19 Oct 2009 20:42:36 -0500
Message-ID: <4ADD158C.2090708@billgatliff.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com> 	<1255984366-26952-4-git-send-email-bgat@billgatliff.com> <1255984366-26952-5-git-send-email-bgat@billgatliff.com> <8bd0f97a0910191451w89d80ffx9afcdbe31dad0cc7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0910191451w89d80ffx9afcdbe31dad0cc7@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
>   
>> --- a/drivers/leds/leds-pwm.c
>> +++ b/drivers/leds/leds-pwm.c
>> @@ -1,153 +1,167 @@
>> -/*
>> - * linux/drivers/leds-pwm.c
>> - *
>> - * simple PWM based LED control
>> - *
>> - * Copyright 2009 Luotao Fu @ Pengutronix (l.fu@pengutronix.de)
>> - *
>> - * based on leds-gpio.c by Raphael Assenat <raph@8d.com>
>> - *
>> - * This program is free software; you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License version 2 as
>> - * published by the Free Software Foundation.
>> - */
>>     
>
> this should not be removed.  if you wanted to add your copyright line,
> then that's fine, but the rest needs to stay.
>   

For the record, the reason the file looks like it does is because I 
wrote an original one that replaced the previous leds-pwm.c--- but 
obviously git didn't see it that way when it produced the diff.

I certainly wasn't trying to write-out anyone's copyright!  I don't have 
a problem with their names appearing in the file, regardless, so I'll 
put them back in.  If they have problems with their names appearing 
therein, they can let me know.  :)

>>  #include <linux/pwm.h>
>> +#include <linux/pwm-led.h>
>>     
>
> if there's going to be a bunch of new pwm related headers, perhaps a
> subdir makes more sense: linux/pwm/xxx
>   

In general I don't have a problem with this.  However, in this specific 
case would it make more sense to just fold pwm-led.h into pwm.h?  There 
really isn't much to pwm-led.h.

>> +static void
>> +led_pwm_brightness_set(struct led_classdev *c,
>> +                      enum led_brightness b)
>> +{
>> +       struct led_pwm *led;
>> +       int percent;
>> +
>> +       percent = (b * 100) / (LED_FULL - LED_OFF);
>> +       led = container_of(c, struct led_pwm, led);
>>     
>
> instead of using container_of() everywhere, why not add a helper macro
> that turns a led_classev into a led_pwm
>   

That's just a personal style thing.  As soon as I write a helper macro, 
I tend to forget how it works and then start mis-using it everywhere.  
But I don't have a problem with doing a helper.

For better type-safety, would a helper inline-function be a better 
choice than a helper macro?  Or would it make any difference?

>> +static int __init
>> +led_pwm_probe(struct platform_device *pdev)
>>     
>
> probe functions are typical __devinit
>   

Yep, my bad.

>> +       if (!try_module_get(d->driver->owner))
>> +               return -ENODEV;
>>     
>
> is this really needed ?
>   

Not sure.

>> -static int __devexit led_pwm_remove(struct platform_device *pdev)
>> +static int
>> +led_pwm_remove(struct platform_device *pdev)
>>     
>
> looks like you lost the __devexit markings
>   

Yep.

>>  static struct platform_driver led_pwm_driver = {
>> +       .driver = {
>> +               .name =         "leds-pwm",
>> +               .owner =        THIS_MODULE,
>>        },
>>     
>
> i dont think platform_drivers need to explicitly set their owner.  i
> thought that was all handled for you.
>   

There are examples for both cases.  I don't see anything assigning to 
.owner in drivers/base/platform.c, though.

>> --- /dev/null
>> +++ b/include/linux/pwm-led.h
>> @@ -0,0 +1,34 @@
>> +#ifndef __LINUX_PWM_LED_H
>> +#define __LINUX_PWM_LED_H
>> +
>> +/*
>> + * include/linux/pwm-led.h
>>     
>
> the ifdef protection typically goes after the header comment blob, not before
>   

Yep, my bad.


Thanks for the feedback!


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
