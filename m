From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 20:30:58 +0200
Message-ID: <20080612183057.GC7423@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <20080612160845.GB9327@linux-sh.org>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080612160845.GB9327@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Paul Mundt <lethal@linux-sh.org> schrieb:

> The other issue is that people that are working in this space tend to do
> very little beyond solving their immediate troubles. 

Sad but true :(

> Since perl was mentioned, it also makes a good example. Embedded distros 
> have been cross-compiling perl for pretty much the last decade, yet even 

Now I'm curious: where can I find a patch ?

Upstream's build scripts are really far from being cross'able.

> You can either try to fix the packages in question, convince the package
> developers to rip out the parts that cause trouble for your environment,
> fix your own build environment to meet the needs of the packages, or
> whine about it on a mailing list. Empirically we already know which one
> of those options is going to win out. ;-)

I, personally, prefer to *solve* problems instead of trying to work 
around somehow. In longer terms, this worked quite good for me.

Of course, fixing requires that you find out what's the problem
really is before ;-P


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
