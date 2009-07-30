From: Ohad Ben-Cohen <ohad@bencohen.org>
Subject: Re: [PATCH] sdio: add CD disable support
Date: Thu, 30 Jul 2009 18:55:14 +0300
Message-ID: <bd5b16740907300855y2ee0f76fv5886606fcee241b7@mail.gmail.com>
References: <1248954848.5396.6.camel@localhost> <20090730124543.GF3058@console-pimps.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090730124543.GF3058@console-pimps.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Fleming <matt@console-pimps.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Philip Langdale <philipl@overt.org>, ian@mnementh.co.uk, pierre@ossman.eu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-l@jasper.es, Adrian Hunter <adrian.hunter@nokia.com>, Madhusudhan <madhu.cr@ti.com>

On Thu, Jul 30, 2009 at 3:45 PM, Matt Fleming<matt@console-pimps.org> wrote:
> Do you have a follow-up patch to make use of this new functionality?

Well, sort of:

The patch sets disable_cd for TI wl1271 embedded wlan sdio device on a
ZOOM2 platform.

Since the patch is very board/device specific, we first route it via
internal maintainers, so it is not posted yet.

It's nothing fancy:

diff --git a/arch/arm/mach-omap2/mmc-twl4030.c
b/arch/arm/mach-omap2/mmc-twl4030.c
index 5b64bf1..caa8b16 100644
--- a/arch/arm/mach-omap2/mmc-twl4030.c
+++ b/arch/arm/mach-omap2/mmc-twl4030.c
@@ -81,6 +81,7 @@ static struct embedded_sdio_data omap_wifi_emb_data = {
 		.wide_bus       = 1,
 		.high_power     = 0,
 		.high_speed     = 0,
+		.disable_cd	= 1,
 	},
 	.funcs  = wifi_func_array,
 	.num_funcs = 2,
