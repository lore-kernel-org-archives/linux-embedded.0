From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Thu, 12 Jun 2008 17:37:35 +0100
Message-ID: <1213288655.26255.168.camel@pmac.infradead.org>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
	 <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com>
	 <1213285831.26255.152.camel@pmac.infradead.org>
	 <20080612160845.GB9327@linux-sh.org>  <48514E9A.3080901@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48514E9A.3080901@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, 2008-06-12 at 11:28 -0500, Bill Gatliff wrote:
> Guys:
> 
> > If you opt to cross-compile, having to deal with those
> > sorts of things is the price you pay.
> 
> 
> If the build system derives from autoconf, then a hacked-up config.cache (or
> equivalent command-line args) often solves problems for me.  Just give the cache
> the answers that it would otherwise have to get by running code on the target
> machine.
> 
> That's how emdebian is doing a bunch of their stuff, and I have to admit that it
> works pretty darned well.  It's also handy for configuration management, since
> the cache file itself is plaintext and therefore svn/git/bzr/cvs/...-friendly.

Yeah, I was building Red Hat Linux packages for sh3 many years ago,
using tricks like that. But there was always _something_ else going
wrong, however much you hacked around it. And a lot of it would only
turn up at runtime, not build time. I would never consider shipping a
product with a large number of userspace packages cross-compiled.

For minimal file systems with a select handful of tools which can be
tested exhaustively, it's not so bad. But for any 'full-featured'
userspace, I think cross-compilation is completely insane.

-- 
dwmw2

