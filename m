From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Fri, 13 Jun 2008 10:12:00 +0100
Message-ID: <1213348320.26255.231.camel@pmac.infradead.org>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806130843.05704.neundorf@eit.uni-kl.de>
	 <1213346316.17853.28.camel@tara.firmix.at>
	 <200806131106.18487.neundorf@eit.uni-kl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806131106.18487.neundorf@eit.uni-kl.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Neundorf <neundorf@eit.uni-kl.de>
Cc: linux-embedded@vger.kernel.org

On Fri, 2008-06-13 at 11:06 +0200, Alexander Neundorf wrote:
> > Why on earth does someone need this explicitly during the build?
> > If you have portable software, all of that should be hidden in the code
> > and use "sizeof(int)".
> 
> From the "developer of a buildsystem" POV: there will be users who will need 
> it. 

I think that epitomises what's wrong with autoconf. Sometimes, the best
thing to do is tell your users that they _don't_ need whatever it is
they're asking you for.

-- 
dwmw2

