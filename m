From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Tue, 17 Jun 2008 15:46:36 +0200
Message-ID: <20080617134635.GE9141@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806160955.12752.neundorf@eit.uni-kl.de> <20080616151536.GC9141@nibiru.local> <200806170827.09103.neundorf@eit.uni-kl.de>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806170827.09103.neundorf@eit.uni-kl.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:
> On Monday 16 June 2008 17:15:37 Enrico Weigelt wrote:
> > * Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:
> > > CMake has a cache, where the values of variables are stored, e.g. if an
> > > option is enabled or not, or where a library has been found (e.g.
> > > JPEG_LIBRARY=/usr/local/lib/libjpeg.so).
> > > The way to influence the behaviour of cmake is to change the value of
> > > these variables, this can be done either via a GUI (curses based or with
> > > cmake 2.6 also a graphical one), or via the command line:
> > > $ cmake -D<name_of_variable>=<new_value> ...more options
> >
> > Are these variables strictly specified or is all left to individual
> > author's decision ?
> 
> Authors decision.

Then you've got the same problem as w/ autoconf's config.status:
You have to tweak it for each individual package separately :(

My destiny is to have strictly standardized variables for all the
common things, so you can use an global per-target configuration 
for *all* packages ever coming.
That's what Unitool's system properties db is for.

> > hmm, why not just expecting an sane shell on the building system ?
> > (as you already have to expect a sane compiler)
> 
> Well, we could go so far to expect a "sane" operating system, but you can't 
> change it, there are "insane" people in the world ;-)

Many, many things can be done within in the toolchain, eg. fixes 
for broken libc's. For example, I've seen packages adding several 
missing functions for certain platforms - this should be the job
of the toolchain.


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
