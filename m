From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Kernel crashing and log buffers...
Date: Thu, 11 Jun 2009 15:46:06 -0700
Message-ID: <20090611224606.GA21677@cuplxvomd02.corp.sa.net>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090611175303.GA10058@cuplxvomd02.corp.sa.net> <4A314B81.7060401@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A314B81.7060401@am.sony.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=2423; t=1244760366; x=1245624366;
	c=relaxed/simple; s=sjdkim4002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Kernel=20crashing=20and=20log=20buffers
	...
	|Sender:=20;
	bh=QjbjNDUSdlZuZiphgG5QJMPm2LSqh5rA5LtnsTKwE+k=;
	b=hFC1pfmFHi81z1ZhFWFGEBG/saB53u3TqGBZx9QIeP3K+eDrWjP64miwy9
	4wZ8JgmclCKNTrAvKTEXSBDbIKHKO1WgmBHRs9rvx7r8jTJs123S7AHM5PYB
	FZ/NWHMfu9;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Jun 11, 2009 at 11:22:57AM -0700, Tim Bird wrote:
> David VomLehn wrote:
> > Our kernel does crash, so we have to do this. I had submitted a patch a
> > while ago that tweaks emit_log_char, but this was bounced, reasonably,
> > because it would be interferring with the great majority of people who
> > are not interested in capturing log output. The suggestion was made that
> > we do this with a console driver. I've recently got a version working, as
> > a module, but I've only started testing of the version integrated into the
> > kernel tree.  Still, post early, post often, so I've appended a version
> > of the patch here to see if this seems to be the right direction.
> > 
> > Regardless whether my particular patch seems like the right way to do this,
> > we do need to solve this problem for the embedded world. It is one of the
> > few areas where we have needs not shared by the rest of the kernel community.
> 
> In general, I like this approach to solve this problem.  I spend most of
> my time in the lab with prototype boards that use a serial console, so my
> terminal history has always been my crashdump repository. ;-)
> 
> This approach it unobtrusive to the rest of the log buffer system.  I never
> did like the patches that introduced other ways to hack into the log
> buffer.  The printk/log buffer code path is already convoluted enough,
> and I didn't like the idea of adding additional hooks.  this approach
> leverages an already existing hook.

The one thing that is missing over some other approaches is that log output
captured by this method will be filtered, just like all of the other consoles,
by the printk priority. It might be useful to have the ability to specify
the priority level for each console. So, you could have only KERN_CRIT and
above going to your serial console, but configure the logging console to
capture everything down to KERN_WARNING. This is a refinement, though, and I
didn't want to make things overly complex without a good feeling that it was
necessary.

> I don't have much comment on the code specifics, but I have one nit
> with the config help...
...
> > +	help
> > +	  This contains a pseudo-console to record and divert kernel console
> > +	  output, which is probably of most used to embedded systems. When
> should be "most use" (no 'd')

Thanks for picking the nit!

> Tim Bird

David VomLehn
