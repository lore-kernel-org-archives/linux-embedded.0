From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 01:12:41 +0200
Message-ID: <20080615231241.GA8899@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org> <48514D77.4060007@am.sony.com> <20080612183735.GE7423@nibiru.local> <20080613184555.GR13599@pengutronix.de>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613184555.GR13599@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

* Robert Schwebel <r.schwebel@pengutronix.de> schrieb:

Hi,

> Instead of hacking around and inventing new things, you should have
> spent your time for improving libtool ...

No, not with libtool. 
I do not want to support that insane approach of tweaking command
lines in the middle - it's an Pandorra's Box. I've already spent 
too much time on it and decided to completely drop it.

Instead I prefer *clean* lines.

Unitool provides commands on an higher level than, gcc+co do.
These commands are on an higher functional level, hiding the 
individual platform's details. Also including things like importing
.la-libs, sysroot, etc.

Lt-unitool is a wrapper which parses the libtool commands and calls 
Unitool to do the actual work.


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
