From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sun, 4 Jan 2009 11:23:39 +0100
Message-ID: <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com>
References: <200901020207.30359.rob@landley.net>
	 <c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com>
	 <495FEEAF.5020005@zytor.com> <200901032006.47652.rob@landley.net>
	 <20090104030619.GA21466@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=22DZXhM/Uqi6Kk28mjdtCh1K7G9pJelDgG1grXlpnPc=;
        b=UlSpzLMX1t9ouha6aHzKSK9r94odM7+r3rjZgwZ3BRTMdkkJ3buOKw5aOluvGfsfh/
         GPODg43pI8eFyv6FDrvua7QmQtk8SaHZ8r/i4HBZJ7U9pJLfgBp/fMm4iITteL8v0njt
         lUfVXxQlwPh6rG3qLHN5c2MKjuCykPF2V2Cuc=
In-Reply-To: <20090104030619.GA21466@linux-sh.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>, Rob Landley <rob@landley.net>, "H. Peter Anvin" <hpa@zytor.com>, Leon Woestenberg <leon.woestenberg@gmail.com>, Embedded Linux mailing list <>

Hello,

On Sun, Jan 4, 2009 at 4:06 AM, Paul Mundt <lethal@linux-sh.org> wrote:
> Let's look at the rationale presented so far in this thread:
>
>        1 - Being able to build the kernel natively on a constrained
>        target is useful, regardless of whether it is being used for
>        regression/stress testing or for headers installation or whatever
>        else.
>
>        2 - Cross-compiling perl is hard.
>
>        3 - Some oddly constrained target distributions manage to ship
>        with an entire toolchain yet fail to provide any implementation
>        of perl.
>
>        4 - It wasn't required before.
>
> If there is anything I missed, feel free to add it to the list. It was
> difficult to extract even those 4 from the ranting.
>

2 is not hard.

5. Tool *version* dependency is hard to get right. When cross-building
30 software packages all requiring native perl, we probably need to
build a few versions of perl (native), one for each set of packages.



Regards,
-- 
Leon
