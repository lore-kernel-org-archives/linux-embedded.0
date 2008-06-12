From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 20:34:21 +0200
Message-ID: <20080612183421.GD7423@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <20080612160845.GB9327@linux-sh.org> <48514E9A.3080901@billgatliff.com>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48514E9A.3080901@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Bill Gatliff <bgat@billgatliff.com> schrieb:

> If the build system derives from autoconf, then a hacked-up 
> config.cache (or equivalent command-line args) often solves 
> problems for me. 

Only if you're working on *one specific* target for a long time.
I, for example, have to support lots of different targets, so your
approach does not work for me. Ah, and it's not *solving* any problem,
just deferring it to some other day.


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
