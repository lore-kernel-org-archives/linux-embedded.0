From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Mon, 16 Jun 2008 12:59:01 +0100
Message-ID: <1213617541.26255.705.camel@pmac.infradead.org>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806131106.18487.neundorf@eit.uni-kl.de>
	 <1213348320.26255.231.camel@pmac.infradead.org>
	 <200806131132.55543.neundorf@eit.uni-kl.de>
	 <20080613152854.GM11760@nibiru.local>
	 <20080614003102.GB30652@shareable.org>
	 <20080616042310.GH12962@nibiru.local>
	 <20080616104917.GA18857@shareable.org>
	 <1213614593.26255.691.camel@pmac.infradead.org>
	 <20080616115218.GF18857@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080616115218.GF18857@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Enrico Weigelt <weigelt@metux.de>, linux-embedded@vger.kernel.org

On Mon, 2008-06-16 at 12:52 +0100, Jamie Lokier wrote:
> E.g. Calls to pread should _not_ be implemented as lseek+read+lseek on
> old kernels which don't have pread.  That leads to race conditions and
> corruption in some applications.  (I think this has really occurred,
> but I'm unable to find it now).

Likewise pselect(). You're right -- it can't always be emulated.

-- 
dwmw2

