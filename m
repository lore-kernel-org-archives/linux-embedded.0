From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Sat, 14 Nov 2009 00:55:17 -0700
Message-ID: <fa686aa40911132355t3b79fe46m90005ecba453dcc1@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> 
	<8bd0f97a0911132022pf743558lfef1402125d4b60b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0911132022pf743558lfef1402125d4b60b@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

On Fri, Nov 13, 2009 at 9:22 PM, Mike Frysinger <vapier.adi@gmail.com> =
wrote:
> On Fri, Nov 13, 2009 at 14:08, Grant Likely wrote:
>> On Wed, Oct 15, 2008 at 11:14 AM, Bill Gatliff wrote:
>>> This series implements a Generic PWM Device API, including referenc=
e
>>> implementations for the Atmel PWMC device, an LED device, and an LE=
D
>>> trigger. =A0It is based on linux-2.6.27.
>> [...]
>>> The implementation of the Generic PWM Device API is structurally
>>> similar to the generic GPIO API, except that the PWM code uses
>>> platform bus_id strings instead of integers to identify target
>>> deviices. =A0A configuration structure is also provided, both to
>>> facilitate atomic hardware state changes and so that the API can be
>>> extended in a source-code-compatible way to accomodate devices with
>>> features not anticipated by the current code.
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
>>
>> What is the reason for bringing in an entirely new framework instead
>> of extending the GPIO API or gpiolib? =A0I'm not too excited about
>> having two entirely different frameworks for what basically boils do=
wn
>> to "numbered signal pins".
>
> unifying resource management obviously makes sense so as to avoid
> conflicts, but i dont think the fact that one pin can be multi purpos=
e
> means it should be entirely forced into the GPIO framework, nor do i
> see any real gain for doing so.

Common code is a big gain in and of itself.  It means less to develop,
less to maintain, and fewer APIs in the kernel.  Right now, I don't
see a fundamental difference is between GPIO and PWM pin management.
It is essentially the same problem, and in many cases PWM pins can
also be used as GPIOs.  I think the question should be flipped around;
rather than asking for a compelling reason for them to be merged; I
want to know the compelling reason to keep them separate.  What is the
fundamental difference that keeps them apart?

However, since it was mentioned, I do see some real gains for using
the same infrastructure:
- Devices using GPIO pins can easily be extended to take advantage of
PWM modes.  i could see GPIO LEDs taking advantage of this for example
- (as I already mentioned) PWM pins that can also behave as GPIOs
don't need to register 2 interfaces.
- All the existing support code for hooking up GPIO pins to other
devices can be reused as is.
- Individual platforms have the option of implementing the GPIO+PWM
API directly (fast, but static), or they can hook in via GPIOLIB
(dynamic; slower but pluggable)
- All the OF device tree bindings for GPIOs also work with PWMs.

What I would like to see is the PWM functions added to the GPIO API.
GPIO drivers can then either implement them or not.  If a GPIO driver
supports the PWM function, great.  If not, then it returns -EINVAL.
Heck, I'll even got a driver right now that I'd use it with.  I'm more
than happy to help code it up even.

Cheers,
g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
