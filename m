From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Thu, 8 Jan 2009 08:29:24 -0500
Message-ID: <8bd0f97a0901080529j6018d5e4j66d0409bd7093425@mail.gmail.com>
References: <200901020207.30359.rob@landley.net>
	 <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com>
	 <495FEEAF.5020005@zytor.com> <200901032006.47652.rob@landley.net>
	 <20090104030619.GA21466@linux-sh.org>
	 <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=JAEaT7lLsQs2Qdg9yaJm8pieR19GX7X1QQuZh+HSFQU=;
        b=ulZfEgHhTpx+51tlvq9XYxt/h4OaveJB3+diBc9tK2Ww+ysJaxG5C875kKcqwcWP1z
         BQCyjeR3M30loBmpots4F9/LAU4ftX5DCpyeQmMxyl4qGFszzVMVbN76IpIH3BiDivzI
         lnSDM3wytYtWM7IUCY/4ezyRF1x9Lq/J7U1Es=
In-Reply-To: <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Rob Landley <rob@landley.net>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On Sun, Jan 4, 2009 at 05:23, Leon Woestenberg wrote:
> On Sun, Jan 4, 2009 at 4:06 AM, Paul Mundt <lethal@linux-sh.org> wrote:
>> Let's look at the rationale presented so far in this thread:
>>
>>        2 - Cross-compiling perl is hard.
>
> 2 is not hard.

i dont know where you're getting this mythical version of perl, but
anything beyond micro-perl is a pita.  and micro-perl is practically
worthless.  maybe for kernel/
-mike
