From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 06:23:11 +0200
Message-ID: <20080616042310.GH12962@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806131106.18487.neundorf@eit.uni-kl.de> <1213348320.26255.231.camel@pmac.infradead.org> <200806131132.55543.neundorf@eit.uni-kl.de> <20080613152854.GM11760@nibiru.local> <20080614003102.GB30652@shareable.org>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080614003102.GB30652@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

* Jamie Lokier <jamie@shareable.org> schrieb:

> > > E.g. in python there are tests which call functions and check 
> > > their result to see if we are currently on a platform where 
> > > that function is broken (I think there was such a test for 
> > > poll() and some other functions).
> > 
> > IMHO, that's broken sw engineering from ground up.
> 
> Oh?  The alternative I see is to do the test at run-time.  But that
> adds to executable size and run-time slowdown on most platforms.

There's no generic answer to this, we have to look at the details
carefully ;-P

Most times I've seen those checks, they silently enable some 
features, eg. if it looks for certain kernel devices. Definitively
the wrong way! It really should be in users/packagers control to
explicitly enable features. Nevertheless, the existence of some
file or device says nothing about whether it will be usable
(or *should* be used) at runtime. I've seen packages silently
enabling some feature and then failing at runtime since the 
previously detected device is missing later. What a nightamare 
for packagers.

Another point are broken syscalls. Well, you *have* check at runtime 
to be sure, or perhaps choose to ignore it and expect a sane system.

*If* you really want to do constraint checks, you should do it 
as an separate, optional step. Maybe issue a big-fat hint that 
one really should run that test (and follow certain instructions)
if he don't exactly know what he's doing.

> Doing it at build time is an improvement, for those people who don't
> care about cross-compilation.  (Not me, you understand.)

IMHO, it's just lazyness, at least for about 99% of the cases ;-P


cu
-- 
---------------------------------------------------------------------
 Enrico Weigelt    ==   metux IT service - http://www.metux.de/
---------------------------------------------------------------------
 Please visit the OpenSource QM Taskforce:
 	http://wiki.metux.de/public/OpenSource_QM_Taskforce
 Patches / Fixes for a lot dozens of packages in dozens of versions:
	http://patches.metux.de/
---------------------------------------------------------------------
