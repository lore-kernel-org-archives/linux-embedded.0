From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Fri, 20 Nov 2009 15:49:32 -0700
Message-ID: <fa686aa40911201449we09fe69i7c7601e705b9e39e@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> 
	<4B02C3A6.5030000@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B02C3A6.5030000@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>, David Brownell <dbrownell@users.sourceforge.net>

On Tue, Nov 17, 2009 at 8:39 AM, Bill Gatliff <bgat@billgatliff.com> wr=
ote:
> Grant Likely wrote:
>> Hi Bill
>>
>> On Wed, Oct 15, 2008 at 11:14 AM, Bill Gatliff <bgat@billgatliff.com=
> wrote:
>>
>>> This series implements a Generic PWM Device API, including referenc=
e
>>> implementations for the Atmel PWMC device, an LED device, and an LE=
D
>>> trigger. =A0It is based on linux-2.6.27.
>>>
>> [...]
>>
>>> The implementation of the Generic PWM Device API is structurally
>>> similar to the generic GPIO API, except that the PWM code uses
>>> platform bus_id strings instead of integers to identify target
>>> deviices. =A0A configuration structure is also provided, both to
>>> facilitate atomic hardware state changes and so that the API can be
>>> extended in a source-code-compatible way to accomodate devices with
>>> features not anticipated by the current code.
>>>
>>
>> Hey Bill,
>>
>> I'm concerned about the approach taken here. =A0As I understand it, =
the
>> PWM signals are very similar to GPIOs in that each PWM device contro=
ls
>> an external signal line, just like GPIO lines. =A0The difference bei=
ng
>> that PWMs cannot do input, and has additional capabilities (can be
>> programmed with a signal; not just on/off/tristate). =A0Actually, ma=
ny
>> GPIOs have these properties too. =A0I've got a part with output-only
>> gpios, and gpio devices that also have a PWM.
>
> It's true that PWM signals can be emitted via GPIO pins, and in fact =
the
> API code I submitted uses the GPIO API combined with an hrtimer to
> generate a low-speed PWM output.
>
> It's also true that things like LEDs might want to be driven by PWM
> signals, and indeed LEDs can also be driven by GPIO pins.
>
> Finally, it's accurate to say that a lot of microcontrollers multiple=
x
> GPIO functions onto pins that also provide PWM functionality.
>
> But in my opinion, none of the above means that the PWM API and GPIO =
API
> should be coupled at the interface abstraction. =A0All it means is th=
at in
> some cases, one implementation might be able to "stand in" as an
> embodiment of the other's interface. =A0And we all agree on that for =
PWM
> and GPIO.

I have no problem with the PWM API.  I think it describes most of the
PWM *usage* requirements well, and I agree that GPIO devices can never
implement the PWM API.

> Given a PWM-capable chip that you control over an I2C or SPI interfac=
e,
> I don't think anyone would argue that such chips should be viewed as =
an
> extension of the SPI or I2C APIs just because the chips use those
> communications protocols.

Nor would I.

> I think it's a similar argument for PWM and GPIO.

I don't think that's true, but I'm approaching it from the viewpoint
of managing pins; not the usage API.  ie. the difference between
gpiolib (management) and the gpio api (usage).

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
