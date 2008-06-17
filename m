From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Tue, 17 Jun 2008 15:57:53 +0200
Message-ID: <20080617135752.GF9141@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806121925.35883.rob@landley.net> <20080613145119.GF11760@nibiru.local> <200806160958.48157.neundorf@eit.uni-kl.de> <20080616160037.GD9141@nibiru.local> <20080616173839.GA19341@cs181133002.pp.htv.fi>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080616173839.GA19341@cs181133002.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Adrian Bunk <bunk@kernel.org> schrieb:

Hi,

> > I won't to that w/ my TreeBuild. It is intentionally limited on
> > easily structured packages. People should either structure their
> > packages properly use something else ;-P
> 
> For simple packages autoconf+automake+libtool is already near at your
> descriptive paragidm.

Yes, but mine is much simpler and syntactically stable. With autotools
there are uncountable things you can do wrong, without even noticing - 
it needs *very* much care. In TreeBuild there's almost no room for
those mistakes. A simple typo can lead autoconf to unpredictable 
behaviour - TreeBuild spits out an parse error.

So for these cases (which already make up a very large number of
total packages in the world), maintaining buildfiles becomes a lot
easier ;-P

> And despite all nasty details of autoconf/automake/libtool they also 
> have advantages:
> - they are quite powerful when you know how to handle them

The point is: you *must* know autotools very well, otherwise you
soon run into pitfalls.

> - they allow to build your software on non-Linux systems

TreeBuild does that too, as soon as someone wrote a proper config 
for another platform. The design is platform agnostic, just lacking
ports to other platforms, due lack of (my) time.

> - they are the de-facto standard in the open source world, and everyone
>   building open source software knows them

I don't think that this is a good argument. M$-Word is also an
"de facto" standard ;-P
 
> And the last point is a very important one:
> 
> For me as someone who is often compiling software your plan of creating 
> yet another build tool I have to handle does not sound like a good idea.

Yes, but that's not a problem of TreeBuild, but the total count of 
different build systems around the world. That's why a new buildsystem
should be an really good solution for an reasonable class of problems
and should be easy to learn. IMHO, TreeBuild does this - for simple
structed packages. (which make up about 99% of my own ones).

Of course, TreeBuild still in an early development stage. So I 
don't claim it's really usable for everyone - for now it's more
an academic issue.


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
