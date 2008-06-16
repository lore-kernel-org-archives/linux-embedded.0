From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 17:15:37 +0200
Message-ID: <20080616151536.GC9141@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <20080613222523.GA28805@shareable.org> <20080613231932.GW13599@pengutronix.de> <200806160955.12752.neundorf@eit.uni-kl.de>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806160955.12752.neundorf@eit.uni-kl.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:

> CMake has a cache, where the values of variables are stored, e.g. if an option 
> is enabled or not, or where a library has been found (e.g. 
> JPEG_LIBRARY=/usr/local/lib/libjpeg.so).
> The way to influence the behaviour of cmake is to change the value of these 
> variables, this can be done either via a GUI (curses based or with cmake 2.6 
> also a graphical one), or via the command line:
> $ cmake -D<name_of_variable>=<new_value> ...more options

Are these variables strictly specified or is all left to individual 
author's decision ?

> > autotools need only a shell and make
> 
> Yes, and requiring a shell is a lot, in the case you want to port 
> also to Windows.

hmm, why not just expecting an sane shell on the building system ?
(as you already have to expect a sane compiler)


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
