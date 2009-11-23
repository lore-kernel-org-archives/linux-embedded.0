From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Mon, 23 Nov 2009 10:39:22 -0700
Message-ID: <fa686aa40911230939q3c65c681jee8c4098331f70ee@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <8bd0f97a0911132022pf743558lfef1402125d4b60b@mail.gmail.com> 
	<fa686aa40911132355t3b79fe46m90005ecba453dcc1@mail.gmail.com> 
	<200911162347.02364.david-b@pacbell.net> <fa686aa40911201414u6a9023e6y9addc97635d1c88@mail.gmail.com> 
	<4B0A9832.20908@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B0A9832.20908@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: David Brownell <david-b@pacbell.net>, Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org

On Mon, Nov 23, 2009 at 7:12 AM, Bill Gatliff <bgat@billgatliff.com> wr=
ote:
> Grant Likely wrote:
>> I'm talking about discrete controllable entities.
>
> At the extreme, I see discrete, single-pin GPIO as being a degenerate
> case of PWM: only 0% or 100% duty cycle e.g. one-bit granularity, a
> single output, and no dependencies with any other channels or pins.

yes

> But the perspectives of the two groups of users are completely
> different, so I don't see any advantage to having a combined user-fac=
ing
> API.

=2E.. for the control API; yes.  ie, the functions that set the GPIO pi=
n
state or the PWM duty cycle.  There is no overlap here (except for the
degenerate case of using a PWM as an output only GPIO... which is
useful.  Board designers do crazy things).

>> I'm talking about the management code to obtain a reference to
>> the pin your interested in. =A0There is a non-trivial amount of code
>> associated with getting a reference to a pin and the behaviour
>> required is largely identical between GPIO and PWM.
>
> True, but anything involving pins has to be dealt with at the platfor=
m
> level.

Not exactly true.  GPIO pins do not have to be dealt with at the
platform level when GPIO lib is used.  I've got several platforms
where the routing of GPIOs is specified in the device tree data, and
platform code never touches them.  When the driver probes a device
implemented via GPIOs, it reads the data and requests the GPIO numbers
that it needs.

*however* I do agree that it is the responsibility of platform code to
set up chip-internal pin muxing and routing.  Actually, further than
that, I think it is actually firmware's responsibility to set up chip
internal pin muxing because it leads to more common platform code in
the kernel (less board specific fixups), but the kernel can fix it up
in a pinch.  But I'm not arguing about the pin (hardware) setup code.

> =A0And the general approach for that so far is that the board's
> startup code sets the pins how it wants them, and the peripheral driv=
ers
> more or less assume that things are as they should be when it comes t=
ime
> to activate the peripherals themselves. =A0Anything more sophisticate=
d
> than that and you prevent the kind of reuse that's taking place now
> between AVR32 and AT91, for example.
>
> Maybe that's an opportunity for improvement: an API for pin reservati=
on,
> that GPIO, PWM and other platform-oriented drivers could use to reque=
st
> the pins that they want. =A0A kind of common version of the OMAP mux
> management code, if you will.

Perhaps.  But that's not what I'm taking issue with.

> But I don't think such an API would be all that useful for GPIO- and
> PWM-related scenarios. =A0Out of necessity, PWM and GPIO are very spe=
cific
> to the board hardware, and on-the-fly pin configuration changes aren'=
t
> possible: either the hardware needs that pin to be an output, or it
> doesn't. =A0You can't make that decision at runtime because you'd pro=
bably
> have to swap out or add resistors, drivers, etc. =A0The software to d=
o
> *that* would be.... tricky. =A0:)
>
>
>> I don't want to see a new subsystem that largely does the exact same=
 job, but is
>> different in subtle ways. =A0I think it should either be a unified
>> PWM/GPIO pin management subsystem, or a common library used by each.
>
> Where is there overlap? =A0My PWM code is totally pin-agnostic, at le=
ast
> for the drivers I've worked with so far. =A0And I'm not aware of any =
GPIO
> chip drivers that deal with pin multiplexing, either. =A0Not saying t=
here
> aren't any, only that I haven't seen them.

