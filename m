From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: Kernel crashing and log buffers...
Date: Fri, 12 Jun 2009 00:54:46 -0400
Message-ID: <200906120054.46965.rgetz@blackfin.uclinux.org>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <8bd0f97a0906111627h128cc561y2bf4a0b2b30d7187@mail.gmail.com> <20090612010707.GB23715@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090612010707.GB23715@cuplxvomd02.corp.sa.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu 11 Jun 2009 21:07, David VomLehn pondered:
> It may be helpful if you can say a bit more about
> the problem you are trying to solve.

Yeah, I guess defining the goals is a good place to start (and 
the hardest to come to agreement on).

 - early crash analysis - before the kernel has set up the console 
   or console drivers, (which happens after interrupts, caches, & 
   memory, are set up) crashes are pretty difficult to figure out. 
   Typically - the kernel crashes or hangs without any output on 
   the console.
   What the end users experiences is typically...
   "Starting Kernel at = xxxx"
   and nothing else. The valuable info (if any) is stuck in the 
   kernel's log buffer.

   earlyprintk helps with this, however - this assumes that the 
   kernel has set up the early_printk console properly. If there
   is a problem doing that (wrong driver compiled in, wrong pin 
   muxing, etc), then the info is still stuck (unseen) in the
   kernel's log buffer.

   - but is only to be supported on:
   Documentation/kernel-parameters.txt
       earlyprintk=    [X86-32,X86-64,SH,BLACKFIN]
                        earlyprintk=vga
                        earlyprintk=serial[,ttySn[,baudrate]]
                        earlyprintk=dbgp

   see:
   arch/x86/kernel/early_printk.c
   arch/sh/kernel/early_printk.c
   arch/blackfin/kernel/early_printk.c

   For giggles - put a panic() in your arch/*/kernel/setup.c:setup_arch()
   With earlyprintk - you still get to see what happened (if the 
   earlyprintk console is working OK).

   Problem:
    Even with earlyprintk - there are times when things not getting
    out of the system, and are stuck in the printk __log_buf.

   David's patch might help with this - as architectures could register, 
   and write all the prink data into a buffer in memory - where it could
   be read out by the bootloader, or future kernels - but it would need
   some tweaks to support early functionality (but I don't think much).

 - late crash analysis - Sometimes - even after the kernel is up
   and running properly - a device driver does a bad thing. 
   Normally - complete kernel dumps can come out a serial
   console, and you can you your favourite serial application
   to scroll back and determine what is going on.

   In many embedded devices - this is not a possibility, since
   all the serial ports are in use (Irda, Bluetooth, GPS, etc).

   In devices that are deployed in the field - this is not a
   possibility, since nothing is connected to the serial 
   console (if it exists) for logging.

   Even when there is no console device, or anything attached to the
   console device, everything is in the __log_buf.

   Problem:
   There doesn't appear (to me) to be anything in mainline to help 
   with this.

   David's patch might help with this - as architectures could register, 
   and write all the prink data into a buffer in memory - where it could
   be read out by the bootloader, or future kernels.

 - allowing board startup information (POST) created/output from
   the boot loader to be transfered to the standard/normal kernel
   log processing features (syslog/dmesg/etc).

   There doesn't appear (to me) to be anything in mainline to help 
   with this.
 
   David's patch could help with this - as architectures could register, 
   and if a magic number was in the start of the buffer, it could just
   strnlen the buffer, and then do a printk on it. The downside is it would
   not be at the start of the buffer - as Grant's and Wolfgang's suggestion.
   But I'm not sure this is a requirement???


Is there anything I'm missing?
