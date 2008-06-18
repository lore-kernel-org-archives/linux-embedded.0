From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Recommendation for activating a deferred module init in the
	kernel
Date: Wed, 18 Jun 2008 09:20:22 +0100
Message-ID: <1213777222.26255.1161.camel@pmac.infradead.org>
References: <4858AF6D.7040808@codefidence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4858AF6D.7040808@codefidence.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Ben-Yossef <gilad@codefidence.com>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, 2008-06-18 at 09:47 +0300, Gilad Ben-Yossef wrote:
> This may sound like a stupid question, but why are you compiling the 
> modules statically?

I wondered that.

One potential reason to avoid modules is that they waste RAM -- you have
to allocate an integral number of pages for each one, which means an
average of 2KiB wasted for each module you load. Although that isn't
much, it's not zero either. It might be possible to optimise that by
'packing' module allocations, if you're careful about it.

Also, on some architectures modules have historically been less
efficient because when kernel and module text are too far apart in the
virtual address space, you have to insert trampolines for all calls
between them. I believe this used to be the case on ARM, but it got
fixed by moving stuff around? It's only v850 which still does this
AFAICT.

Do we actually manage to free inittext/initdata from modules on all
architectures now? The comments in <linux/init.h> suggest not, but I
think they lie -- it looks like like kernel/module.c will handle that
entirely generically for sections named ".init*" -- it'll allocate space
for those sections in a separate module_alloc() call, and free them
itself. (Do bear this in mind, if you take the above suggestion about
packing in module_alloc().)

So the only real reason I can see to avoid modules in the _current_
kernel would be the wasted RAM, which should be something we can
address. Tim, have I missed something? What _were_ your reasons for
avoiding modules, and can we do something about those instead of trying
to defer the initialisation of in-kernel code?

Delaying init of certain modules seems like a poor man's substitute for
a properly multi-threaded startup....

-- 
dwmw2

