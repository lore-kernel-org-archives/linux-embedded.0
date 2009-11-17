From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Tue, 17 Nov 2009 09:54:14 -0600
Message-ID: <4B02C726.6070607@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> <200911170027.38664.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200911170027.38664.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

David Brownell wrote:
> On Friday 13 November 2009, Grant Likely wrote:
>   
>> I'm concerned about the approach taken here.  As I understand it, the
>> PWM signals are very similar to GPIOs in that each PWM device controls
>> an external signal line, just like GPIO lines.
>>     
>
> PWM is not GPIO, and doesn't fit into a GPIO framework.
>
> Since *everything* boils down to one or more signal lines,
> your argument leads directly to Linux having no native
> hardware interface except GPIOs.  Not ... practical. ;)
>   

Wait.  Isn't that what Ubicom's chips do?  :)


> If you want to combine PWM with something else ... timers would
> be a better target.  They're both fundamentally about periodic
> phenomena.  And quite a lot of timers support PWM output modes...
>
> (A generic interface to hardware timers is lacking, too.)
>   

True, and I have code (not yet published) to support a couple of
timer/counter peripherals under the PWM interface.  So for that
functionality at least, I don't think a more generic or standalone API
is necessary.

I don't know how to define a generic interface for the counter a.k.a.
"input capture" behavior of such devices, though.  Still an unsolved
problem, but I don't think it will be a part of the PWM API.  It's a
different metaphor.


> GPIOs, on the other hand, are packaged for manual bit
> twiddling.  While it's possible to create low-speed
> implementations of serial protocols using GPIOs (like
> 2-wire/I2C, one-wire, and various SPI variants), those
> are explicitly the high-overhead (and low performance)
> substitutes, to be used only when native hardware isn't
> available (or is broken etc).
>   

And when using GPIO to generate I2C or SPI signals, you don't do it
through the GPIO interface--- you do it through the I2C or SPI
interface, and a driver behind that API talks to the GPIO API.... or to
a different driver if you change your mind.  Same idea for the PWM API.


-- 
Bill Gatliff
bgat@billgatliff.com

