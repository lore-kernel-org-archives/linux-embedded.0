From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: AMP on an SMP system
Date: Fri, 02 Aug 2013 16:53:50 +0200
Message-ID: <51FBC7FE.4000403@gmail.com>
References: <51FB6EE1.3090708@lumino.de> <20130802114225.GR3880@pengutronix.de> <51FBA261.10301@lumino.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=tqZp/lt1akC7PTebZI4EplWsYA7DbyUCuHP6zbd3epw=;
        b=JnM63F3AJ76m9XGe27t0gbYDOFAgeLGOcEq4owQPZrhtT1X8Ro5Xrt+9d/Lq8VSWL0
         Nr8MHGvyEdqjYnqMe6ijHh475FRCayKSlJV9XfFQVDLuRY4yNK0fQ/PouYKGA5ahdxNX
         +3yYttF/jFlHJZpNQJ1osI4gUrylaS92qEgUWIRhfwmAsVFH1MmdZ9pNh5E/dHTy/uZ3
         9qdWnD1slmEuJLv+OKpeGAmgmIKbYNzYDUTdFVqtq5MPgpfC2vjO27VIPiosULHe7Z1O
         PVaMUSnRtK8NqeVgdZkeJsGujoscu4zfcnW2YGk6GQ11wWsGE7g2bgiJIUbTNRwlbAmR
         OIdQ==
In-Reply-To: <51FBA261.10301@lumino.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Michael Schnell <mschnell@lumino.de>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

Il 02/08/2013 14:13, Michael Schnell ha scritto:
> On 08/02/2013 01:42 PM, Robert Schwebel wrote:
>> Before hacking around (which might also lead to interesting solution=
s),
>> I would start using a kernel with preempt-rt support and play with t=
he
>> cpu affinity:
>>
>> http://lxr.linux.no/#linux+v3.10.4/Documentation/kernel-parameters.t=
xt#L1257
>>
>>
>
> Robert !
> Nice to see you here (I do own your "Embedded Linux Handbuch f=FCr
> Entwickler" :-) )
>
> Thanks for the pointer !
>
> I do already know "preempt-rt", but I was not aware of cpu affinity.
>
> So this might help.
>
> In fact I need a way to do very guaranteed low latency. regarding the
> high clock rate (about 1 GHz) modern ARM chips can provide, maybe
> preempt-rt with the cpu affinity might be a decent way to go.
>

Just to be clear: at the moment there isn't an easy way to dedicate=20
"completely" a cpu for a task. The last time I tried (some years ago=20
actually) to use exclusive cpu set, the scheduler didn't do a good work=
=20
because it was designed for SMP, not SMP minus some piece. However you=20
can try and you can report your results. It would be interesting.

> The raining questions include
>   - how to calculate the maximum latency that can be guaranteed ? (i.=
e.
> does the Kernel impose any spinlocks and interrupt disables on the wo=
uld
> be AMP subsystem ?)

No. You can use full dyn tick for example to disable timer interrupt,=20
but it has got some pros and cons, especially with very low latency=20
requirement.

>   - how to assign an interrupt (e.g. a dedicated timer) to the subsys=
tem ?

Interrupt handler are kernel thread, so you can schedule your kernel=20
thread on your "normal" cpu.

>   - Do the interrupts immediately call the ISR of the cpu "under
> affinity" or is some additional latency imposed by the Kernel

AFAIC, no latency for cpu "under affinity".

> (and how
> many cpu cycles at max are needed to enter the ISR) ?

It's difficult to answer to this question because the performance=20
depends on your system. From my last statistics I saw that with an rt=20
linux kernel you can stay below 50us for the interrupt latency.

Marco
