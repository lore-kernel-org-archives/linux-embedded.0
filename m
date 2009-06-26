From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Kernel crashing and log buffers...
Date: Fri, 26 Jun 2009 10:42:19 -0700
Message-ID: <20090626174219.GA19426@cuplxvomd02.corp.sa.net>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090611175303.GA10058@cuplxvomd02.corp.sa.net> <200906261039.50570.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200906261039.50570.rgetz@blackfin.uclinux.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1211; t=1246038139; x=1246902139;
	c=relaxed/simple; s=sjdkim1004;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Kernel=20crashing=20and=20log=20buffers
	...
	|Sender:=20;
	bh=jbJKpSGvP6tGpBMQFKMaT+L6+/0VwKVdF6bKPlYTnsU=;
	b=WqxOzi6UHMBRWAz4yKJkbN0sjCJfCyu1sT6ClzA0FegSqT+3zB7T7D+4p3
	A21r6AHVbobQnIlQMzBFnihtVOToK0SA5tNF7rkpxnP0cJvRFvDg6lHP6YmV
	AYRsGECA4RmdepaoISLiPAM68jYCCqgVzaXEWAA4l/+K0vL5nzGCE=;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Getz <rgetz@blackfin.uclinux.org>
Cc: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Fri, Jun 26, 2009 at 10:39:50AM -0400, Robin Getz wrote:
> OK - so after a bit more digging into things (and a poke by Mike) - I think 
> most of the stuff already exists.
> 
> Normal run time issues:
> --------------------------
>  - MTD_OOPS - on 2007-06-28 this was added to Linus's tree:
>     http://lkml.org/lkml/2007/6/18/234
>     CONFIG_MTD_OOPS
>       tristate "Log panic/oops to an MTD buffer"
...
> early boot issues:
> ----------------------
>  - CONFIG_EARLY_PRINTK
>    - early printk just defined a console - and is supported by:
>       alpha, blackfin, microblaze, mips, powerpc, sh, x86
>    - it's pretty trivial to support a memory based buffer - some
>      archs already support it.
> 
> I think this only leaves Wolfgang's desire for memory buffers from the 
> bootloader to get (somehow) into the kernel's log buffer for syslog 
> processing...
> 
> Anyone else agree?

Almost. A couple of us also want memory for "flight data record" FDR data
for doing continuous logging. This would, ideally, be either uncached or cached
in such a way that data is guaranteed to be written to memory in the event of
a watchdog timer-induced system reset.

David VL
