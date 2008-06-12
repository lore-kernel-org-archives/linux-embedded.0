From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 11:28:10 -0500
Message-ID: <48514E9A.3080901@billgatliff.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <20080612160845.GB9327@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080612160845.GB9327@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

Guys:

> If you opt to cross-compile, having to deal with those
> sorts of things is the price you pay.


If the build system derives from autoconf, then a hacked-up config.cache (or
equivalent command-line args) often solves problems for me.  Just give the cache
the answers that it would otherwise have to get by running code on the target
machine.

That's how emdebian is doing a bunch of their stuff, and I have to admit that it
works pretty darned well.  It's also handy for configuration management, since
the cache file itself is plaintext and therefore svn/git/bzr/cvs/...-friendly.



b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
