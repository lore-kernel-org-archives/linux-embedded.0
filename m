From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
	translation
Date: Wed, 4 Jun 2008 20:34:32 +0200
Message-ID: <20080604183432.GC27768@mx.loc>
References: <48447615.5050806@am.sony.com> <20080604103353.GC27335@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=DRsTrDEnV3ewWsL1pDco5omfLNgy/hOkjRuSfgEJkE8=;
        b=EZA6Tu+Hf+7tE1IDkVOlUd464G6KDVFmSTG+9vSa1I8s07Rq/L01Dl24HdvEIblms3
         S1nE4uFTvCBVdTm7wrlEQxhRRudOqM277jBAEEx251xkmdjJK4KqC45AsltQr+E52PDy
         SC+yWxdIeoTuaw9Tlv9SBZRt3EBQNtss6nlO4=
Content-Disposition: inline
In-Reply-To: <20080604103353.GC27335@cs181133002.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <adrian.bunk@movial.fi>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, Jun 04, 2008 at 01:33:53PM +0300, Adrian Bunk wrote:

>My gut feeling is that the influence of this kind of linux-tiny patches 
>is hardly noticably compared to the overall code size development, but 
>if you have numbers that prove me wrong just point me to them and I'll 
>stand corrected.
>
>cu
>Adrian
>
>BTW: I'm not insisting on "between 2.6.16 and 2.6.26", that's just some
>     timeframe big enough for showing general trends.

Current kernels are too big, they tend to be about 1MB (ignoring lzma or
gz compression), a couple of years back an ide- and network-enabled
kernel with 8139too (or whatever -nic you use in qemu nowadays) was at
least 30% smaller.
