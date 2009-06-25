From: "Martin Meuli" <Martin.Meuli@gmx.ch>
Subject: Saving the kernel log accross boots
Date: Thu, 25 Jun 2009 16:40:29 +0200
Message-ID: <op.uv238aaxq25ece@thur.netmodule.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi All

In case of a crash we would like to save the kernel log and retrieve it in  
the next boot.
There are already several suggestions on how to do it on this and other  
lists.
(Kernel crashing and log buffers: Robin Getz)
Unfortunately we don't have extra SRAM to use for it. We need to do it in  
the 'normal' RAM.

ARCH=ARM

What we did:
- modify kernel/printk.c: use  
__attribute__((__section__(".bss.kringbuf"... to put the log related stuf  
into a separate section
- modify the linker script to link .bss.kringbuf at the start of the .bss  
section
- modify arch/arm/kernel/head-common.S to exclude the new section from  
being nulled (if it was a watchdog restart)
- modify kernel/printk.c to use cach_flush after prink
- make sure the bootloader does not overwrite that memory

This seems to work.
After a crash we get the messages from the new boot and the last crash.
It seems that the decompress code is using memory at the end of the kernel  
and destroys the log. So we have to use the bootloader to decompress the  
image into RAM.

Before digging any deeper I would like to know if someone as a better  
(more general) idea.

Regards, Martin
