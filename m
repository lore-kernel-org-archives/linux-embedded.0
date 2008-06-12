From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 13:22:32 -0400
Message-ID: <8bd0f97a0806121022i6876646q26554da74d8305a2@mail.gmail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
	 <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com>
	 <1213285831.26255.152.camel@pmac.infradead.org>
	 <20080612160845.GB9327@linux-sh.org>
	 <48514E9A.3080901@billgatliff.com>
	 <20080612163155.GC9327@linux-sh.org>
	 <48515978.8040603@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=HOkMjqrRyQJdOxR07gYMyjwfLKeyQo5OL6zped1xTBo=;
        b=e1XjfrsRFnO7hdjUwiFGuRGhNZl/GZKEit0gXRtGHebn1d45cqB/dsl6orW7id/4X0
         7wBP/rhZfLGZVWErWgsue8kVraKY0KFEV8R9ODBSOsTF9JlKn5LQZfzVjNtoirRz7csj
         YxDV03qPOGj8UE3TRQXKhFnDH+JQkWolPa6QU=
In-Reply-To: <48515978.8040603@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 1:14 PM, Bill Gatliff wrote:
> Paul Mundt wrote:
>> Yes, that's the easy case. It's things like perl that are the corner
>> cases, and my objection comes from the fact that people think we ought to
>> not have the kernel depend on perl rather than just fixing the package
>> itself. Autoconf/libtool damage is an entirely different problem :-)
>
> At first glance, it seems like checkincludes.pl could be duplicated by egrep |
> uniq | wc vs. egrep | wc.  Not quite sure what checkversion.pl is trying to do.
>
> The namespace.pl script looks optional, as does export_report.pl.
>
> So maybe we could _reduce_ dependency on perl, if there's any advantage to gain
> by doing so.  But the kernel build machinery isn't dependent on very many other
> systems (just tcl, bash and gcc-core), so I don't really see the point unless
> you could completely eliminate perl.  And I don't see how you might do *that*
> without dragging in a bunch of stuff to replace it, thereby increasing the
> number of dependencies.

the idea is to keep perl from being required to build the kernel
itself.  tcl is not required in this case either.  if you want to use
crazy languages to optional things above and beyond, then no one is
going to complain (and if they do, well screw them).
-mike
