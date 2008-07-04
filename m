From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH v4 0/6] dmaengine/mmc: DMA slave interface and two new
 drivers
Date: Fri, 4 Jul 2008 17:13:23 +0200
Message-ID: <20080704171323.14fe6daa@hskinnemo-gx745.norway.atmel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	<e9c3a7c20807031806u23304279p33ed3467ba0e5a7f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <e9c3a7c20807031806u23304279p33ed3467ba0e5a7f@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Williams <dan.j.williams@intel.com>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>

"Dan Williams" <dan.j.williams@intel.com> wrote:
> On Thu, Jun 26, 2008 at 6:23 AM, Haavard Skinnemoen
> <haavard.skinnemoen@atmel.com> wrote:
> >      dmaengine: Add dma_client parameter to device_alloc_chan_resources
> 
> Applied.  I fixed it up for fsldma and mv_xor.

Thanks.

> >      dmaengine: Add dma_chan_is_in_use() function
> 
> I applied the chan->client_count patch that we talked about.

Ok, I've updated the dw_dmac driver.

> >      dmaengine: Add slave DMA interface
> 
> There were some comments to the change log and other fixes, so I'll
> wait for v5 of this patch.

Will post v5 right after I finish typing this.

> >      dmaengine: Make DMA Engine menu visible for AVR32 users
> 
> Applied the "remove arch dependency in drivers/dma/Kconfig" instead.

Ok.

> >      dmaengine: Driver for the Synopsys DesignWare DMA controller
> >      Atmel MCI: Driver for Atmel on-chip MMC controllers
> 
> I will wait for v5 on these as well for the chan->client_count fixups
> and a response to the dma_unmap situation.

I'll send you v5 of the dw_dmac driver. The MMC driver should go in via
Pierre.

Thanks,

Haavard
