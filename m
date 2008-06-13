From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 17:06:36 +0200
Message-ID: <20080613150636.GI11760@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain> <200806121925.35883.rob@landley.net> <200806130855.19609.neundorf@eit.uni-kl.de>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806130855.19609.neundorf@eit.uni-kl.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:

> In general, cross compiling is not hard. You just have to call the cross 
> toolchain, give it the correct parameters, search files in the right location 
> and ... make sure you don't test stuff by running programs.

Same with carefully written makefiles ;-P

> Basically only the last one is problematic (but IMO still less problematic 
> than running a virtual system on the host just to build something).

Yes, and that should be completely prohibited.

> How does cmake support that for cross compiling ?
> If it detects a try_run() (which is the command for building a test executable 
> and then running it) in cross compiling mode (i.e. when it was told what the 
> target platform is instead of just assuming it's the same as the build host), 
> then it 
> -issues a warning
> -stores the created executable in a place so the developer can find it
> -running some existing executable and checking its output
> -creates a file where the developer can enter the results which running the 
> executable on the target host would have brought (includes comments where 
> that command was found, the arguments, etc.,). The developer can then run the 
> test executable manually on the target and enter the results. This seems to 
> be similar to the config.cache somebody mentioned for debian.

Yes, introducing the problems as with autoconf. You'll have to maintain one 
cachefile per package - there is *NO* standard on it's variables. And exactly 
that's the key problem !

Therefore unitool has an generic platform database, where such generic 
platform parameters can be set. These fields have to be standardized,
(adding new ones for some specific package is definitively the wrong way).

> So really the hard part is getting rid of running stuff to check the platform. 

Isnt that hard. In all these years I had no case where it couldn't be 
circumvented.


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
