From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Mon, 16 Jun 2008 18:43:11 +0200
Message-ID: <20080616164311.GB22089@mx.loc>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806131106.18487.neundorf@eit.uni-kl.de> <1213348320.26255.231.camel@pmac.infradead.org> <200806131132.55543.neundorf@eit.uni-kl.de> <20080613152854.GM11760@nibiru.local> <20080614003102.GB30652@shareable.org> <20080616042310.GH12962@nibiru.local> <20080616104917.GA18857@shareable.org> <1213614593.26255.691.camel@pmac.infradead.org> <20080616115218.GF18857@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=K3I9P3kyLTo9Aeooaxh68wwtwb2P8w4GDMOwZenIe9o=;
        b=BMnozT/On2ZF8zBwxy39lyeKPe9xZH+1e1OyChonb/DCt0afTzC9HixIuzy/JiUN/1
         mswgzdGaex5nvs74kopc8QANDYEwaVl/ZibouDUDHKWjHfIhqEzfcbDpNW/TLLBZrjLp
         x1ax6iBQGImFpLuDYDCcCNvcHBuv05MvbQBpY=
Content-Disposition: inline
In-Reply-To: <20080616115218.GF18857@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Enrico Weigelt <weigelt@metux.de>, linux-embedded@vger.kernel.org

On Mon, Jun 16, 2008 at 12:52:18PM +0100, Jamie Lokier wrote:

>The same applications are fine if pread returns ENOSYS and they know
>what they need to do with lseek and read.

Note that they (pread, etc.) would better not exist at all instead of
being stubbed out (this requirement was dropped, AFAICS). If there is no
prototype then you don't need AC_TRY_RUN(other_arch_pread_test) in the
first place. Of course this assumes that you don't want to make that
decision at runtime but compile time.
>
>The same is true of the rsync example, with utimes and utime.  It's
>wrong for libc to "emulate" utimes using utime on old kernels: they
>aren't the same.  So the application does it instead: the application
>has a policy that it's fine with the different functionality when
>utimes returns ENOSYS.

You usually do the opposite, emulate utimes with utime ;)
link_warning(utimes, "the use of LEGACY `utimes' is discouraged, use `utime'")
