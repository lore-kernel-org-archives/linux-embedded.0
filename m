From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 17:25:08 +0200
Message-ID: <20080613152507.GL11760@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806130843.05704.neundorf@eit.uni-kl.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:

> Well, IMO this makes it sound too easy.
> If you write portable software, you have to do platform checks.
> Basically they can be done by
> -checking for the existence of files
> -checking if something builds
> -checking the output of running something you just built

Some concerete examples where you really *need* that ?

> The last one is the problem for cross compiling.
> Example: detecting the size of ints
> 
> Easy way:
> 
> ...
> printf("%d\n", sizeof(long));
> ...

Why not directly using sizeof() in your code ?


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
