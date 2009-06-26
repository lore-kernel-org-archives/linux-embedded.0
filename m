From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: Kernel crashing and log buffers...
Date: Fri, 26 Jun 2009 10:39:50 -0400
Message-ID: <200906261039.50570.rgetz@blackfin.uclinux.org>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090611175303.GA10058@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090611175303.GA10058@cuplxvomd02.corp.sa.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

OK - so after a bit more digging into things (and a poke by Mike) - I think 
most of the stuff already exists.


Normal run time issues:
--------------------------
 - MTD_OOPS - on 2007-06-28 this was added to Linus's tree:
    http://lkml.org/lkml/2007/6/18/234
    CONFIG_MTD_OOPS
      tristate "Log panic/oops to an MTD buffer"
        depends on MTD
        help
          This enables panic and oops messages to be logged to a circular
          buffer in a flash partition where it can be read back at some
          later point.

          To use, add console=ttyMTDx to the kernel command line,
          where x is the MTD device number to use.

Note - this currently _only_ does things when oops_in_progress is set, but 
should be easy to extend to all - if that what people want.

 - mtd devices can be backed by RAM.
    CONFIG_MTD_RAM

 - mtd devices can be backed by flash (if you want things to be persistant
     across power cycles)...



early boot issues:
----------------------
 - CONFIG_EARLY_PRINTK
   - early printk just defined a console - and is supported by:
      alpha, blackfin, microblaze, mips, powerpc, sh, x86
   - it's pretty trivial to support a memory based buffer - some
     archs already support it.

I think this only leaves Wolfgang's desire for memory buffers from the 
bootloader to get (somehow) into the kernel's log buffer for syslog 
processing...

Anyone else agree?
