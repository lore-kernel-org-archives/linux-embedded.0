From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 16:51:19 +0200
Message-ID: <20080613145119.GF11760@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com> <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain> <200806121925.35883.rob@landley.net>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806121925.35883.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Rob Landley <rob@landley.net> schrieb:

> Current compilers have a "build at once" mode where they suck the whole 
> project in and run the optimizer on it at once, resulting in noticeably 
> smaller and faster output at the expense of needing buckets of memory to hold 
> all the source code and intermediate structures in memory at once.  The main 
> roadblock to making use of this?  Ripping out the existing makefiles and 
> replacing them with a very small shell script that does something similar 
> to "gcc *.c".

Yep, that's a fundamental problem with make that it works only on an
per-file basis (which is fine for many projects, but sometimes not).

That's why I prefer an purely descriptive paragidm (= subset of 
delcarative, but practically no logic): a buildfile should only 
describe the package's structure (eg.: "i have some executable foo 
which consists of source [...] and imports libs [...]), so the 
buildtool (and user's config) can cope with it all.

TreeBuild works this way:	http://treebuild.metux.de/


BTW: does anyone known Plan9's mk ?

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
