From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 18:00:37 +0200
Message-ID: <20080616160037.GD9141@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806121925.35883.rob@landley.net> <20080613145119.GF11760@nibiru.local> <200806160958.48157.neundorf@eit.uni-kl.de>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806160958.48157.neundorf@eit.uni-kl.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:

> > That's why I prefer an purely descriptive paragidm (= subset of
> > delcarative, but practically no logic): a buildfile should only
> > describe the package's structure (eg.: "i have some executable foo
> > which consists of source [...] and imports libs [...]), so the
> > buildtool (and user's config) can cope with it all.
> 
> This was also the plan for cmake when it was started. But it turned 
> out that this is not enough, and for more complex projects some 
> programming logic is required. So cmake turned from quite declarative 
> to quite imperative over time.

And so you just open the Pandorra's Box again ;-o
As soon as you try to build some one-fits-all-solution, you'll
sooner or later run into similar problems as autoconf has.

I won't to that w/ my TreeBuild. It is intentionally limited on
easily structured packages. People should either structure their
packages properly use something else ;-P


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
