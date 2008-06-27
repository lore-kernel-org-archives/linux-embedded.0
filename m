From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [PATCH v4 4/6] dmaengine: Make DMA Engine menu visible for
	AVR32 users
Date: Fri, 27 Jun 2008 21:29:00 +0300
Message-ID: <20080627182900.GC4306@cs181140183.pp.htv.fi>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com> <200806270937.21850.david-b@pacbell.net> <20080627174441.GB4306@cs181140183.pp.htv.fi> <200806271124.42783.david-b@pacbell.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806271124.42783.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <david-b@pacbell.net>
Cc: Dan Williams <dan.j.williams@intel.com>, Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>

On Fri, Jun 27, 2008 at 11:24:42AM -0700, David Brownell wrote:
> On Friday 27 June 2008, Adrian Bunk wrote:
> > The only effect of the HAVE_DMA_ENGINE would be to not show an empty 
> > kconfig menu.
> 
> Well, no.  It would also make the network layer memcpy "acceleration"
> option unavailable when there was no underlying engine ... similarly
> with other pointless "we don't have that subsystem here" options.
>...

This NET_DMA issue has already been fixed 11 months ago - in the same 
patch that added the arch dependency for the menu. [1]

NET_DMA now depends on DMA_ENGINE which gets select'ed by the device 
options. NET_DMA can therefore never be offered on architectures
without any DMA device.

cu
Adrian

[1] http://lkml.org/lkml/2007/7/26/15

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
