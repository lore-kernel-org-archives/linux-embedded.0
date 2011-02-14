From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v3: 1/3] PWM: Implement a generic PWM framework
Date: Mon, 14 Feb 2011 10:56:57 -0600
Message-ID: <AANLkTimt77oQg5qdxurMrZs9Xs6DzrWi5Zk7aDL58nKO@mail.gmail.com>
References: <1297353231-14475-1-git-send-email-bgat@billgatliff.com>
	<1297353231-14475-2-git-send-email-bgat@billgatliff.com>
	<20110210203937.GV9041@pengutronix.de>
	<AANLkTika903eDoFOEcLtcAcizZpPqBH7k4drOdYyz3dA@mail.gmail.com>
	<20110214080318.GB9041@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110214080318.GB9041@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-embedded@vger.kernel.org

Sascha:


Keep the great comments coming!  My replies inlined below.

On Mon, Feb 14, 2011 at 2:03 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> The gpio framework does this with 'export', and it does exactly what you
> need: Make sure that a gpio is not used by both the kernel and
> userspace. Unlike the pwm api this does not give the impression that a
> gpio is owned by a specific process.

The gpio framework doesn't provide a way for applications to know that
a pin is already exported and in use by another process, either.
Unless you stipulate that the only way to know that a pin ISN'T
already in use by another process is that it isn't already exported.
But the check-then-export procedure is a test-then-act, which is
non-atomic.  So two applications can attempt to export the pin for
themselves, and both risk actually thinking that they got it.

[Actually, I take the above back; prior to clicking send I checked
export_store in gpiolib.c, and it looks like the export will fail for
one application if two attempt to export simultaneously.  That leaves
just the namespace question.]

In my implementation, a process merely reads from the request
attribute; if the pid it gets back is its own, then it knows that it
now has the (albeit advisory) lock on the device.  That's atomic (or
at least it's supposed to be, there may be bugs left in my code :) ).
Maybe the whole concept I have implemented is flawed, and I'm willing
to accept a failed experiment if that's what it really is.  Sounds
like you might think that it actually is.

The namespace for PWMs is more complex than with GPIO pins, though,
and I'm not sure I would ever be comfortable with integer enumerations
of PWM devices; hardware usually dictates that specific functions are
tied to specific PWM devices, regardless of the order in which said
devices are registered in the system across kernel builds and/or
releases.

The complexity of the namespace for PWM devices makes it convenient
for users to have a reference to the names of available devices.  The
entries in /sys/class/pwm provide this list.

What I'm getting to is this.  I think we need to have a list of PWM
devices present in a system available under /sys/class/pwm at all
times, not just when those devices have been exported to users.  If
you accept that, and you also accept the need for a mechanism for
applications to provide notification that they are now exerting
control over a PWM device, how would you prefer the interface for that
mechanism look?

My answer to that question is the current code.  I'd love to hear other answers!

> A single pwm_set(int period_ns, int duty_ns, int polarity) would do.

... except when you want to change only one of those three parameters.
 Which is all you would be able to do if you provide period_ns,
duty_ns, and polarity attributes to userspace.

But then look at it from the backend.  Are you going to force driver
authors to implement a multitude of functions for the different
permutations of arguments?  That would be redundant work, which I
decided to put into the PWM API itself so that it wouldn't appear over
and over again in driver code.

> Arguably this function is by definition non atomic because it will
> always take effect during the next period and not in the current one.
> If it takes effect during the current period it means that the current
> period will be interrupted which renders your pwm useless for motors.

Agreed.  But some hardware, like the Atmel PWMC, have double-buffered
registers.  So they do the handoff at the end of the period
themselves.  Other "hardware", like GPIO pins, force you do to the
handoff manually.  But the PWM API looks the same to users in both
cases.

> So you are proposing an API which does not abstract from the hardware
> capabilities and does not provide a way to query the hardware
> capabilities. This means your motor control application will work with
> one pwm in the background while throwing stack traces with another
> pwm.

The API provides a consistent set of capabilities to users (be they
kernel or otherwise), regardless of what the hardware looks like.  All
hardware implementations are required to support the ability to
control period_ticks and duty_ticks, but they may choose to implement
that support in whatever way is dictated by the hardware.

If a user (kernel or otherwise) of pwm_config() causes a stack trace,
then it's because they didn't check the return value of that function.
 That's hardly my problem.  :)

I'm trying to hide as few details as possible from users of
pwm_config(), actually.  If they call pwm_config_nosleep() and get an
error, then the user can then decide for themselves whether to
implement a kthread or whatever other way is easiest for them.  I
don't want to make those decisions myself, because then I'll get
complaints from people calling pwm_config_nosleep() and discovering
that the hardware reconfiguration is much later than they expected
because of the kthread *I* have to create.  I would rather just tell
them the problem up front.

Gpiolib does the same thing, but in a different way, with
gpio_cansleep().  I don't make them ask up front, I just notify them
after the fact when I couldn't carry out the request as they intended.

> Honestly, putting a 'this call might or might not be possible' into API
> level does not seem to be a good idea to me.

You'd rather me do away with pwm_config_nosleep() entirely?  That
would be the alternative.  Then nobody could use it, even on hardware
(like Atmel PWMC) that can support it!

> How about making all calls to the pwm non atomic?

If you want that, just call pwm_config() all the time, and pretend
that pwm_config_nosleep() doesn't exist.  But then you can't do PWM
updates from hrtimers or interrupt handlers.  I'm not arguing as to
whether someone should be doing that or not, I'm just giving them the
capability to do so in situations where the hardware will allow it---
and informing them when they are in situations where the hardware
won't allow it.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
