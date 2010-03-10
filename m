From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH v2] char drivers: Ram oops/panic logger
Date: Wed, 10 Mar 2010 09:02:06 +0100
Message-ID: <2ea1731b1003100002w104633ffy1ae46ef3d245e5b5@mail.gmail.com>
References: <4B968834.3040609@gmail.com>
	 <21eaeb5a1003091808s2d7638cxd524952a7d84b378@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=sPLIcA5Ym2Hc5hAVZErlu6trZddX6c4IDvayyWH1QdM=;
        b=QHA6VLtlhIIi05Ul6G4tNdXBSvPrpnwjC1iOr3AKkCXaN0C27HSuxRZFUNS9FFauxy
         BSh9DmB66DY0fHFtSaLhu4LG+qlNa8qoeGpUmw5sl1byrHc+6a14+hzP8rj3ISq4cqgV
         OXm04qri1ywt6SvvVigk1Qm8aiwk7IvCMWATE=
In-Reply-To: <21eaeb5a1003091808s2d7638cxd524952a7d84b378@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuasa Yoichi <yuasa@linux-mips.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

2010/3/10 Yuasa Yoichi <yuasa@linux-mips.org>:
> Hi,
>
> 2010/3/10 Marco Stornelli <marco.stornelli@gmail.com>:
>> Ramoops, like mtdoops, can log oops/panic information but in RAM.
>
> What is different from mtdoops + mtd-ram?
>
> Yoichi
>

It can be used in a very easy way with persistent RAM for systems
without flash support. For this systems, with this driver, it's no
more needed add to the kernel the mtd subsystem with advantage in
footprint as I said in the description. In addition, you can save
flash space and store this information only in RAM. I think it's very
useful for embedded systems.

Marco
