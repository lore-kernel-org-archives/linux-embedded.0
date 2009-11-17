From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Tue, 17 Nov 2009 09:39:18 -0600
Message-ID: <4B02C3A6.5030000@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>, David Brownell <dbrownell@users.sourceforge.net>

Grant Likely wrote:
> Hi Bill
>
> On Wed, Oct 15, 2008 at 11:14 AM, Bill Gatliff <bgat@billgatliff.com> wrote:
>   
>> This series implements a Generic PWM Device API, including reference
>> implementations for the Atmel PWMC device, an LED device, and an LED
>> trigger.  It is based on linux-2.6.27.
>>     
> [...]
>   
>> The implementation of the Generic PWM Device API is structurally
>> similar to the generic GPIO API, except that the PWM code uses
>> platform bus_id strings instead of integers to identify target
>> deviices.  A configuration structure is also provided, both to
>> facilitate atomic hardware state changes and so that the API can be
>> extended in a source-code-compatible way to accomodate devices with
>> features not anticipated by the current code.
>>     
>
> Hey Bill,
>
> I'm concerned about the approach taken here.  As I understand it, the
> PWM signals are very similar to GPIOs in that each PWM device controls
> an external signal line, just like GPIO lines.  The difference being
> that PWMs cannot do input, and has additional capabilities (can be
> programmed with a signal; not just on/off/tristate).  Actually, many
> GPIOs have these properties too.  I've got a part with output-only
> gpios, and gpio devices that also have a PWM.
>   


It's true that PWM signals can be emitted via GPIO pins, and in fact the
API code I submitted uses the GPIO API combined with an hrtimer to
generate a low-speed PWM output.

It's also true that things like LEDs might want to be driven by PWM
signals, and indeed LEDs can also be driven by GPIO pins.

Finally, it's accurate to say that a lot of microcontrollers multiplex
GPIO functions onto pins that also provide PWM functionality.

But in my opinion, none of the above means that the PWM API and GPIO API
should be coupled at the interface abstraction.  All it means is that in
some cases, one implementation might be able to "stand in" as an
embodiment of the other's interface.  And we all agree on that for PWM
and GPIO.

The reason I think that PWM merits its own API is because I want the
users of the interface to be able to treat it as a PWM-only metaphor. 
Behind the scenes, we may in fact have a connection with the GPIO
interface--- and in fact we already do with my code.  But PWM generation
can also come from timer/counter peripherals having a compare/match
capability, from true PWM generation hardware (which are in most cases
just three tightly-coupled timer/counters with compare/match hardware),
as well as from standalone chips that are controlled over an I2C or SPI
interface.  The latter example is in fact the initial motivation for the
code, even though at the moment I don't have any patches available to
submit because the devices in question are 8-bit microcontrollers
running custom firmware.

Given a PWM-capable chip that you control over an I2C or SPI interface,
I don't think anyone would argue that such chips should be viewed as an
extension of the SPI or I2C APIs just because the chips use those
communications protocols.  I think it's a similar argument for PWM and GPIO.

Overall, I think your question is a very good one and it's one that I
asked myself early on.  And it's a question that we should ask for EVERY
new interface abstraction that's developed for kernel-facing or
application-facing users.


> What is the reason for bringing in an entirely new framework instead
> of extending the GPIO API or gpiolib?  I'm not too excited about
> having two entirely different frameworks for what basically boils down
> to "numbered signal pins".
>   

I hope my reasoning is clear.  I might not be right, but at least you
know what my thoughts are.  Questions, comments and flames welcome!


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com

