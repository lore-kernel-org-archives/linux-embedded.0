From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Fri, 20 Nov 2009 15:21:31 -0700
Message-ID: <fa686aa40911201421k67d1de27u2c6dbe337989696b@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> 
	<200911170027.38664.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200911170027.38664.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Brownell <david-b@pacbell.net>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

On Tue, Nov 17, 2009 at 1:27 AM, David Brownell <david-b@pacbell.net> w=
rote:
> On Friday 13 November 2009, Grant Likely wrote:
>> I'm concerned about the approach taken here. =A0As I understand it, =
the
>> PWM signals are very similar to GPIOs in that each PWM device contro=
ls
>> an external signal line, just like GPIO lines.
>
> PWM is not GPIO, and doesn't fit into a GPIO framework.
>
> Since *everything* boils down to one or more signal lines,
> your argument leads directly to Linux having no native
> hardware interface except GPIOs. =A0Not ... practical. ;)

I think you've missed my point and taken it to an illogical extreme to
counter it.  I agree that PWMs are not GPIOs and visa versa.  However,
*some* devices are both GPIOs and PWMs.  Also what is needed to manage
GPIO and PWM pins is pretty much identical.

>> The difference being
>> that PWMs cannot do input, and has additional capabilities (can be
>> programmed with a signal; not just on/off/tristate)
>
> If you want to combine PWM with something else ... timers would
> be a better target. =A0They're both fundamentally about periodic
> phenomena. =A0And quite a lot of timers support PWM output modes...
>
> (A generic interface to hardware timers is lacking, too.)
>
>
>> What is the reason for bringing in an entirely new framework instead
>> of extending the GPIO API or gpiolib? =A0I'm not too excited about
>> having two entirely different frameworks for what basically boils do=
wn
>> to "numbered signal pins".
>
> You seem to mis-understand what PWM is all about, then.
> The whole point of a PWM is to set up a periodic activity
> that will run without CPU intervention.

I understand that.

> GPIOs, on the other hand, are packaged for manual bit
> twiddling. =A0While it's possible to create low-speed
> implementations of serial protocols using GPIOs (like
> 2-wire/I2C, one-wire, and various SPI variants), those
> are explicitly the high-overhead (and low performance)
> substitutes, to be used only when native hardware isn't
> available (or is broken etc).

But that *isn't* the primary purpose of the GPIO subsystem.  All that
stuff is layered on top of the GPIO pin management code and doesn't
really play into this debate.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
