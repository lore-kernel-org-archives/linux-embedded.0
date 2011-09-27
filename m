From: =?ISO-8859-1?Q?H=E5vard_Skinnemoen?= <hskinnemoen@gmail.com>
Subject: Re: dma_unmap_single() lacking cache sync on some archs?
Date: Tue, 27 Sep 2011 09:55:02 -0700
Message-ID: <CAF8ieYUPcer2ZwaOi6YbiZQPeDBFukT2_dPStH10G_15Rh1fpw@mail.gmail.com>
References: <4E81BDEE.2080601@enea.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=vw5vS9epsGFVmSFy5tAfqvaDF3yeKyio0fN7Ib2L7x8=;
        b=kZWPvlWcRBdq+r33tj6/HrIBNrauFp0d+bVGuosaoGfCKehsJgZ8SEmrZdRRRXRYb1
         1zfB3wruQwBukVl8OzHj8fD7jl1g1GQtbd3LbTzk6UimJjixFmOOLLbRsX1PuYujmJSY
         ePtpUUOOv9G+/tiYDZeXL2v2X+Wj1CsFjKYcc=
In-Reply-To: <4E81BDEE.2080601@enea.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arvid Brodin <arvid.brodin@enea.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>, arnd@arndb.de

Hi,

On Tue, Sep 27, 2011 at 5:13 AM, Arvid Brodin <arvid.brodin@enea.com> wrote:
> [Resending with CC to affected parties]
>
> Hi,
>
> I would expect cache synchronization for DMA_TO_DEVICE and DMA_BIDIRECTIONAL
> when dma_map_single() is called, and for DMA_FROM_DEVICE and DMA_BIDIRECTIONAL
> when dma_unmap_single() is called.
>
> However, on some architechtures (at least avr32, blackfin, ...), cache
> synchronization only happens when dma_map_single() is called (and then
> irrespective of DMA direction). dma_unmap_single() is a no-op for these archs.
>
> See e.g. http://lxr.linux.no/#linux+v3.0.4/arch/avr32/include/asm/dma-mapping.h#L117
>
> Isn't this a bug?

I don't think so. What do other architectures do?

We always need to sync before the transfer because if there is dirty
data in the cache, it might get written to RAM during the transfer,
which would be bad. Then, since the relevant cache lines are already
clean and invalid, and the CPU is not allowed to access the buffer
during the transfer, there's no need to sync again when the transfer
is complete.

Havard
