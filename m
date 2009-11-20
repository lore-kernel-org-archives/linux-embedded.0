From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Fri, 20 Nov 2009 15:14:36 -0700
Message-ID: <fa686aa40911201414u6a9023e6y9addc97635d1c88@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <8bd0f97a0911132022pf743558lfef1402125d4b60b@mail.gmail.com> 
	<fa686aa40911132355t3b79fe46m90005ecba453dcc1@mail.gmail.com> 
	<200911162347.02364.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200911162347.02364.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Brownell <david-b@pacbell.net>
Cc: Mike Frysinger <vapier.adi@gmail.com>, Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org

On Tue, Nov 17, 2009 at 12:47 AM, David Brownell <david-b@pacbell.net> =
wrote:
> On Friday 13 November 2009, Grant Likely wrote:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Right now, I don't
>> see a fundamental difference is between GPIO and PWM pin management.
>> It is essentially the same problem, and in many cases PWM pins can
>> also be used as GPIOs.
>
> Pin management for a given SoC is going to be relevant to setting
> every signal, no matter what peripheral it's associated with. =A0The
> same argument applies to an MDIO bus, I2C, 1-wire, and more.
>
> And I don't buy it in those cases either.
>
>
>> I think the question should be flipped around;
>> rather than asking for a compelling reason for them to be merged; I
>> want to know the compelling reason to keep them separate. =A0What is=
 the
>> fundamental difference that keeps them apart?
>
> PWM is about periodic signal generation without CPU intervention.
>
> GPIO is about explicit CPU management/interrogation of single
> signals.

Can also be viewed from the perspective: It is about putting a pin
into a particular state until I explicitly tell you to change it.
Whether that state be a GPIO input, a GPIO high, a GPIO low, or a PWM
periodic.

>> What I would like to see is the PWM functions added to the GPIO API.
>
> No. =A0If you want a pin mux interface, come up with one of them.
>
> It shouldn't be a PWM interface, a GPIO interface, an I2C interface,
> a SPI interface, an MDIO interface, a 1-wire interface ... or any of
> dozens of other things. =A0It'd be purely for pinmux.

I'm not talking about a pin mux interface.  I'm talking about discrete
controllable entities.  I agree that pin muxing is an entirely
different scope.  I'm also not talking about layers on top of the
GPIO.  I'm talking about the management code to obtain a reference to
the pin your interested in.  There is a non-trivial amount of code
associated with getting a reference to a pin and the behaviour
required is largely identical between GPIO and PWM.  I don't want to
see a new subsystem that largely does the exact same job, but is
different in subtle ways.  I think it should either be a unified
PWM/GPIO pin management subsystem, or a common library used by each.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
