From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Fri, 02 Aug 2013 14:13:21 +0200
Message-ID: <51FBA261.10301@lumino.de>
References: <51FB6EE1.3090708@lumino.de> <20130802114225.GR3880@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20130802114225.GR3880@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded@vger.kernel.org

On 08/02/2013 01:42 PM, Robert Schwebel wrote:
> Before hacking around (which might also lead to interesting solutions=
),
> I would start using a kernel with preempt-rt support and play with th=
e
> cpu affinity:
>
> http://lxr.linux.no/#linux+v3.10.4/Documentation/kernel-parameters.tx=
t#L1257
>

Robert !
Nice to see you here (I do own your "Embedded Linux Handbuch f=FCr=20
Entwickler" :-) )

Thanks for the pointer !

I do already know "preempt-rt", but I was not aware of cpu affinity.

So this might help.

In fact I need a way to do very guaranteed low latency. regarding the=20
high clock rate (about 1 GHz) modern ARM chips can provide, maybe=20
preempt-rt with the cpu affinity might be a decent way to go.

The raining questions include
  - how to calculate the maximum latency that can be guaranteed ? (i.e.=
=20
does the Kernel impose any spinlocks and interrupt disables on the woul=
d=20
be AMP subsystem ?)
  - how to assign an interrupt (e.g. a dedicated timer) to the subsyste=
m ?
  - Do the interrupts immediately call the ISR of the cpu "under=20
affinity" or is some additional latency imposed by the Kernel (and how=20
many cpu cycles at max are needed to enter the ISR) ?

Thanks,
-Michael
