From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Sat, 14 Jun 2008 01:31:02 +0100
Message-ID: <20080614003102.GB30652@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806131106.18487.neundorf@eit.uni-kl.de> <1213348320.26255.231.camel@pmac.infradead.org> <200806131132.55543.neundorf@eit.uni-kl.de> <20080613152854.GM11760@nibiru.local>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613152854.GM11760@nibiru.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrico Weigelt <weigelt@metux.de>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

Enrico Weigelt wrote:
> * Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:
> 
> > E.g. in python there are tests which call functions and check 
> > their result to see if we are currently on a platform where 
> > that function is broken (I think there was such a test for 
> > poll() and some other functions).
> 
> IMHO, that's broken sw engineering from ground up.

Oh?  The alternative I see is to do the test at run-time.  But that
adds to executable size and run-time slowdown on most platforms.

Doing it at build time is an improvement, for those people who don't
care about cross-compilation.  (Not me, you understand.)

-- Jamie
