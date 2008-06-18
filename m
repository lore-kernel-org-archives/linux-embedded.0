From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Recommendation for activating a deferred module init in the
	kernel
Date: Wed, 18 Jun 2008 11:41:57 +0100
Message-ID: <1213785717.26255.1192.camel@pmac.infradead.org>
References: <4858AF6D.7040808@codefidence.com>
	 <1213777222.26255.1161.camel@pmac.infradead.org>
	 <20080618085233.GP25911@cs181133002.pp.htv.fi>
	 <Pine.LNX.4.64.0806181056300.13297@vixen.sonytel.be>
	 <1213783190.26255.1188.camel@pmac.infradead.org>
	 <20080618103302.GA16139@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080618103302.GA16139@cs181133002.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@kernel.org>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Gilad Ben-Yossef <gilad@codefidence.com>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, 2008-06-18 at 13:33 +0300, Adrian Bunk wrote:
> But even after all optimizations CONFIG_MODULES=y will still cause a 
> significant additional cost [1] when thinking in the dimensions of 
> Tim's "the 30 or so Linux-tiny patches that I use get me about 110k of 
> reductions.  For me, this is about 5% of my kernel size" statement in 
> another thread.

Yes. If the system in question is currently being built without
CONFIG_MODULES, that's fairly much a no-go for my alternative
suggestion.

-- 
dwmw2

