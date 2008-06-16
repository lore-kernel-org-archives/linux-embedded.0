From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Mon, 16 Jun 2008 12:09:53 +0100
Message-ID: <1213614593.26255.691.camel@pmac.infradead.org>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806131106.18487.neundorf@eit.uni-kl.de>
	 <1213348320.26255.231.camel@pmac.infradead.org>
	 <200806131132.55543.neundorf@eit.uni-kl.de>
	 <20080613152854.GM11760@nibiru.local>
	 <20080614003102.GB30652@shareable.org>
	 <20080616042310.GH12962@nibiru.local>
	 <20080616104917.GA18857@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080616104917.GA18857@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Enrico Weigelt <weigelt@metux.de>, linux-embedded@vger.kernel.org

On Mon, 2008-06-16 at 11:49 +0100, Jamie Lokier wrote:
> But here's the thing: do you really want every package have code
> calling every different variation on a system call, at run time, until
> it finds one that works?

No. That functionality lives in libc, if you want it at all.

-- 
dwmw2

