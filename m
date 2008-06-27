From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 6/6] Atmel MCI: Driver for Atmel on-chip MMC
	controllers
Date: Fri, 27 Jun 2008 14:31:13 -0700
Message-ID: <1214602273.12666.7.camel@dwillia2-linux.ch.intel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-5-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-6-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-7-git-send-email-haavard.skinnemoen@atmel.com>
	 <20080627211014.0e80db04@siona.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080627211014.0e80db04@siona.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>, David Brownell <david-b@pacbell.net>


On Fri, 2008-06-27 at 12:10 -0700, Haavard Skinnemoen wrote:
> On Thu, 26 Jun 2008 15:23:23 +0200
> Haavard Skinnemoen <haavard.skinnemoen@atmel.com> wrote:
> 
> > This driver can also use PIO transfers when no DMA channels are
> > available, and for transfers where using DMA may be difficult or
> > impractical for some reason (e.g. the DMA setup overhead is usually
> > not worth it for very short transfers, and badly aligned buffers or
> > lengths are difficult to handle.)
> 
> Btw, it's probably not that hard to rip the DMA bits out and post them
> as a separate patch. This would mean that:
>   * Pierre can merge the driver independently of the other 5 patches
>   * A separate patch adding DMA support would make it clearer how the
>     DMA slave interface is used.
>   * The chances of having MMC support out of the box on avr32 boards
> in
>     2.6.27 become greater, and many people have been asking about that
>     (including Pierre and David.)

> The driver is surprisingly fast with DMA turned off (2-3 MiB/s), but
> the CPU usage is of course horrible.
> 
> If that sounds like a good plan to you, I'll split the driver
> tomorrow.
> 
> This driver has been out of tree for way too long. I'm hoping we can
> get it in before 2.6.27.

I have high confidence that we can get the dma bits applied in time for
2.6.27.  You seem to have addressed my previous concerns and there has
been more than ample time for others with similar dma configurations to
comment on the dma-slave framework.  I just want some more time to give
it an honest review.

Regards,
Dan

