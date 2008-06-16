From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 16:33:15 +0200
Message-ID: <20080616143315.GB9141@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de> <1213346316.17853.28.camel@tara.firmix.at> <200806131106.18487.neundorf@eit.uni-kl.de> <1213351433.17853.61.camel@tara.firmix.at> <20080613151634.GJ11760@nibiru.local> <1213382709.17853.79.camel@tara.firmix.at> <20080616040854.GG12962@nibiru.local> <87zlplj0ot.fsf@macbook.be.48ers.dk>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87zlplj0ot.fsf@macbook.be.48ers.dk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Peter Korsgaard <jacmet@sunsite.dk> schrieb:

Hi,

> Notice that sysroot is broken in 0.23 (it removes everything else than
> -I / -L words). Patches have been posted to the pkgconfig list several
> times.

ugh, why didn't they just apply my patch which only appends 
$sysroot to the pathes ?  .... grmpf ...

well, i'll stick w/ my 5-lines wrapper script ;-o

>  Enrico> Yep, it doesn't take $SYSROOT (as my original patch did), but with 
>  Enrico> some prefix ...
> 
> PKG_CONFIG_SYSROOT_DIR

ack.

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
