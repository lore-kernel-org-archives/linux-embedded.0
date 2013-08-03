From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: AMP on an SMP system
Date: Sat, 3 Aug 2013 21:11:49 +0200
Message-ID: <20130803191149.GU3880@pengutronix.de>
References: <51FB6EE1.3090708@lumino.de>
 <20130802114225.GR3880@pengutronix.de>
 <51FBA261.10301@lumino.de>
 <51FBC7FE.4000403@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51FBC7FE.4000403@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Michael Schnell <mschnell@lumino.de>, linux-embedded@vger.kernel.org

Hi,

On Fri, Aug 02, 2013 at 04:53:50PM +0200, Marco Stornelli wrote:
> > In fact I need a way to do very guaranteed low latency. regarding the
> > high clock rate (about 1 GHz) modern ARM chips can provide, maybe
> > preempt-rt with the cpu affinity might be a decent way to go.

Modern hardware has lots of features which makes them basically not
deterministic.

One recent example: on MX6 (quadcore Cortex-A9), when you run a certain
cpuburn tool, the temperature rises up to the maximum allowed value in
just a couple of seconds, and then you either have the choice to burn
your hardware or to use the tempmon interrupt to throttle down the speed
of the cpu. You can imagine what all that means for latencies.

So if you want to use a reasonably modern hardware, it is always a
matter of "high system probability" of not missing a cycle.

> Just to be clear: at the moment there isn't an easy way to dedicate
> "completely" a cpu for a task. The last time I tried (some years ago
> actually) to use exclusive cpu set, the scheduler didn't do a good
> work because it was designed for SMP, not SMP minus some piece.
> However you can try and you can report your results. It would be
> interesting.

Without having done some tests myself, I would expect that the -rt folks
have such scenarios.

> > The raining questions include
> >   - how to calculate the maximum latency that can be guaranteed ? (i.e.
> > does the Kernel impose any spinlocks and interrupt disables on the would
> > be AMP subsystem ?)

You can't. And you can't, even if you try to run bare-metal software on
a dedicated core. I can't imagine how for example the cache influences
between the cores could be determined.

> No. You can use full dyn tick for example to disable timer
> interrupt, but it has got some pros and cons, especially with very
> low latency requirement.
> 
> >  - how to assign an interrupt (e.g. a dedicated timer) to the subsystem ?
> 
> Interrupt handler are kernel thread, so you can schedule your kernel
> thread on your "normal" cpu.

The really great thing with preempt-rt is that it is all Linux and
POSIX. No need to invent new things like program starters, inter-
process-communication and even inter-processor-communication.
 
> >  - Do the interrupts immediately call the ISR of the cpu "under
> >affinity" or is some additional latency imposed by the Kernel
> 
> AFAIC, no latency for cpu "under affinity".
> 
> >(and how
> >many cpu cycles at max are needed to enter the ISR) ?
> 
> It's difficult to answer to this question because the performance
> depends on your system. From my last statistics I saw that with an
> rt linux kernel you can stay below 50us for the interrupt latency.

Here is an MX53 (single core cortex-a8) in the OSADL testlab:
https://www.osadl.org/Latency-plot-of-system-in-rack-0-slot.qa-latencyplot-r0s5.0.html

But note that multicore is quite different. I'd suggest that you measure
yourself.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
