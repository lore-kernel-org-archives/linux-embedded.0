From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Sat, 28 Nov 2009 13:59:35 -0800
Message-ID: <200911281359.35565.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <4B0A9832.20908@billgatliff.com> <fa686aa40911230939q3c65c681jee8c4098331f70ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911230939q3c65c681jee8c4098331f70ee@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Bill Gatliff <bgat@billgatliff.com>, Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org

On Monday 23 November 2009, Grant Likely wrote:
> 			I take issue
> with all the common code behind the API to make it work and to allow
> GPIOs or PWMs to be registered at runtime. =A0The overlap is the code
> and behaviour used to register pins and to obtain a reference to a
> pin.
>=20
> On the PWM side; it's the code backing pwm_register().
> pwm_unregister(), pwm_request(), pwm_free(), and the sysfs hooks.
>=20
> For GPIO; it's gpiochip_add(), gpiochip_remove(), gpio_request(),
> gpio_free(), the sysfs hooks, and the device tree bindings.
>=20
> They perform exactly the same task. =A0The difference is that PWM
> devices implement the PWM API and GPIO devices implement the GPIO API=
;
> but the behaviour needed to manage them is identical. =A0I don't like
> the fact that it will be implemented twice with subtle differences
> between them.

Most of that stuff sits inside sysfs.  What's actually sharable?


> The argument has been made that the split is appropriate because the
> use case between GPIO and PWM is considerably different, and to a
> point I agree. =A0The PWM use case definitely requires a different AP=
I.
> However, the argument also makes the assumption that what is a GPIO
> and what is a PWM can easily be pinned down. =A0For example, I've got
> output only GPIOs, input only GPIOs, and a device that implements bot=
h
> PWM and GPIO behaviour (not pin muxing).

In object oriented programming there's this thing called an "interface"=
,
and its application here is:  you write a driver implementing both
the "gpio" and "pwm" interfaces.  Someone wanting a given behavior
goes through that interface.


> If a hard distinction is=20
> made now to manage GPIO and PWM pins separately, what then do we do
> with other similar-yet-different pin controllers? =A0What about a
> multi-voltage output GPIO pin? =A0Or a Frequency generator pin? =A0Is=
 it
> appropriate to create a new subsystem for managing each one?

None of those are particularly common.  The Linux approach is to come
up with interfaces as needed ... then generalize once there's enough
data, if indeed there is enough.  Just because you *can* come up with
hardware doesn't mean it's widespread enough to need a shared API.


> What an API can do is capture the common use cases, but it can never
> capture the full range of behaviour implemented by a particular
> device.

Right, so you need to become accustomed to the notion that there
can be platform-specific capabilities.  Kitchen-sink APIs are bad.
