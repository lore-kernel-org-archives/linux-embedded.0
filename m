From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v3: 1/3] PWM: Implement a generic PWM framework
Date: Wed, 16 Feb 2011 09:00:35 -0800
Message-ID: <AANLkTikFcT02PiZG=dz8khSoLNtFrFq-7OLkHfULNR7n@mail.gmail.com>
References: <1297353231-14475-1-git-send-email-bgat@billgatliff.com>
	<1297353231-14475-2-git-send-email-bgat@billgatliff.com>
	<20110210203937.GV9041@pengutronix.de>
	<AANLkTika903eDoFOEcLtcAcizZpPqBH7k4drOdYyz3dA@mail.gmail.com>
	<20110214080318.GB9041@pengutronix.de>
	<AANLkTimt77oQg5qdxurMrZs9Xs6DzrWi5Zk7aDL58nKO@mail.gmail.com>
	<20110216081826.GC26437@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110216081826.GC26437@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-embedded@vger.kernel.org

Sascha:


On Wed, Feb 16, 2011 at 12:18 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> The discussion started with me saying that the requesting process may
> die and the kernel has no way to clean up the requested resources (pwm).
> You responded that you want to make sure that there is no resource
> conflict between the kernel and userspace. Now we are at two userspace
> processes again. We are drawing circles.

Yes, and I think part of the reason we are drawing circles is that the
whole "request" concept as I have implemented it is ill-defined.  It
may be a communication/documentation issue, but it might also be an
implementation issue.  It could even be that my my design decisions
which deviate from gpiolib's are magnifying flaws in the whole
concept.

I'm trying to emulate gpiolib's export/unexport mechanism, while at
the same time keeping the set of all present PWM devices visible in
/sys/class/pwm.  A user process reads from ...<pwm device>/request to
"claim" a PWM device for userspace; subsequent kernel pwm_request()
calls will fail until a user process then writes to ...<pwm
device>/request again.  That's all.

Multiple user processes are free to manipulate the PWM's period, duty,
and polarity states.  (And due to some missing code on my part, user
processes can do that even when kernelspace is using the device.  Will
fix).  But kernel-side pwm_request() calls on the device will fail
until after any user process writes back to the request attribute to
signal that it is relinquishing the userspace advisory lock on the
device.

I think things would be helped immensely in what I have implemented if
I were to get rid of all mention of pids in the request interface.
Oh, and fix that thing about simultaneous kernel-user access being
permitted.  :)

I'm also thinking that I might go back over to gpiolib's way of
handling userspace, which is to not have any attributes visible under
/sys/class/pwm for devices that aren't actually exported to userspace.
 Do you think that would settle this issue?

> What should a userspace process do if it finds the pwm requested by
> another process (which may be already dead)? Free it and request it
> again when -f is supplied?

Ignore it, just like what happens with gpiolib.  As with gpiolib, if a
pwm device is already exported to userspace then it's a free-for-all
for any user process to access.

> There are two things I really don't like about this. First is reading
> a sysfs entry should not alter the system state. Second is the kernel
> should only grant resources it can claim back when the process dies.

Except that what I'm doing isn't resource granting per se.  It's
advisory locking.

> A pwm user can store the actual values for period_ns/duty_ns in his
> private data and can leave the values constant it does not want to
> change. I consider a sysfs driver a pwm being a pwm user also.

So each time a pwm device is exported to userspace, the kernel API has
to maintain cached values for period, duty, and polarity attributes
since sysfs allows for changing only one of those values at a time.  I
hate cached values.  :)

I would also lose the ability to judge whether a user is changing only
one of those three values, unless I consult those cached copies.
Without such information, I can't take advantage of hardware features
like PWMC's double-buffering that let me change one of those values
(but not both) without stopping the hardware.

> What multitude of arguments are you talking about? With my proposed
> version of pwm_set() a driver only has to parse three arguments.

... if you want to force driver authors to always implement the
worst-case scenario, where all three values are assumed to be
changing.  If the hardware looks like Atmel's PWMC, however, then
there are opportunities to change the period or duty attributes
without stopping the hardware--- when you can tell that's all that the
user is trying to do.  This fact is what motivated my design of the
pwm_config() function.

> We have threaded interrupts for this. I haven't thought about hrtimers
> though.

Yes, I'm aware of threaded interrupts.  But I don't want to mandate
them in situations where the hardware doesn't require them.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
