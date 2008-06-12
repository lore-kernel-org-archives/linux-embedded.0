From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 01:31:55 +0900
Message-ID: <20080612163155.GC9327@linux-sh.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <20080612160845.GB9327@linux-sh.org> <48514E9A.3080901@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48514E9A.3080901@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 11:28:10AM -0500, Bill Gatliff wrote:
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
> 
Yes, that's the easy case. It's things like perl that are the corner
cases, and my objection comes from the fact that people think we ought to
not have the kernel depend on perl rather than just fixing the package
itself. Autoconf/libtool damage is an entirely different problem :-)
