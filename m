From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: AT91SAM9G20 design and boot times
Date: Fri, 12 Jun 2009 16:06:26 +0200
Message-ID: <20090612140626.GA10372@game.jcrosoft.org>
References: <ed62800906102037q71f2a6bdq835793a1ac36c41b@mail.gmail.com> <ed62800906102043m723911d8t1968174201ba7fbb@mail.gmail.com> <4A30FD17.7060508@atmel.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A30FD17.7060508@atmel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Aras Vaichas <arasv@magellan-technology.com>, linux-embedded@vger.kernel.org

On 14:48 Thu 11 Jun     , Nicolas Ferre wrote:
> Hi,
> 
> Aras Vaichas :
> > Hi,
> > 
> > we're designing our next generation RFID reader and I'm planning on
> > using the AT91SAM9G20 in the next design. We currently use the
> > AT91RM9200.
> 
> Good choice ;-)
> 
> > Can I get some feedback from people with regards to general design
> > configurations  that affect the boot time with respect to this CPU (or
> > the AT91SAM9260)
> 
> I presume that you already know what are the configurations we are using
> at Linux4sam.org on our at91sam9g20ek board. Anyway, I answer your
> questions as it may also interest other readers.
> 
> > Some questions are:
> > 
> > * what is your boot time? What is the time from power-on to kernel
> > running, how long does the kernel take to run until init starts, and
> > how long does init take?
> 
> We have not tried to be clever on speeding up boot process but I guess
> that we can save time:
> - removing unneeded bootloader steps (remove u-boot for instance)
> - removing unused drivers
> - lower timeouts (Ethernet phy detection for example)
> - tailor rootfs exactly to your needs
> 
> That said, here are numbers from our not optimized demo
> (AT91Bootstrap+u-boot+linux+buildroot):
> - ~6s to Linux (can certainly be optimized)
> - ~+2s to init
> - ~+5s to login (here also)
I've done some test on 9263
with the following config
cpu+nor (u-boot+linux+busybox)
~4/5s to the prompt

if the boottime is critical I'll recommend you NOR + XIP

> 
> > * what is your system hardware configuration? CPU+NAND, CPU+NOR+NAND,
> > CPU+DATAFLASH+NAND?
> 
> CPU + NAND can lower your BOM
> 
> > * do you boot everything from the NAND or do you use a combination of
> > Dataflash/NOR and NAND?
I've test it on 9263
> 
> Both.
> 
> > * do you use U-Boot, or a minimal custom bootloader that copies a
> > kernel image from NAND to SDRAM and then executes it?
> 
> If boot time is a hot topic, choose AT91Bootstrap that directly loads Linux.
I disagree on this because you will loose a lot's of possibity as bootcount
DFU, store your kernel in your rootfs etc...

> 
> > * do you mount a small partition of the NAND to begin with and then
> > mount the rest later?
> 
I'll consider to switch to UBIFS
and use lzma compression (for the uImage) if no XIP

Best Regards,
J.
