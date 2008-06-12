From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded	Maintainer(s)...)
Date: Thu, 12 Jun 2008 12:17:29 -0500
Message-ID: <48515A29.6070800@billgatliff.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>	 <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com>	 <1213285831.26255.152.camel@pmac.infradead.org>	 <20080612160845.GB9327@linux-sh.org>  <48514E9A.3080901@billgatliff.com> <1213288655.26255.168.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213288655.26255.168.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>

David Woodhouse wrote:
> Yeah, I was building Red Hat Linux packages for sh3 many years ago,
> using tricks like that. But there was always _something_ else going
> wrong, however much you hacked around it. And a lot of it would only
> turn up at runtime, not build time. I would never consider shipping a
> product with a large number of userspace packages cross-compiled.

I take it on a case-by-case basis.  But yea, validation is definitely a pain.
Especially with all the silent failures (i.e. getting endianness wrong) that the
configure script creates for you.

> For minimal file systems with a select handful of tools which can be
> tested exhaustively, it's not so bad. But for any 'full-featured'
> userspace, I think cross-compilation is completely insane.

We both agree that it'll *drive* you insane, at least.  And I'm 90% with you on
the rest.  :)


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
