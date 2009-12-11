From: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: Squashfs performance (3.3 vs 4.0 in mainline)
Date: Fri, 11 Dec 2009 11:55:27 +0000
Message-ID: <bffbecbb0912110355l3bdc225av7897f12c512a599a@mail.gmail.com>
References: <20091210150243.2ed788f4@marrow.netinsight.se>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=yUJNjFQrdHo7doVWA7mKdCmm4LstYdETFb2bOIGMSxM=;
        b=nhe71PAkiLiNq8SLli7JCmuTIqQxHoCHm5pXEZC775TPpJm56kszfvT5WdsiGDXaKD
         IXHg0KTuaJSC7l1BmWLi/+CCs+bpUHaNVf+cJlOS/nT9Cq6tw+TOTsZyaLZ7G71kUBQG
         zgKQYC8CTLSwM/r9NM04HYCD4FXe5WGDHX7o8=
In-Reply-To: <20091210150243.2ed788f4@marrow.netinsight.se>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, Phillip Lougher <phillip@lougher.demon.co.uk>

On Thu, Dec 10, 2009 at 2:02 PM, Simon Kagstrom
<simon.kagstrom@netinsight.net> wrote:

> Squashfs works well, but I've noted a performance regression compared
> to the out-of-tree squashfs 3.3 which we ran on 2.6.23. The new kernel
> is faster until the squashfs root filesystem is mounted, but after that
> it goes downhill. Especially mounting takes a lot more time with the
> new:
> (The first column is the time difference compared to last timestamp).
> Are there any general changes which could have caused this difference?
>

There's nothing which should have caused such a slow-down in Squashfs.
 Unfortunately, you're comparing Squashfs 3.3 on 2.6.23, with Squashfs
4.0 on 2.6.31, there's a huge amount of kernel differences between the
two.  Anything broken in your 2.6.31 kernel (caching, memory handling,
interrupts etc.) could be the underlying cause.

Personally, I would try and isolate the problem more before blaming
Squashfs.  A couple of things which you should try:

1. Try a different filesystem, i.e. cramfs or ext2, on both 2.6.23 and
2.6.31.  Do you get the same slowdown?  Preferable to use cramfs, as
this has similar compute intensive decompression overhead.

2. Enable tracing in Squashfs and send the output.  Squashfs 3.3/4.0
should behave the same way.  This will pinpoint such issues.

3. Do some compute intensive, and memory/IO intensive application
benchmarking, on both your 2.6.23 and 2.6.31 kernels.

4. Test Squashfs 3.3 in your 2.6.31 kernel.  Do you get the same
slowdown?  If the above tests still tend to show Squashfs 4.0 is the
issue, I'm prepared to produce a Squashfs 3.3 patch for 2.6.31 for
you.

>
> I've tried with various mksquashfs options, and -noI makes it somewhat
> faster (and larger), but not near the old version.
>

OK.  This shows less compression makes it go faster.  If you have a
slow CPU this is to be expected, and would happen with or without any
underlying problems somewhere.

Phillip
