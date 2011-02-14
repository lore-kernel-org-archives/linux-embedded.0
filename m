From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PWM v3: 1/3] PWM: Implement a generic PWM framework
Date: Mon, 14 Feb 2011 09:03:18 +0100
Message-ID: <20110214080318.GB9041@pengutronix.de>
References: <1297353231-14475-1-git-send-email-bgat@billgatliff.com>
 <1297353231-14475-2-git-send-email-bgat@billgatliff.com>
 <20110210203937.GV9041@pengutronix.de>
 <AANLkTika903eDoFOEcLtcAcizZpPqBH7k4drOdYyz3dA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTika903eDoFOEcLtcAcizZpPqBH7k4drOdYyz3dA@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Fri, Feb 11, 2011 at 12:22:27PM -0600, Bill Gatliff wrote:
> Sascha:
> 
> 
> 
> The objective of the sysfs request attribute is to prevent
> simultaneous uses of a channel in both kernel and user spaces.  Same
> as with GPIO pins.

The gpio framework does this with 'export', and it does exactly what you
need: Make sure that a gpio is not used by both the kernel and
userspace. Unlike the pwm api this does not give the impression that a
gpio is owned by a specific process.

> 
> > There is no need for introducing ioctl like interfaces in the kernel.
> > You should create the appropriate callbacks instead which is both easier
> > to read and easier to implement.
> 
> I disagree.
> 
> The problem with implementing callbacks to do the job of these
> configuration flags is trying to come up with an approach that lets
> users set multiple parameters at the same time.  To achieve what I am
> doing with these flags using callbacks, I would need a
> pwm_set_period_and_duty_ns(), pwm_set_period_and_duty_and_polarity(),
> pwm_set_duty_and_polarity(), and so on.

A single pwm_set(int period_ns, int duty_ns, int polarity) would do.
Arguably this function is by definition non atomic because it will
always take effect during the next period and not in the current one.
If it takes effect during the current period it means that the current
period will be interrupted which renders your pwm useless for motors.

> 
> I'm thinking mostly about DC motor control applications, where you
> vary both the period and the duty cycle based on the speed of the
> motor.  The two values have to change at the same time.
> 
> You might argue that all I need to add, therefore, is a
> pwm_set_duty_and_period_ns().  You would be right--- and I can
> certainly do that at the API level.  But I still want one
> configuration entry point into the driver code itself, which means I
> still need flags somewhere.
> 
> Why do I want one entry point into drivers?  Because at the same time
> users want to change single or multiple parameters in one go, the
> hardware may prevent doing so simply because it doesn't work that way.

So you are prososing an API which does not abstract from the hardware
capabilities and does not provide a way to query the hardware
capabilities. This means your motor control application will work with
one pwm in the background while throwing stack traces with another
pwm.
Honestly, putting a 'this call might or might not be possible' into API
level does not seem to be a good idea to me.

How about making all calls to the pwm non atomic?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
