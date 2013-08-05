From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Mon, 05 Aug 2013 09:25:18 +0200
Message-ID: <51FF535E.2050006@lumino.de>
References: <51FB6EE1.3090708@lumino.de> <20130802114225.GR3880@pengutronix.de> <51FBA261.10301@lumino.de> <51FBC7FE.4000403@gmail.com> <20130803191149.GU3880@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20130803191149.GU3880@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-embedded@vger.kernel.org

On 08/03/2013 09:11 PM, Robert Schwebel wrote:
> One recent example: on MX6 (quadcore Cortex-A9), when you run a 
> certain cpuburn tool, the temperature rises up to the maximum allowed 
> value in just a couple of seconds, and then you either have the choice 
> to burn your hardware or to use the tempmon interrupt to throttle down 
> the speed of the cpu. You can imagine what all that means for 
> latencies. So if you want to use a reasonably modern hardware, it is 
> always a matter of "high system probability" of not missing a cycle. 
I see.

OTOH. with hard realtime embedded Systems, you always need to determine 
the max latency for any critical reaction (which of course is missed 
when the system is defective, e.g. because the temperature gets higher 
than predicted by design in worst case - e.g. because of a fan fail - or 
things like power fail. Here of course the system needs to do a save 
shutdown before such a worst case hits. )

(In fact what I have in mind is "virtual peripherals", which I define as 
"hard realtime with extremely low latency", usable as an alternative to 
FPGAs.)

> You can't. And you can't, even if you try to run bare-metal software on
> a dedicated core. I can't imagine how for example the cache influences
> between the cores could be determined.
This would render all efforts for hard realtime embedded Linux 
applications useless. You always need to calculate the max latency.

Of course you are right that cache issues need to be taken into account. 
But this is on top of the latency that is imposed by process scheduling 
(if you consider user space) Kernel locks and interrupt delays (if you 
consider Kernel space).

Using a dedicated Core will certainly reduce the max latency, but of 
course it will not do away with the necessary calculations that take 
into account what the other CPUs might do (regarding second level Cache, 
cache synchronization, bus scheduling, etc.)

To eliminate this, you would need another dedicated chip (Processor or 
FPGA). And this is exactly, what I would like to avoid regarding that a 
quad core system with much higher Clock rate nowadays will cost less 
than any homebrew multi chip solution.

IMHO, a good compromise is the TI 335x chip that has a single 1 GHz 
Cortex A8 and two 300 MHz Cortex A3 cores for a very reasonable price 
and and "embedded" specs for temperature range and future chip 
availability.
> The really great thing with preempt-rt is that it is all Linx and 
> POSIX. No need to invent new things like program starters, inter- 
> process-communication and even inter-processor-communication. 
Sounds very good - provided it is possible to calculate the the max 
latency and same is a lot better than "usual".
> I'd suggest that you measure yourself.
That of course is necessary in any case.

Right now, I am just investigating viable ways to do things, before 
doing a pre-decision for any hardware and starting do dive into that.

-Michael
