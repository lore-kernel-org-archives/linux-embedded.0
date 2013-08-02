From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Fri, 02 Aug 2013 17:24:54 +0200
Message-ID: <51FBCF46.4080700@lumino.de>
References: <51FB6EE1.3090708@lumino.de> <20130802114225.GR3880@pengutronix.de> <51FBA261.10301@lumino.de> <51FBC7FE.4000403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <51FBC7FE.4000403@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-embedded@vger.kernel.org

On 08/02/2013 04:53 PM, Marco Stornelli wrote:
>
>>   - how to assign an interrupt (e.g. a dedicated timer) to the 
>> subsystem ?
>
> Interrupt handler are kernel thread, so you can schedule your kernel 
> thread on your "normal" cpu.
Sorry. I don't understand.

The point I'd like to make is, that for really low latency stuff the ISR 
needs to take place immediately when the hardware fires an interrupt.

As the Linux kernel will (for the SMP CPUs it handles) need to disable 
interrupt in certain cases, it is essential that the "really low 
latency" interrupt is assigned to the AMP cpu (that the Kernel will 
never touch).

> AFAIC, no latency for cpu "under affinity".
That would be great but it need the stuff described above.
In fact the interrupt would need to be assigned to the AMP cpu by some 
hardware means (that I don't know anything about yet), and not be 
"forwarded" in any way from some other cpu (which is managed by the 
Kernel) and thus might be in a "interrupt disable state at some point in 
time.

>> (and how
>> many cpu cycles at max are needed to enter the ISR) ?
>
> It's difficult to answer to this question because the performance 
> depends on your system. From my last statistics I saw that with an rt 
> linux kernel you can stay below 50us for the interrupt latency.
Of course (sorry for unclear language). I tried to ask for a pointer to 
start developing an algorithm that allows to predict the max latency the 
system can offer.

Here we could try to do these calculations as well with a "really 
dedicated AMP" CPU and with a system using "preempt-rt" and "cpu 
affinity" appropriately. to see if a more "standard" way to do things 
might be good enough.

Thanks for your answers,
-Michael
