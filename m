From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 17:19:43 +0200
Message-ID: <20080613151942.GK11760@nibiru.local>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com> <20080613092449.GO27937@knossos.aleph1.co.uk> <7b740b700806130500u17bf3adel3b2139e50d7b029f@mail.gmail.com> <0af6abe442d0b93a10a96b27153f04e9.squirrel@www.geekisp.com> <20080613144658.GA21071@shareable.org>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613144658.GA21071@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Jamie Lokier <jamie@shareable.org> schrieb:

> For some reason, that stopped a while ago, and you had to go to
> different places to get working basic tools.  And often, the place to
> go wasn't clear.  Different people advertised their "ARM toolchain",
> "m68k toolchain" etc.  and they were slightly different sets of
> patches on top of mainline tools.  Central authorities you might
> believe in existed, but they were always a few patches behind what you
> actually needed.

That's because many embedded build their toolchains completely on
their own, instead of just using an generic toolkit like ct.

> Contrast with kernel.org: everyone knows where to get a good working
> Linux kernel for the mainstream architectures, and the quality work
> tends to be quite good at reaching mainline there nowadays.

ACK. But you perhaps remember the discussions on LKML where some
folks wanted to stop this and leave all the QM works to individual
distros. I'm glad this plan was dropped.


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
