From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 16:41:18 +0200
Message-ID: <20080613144118.GE11760@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <1213351433.17853.61.camel@tara.firmix.at> <20080613131753.GA19549@shareable.org> <200806131540.15558.neundorf@eit.uni-kl.de> <48527C96.4070404@parrot.com>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48527C96.4070404@parrot.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

* Matthieu CASTET <matthieu.castet@parrot.com> schrieb:

> >How does it do that compile-time numeric comparison ?
> >
> for example you could do
> 
> int test[my comparaison];
> 
> if my comparaison < 0, the compilation should abort.

Cool trick :)

So, eg if you find out wether some type has an specific size:

int foo[(sizeof(int) == 4)?1:-1];


But: the question is whether you'll need such a test at all
or if just using sizeof() at the right place won't do the trick ;-P
(yes, I've came around lots of packages where this was the case!)

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
