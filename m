From: "H Hartley Sweeten" <hartleys@visionengravers.com>
Subject: RE: [PWM PATCH 2/5] Emulates PWM hardware using a high-resolution timer and a GPIO pin
Date: Fri, 12 Feb 2010 08:53:30 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190902153515@mi8nycmail19.Mi8.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <2d73f9b2fd175fd3e482920baebcd3028206f02e.1265094517.git.bgat@billgatliff.com> <20100211200702.GB1487@ucw.cz> <4B746A02.9060306@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <4B746A02.9060306@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

Thursday, February 11, 2010 1:35 PM, Bill Gatliff wrote:
> Pavel Machek wrote:
>>> +static void
>>> +gpio_pwm_work (struct work_struct *work)
>>> +{
>>> +	struct gpio_pwm *gp = container_of(work, struct gpio_pwm, work);
>>> +
>>> +	if (gp->active)
>>> +		gpio_direction_output(gp->gpio, gp->polarity ? 1 : 0);
>>> +	else
>>> +		gpio_direction_output(gp->gpio, gp->polarity ? 0 : 1);
>>> +}
>>>     
>>
>> ...polarity ^ active ?
>>   
>
> ... except that if polarity and/or active are >1, I don't send the
> values 1 or 0 to gpio_direction_output.  I don't know if the API is
> specifically intended to accept nonzero values that are greater than 1.

FWIW, the gpiolib API will accept any non-zero value to "set" a gpio pin
and a zero value to "clear" the pin.

For that matter, some of the gpiolib drivers end up returning the bit
position mask for a given gpio pin and not 1 or 0.  For instance if the
gpio pin in question is bit 6 in an 8-bit register and it is set, a
__gpio_get_value will end up returning 0x40 and not '1'.

Regards,
Hartley
