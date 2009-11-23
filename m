From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Mon, 23 Nov 2009 10:44:25 -0700
Message-ID: <fa686aa40911230944o197c732bo2d2e5f0aacd936b7@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> 
	<200911170027.38664.david-b@pacbell.net> <fa686aa40911201421k67d1de27u2c6dbe337989696b@mail.gmail.com> 
	<20091123152943.GC3987@sirena.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20091123152943.GC3987@sirena.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: David Brownell <david-b@pacbell.net>, Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

On Mon, Nov 23, 2009 at 8:29 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Nov 20, 2009 at 03:21:31PM -0700, Grant Likely wrote:
>> On Tue, Nov 17, 2009 at 1:27 AM, David Brownell <david-b@pacbell.net=
> wrote:
>
>> > Since *everything* boils down to one or more signal lines,
>> > your argument leads directly to Linux having no native
>> > hardware interface except GPIOs. ?Not ... practical. ;)
>
>> I think you've missed my point and taken it to an illogical extreme =
to
>> counter it. =A0I agree that PWMs are not GPIOs and visa versa. =A0Ho=
wever,
>> *some* devices are both GPIOs and PWMs. =A0Also what is needed to ma=
nage
>> GPIO and PWM pins is pretty much identical.
>
> On most of the ARM SoCs PWM and GPIO aren't particularly special here=
 -
> most of the on-SoC functionality is multiplexed onto pins through the
> same hardware interface. =A0A very large proportion of the pins of th=
e SoC
> will have muxes to bring out the signals from the internal IP blocks,
> and pretty much all of those will have GPIO as one of those functions=
=2E

Right, pin-mux is a different problem.  But there are also devices
that implement both PWM and GPIO functionality in the same IP block.
I think pin muxing, and pin controller drivers are different problem
domains and should be handled separately.

>> But that *isn't* the primary purpose of the GPIO subsystem. =A0All t=
hat
>> stuff is layered on top of the GPIO pin management code and doesn't
>> really play into this debate.
>
> The GPIO subsystem isn't doing pin management in that way for most
> systems, it's just controlling the GPIO functionality and relies on
> separate configuration to ensure that the relevant pins are in GPIO
> mode.

Sorry. when I said pin management I meant how Linux keeps track of pin
controllers.  Not pin mux.  I should use different terminology perhaps
to reduce confusion.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
