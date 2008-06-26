From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH v4 3/6] dmaengine: Add slave DMA interface
Date: Thu, 26 Jun 2008 15:32:12 +0200
Message-ID: <20080626153212.543be415@hskinnemo-gx745.norway.atmel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1764344AbYFZNci@vger.kernel.org>
In-Reply-To: <1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Williams <dan.j.williams@intel.com>, Pierre Ossman <drzeus-list@drzeus.cx>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>

Ok, I guess I didn't update all the patch descriptions properly...

Haavard Skinnemoen <haavard.skinnemoen@atmel.com> wrote:
> A new struct dma_slave_descriptor is added. This extends the standard
> dma_async_tx_descriptor with a few members that are needed for doing
> slave DMA from/to peripherals.

This isn't correct anymore, as the dma_slave_descriptor struct turned
out not to be needed after all.

> A new operation for creating such descriptors is added to struct
> dma_device.

This isn't entirely correct either -- regular dma_async_tx_descriptors
are created, but one such descriptor can represent a whole scatterlist.

I'll update the changelog for the next round...

Haavard
