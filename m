From: David Vrabel <david.vrabel@csr.com>
Subject: Re: [PATCH] sdio: add CD disable support
Date: Thu, 30 Jul 2009 13:54:41 +0100
Message-ID: <4A719811.4060904@csr.com>
References: <1248954848.5396.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1248954848.5396.6.camel@localhost>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ohad Ben-Cohen <ohad@bencohen.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Philip Langdale <philipl@overt.org>, Matt Fleming <matt@console-pimps.org>, ian@mnementh.co.uk, pierre@ossman.eu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-l@jasper.es, Adrian Hunter <adrian.hunter@nokia.com>, Madhusudhan <madhu.cr@ti.com>

Ohad Ben-Cohen wrote:
> From: Ohad Ben-Cohen <ohad@wizery.com>
> 
> To save power, the pull-up resistor on CD/DAT[3] (pin 1)
> of the card can be disconnected. This is desired, e.g.,
> with embedded SDIO devices which do not rely on this pin
> for card detection.

Platforms may rely on the card's pull-up and not fit/configure an
external one.  There may need to be a way for host controller drivers to
 say this and prevent the disabling of the card's DAT3 pull-up.

> Signed-off-by: Ohad Ben-Cohen  <ohad@wizery.com>
> ---
>  drivers/mmc/core/sdio.c  |   32 ++++++++++++++++++++++++++++++++
>  include/linux/mmc/card.h |    3 ++-
>  2 files changed, 34 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> index fb99ccf..4c4c9a9 100644
> --- a/drivers/mmc/core/sdio.c
> +++ b/drivers/mmc/core/sdio.c
> @@ -165,6 +165,31 @@ static int sdio_enable_wide(struct mmc_card *card)
>  }
>  
>  /*
> + * Disconnect the pull-up resistor on CD/DAT[3] if requested by the card.
> + * If card detection is not needed, this can save some power.
> + */

The first sentence of this comment doesn't make sense.  The decision to
disable the pull-up is for the controller driver to make, not that card.

David
-- 
David Vrabel, Senior Software Engineer, Drivers
CSR, Churchill House, Cambridge Business Park,  Tel: +44 (0)1223 692562
Cowley Road, Cambridge, CB4 0WZ                 http://www.csr.com/


'member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom'
