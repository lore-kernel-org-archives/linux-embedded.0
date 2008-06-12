From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 12:14:32 -0500
Message-ID: <48515978.8040603@billgatliff.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <20080612160845.GB9327@linux-sh.org> <48514E9A.3080901@billgatliff.com> <20080612163155.GC9327@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080612163155.GC9327@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Paul Mundt wrote:

> Yes, that's the easy case. It's things like perl that are the corner
> cases, and my objection comes from the fact that people think we ought to
> not have the kernel depend on perl rather than just fixing the package
> itself. Autoconf/libtool damage is an entirely different problem :-)
> 

At first glance, it seems like checkincludes.pl could be duplicated by egrep |
uniq | wc vs. egrep | wc.  Not quite sure what checkversion.pl is trying to do.

The namespace.pl script looks optional, as does export_report.pl.

So maybe we could _reduce_ dependency on perl, if there's any advantage to gain
by doing so.  But the kernel build machinery isn't dependent on very many other
systems (just tcl, bash and gcc-core), so I don't really see the point unless
you could completely eliminate perl.  And I don't see how you might do *that*
without dragging in a bunch of stuff to replace it, thereby increasing the
number of dependencies.

Any machine beefy enough to build the kernel is more than adequate to host perl
as well.  So maybe the "corner case" is situations where you're trying to build
the kernel on an overly-minimalist host--- perhaps one that you constructed
yourself using linux-from-scratch?

Not trying to fan the flames any, of course.  I'm just sayin'...

The worst for cross-building so far for me has been openssh.  And even that's
tolerable once you find your way around the autoconf stuff.  But this would be
the wrong list for that.  :)


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
