From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: A new Subsystem for Current Management
Date: Thu, 10 Nov 2011 15:04:43 +0000
Message-ID: <20111110150442.GG3832@opensource.wolfsonmicro.com>
References: <D6D887BA8C9DFF48B5233887EF04654109F1111F6C@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109F1111F6C@bgsmsx502.gar.corp.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Thu, Nov 10, 2011 at 04:58:27PM +0530, R, Durgadoss wrote:

> > > 	Current[1-N]_limit - set of current limits
> > > 	Voltage[1-X]_limit - set of voltage limits

> > What would the voltage limits be?  Whatever is going on here there
> > should be some integration with the regulator framework, modern
> > regulators are often able to report when they go out of regulator and
> > able to impose current limits.

> These (limits) are configurable voltage limits. The HW generates an
> Interrupt when any of these configured voltage limits are crossed.
> Similarly, for Current also.

> Now, Say there are 3 current limits that we can program.
> On the first and second limit violation we take some actions,
> and control the current consumption, so that it does not hit the
> worst current limit.

So what you mean is that these are maxima.  

I'm not sure that the voltage limits are terribly useful on regulated
supplies; the voltages tend not to be varied autonomously by hardware
and even where they are they're not directly tied to power consumption
which is usually the actual problem.  On unregulated supplies like the
battery output it's more useful and it's something that the existing
power framework already has some support for reporting current flows,
my first guess would be that for the unregulated supplies you'd build on
top of that (and there will be overlap with the charger management for
the devices that need hand holding to do that).

Current limits are more generally useful, they apply equally well to
regulated and unregulated supplies.

You probably want to tie this stuff in with the thermal management work
that people are starting to look at - it sounds like you're basically
trying to look at a different aspect of the same problem.

> Do you think, we can fit this into the regulator framework ?

That's not something that the hardware generally supports; for voltages
you'll usually just get an out of regulation notification and current
limits generally just give you a single trip point.

> But I would like to see a 'consumer' driver that uses the framework
> efficiently, so that I can get some more idea. Could you point to
> some source files ?

find linux-2.6 -type f | xargs grep -l regulator_

should show a bunch of devices, nothing actually using any form of
limiting at the minute though.  Any regulator driver which notifies will
be able to show when it goes out of regulation.
