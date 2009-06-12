From: Christian Gagneraud <cgagneraud@techworks.ie>
Subject: Re: AT91SAM9G20 design and power (was and boot times)
Date: Fri, 12 Jun 2009 19:37:51 +0100
Message-ID: <4A32A07F.5020907@techworks.ie>
References: <ed62800906102037q71f2a6bdq835793a1ac36c41b@mail.gmail.com> <ed62800906102043m723911d8t1968174201ba7fbb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ed62800906102043m723911d8t1968174201ba7fbb@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aras Vaichas <arasv@magellan-technology.com>
Cc: linux-embedded@vger.kernel.org

Aras Vaichas wrote:
> Hi,
> 
> we're designing our next generation RFID reader and I'm planning on
> using the AT91SAM9G20 in the next design. We currently use the
> AT91RM9200.
> 
> Can I get some feedback from people with regards to general design
> configurations  that affect the boot time with respect to this CPU (or
> the AT91SAM9260)
> 
> Some questions are:
> 
> * what is your boot time? What is the time from power-on to kernel
> running, how long does the kernel take to run until init starts, and
> how long does init take?
> * what is your system hardware configuration? CPU+NAND, CPU+NOR+NAND,
> CPU+DATAFLASH+NAND?
> * do you boot everything from the NAND or do you use a combination of
> Dataflash/NOR and NAND?
> * do you use U-Boot, or a minimal custom bootloader that copies a
> kernel image from NAND to SDRAM and then executes it?
> * do you mount a small partition of the NAND to begin with and then
> mount the rest later?
> * do you have a monolithic kernel, or is it split into minimal with
> modules loaded from, say, JFFS2 on NAND?
> * are you using JFFS2 or UBIFS?
> 
> Any info is much appreciated, thank you!

Hi all,

I'm changing slightly the topic...

We are thinking about making our own board as well, but we are mainly 
concerned with power consumption.

Can anyone gives some feedback as well about power consumption of 
their board (or the main components) and as well about the current 
support for power management of the Linux kernel? What about suspend 
to RAM, frequency scaling, etc...?

Regards,
Chris

> 
> regards,
> 
> Aras Vaichas
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
