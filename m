From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: AMP on an SMP system
Date: Mon, 5 Aug 2013 10:17:58 +0200
Message-ID: <20130805081758.GI30920@pengutronix.de>
References: <51FB6EE1.3090708@lumino.de>
 <20130802114225.GR3880@pengutronix.de>
 <51FBA261.10301@lumino.de>
 <51FBC7FE.4000403@gmail.com>
 <20130803191149.GU3880@pengutronix.de>
 <51FF535E.2050006@lumino.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51FF535E.2050006@lumino.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schnell <mschnell@lumino.de>
Cc: linux-embedded@vger.kernel.org

On Mon, Aug 05, 2013 at 09:25:18AM +0200, Michael Schnell wrote:
> > You can't. And you can't, even if you try to run bare-metal software
> > on a dedicated core. I can't imagine how for example the cache
> > influences between the cores could be determined.
>
> This would render all efforts for hard realtime embedded Linux
> applications useless. You always need to calculate the max latency.

You can't calculate the max latency with today's complex processor
hardware any more. It's all a matter of system failure probabilities.

> Using a dedicated Core will certainly reduce the max latency, but of
> course it will not do away with the necessary calculations that take
> into account what the other CPUs might do (regarding second level
> Cache, cache synchronization, bus scheduling, etc.)

I don't think it is possible to get an analytic result for the max
latency introduced by other CPUs.

What we do today is to run preempt-rt systems, measure them under
realistic and extreme load and look at the max latencies. If you design
your system in a way that it runs at factor X above this max latency, it
should be fine.

The advantage of preempt-rt is that you have only one software
environment for rt and non-rt. Nevertheless, there always have been
settings where you could get rid of all realtime complexity by spending
a 1-Euro microcontroller to the BOM.

> IMHO, a good compromise is the TI 335x chip that has a single 1 GHz
> Cortex A8 and two 300 MHz Cortex A3 cores for a very reasonable price
> and and "embedded" specs for temperature range and future chip
> availability.

AM335x has PRU subprocessors (not ARM architecture). Yes, that can be a
solution. Freescale's Vybrid has Cortex-M3 cores.

> Right now, I am just investigating viable ways to do things, before
> doing a pre-decision for any hardware and starting do dive into that.

What kind of application is that?

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
