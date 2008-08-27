From: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
	bisected
Date: Wed, 27 Aug 2008 03:23:16 +0300
Message-ID: <20080827002316.GE11734@cs181140183.pp.htv.fi>
References: <48B313E0.1000501@hp.com> <alpine.LFD.1.10.0808251326500.3363@nehalem.linux-foundation.org> <200808261111.19205.rusty@rustcorp.com.au> <alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org> <20080826183051.GB10925@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org> <20080826205916.GB11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org> <20080826232411.GC11734@cs181140183.pp.htv.fi> <alpine.LFD.1.10.0808261648140.3363@nehalem.linux-foundation.org>
Mime-Version: 1.0
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0808261648140.3363-nfNrOhbfy2R17+2ddN/4kux8cNe9sq/dYPYVAmT7z5s@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "Alan D. Brunelle" <Alan.Brunelle-VXdhtT5mjnY@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arjan van de Ven <arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Aug 26, 2008 at 04:51:52PM -0700, Linus Torvalds wrote:
> 
> 
> On Wed, 27 Aug 2008, Adrian Bunk wrote:
> > > 
> > > We're much better off with a 1% code-size reduction than forcing big 
> > > stacks on people. The 4kB stack option is also a good way of saying "if it 
> > > works with this, then 8kB is certainly safe".
> > 
> > You implicitely assume both would solve the same problem.
> 
> I'm just saying that your logic doesn't hold water.
> 
> If we can save kernel stack usage, then a 1% increase in kernel size is 
> more than worth it.

From some tests the size increase seems to become bigger for smaller 
kernels, but I don't have any really good data.


An interesting question is why most of our architectures for embedded 
devices only offer bigger stacks:

The only architectures offering a 4kB stacks option are:
- m68knommu
- sh
- 32bit x86

The following architectures that are used in embedded devices 
always use 8kB stacks (or bigger) in your tree:
- arm
- avr32
- blackfin
- cris
- frv
- h8300
- m32r
- m68k
- mips
- mn10300 (has an #ifdef CONFIG_4KSTACKS but no kconfig option)
- powerpc
- xtensa


> > While 4kB stacks are something we anyway never got 100% working
> 
> What? Don't be silly. 
> 
> Linux _historically_ always used 4kB stacks.
> 
> No, they are likely not usable on x86-64, but dammit, they should be more 
> than usable on x86-32 still.


When did we get callpaths like like nfs+xfs+md+scsi reliably 
working with 4kB stacks on x86-32?


>...
> 			Linus

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
