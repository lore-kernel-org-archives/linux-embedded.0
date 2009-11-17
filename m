From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Tue, 17 Nov 2009 01:27:38 -0700
Message-ID: <200911170027.38664.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

On Friday 13 November 2009, Grant Likely wrote:
> I'm concerned about the approach taken here. =A0As I understand it, t=
he
> PWM signals are very similar to GPIOs in that each PWM device control=
s
> an external signal line, just like GPIO lines.

PWM is not GPIO, and doesn't fit into a GPIO framework.

Since *everything* boils down to one or more signal lines,
your argument leads directly to Linux having no native
hardware interface except GPIOs.  Not ... practical. ;)



> The difference being=20
> that PWMs cannot do input, and has additional capabilities (can be
> programmed with a signal; not just on/off/tristate)

If you want to combine PWM with something else ... timers would
be a better target.  They're both fundamentally about periodic
phenomena.  And quite a lot of timers support PWM output modes...

(A generic interface to hardware timers is lacking, too.)


> What is the reason for bringing in an entirely new framework instead
> of extending the GPIO API or gpiolib? =A0I'm not too excited about
> having two entirely different frameworks for what basically boils dow=
n
> to "numbered signal pins".

You seem to mis-understand what PWM is all about, then.
The whole point of a PWM is to set up a periodic activity
that will run without CPU intervention.

GPIOs, on the other hand, are packaged for manual bit
twiddling.  While it's possible to create low-speed
implementations of serial protocols using GPIOs (like
2-wire/I2C, one-wire, and various SPI variants), those
are explicitly the high-overhead (and low performance)
substitutes, to be used only when native hardware isn't
available (or is broken etc).

=46or example you won't often get 40 Mbit/sec SPI if you
are bitbanging over GPIOs ... and if you do, it won't
leave much CPU horsepower for much of anything else.

- Dave
