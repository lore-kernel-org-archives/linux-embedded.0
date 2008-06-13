From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Fri, 13 Jun 2008 16:26:33 +0200
Message-ID: <20080613142632.GC11760@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <20080612182529.GB7423@nibiru.local> <485190E8.80705@cisco.com> <48519837.1090902@katalix.com> <8bd0f97a0806121446i68af3b96sbe51cc510f7d4fb6@mail.gmail.com> <20080612220246.GB27513@sovereign.org>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080612220246.GB27513@sovereign.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Jim Freeman <jfree@sovereign.org> schrieb:

> And I'm just betting that when he said "push ... fixes ... out"
> he meant "work to get them incorporated back upstream", not just
> make them available to requesters.

Exactly.
That's the essence of opensource development: 
Working together, instead of just taking someone else's work.

BTW: everyone here should know that maintaining own branches
(this actually happens if you have your own patches not fed
back to upstream) is an quite work intensive and sometimes
complex task. I doubt anyone here's really eager on doing that ;-P

I understand that not everyone can talk with every project's 
upstream. Simply too much load. And not every project wants to
merge in your patches asap (think of how long it took until
expat team took in my really trivial $DESTDIR patch ;-o).

That's why I founded the OSS-QM project: it a kind of "overlay"
which provides fixes for a lot of packages in a strictly normalized
namespace (so 100% automatic applying is easy).

http://oss-qm.metux.de/

So, eg. if you've made some local changes, please at least feed 
them to us :)


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
