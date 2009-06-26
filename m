From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: Kernel crashing and log buffers...
Date: Fri, 26 Jun 2009 13:59:53 -0400
Message-ID: <200906261359.53746.rgetz@blackfin.uclinux.org>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <200906261039.50570.rgetz@blackfin.uclinux.org> <20090626174219.GA19426@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090626174219.GA19426@cuplxvomd02.corp.sa.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Fri 26 Jun 2009 13:42, David VomLehn pondered:
> On Fri, Jun 26, 2009 at 10:39:50AM -0400, Robin Getz wrote:
> > OK - so after a bit more digging into things (and a poke by Mike) - I
> think 
> > most of the stuff already exists.
> > 
> > Normal run time issues:
> > --------------------------
> >  - MTD_OOPS - on 2007-06-28 this was added to Linus's tree:
> >     http://lkml.org/lkml/2007/6/18/234
> >     CONFIG_MTD_OOPS
> >       tristate "Log panic/oops to an MTD buffer"
> ...
> > early boot issues:
> > ----------------------
> >  - CONFIG_EARLY_PRINTK
> >    - early printk just defined a console - and is supported by:
> >       alpha, blackfin, microblaze, mips, powerpc, sh, x86
> >    - it's pretty trivial to support a memory based buffer - some
> >      archs already support it.
> > 
> > I think this only leaves Wolfgang's desire for memory buffers from the
> 
> > bootloader to get (somehow) into the kernel's log buffer for syslog 
> > processing...
> > 
> > Anyone else agree?
> 
> Almost. A couple of us also want memory for "flight data record" FDR
> data for doing continuous logging. This would, ideally, be either uncached
> or cached in such a way that data is guaranteed to be written to memory in
> the event of a watchdog timer-induced system reset.

Many of the early_printk implementations accept a "keep" option (which does 
not remove the console/buffer - and keeps it around forever) - I'm adding 
that to the Blackfin implementation as we speak - but it is already there on 
sh.

I expect that we could add something to the MTD_OOPS, as to allways write as 
well (console=ttyMTDx,log_level) or something like that if the backing needed 
to be flash.

Would that satisfy things?

-Robin
