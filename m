From: Adrian Bunk <bunk@kernel.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Thu, 12 Jun 2008 20:01:08 +0300
Message-ID: <20080612170108.GA17231@cs181133002.pp.htv.fi>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <20080612160845.GB9327@linux-sh.org> <48514E9A.3080901@billgatliff.com> <1213288655.26255.168.camel@pmac.infradead.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213288655.26255.168.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Bill Gatliff <bgat@billgatliff.com>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 05:37:35PM +0100, David Woodhouse wrote:
> On Thu, 2008-06-12 at 11:28 -0500, Bill Gatliff wrote:
> > Guys:
> > 
> > > If you opt to cross-compile, having to deal with those
> > > sorts of things is the price you pay.
> > 
> > 
> > If the build system derives from autoconf, then a hacked-up config.cache (or
> > equivalent command-line args) often solves problems for me.  Just give the cache
> > the answers that it would otherwise have to get by running code on the target
> > machine.
> > 
> > That's how emdebian is doing a bunch of their stuff, and I have to admit that it
> > works pretty darned well.  It's also handy for configuration management, since
> > the cache file itself is plaintext and therefore svn/git/bzr/cvs/...-friendly.
> 
> Yeah, I was building Red Hat Linux packages for sh3 many years ago,
> using tricks like that. But there was always _something_ else going
> wrong, however much you hacked around it. And a lot of it would only
> turn up at runtime, not build time. I would never consider shipping a
> product with a large number of userspace packages cross-compiled.
> 
> For minimal file systems with a select handful of tools which can be
> tested exhaustively, it's not so bad. But for any 'full-featured'
> userspace, I think cross-compilation is completely insane.

There's also the middle way taken by e.g. Scratchbox of using 
cross-compilers and other tools from the machine the compilation
is done on, but emulating a native build for the software being
compiled.

This works quite good in practice.

> dwmw2

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

