From: Matt Fleming <matt@console-pimps.org>
Subject: Re: [PATCH] sdio: add CD disable support
Date: Thu, 30 Jul 2009 13:45:43 +0100
Message-ID: <20090730124543.GF3058@console-pimps.org>
References: <1248954848.5396.6.camel@localhost>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1248954848.5396.6.camel@localhost>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@bencohen.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Philip Langdale <philipl@overt.org>, ian@mnementh.co.uk, pierre@ossman.eu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-l@jasper.es, Adrian Hunter <adrian.hunter@nokia.com>, Madhusudhan <madhu.cr@ti.com>

On Thu, Jul 30, 2009 at 02:54:08PM +0300, Ohad Ben-Cohen wrote:
> From: Ohad Ben-Cohen <ohad@wizery.com>
> 
> To save power, the pull-up resistor on CD/DAT[3] (pin 1)
> of the card can be disconnected. This is desired, e.g.,
> with embedded SDIO devices which do not rely on this pin
> for card detection.
> 
> Signed-off-by: Ohad Ben-Cohen  <ohad@wizery.com>
> ---
>  drivers/mmc/core/sdio.c  |   32 ++++++++++++++++++++++++++++++++
>  include/linux/mmc/card.h |    3 ++-
>  2 files changed, 34 insertions(+), 1 deletions(-)
> 

Do you have a follow-up patch to make use of this new functionality? I
can't see anywhere where disable_cd is set.

