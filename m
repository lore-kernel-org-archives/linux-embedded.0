From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH v4 4/6] dmaengine: Make DMA Engine menu visible for AVR32 users
Date: Fri, 27 Jun 2008 09:37:21 -0700
Message-ID: <200806270937.21850.david-b@pacbell.net>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com> <20080626164601.712bf048@hskinnemo-gx745.norway.atmel.com> <1214528379.32709.51.camel@dwillia2-linux.ch.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1214528379.32709.51.camel@dwillia2-linux.ch.intel.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Williams <dan.j.williams@intel.com>
Cc: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, Adrian Bunk <bunk@kernel.org>, Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>

On Thursday 26 June 2008, Dan Williams wrote:
> I agree with removing the arch dependency, and I do not think we
> necessarily need to add HAVE_DMA_ENGINE.

I think a HAVE_DMA_ENGINE would be better than what you're doing
below:  moving the arch dependency into the network code, and
adding this !HIGHMEM64G thing (which is really just a more subtle
arch dependency).

Note that HAS_DMA is very different from having DMA engine support...
one is a specific interface, the other is the generic mechanism with
any of its numerous (and often peripheral-specific) interfaces.


> Taking an example from libata 
> the SATA_FSL driver depends on FSL_SOC but the menuconfig for ATA does
> not.  We can use "depends on HAS_DMA" to make the menu disappear on
> archs that will never have a dmaegine.  So I propose the following:
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 6239c3d..e4dd006 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -4,13 +4,14 @@
>  
>  menuconfig DMADEVICES
>  	bool "DMA Engine support"
> -	depends on (PCI && X86) || ARCH_IOP32X || ARCH_IOP33X || ARCH_IOP13XX || PPC
> -	depends on !HIGHMEM64G
> +	depends on !HIGHMEM64G && HAS_DMA
>  	help
>  	  DMA engines can do asynchronous data transfers without
>  	  involving the host CPU.  Currently, this framework can be
>  	  used to offload memory copies in the network stack and
> -	  RAID operations in the MD driver.
> +	  RAID operations in the MD driver.  This menu only presents
> +	  DMA Device drivers supported by the configured arch, it may
> +	  be empty in some cases.
>  
>  if DMADEVICES
>  
> @@ -55,10 +56,12 @@ comment "DMA Clients"
>  config NET_DMA
>  	bool "Network: TCP receive copy offload"
>  	depends on DMA_ENGINE && NET
> +	default (INTEL_IOATDMA || FSL_DMA)
>  	help
>  	  This enables the use of DMA engines in the network stack to
>  	  offload receive copy-to-user operations, freeing CPU cycles.
> -	  Since this is the main user of the DMA engine, it should be enabled;
> -	  say Y here.
> +
> +	  Say Y here if you enabled INTEL_IOATDMA or FSL_DMA, otherwise
> +	  say N.
>  
>  endif
> 
> 
> 

