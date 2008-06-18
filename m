From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Recommendation for activating a deferred module init in the
	kernel
Date: Wed, 18 Jun 2008 10:59:50 +0100
Message-ID: <1213783190.26255.1188.camel@pmac.infradead.org>
References: <4858AF6D.7040808@codefidence.com>
	 <1213777222.26255.1161.camel@pmac.infradead.org>
	 <20080618085233.GP25911@cs181133002.pp.htv.fi>
	 <Pine.LNX.4.64.0806181056300.13297@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806181056300.13297@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Adrian Bunk <bunk@kernel.org>, Gilad Ben-Yossef <gilad@codefidence.com>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, 2008-06-18 at 10:57 +0200, Geert Uytterhoeven wrote:
> On Wed, 18 Jun 2008, Adrian Bunk wrote:
> > On Wed, Jun 18, 2008 at 09:20:22AM +0100, David Woodhouse wrote:
> > > On Wed, 2008-06-18 at 09:47 +0300, Gilad Ben-Yossef wrote:
> > > > This may sound like a stupid question, but why are you compiling the 
> > > > modules statically?
> > > 
> > > I wondered that.
> > > 
> > > One potential reason to avoid modules is that they waste RAM -- you have
> > > to allocate an integral number of pages for each one, which means an
> > > average of 2KiB wasted for each module you load. Although that isn't
> > > much, it's not zero either. It might be possible to optimise that by
> > > 'packing' module allocations, if you're careful about it.
> > >...
> > > So the only real reason I can see to avoid modules in the _current_
> > > kernel would be the wasted RAM, which should be something we can
> > > address.
> > >...
> > 
> > You miss the size increase imposed by CONFIG_MODULES=y.
> > 
> > E.g. setting CONFIG_MODULES=y in the arm collie_defconfig will
> > increase the size of vmlinux by 14% (sic).
> > 
> > I haven't investigated why it takes that much space, but stuff like 
> > kernel/module.o taking 23kB and each EXPORT_SYMBOL requiring a few
> > bytes simply cannot be completely eliminated.
> 
> Sounds like we need a tool that strips out the unneeded symbols, given a list
> of modules?

And do the --gc-sections step again after that... :)

-- 
dwmw2

