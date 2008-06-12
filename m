From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded	Maintainer(s)...)
Date: Thu, 12 Jun 2008 20:37:35 +0200
Message-ID: <20080612183735.GE7423@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <48514D77.4060007@am.sony.com>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48514D77.4060007@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Tim Bird <tim.bird@am.sony.com> schrieb:

> If autoconf is the problem (and I think it is), then that's what
> should be fixed (see my original post).  

ACK. One of the first things I did was replacing libtool and
kicked off broken-by-design macros like AC_TRY_RUN. This solved
at >80% of the problems for me.

> At a minimum, it would be nice if it had more built-in detection 
> and warning of techniques that were dangerous for cross-compilation.

Meanwhile, autoconf warns on some broken macros like AC_TRY_RUN.


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
