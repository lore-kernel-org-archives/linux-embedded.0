From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 16:55:34 +0200
Message-ID: <20080613145534.GH11760@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de> <1213346316.17853.28.camel@tara.firmix.at> <200806131106.18487.neundorf@eit.uni-kl.de> <1213351433.17853.61.camel@tara.firmix.at> <20080613131753.GA19549@shareable.org>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613131753.GA19549@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Jamie Lokier <jamie@shareable.org> schrieb:

> Relying on 'nm 'finding the variable, and not accidentally matching
> another variable with the wrong value, does not work for all C
> environments.  E.g. some compile to compressed executables; some
> produce intermediate objects with incomplete or lazy compiles or
> symbolic, to be finished at link stage, and some are even more
> abstract.

ACK. And also think of preprocessor symbols (see glibc ;-P)
IIRC perl's buildsystem goes this way and so tends to fail.


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
