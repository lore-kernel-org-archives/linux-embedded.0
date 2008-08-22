From: Will Marone <wjmarone@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 15:09:09 -0700
Message-ID: <48AF3905.70304@gmail.com>
References: <48AD00C4.6060302@gmail.com> <Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=cCgwYALbCsMbgywjU8Vd5g5jxFai+1QywsY3JPxHYiM=;
        b=GauGMs37+TjhC1WYgcLsxU0M7v5lucNhEzOXFPeIe8aeh77DFCRFnXmQbtc2odA8pk
         +P/NacSioSu+7bIU2Hs6DOBbkDanwNz6L4R+KJWeBr5vCRcexnwJ0yhwj7Xqblep83NY
         x2fFfz/IrcAmW+IF2F6QK03j1k5ZDRXlE7QBA=
In-Reply-To: <Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Jared Hulbert <jaredeh@gmail.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>, tim.bird@AM.SONY.COM

Geert Uytterhoeven wrote:
> I gave AxFS a try on PS3 (ppc64, always use big-endian 64-bit for testing new
> code ;-).
> When mounting the image, I got the crash below:
>
> | attempt to access beyond end of device
> | loop0: rw=0, want=4920, limit=4912
> | Unable to handle kernel paging request for data at address 0x00000028
> | Faulting instruction address: 0xd000000000037988
> | Oops: Kernel access of bad area, sig: 11 [#1]
> | SMP NR_CPUS=2 PS3
>
> When mounting (also on PS3) an image created on ia32, I get a different crash:
>
> | axfs: wrong magic
>   ^^^^^^^^^^^^^^^^^
> | Unable to handle kernel paging request for data at address 0x000003a8
> | Faulting instruction address: 0xd0000000000355f0
> | Oops: Kernel access of bad area, sig: 11 [#1]
> | SMP NR_CPUS=2 PS
Geert,

Thanks for giving it a spin, especially on a platform as different from 
ours as the PS3.

Before I dig more into what happened, I was wondering if you could tell 
me a bit more
about your environment, particularly how you supplied the filesystem to 
the kernel and
your mount commandline (also, if you used a boot commandline, what it was.)

My first guess would be a ppc64 compiled UML session, but I'd like to be 
a bit more sure.


Will Marone
