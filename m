From: "Dan Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 0/6] dmaengine/mmc: DMA slave interface and two new drivers
Date: Thu, 3 Jul 2008 18:06:27 -0700
Message-ID: <e9c3a7c20807031806u23304279p33ed3467ba0e5a7f@mail.gmail.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=kbrOsduusSgW2xTjUEbsTA/SdtbMqhPGyvvZ9+4n2yo=;
        b=nhNvaqKpRiA48bEmj978RQu6o5TbTzdbclVjqFjoxvWY8PtiKMfaQTtMP31lhG7Sve
         BZ0G4tX8xwsM0PyVhzmo8XZQEpvGM22JO89vXl2hi8MlQP1ZWyf+OfFBphUD24NTefBQ
         ZeA5Y9oP8G0tbvvsAQf9d6T3b/FMJl/upJvdE=
In-Reply-To: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>

On Thu, Jun 26, 2008 at 6:23 AM, Haavard Skinnemoen
<haavard.skinnemoen@atmel.com> wrote:
> First of all, I'm sorry it went so much time between v3 and v4 of this
> patchset. I was hoping to finish this stuff up before all kinds of
> other tasks started demanding my attention, but I didn't, so I had to
> put it on hold for a while. Let's try again...
>
> This patchset extends the DMA engine API to allow drivers to offer DMA
> to and from I/O registers with hardware handshaking, aka slave DMA.
> Such functionality is very common in DMA controllers integrated on SoC
> devices, and it's typically used to do DMA transfers to/from other
> on-SoC peripherals, but it can often do DMA transfers to/from
> externally connected devices as well (e.g. IDE hard drives).
>
> The main differences from v3 of this patchset are:
>  * A DMA descriptor can hold a whole scatterlist. This means that
>    clients using slave DMA can submit large requests in a single call
>    to the driver, and they only need to keep track of a single
>    descriptor.
>  * The dma_slave_descriptor struct is gone since clients no longer
>    need to keep track of multiple descriptors.
>  * The drivers perform better and are more stable.
>
> The dw_dmac driver depends on this patch:
>
>        http://lkml.org/lkml/2008/6/25/148
>
> and the atmel-mci driver depends on this series:
>
>        http://lkml.org/lkml/2008/6/26/158
>
> as well as all preceding patches in this series, of course.
>
> Comments are welcome, as usual! Shortlog and diffstat follow.
>
> Haavard Skinnemoen (6):
>      dmaengine: Add dma_client parameter to device_alloc_chan_resources

Applied.  I fixed it up for fsldma and mv_xor.

>      dmaengine: Add dma_chan_is_in_use() function

I applied the chan->client_count patch that we talked about.

>      dmaengine: Add slave DMA interface

There were some comments to the change log and other fixes, so I'll
wait for v5 of this patch.

>      dmaengine: Make DMA Engine menu visible for AVR32 users

Applied the "remove arch dependency in drivers/dma/Kconfig" instead.

>      dmaengine: Driver for the Synopsys DesignWare DMA controller
>      Atmel MCI: Driver for Atmel on-chip MMC controllers

I will wait for v5 on these as well for the chan->client_count fixups
and a response to the dma_unmap situation.

Thanks,
Dan
