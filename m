From: Nicolas Pitre <nico@cam.org>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Wed, 18 Jun 2008 10:56:40 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0806181042320.2982@xanadu.home>
References: <4858AF6D.7040808@codefidence.com>
 <1213777222.26255.1161.camel@pmac.infradead.org>
 <20080618085233.GP25911@cs181133002.pp.htv.fi>
 <Pine.LNX.4.64.0806181056300.13297@vixen.sonytel.be>
 <1213783190.26255.1188.camel@pmac.infradead.org>
 <20080618103302.GA16139@cs181133002.pp.htv.fi>
 <Pine.LNX.4.64.0806181336410.13297@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <Pine.LNX.4.64.0806181336410.13297@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Adrian Bunk <bunk@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Gilad Ben-Yossef <gilad@codefidence.com>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, 18 Jun 2008, Geert Uytterhoeven wrote:

> On Wed, 18 Jun 2008, Adrian Bunk wrote:
> > On Wed, Jun 18, 2008 at 10:59:50AM +0100, David Woodhouse wrote:
> > > On Wed, 2008-06-18 at 10:57 +0200, Geert Uytterhoeven wrote:
> > > > On Wed, 18 Jun 2008, Adrian Bunk wrote:
> > > > > You miss the size increase imposed by CONFIG_MODULES=y.
> > > > > 
> > > > > E.g. setting CONFIG_MODULES=y in the arm collie_defconfig will
> > > > > increase the size of vmlinux by 14% (sic).
> > > > > 
> > > > > I haven't investigated why it takes that much space, but stuff like 
> > > > > kernel/module.o taking 23kB and each EXPORT_SYMBOL requiring a few
> > > > > bytes simply cannot be completely eliminated.
> > > > 
> > > > Sounds like we need a tool that strips out the unneeded symbols, given a list
> > > > of modules?
> > > 
> > > And do the --gc-sections step again after that... :)
> > 
> > But even after all optimizations CONFIG_MODULES=y will still cause a 
> > significant additional cost [1] when thinking in the dimensions of 
> > Tim's "the 30 or so Linux-tiny patches that I use get me about 110k of 
> > reductions.  For me, this is about 5% of my kernel size" statement in 
> > another thread.
> > 
> > [1] as I said, kernel/module.o alone takes 23kB
> 
> Which could be freed after the last module has been loaded?

Even if you free the module loading infrastructure afterwards, you still 
have to carry it in flash for both the kernel part and the user part.  
And the whole process (having to sort out module loading in user space, 
etc.) is still more complex than not having to load modules at all. Many 
embedded designs have fixed hardware configuration and purpose which 
makes dynamic module loading an unnecessary bloat.

Having the kernel span a parallel thread with a lower priority to 
initialize drivers could be a much simpler solution in terms of size and 
speed.  This way the init process could run early, and devices would 
become available eventually just as if corresponding modules were 
loaded.

The only difficulty is to properly determine how to distinguish between 
drivers that have to be initialized early in order to mount the root fs 
and the others that can wait.


Nicolas
