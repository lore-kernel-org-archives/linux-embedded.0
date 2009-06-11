From: Aras Vaichas <arasv@magellan-technology.com>
Subject: AT91SAM9G20 design and boot times
Date: Thu, 11 Jun 2009 13:43:18 +1000
Message-ID: <ed62800906102043m723911d8t1968174201ba7fbb@mail.gmail.com>
References: <ed62800906102037q71f2a6bdq835793a1ac36c41b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ed62800906102037q71f2a6bdq835793a1ac36c41b@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

we're designing our next generation RFID reader and I'm planning on
using the AT91SAM9G20 in the next design. We currently use the
AT91RM9200.

Can I get some feedback from people with regards to general design
configurations  that affect the boot time with respect to this CPU (or
the AT91SAM9260)

Some questions are:

* what is your boot time? What is the time from power-on to kernel
running, how long does the kernel take to run until init starts, and
how long does init take?
* what is your system hardware configuration? CPU+NAND, CPU+NOR+NAND,
CPU+DATAFLASH+NAND?
* do you boot everything from the NAND or do you use a combination of
Dataflash/NOR and NAND?
* do you use U-Boot, or a minimal custom bootloader that copies a
kernel image from NAND to SDRAM and then executes it?
* do you mount a small partition of the NAND to begin with and then
mount the rest later?
* do you have a monolithic kernel, or is it split into minimal with
modules loaded from, say, JFFS2 on NAND?
* are you using JFFS2 or UBIFS?

Any info is much appreciated, thank you!

regards,

Aras Vaichas
