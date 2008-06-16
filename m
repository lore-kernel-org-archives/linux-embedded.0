From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 06:31:36 +0200
Message-ID: <20080616043136.GA32139@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806122025.54791.rob@landley.net> <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com> <200806130830.52734.neundorf@eit.uni-kl.de> <20080613185157.GT13599@pengutronix.de>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613185157.GT13599@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

* Robert Schwebel <r.schwebel@pengutronix.de> schrieb:
> On Fri, Jun 13, 2008 at 08:30:52AM +0200, Alexander Neundorf wrote:
> > Battle of Wesnoth is currently converted to both Scons and CMake, and
> > in the end they will decide about the winner. (since Eric is good at
> > arguing I guess it will be scons).
> 
> The thing is that 'configure && make && make install' plus the usuall
> --enable-foo / --disable-foo / --with-bla=blub semantics is simply *the*
> standard way of configuring stuff for unix systems. You don't need fancy
> tools, you get cross compiling almost for free and unix people simply
> know how to use it.

ACK. The ./configure script's syntax is quite convenient and semi-standard.
So, IMHO, all packages which have such an configure stage should support
that syntax, even those who code those scripts manually.
Strange, but some projects insist in having their config scripts incompatible
with autoconf's, just to show that it wasn't produced by it ;-o

> Been there, seen that. I maintain > 500 packets in PTXdist and guess
> which ones make 90% of the problems. Hint: they are not related to
> autotools ...

Well, if you count in the improber uses of autoconf (AC_TRY_RUN, etc),
then: yes.


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
