From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH v4 6/6] Atmel MCI: Driver for Atmel on-chip MMC
 controllers
Date: Sat, 28 Jun 2008 14:47:59 +0200
Message-ID: <20080628144759.2d9c7311@hskinnemo-gx745.norway.atmel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-5-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-6-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-7-git-send-email-haavard.skinnemoen@atmel.com>
	<20080627211014.0e80db04@siona.local>
	<1214602273.12666.7.camel@dwillia2-linux.ch.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1214602273.12666.7.camel@dwillia2-linux.ch.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Williams <dan.j.williams@intel.com>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>, David Brownell <david-b@pacbell.net>

Dan Williams <dan.j.williams@intel.com> wrote:
> > This driver has been out of tree for way too long. I'm hoping we can
> > get it in before 2.6.27.  
> 
> I have high confidence that we can get the dma bits applied in time for
> 2.6.27.  You seem to have addressed my previous concerns and there has
> been more than ample time for others with similar dma configurations to
> comment on the dma-slave framework.  I just want some more time to give
> it an honest review.

Sorry, I didn't mean to put pressure on you -- I certainly want an
honest review. I meant it more as a sigh of relief that this
troublesome driver is finally making its way into mainline...and that I
can start working on preparing the other drivers that depend on the DMA
slave interface.

Haavard
