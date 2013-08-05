From: =?iso-8859-1?Q?Lambrecht_J=FCrgen?= <J.Lambrecht@TELEVIC.com>
Subject: Re: AMP on an SMP system
Date: Mon, 5 Aug 2013 12:00:02 +0200
Message-ID: <51FF77A2.7030904@televic.com>
References: <51FB6EE1.3090708@lumino.de> <51FEC76C.70908@televic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <51FEC76C.70908@televic.com>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Schnell <mschnell@lumino.de>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 08/04/2013 11:28 PM, Lambrecht J=FCrgen wrote:
> On 08/02/2013 10:33 AM, Michael Schnell wrote:
> [snip]
>>     - how to assign certain interrupts to that core and have ISRs ru=
n
>> there only dedicatedly interrupting the "main loop" and not ever bei=
ng
>> blocked by any Linux activity ?
>> here I found this:
>> https://access.redhat.com/site/solutions/15482
>> In fact of course the hardware defines if/how a certain Interrupt ca=
n be
>> assigned to a certain CPU. How is this usually done when using ARM
>> Cortex A9+ cores ?.
> The ARM A9 datasheet will say what registers to write to assign IRQs =
to
> CPU1, and make Linux not to use those IRQs.
> Then the max. latency is determined by the clock speed and CPU cycles
> the bare metal program needs to react (should be in datasheet).
I asked a Freescale FAE and the cortex A9 is AMP capable (I also needed=
=20
to know this for my project):

"Actually, you can check on ARM community web site, where you will see =
that the CortexA9/GIC infrastructure enables AMP implementation.
http://forums.arm.com/index.php?/topic/15656-cortex-a9-amp/

The Global Interrupt Controller gives you the possibility to assign spe=
cific IT to specific cores. But a CortexA9 is not very RT oriented (for=
 that ARM has created the Cortex R Family, with improved RT execution t=
ime)."


>
> About the non-determinism of modern hardware: if a chip is AMP capabl=
e
> the heating up of 1 core should not influence the other core. I belie=
ve
> heat spreads vertically (to the heatsink) and not so much horizontall=
y.
> So an RTOS should run with a stable frequency. (anyhow, Linux should =
not
> touch the other CPU, or need to touch it).
That Freescale FAE warns about the voltage scaling: "you have only one=20
power line to supply all the cores, so all processor would be impacted.=
=20
There is no way to change that."
So indeed a problem with modern hardware..

Kind regards,
J=FCrgen--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
