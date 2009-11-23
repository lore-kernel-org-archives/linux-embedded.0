From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Mon, 23 Nov 2009 08:12:02 -0600
Message-ID: <4B0A9832.20908@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <8bd0f97a0911132022pf743558lfef1402125d4b60b@mail.gmail.com> 	<fa686aa40911132355t3b79fe46m90005ecba453dcc1@mail.gmail.com> 	<200911162347.02364.david-b@pacbell.net> <fa686aa40911201414u6a9023e6y9addc97635d1c88@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911201414u6a9023e6y9addc97635d1c88@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Brownell <david-b@pacbell.net>, Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org

Grant Likely wrote:
> I'm talking about discrete controllable entities.

At the extreme, I see discrete, single-pin GPIO as being a degenerate
case of PWM: only 0% or 100% duty cycle e.g. one-bit granularity, a
single output, and no dependencies with any other channels or pins.  
But the perspectives of the two groups of users are completely
different, so I don't see any advantage to having a combined user-facing
API.


> I'm talking about the management code to obtain a reference to
> the pin your interested in.  There is a non-trivial amount of code
> associated with getting a reference to a pin and the behaviour
> required is largely identical between GPIO and PWM.

True, but anything involving pins has to be dealt with at the platform
level.  And the general approach for that so far is that the board's
startup code sets the pins how it wants them, and the peripheral drivers
more or less assume that things are as they should be when it comes time
to activate the peripherals themselves.  Anything more sophisticated
than that and you prevent the kind of reuse that's taking place now
between AVR32 and AT91, for example.

Maybe that's an opportunity for improvement: an API for pin reservation,
that GPIO, PWM and other platform-oriented drivers could use to request
the pins that they want.  A kind of common version of the OMAP mux
management code, if you will.

But I don't think such an API would be all that useful for GPIO- and
PWM-related scenarios.  Out of necessity, PWM and GPIO are very specific
to the board hardware, and on-the-fly pin configuration changes aren't
possible: either the hardware needs that pin to be an output, or it
doesn't.  You can't make that decision at runtime because you'd probably
have to swap out or add resistors, drivers, etc.  The software to do
*that* would be.... tricky.  :)


> I don't want to see a new subsystem that largely does the exact same job, but is
> different in subtle ways.  I think it should either be a unified
> PWM/GPIO pin management subsystem, or a common library used by each.
>   

Where is there overlap?  My PWM code is totally pin-agnostic, at least
for the drivers I've worked with so far.  And I'm not aware of any GPIO
chip drivers that deal with pin multiplexing, either.  Not saying there
aren't any, only that I haven't seen them.

It's a nice idea in the abstract, but I sure don't see how to make it
work well enough in practice to be worth the effort.  I'm not saying it
can't be done, just that it isn't my focus.  Yours?  :)


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
