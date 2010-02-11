From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 2/5] Emulates PWM hardware using a high-resolution
 timer and a GPIO pin
Date: Thu, 11 Feb 2010 14:35:14 -0600
Message-ID: <4B746A02.9060306@billgatliff.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <2d73f9b2fd175fd3e482920baebcd3028206f02e.1265094517.git.bgat@billgatliff.com> <20100211200702.GB1487@ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100211200702.GB1487@ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

Pavel Machek wrote:
>> +static void
>> +gpio_pwm_work (struct work_struct *work)
>> +{
>> +	struct gpio_pwm *gp = container_of(work, struct gpio_pwm, work);
>> +
>> +	if (gp->active)
>> +		gpio_direction_output(gp->gpio, gp->polarity ? 1 : 0);
>> +	else
>> +		gpio_direction_output(gp->gpio, gp->polarity ? 0 : 1);
>> +}
>>     
>
> ...polarity ^ active ?
>   

... except that if polarity and/or active are >1, I don't send the
values 1 or 0 to gpio_direction_output.  I don't know if the API is
specifically intended to accept nonzero values that are greater than 1.


b.g.

-- 
Bill Gatliff
Embedded systems training and consulting
http://billgatliff.com
bgat@billgatliff.com
