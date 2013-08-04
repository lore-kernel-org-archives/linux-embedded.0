From: =?iso-8859-1?Q?Lambrecht_J=FCrgen?= <J.Lambrecht@TELEVIC.com>
Subject: Re: AMP on an SMP system
Date: Sun, 4 Aug 2013 23:28:12 +0200
Message-ID: <51FEC76C.70908@televic.com>
References: <51FB6EE1.3090708@lumino.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <51FB6EE1.3090708@lumino.de>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Schnell <mschnell@lumino.de>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 08/02/2013 10:33 AM, Michael Schnell wrote:
> Hi Experts.
Hi, I am rather new to Linux, but now the RTOS eCos quite well, and hav=
e=20
done some bare metal coding.
This year, a student did his Master's project with my topic: evaluating=
=20
the Xilinx Zynq: a dual core ARM Cortex A9 with an FPGA (as sort of=20
co-processor).
And he demonstrated AMP with Linux on CPU0 and a bare metal program=20
running on CPU1.
> Is there a kind of "official" way to set aside one of the available
> cores in an SMP system from the Linux OS to do deeply embedded
> extremely-low-latency stuff in a kind of single task "main loop" type
> environment ? I.e. creating a true coprocessor from an SMP hardware.
I should start reading some multi-core datasheets, but I would expect=20
all embedded multi-core processors AMP capable
>
> Some of the problems that come in ind here include:
>
>    - how to make the Linux initialization ignore one of the available
> cores  or free a core later on ?
> Here I found this:
> http://www.linuxtopia.org/online_books/linux_kernel/kernel_configurat=
ion/re46.html
> So using one of the four cores for special purpose in fact is viable.
My student used Device Tree with 'maxcpus=3D1'
>
>    - how to have  a Linux task start the free running main loop ?
He followed Xilinx application notes (and google..) and it is=20
implemented that always CPU0 starts first, and CPU1 waits to start unti=
l=20
the start address is written to a specific address - my student did it=20
with a small Linux program.
>
>    - how to assign certain interrupts to that core and have ISRs run
> there only dedicatedly interrupting the "main loop" and not ever bein=
g
> blocked by any Linux activity ?
> here I found this:
> https://access.redhat.com/site/solutions/15482
> In fact of course the hardware defines if/how a certain Interrupt can=
 be
> assigned to a certain CPU. How is this usually done when using ARM
> Cortex A9+ cores ?.
The ARM A9 datasheet will say what registers to write to assign IRQs to=
=20
CPU1, and make Linux not to use those IRQs.
Then the max. latency is determined by the clock speed and CPU cycles=20
the bare metal program needs to react (should be in datasheet).

About the non-determinism of modern hardware: if a chip is AMP capable=20
the heating up of 1 core should not influence the other core. I believe=
=20
heat spreads vertically (to the heatsink) and not so much horizontally.=
=20
So an RTOS should run with a stable frequency. (anyhow, Linux should no=
t=20
touch the other CPU, or need to touch it).
>
>    - what about MMU issues ?
The bare metal program does not use the MMU. The L1 cache is separated,=
=20
and the shared L2 cache was not used by CPU1 to avoid problems.
The RAM was divided in 2 separate parts.
I think it is not too difficult to share some RAM (a third section in=20
the RAM) and let 1 of the core be the master of it to share data.
>
>    - how to have a Linux application communicate with the non.-Linux
> application running on the dedicated core ?
> Here I found this:
> http://lwn.net/Articles/464391
>
>
> For example I (e.g.) would like a (now rather cheap) standard quadcor=
e
> ARM Cortex A9 processor chip and modify a Debian distribution in a wa=
y
> that support this stuff.
>
> Thanks for any pointers ?
The Xilinx Zynq is of course purpose-built for this kind of stuff. Also=
=20
Altera has such a SoC (System on Chip).
My student also found examples of an AMP solution with Linux/FreeRTOS=20
and Linux/eCos.

Let me know if you need more info, but I fear my answer is too deep=20
embedded an away from Linux (when I read the other answers).

Success anyhow, and I would be happy to read about your project!

J=FCrgen
>
> -Michael
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


--=20
J=FCrgen Lambrecht
R&D Associate
Mobile: +32 499 644 531
Tel: +32 (0)51 303045    Fax: +32 (0)51 310670
http://www.televic-rail.com
Televic Rail NV - Leo Bekaertlaan 1 - 8870 Izegem - Belgium
Company number 0825.539.581 - RPR Kortrijk
