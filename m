From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: dmaengine skip unmap (was: Re: [PATCH v4 5/6] dmaengine: Driver
 for the Synopsys DesignWare DMA controller)
Date: Fri, 4 Jul 2008 16:47:34 +0200
Message-ID: <20080704164734.009ba54a@hskinnemo-gx745.norway.atmel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-5-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-6-git-send-email-haavard.skinnemoen@atmel.com>
	<1215132023.23470.15.camel@dwillia2-linux.ch.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1215132023.23470.15.camel@dwillia2-linux.ch.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Williams <dan.j.williams@intel.com>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>, David Brownell <david-b@pacbell.net>

Dan Williams <dan.j.williams@intel.com> wrote:
> The one thing that stands out is that this driver does not unmap the
> source or destination buffers (and I now notice that fsldma is not doing
> this either, hmm...).  Yes, it is a no-op on avr32, for now, but the
> dma-mapping-api assumes that dma_map is always paired with dma_unmap.  I
> remember we discussed this earlier and that discussion inspired the
> patch below.  The end result is that dw_dmac can try to automatically
> dma_unmap the buffers unless an intelligent client, like the mmc driver,
> has disabled unmap.
> 
> Thoughts?

Looks reasonable. I'll update the dw_dmac driver and post a new version
in a few moments.

Haavard
