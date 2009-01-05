From: "Ray Lee" <ray-lk@madrabbit.org>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sun, 4 Jan 2009 16:41:15 -0800
Message-ID: <2c0942db0901041641v5546a1e2med4ca18fe8d2510f@mail.gmail.com>
References: <200901020207.30359.rob@landley.net>
	 <200901020213.30658.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=NP2I6C5dDSQ8OPWqNYHNlqrVNA7Wai1BosJ7PBCBhqU=;
        b=EUur7wrGdJwhaY3gMxuQCKnH4GTZANNXmz6j8Sqe8hvyjd2RvUI6KMD83lnZIuKtCh
         KTYKQJfTM0rkfR2UfpyN+pvvkwpxf5hvbPST+0p9ZhzCts7qU6IIouQquecF8C6o1P3i
         G3PXCFGJTMjtSSrGBMKA1fuOg/JjnEGt0HqSs=
In-Reply-To: <200901020213.30658.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Fri, Jan 2, 2009 at 12:13 AM, Rob Landley <rob@landley.net> wrote:
> Replace kernel/timeconst.pl with kernel/timeconst.sh.  The new shell script
> is much simpler, about 1/4 the size, and runs on Red Hat 9 from 2003.
>
> Peter Anvin added this perl to 2.6.25.  Before that, the kernel had never
> required perl to build.

Nice work. As the computations can all be done in 64-bit precision
now, and there have been concerns expressed about some shells not
supporting 64 bit integers, is there any reason this can't be done
using long longs in C?

Other than ruining a good bike shed argument, anyway.
