From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 1/5] API to consolidate PWM devices behind a common
 user and kernel interface
Date: Thu, 11 Feb 2010 14:51:56 -0600
Message-ID: <4B746DEC.7080602@billgatliff.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <c5873aa7c5d20254a9e54fc1ff179345b77c16b5.1265094517.git.bgat@billgatliff.com> <20100211200456.GA1487@ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100211200456.GA1487@ucw.cz>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

Pavel Machek wrote:
> Exactly; if your hw can be damaged by software, it was misdesigned.
>
> Is the paragraph #1 really neccessary?
>   

It provides a little background on the subject matter.  I don't think
it's mandatory, but I don't see the harm in keeping it.  I think it
improves the document overall from an editorial perspective, however.


>> +pwm_free() -- Marks a PWM channel as no longer in use.  The PWM device
>> +is stopped before it is released by the API.
>>     
>
> free is normally used for something else. Rename to open/close?
>   

... or request/release?

>> +pwm_start(), pwm_stop() -- Turns the PWM signal on and off.  Except
>> +where stated otherwise by a driver author, signals are stopped at the
>> +end of the current period, at which time the output is set to its
>> +inactive state.
>>     
>
> What does it mean to stop a signal? What is the difference between 0%
> duty cycle and stop() ?
>   

Depends on the hardware.  For a true PWM peripheral, a 0% duty cycle
might still have the base peripheral clock for the device running. 
Whereas a pwm_stop() signal could be used to turn off the clock to the
peripheral.

> Is polarity realy required? Can't driver just replace duty with
> 100%-duty

Actually, yes in some cases.  Users can always do the 100%-duty math,
but some hardware asserts a specific output state when you stop the
peripheral that's potentially different from 0% duty.  Also, some
hardware begins the PWM cycle with the output high, while others do with
the output low.  It isn't necessarily the case that the user cares, but
I was thinking that having the API allow for different polarity might
prevent some applications having to optionally do the %duty vs.
100-%duty conversion themselves.


b.g.

-- 
Bill Gatliff
Embedded systems training and consulting
http://billgatliff.com
bgat@billgatliff.com