The overlap is in the management of registered pins.  I do not take
issue with the API.  In fact, I don't take issue with the code that
you've written either.  It appears to be well written.  I take issue
with all the common code behind the API to make it work and to allow
GPIOs or PWMs to be registered at runtime.  The overlap is the code
and behaviour used to register pins and to obtain a reference to a
pin.

On the PWM side; it's the code backing pwm_register().
pwm_unregister(), pwm_request(), pwm_free(), and the sysfs hooks.

=46or GPIO; it's gpiochip_add(), gpiochip_remove(), gpio_request(),
gpio_free(), the sysfs hooks, and the device tree bindings.

They perform exactly the same task.  The difference is that PWM
devices implement the PWM API and GPIO devices implement the GPIO API;
but the behaviour needed to manage them is identical.  I don't like
the fact that it will be implemented twice with subtle differences
between them.

The argument has been made that the split is appropriate because the
use case between GPIO and PWM is considerably different, and to a
point I agree.  The PWM use case definitely requires a different API.
However, the argument also makes the assumption that what is a GPIO
and what is a PWM can easily be pinned down.  For example, I've got
output only GPIOs, input only GPIOs, and a device that implements both
PWM and GPIO behaviour (not pin muxing).  And, as you say, the
degenerate of PWM behaviour is analogous to GPIO output.  The range of
behaviour supported by a PWM or GPIO device is entirely dependent on
what the hardware designer chooses to implement, and there isn't a
canonical definition of either GPIO or PWM.  If a hard distinction is
made now to manage GPIO and PWM pins separately, what then do we do
with other similar-yet-different pin controllers?  What about a
multi-voltage output GPIO pin?  Or a Frequency generator pin?  Is it
appropriate to create a new subsystem for managing each one?  And then
have devices that implement more than one common-case api to register
against each subsystem?

What an API can do is capture the common use cases, but it can never
capture the full range of behaviour implemented by a particular
device.  What I see as important to driver writers (PWM/GPIO users) is
the ability to obtain and use a reference to a controllable pin.  Then
it can either use a common-case API, or if it needs to, call device
specific extra hooks to do something funky, like hardware triggering.

=46or pin controller driver writers, the need is to export as much
behaviour as possible via a common-case API so that the device can
easily be reused by things the driver author hasn't even conceived of.
 Some behaviors won't fit, and some devices don't support behaviour
exposed by the API.  It is perfectly valid for a pin controller driver
to only implement the ops supported by the device and use -EINVAL if
an unsupported op is attempted.

I say that it is better to have a single pin-controller subsystem (and
again, not talking about pin-mux, that is something different) for
registering pins to, and leave it up to the drivers to choose which
ops to implement.  It can implement just the PWM ops, or just the GPIO
ops, or both.  A pin user will use the same mechanism to obtain a
reference to the pin regardless of the pin type, and can use that
reference to call the common case apis (gpio_get/set_value(),
pwm_config(), etc), or can use the reference when calling into a
driver-specific hook.  When new capabilities are identified, the list
of implementable ops can be extended without impact on existing
drivers.  Drivers can take advantage of the new behaviour by
implementing the new ops.

> It's a nice idea in the abstract, but I sure don't see how to make it
> work well enough in practice to be worth the effort. =A0I'm not sayin=
g it
> can't be done, just that it isn't my focus. =A0Yours? =A0:)

The problem that I have is that it shifts the maintenance burden from
the time of development (ie. now) to code maintenance time.  By
duplicating the infrastructure it doubles the code to be maintained.
It means there are differences between how a GPIO/PWM controllers
register their pins, and differences in how other drivers obtain and
use them.  It also establishes a pattern of writing new subsystems to
handle similar-yet-different pin controllers.  To me that is a
non-trivial cost.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
