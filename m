From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: AT91SAM9G20 design and boot times
Date: Thu, 11 Jun 2009 14:48:23 +0200
Message-ID: <4A30FD17.7060508@atmel.com>
References: <ed62800906102037q71f2a6bdq835793a1ac36c41b@mail.gmail.com> <ed62800906102043m723911d8t1968174201ba7fbb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ed62800906102043m723911d8t1968174201ba7fbb@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aras Vaichas <arasv@magellan-technology.com>
Cc: linux-embedded@vger.kernel.org

Hi,

Aras Vaichas :
> Hi,
> 
> we're designing our next generation RFID reader and I'm planning on
> using the AT91SAM9G20 in the next design. We currently use the
> AT91RM9200.

Good choice ;-)

> Can I get some feedback from people with regards to general design
> configurations  that affect the boot time with respect to this CPU (or
> the AT91SAM9260)

I presume that you already know what are the configurations we are using
at Linux4sam.org on our at91sam9g20ek board. Anyway, I answer your
questions as it may also interest other readers.

> Some questions are:
> 
> * what is your boot time? What is the time from power-on to kernel
> running, how long does the kernel take to run until init starts, and
> how long does init take?

We have not tried to be clever on speeding up boot process but I guess
that we can save time:
- removing unneeded bootloader steps (remove u-boot for instance)
- removing unused drivers
- lower timeouts (Ethernet phy detection for example)
- tailor rootfs exactly to your needs

That said, here are numbers from our not optimized demo
(AT91Bootstrap+u-boot+linux+buildroot):
- ~6s to Linux (can certainly be optimized)
- ~+2s to init
- ~+5s to login (here also)

> * what is your system hardware configuration? CPU+NAND, CPU+NOR+NAND,
> CPU+DATAFLASH+NAND?

CPU + NAND can lower your BOM

> * do you boot everything from the NAND or do you use a combination of
> Dataflash/NOR and NAND?

Both.

> * do you use U-Boot, or a minimal custom bootloader that copies a
> kernel image from NAND to SDRAM and then executes it?

If boot time is a hot topic, choose AT91Bootstrap that directly loads Linux.

> * do you mount a small partition of the NAND to begin with and then
> mount the rest later?

With JFFS2, I advice you to tailor your NAND partition for rootfs to the
minimum. You will then have room in another partition once your system
is up-n-running.

> * do you have a monolithic kernel, or is it split into minimal with
> modules loaded from, say, JFFS2 on NAND?

Monolithic kernel.

> * are you using JFFS2 or UBIFS?

JFFS2 for the moment. We will certainly consider moving to UBIFS.

Bye,
-- 
Nicolas Ferre
