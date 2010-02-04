From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 1/5] API to consolidate PWM devices behind a common
 user and kernel interface
Date: Thu, 04 Feb 2010 11:30:56 -0600
Message-ID: <4B6B0450.4000507@billgatliff.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <c5873aa7c5d20254a9e54fc1ff179345b77c16b5.1265094517.git.bgat@billgatliff.com> <BD79186B4FD85F4B8E60E381CAEE190902152ADB@mi8nycmail19.Mi8.com> <4B6A5BAA.2030908@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B6A5BAA.2030908@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

Bill Gatliff wrote:
> H Hartley Sweeten wrote:
>   
>> Your older patch just used printk's to output the messages.  I think the
>> Oops is being caused by the dev_<level>(pwm->dev, ...).  Where is pwm->dev
>> being setup?
>>   
>>     
>
> The intention was to save the result from device_create() called from
> __pwm_create_sysfs(), but I'm suspicious that the patch I posted doesn't
> have that code for some reason.  My local git repo here doesn't seem to
> have it.  Hmmm...
>   

No, that's not right.  Disregard the above.

If the PWM device in question is already known to the kernel, then
before you call pwm_register() you must set pwm->dev to the address of
that device structure.  I need to come up with a better way to handle this.

If the PWM device isn't already known to the kernel as a true struct
device, then I don't yet have a Plan B.  Drat.  :(


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com

