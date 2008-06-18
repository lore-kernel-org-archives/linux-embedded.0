From: Adrian Bunk <bunk@kernel.org>
Subject: Re: Recommendation for activating a deferred module init in the
	kernel
Date: Wed, 18 Jun 2008 11:52:34 +0300
Message-ID: <20080618085233.GP25911@cs181133002.pp.htv.fi>
References: <4858AF6D.7040808@codefidence.com> <1213777222.26255.1161.camel@pmac.infradead.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213777222.26255.1161.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Gilad Ben-Yossef <gilad@codefidence.com>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, Jun 18, 2008 at 09:20:22AM +0100, David Woodhouse wrote:
> On Wed, 2008-06-18 at 09:47 +0300, Gilad Ben-Yossef wrote:
> > This may sound like a stupid question, but why are you compiling the 
> > modules statically?
> 
> I wondered that.
> 
> One potential reason to avoid modules is that they waste RAM -- you have
> to allocate an integral number of pages for each one, which means an
> average of 2KiB wasted for each module you load. Although that isn't
> much, it's not zero either. It might be possible to optimise that by
> 'packing' module allocations, if you're careful about it.
>...
> So the only real reason I can see to avoid modules in the _current_
> kernel would be the wasted RAM, which should be something we can
> address.
>...

You miss the size increase imposed by CONFIG_MODULES=y.

E.g. setting CONFIG_MODULES=y in the arm collie_defconfig will
increase the size of vmlinux by 14% (sic).

I haven't investigated why it takes that much space, but stuff like 
kernel/module.o taking 23kB and each EXPORT_SYMBOL requiring a few
bytes simply cannot be completely eliminated.

> dwmw2

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

