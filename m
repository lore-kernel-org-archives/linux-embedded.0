From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: [PATCH v4 4/6] dmaengine: Make DMA Engine menu visible for AVR32 users
Date: Thu, 26 Jun 2008 15:23:21 +0200
Message-ID: <1214486603-23655-5-git-send-email-haavard.skinnemoen@atmel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
 <1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
 <1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
 <1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Pierre Ossman <drzeus-list@drzeus.cx>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>, Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, Adrian Bunk <bunk@stusta.de>

This makes the DMA Engine menu visible on AVR32 by adding AVR32 to the
(growing) list of architectures DMADEVICES depends on. Though I'd prefer
to remove that whole "depends" line entirely...

The DMADEVICES menu used to be available for all architectures, but at
some point, we started building a huge dependency list with all the
architectures that might have support for this kind of hardware.

According to Dan Williams:

> Adrian had concerns about users enabling NET_DMA when the hardware
> capability is relatively rare.

which seems very strange as long as (PCI && X86) is enough to enable
this menu. In other words, the vast majority of users will see the menu
even though the hardware is rare.

Also, all DMA clients depend on DMA_ENGINE being set. This symbol is
selected by each DMA Engine driver, so users can't select a DMA client
without selecting a specific DMA Engine driver first.

So, while this patch solves my immediate problem of making DMA Engines
available on AVR32, I'd much rather remove the whole arch dependency
list because I think it's bogus. Comments?

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Adrian Bunk <bunk@stusta.de>
---
 drivers/dma/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 18f6ef3..2ac09be 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -4,7 +4,7 @@
 
 menuconfig DMADEVICES
 	bool "DMA Engine support"
-	depends on (PCI && X86) || ARCH_IOP32X || ARCH_IOP33X || ARCH_IOP13XX || PPC
+	depends on (PCI && X86) || ARCH_IOP32X || ARCH_IOP33X || ARCH_IOP13XX || PPC || AVR32
 	depends on !HIGHMEM64G
 	help
 	  DMA engines can do asynchronous data transfers without
-- 
1.5.5.4
