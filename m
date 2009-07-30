From: Ohad Ben-Cohen <ohad@bencohen.org>
Subject: [PATCH] sdio: add CD disable support
Date: Thu, 30 Jul 2009 14:54:08 +0300
Message-ID: <1248954848.5396.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Philip Langdale <philipl@overt.org>, Matt Fleming <matt@console-pimps.org>, ian@mnementh.co.uk, pierre@ossman.eu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-l@jasper.es, Adrian Hunter <adrian.hunter@nokia.com>, Madhusudhan <madhu.cr@ti.com>

From: Ohad Ben-Cohen <ohad@wizery.com>

To save power, the pull-up resistor on CD/DAT[3] (pin 1)
of the card can be disconnected. This is desired, e.g.,
with embedded SDIO devices which do not rely on this pin
for card detection.

Signed-off-by: Ohad Ben-Cohen  <ohad@wizery.com>
---
 drivers/mmc/core/sdio.c  |   32 ++++++++++++++++++++++++++++++++
 include/linux/mmc/card.h |    3 ++-
 2 files changed, 34 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index fb99ccf..4c4c9a9 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -165,6 +165,31 @@ static int sdio_enable_wide(struct mmc_card *card)
 }
 
 /*
+ * Disconnect the pull-up resistor on CD/DAT[3] if requested by the card.
+ * If card detection is not needed, this can save some power.
+ */
+static int sdio_disable_cd(struct mmc_card *card)
+{
+	int ret;
+	u8 ctrl;
+
+	if (!card->cccr.disable_cd)
+		return 0;
+
+	ret = mmc_io_rw_direct(card, 0, 0, SDIO_CCCR_IF, 0, &ctrl);
+	if (ret)
+		return ret;
+
+	ctrl |= SDIO_BUS_CD_DISABLE;
+
+	ret = mmc_io_rw_direct(card, 1, 0, SDIO_CCCR_IF, ctrl, NULL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
  * Test if the card supports high-speed mode and, if so, switch to it.
  */
 static int sdio_enable_hs(struct mmc_card *card)
@@ -392,6 +417,13 @@ int mmc_attach_sdio(struct mmc_host *host, u32 ocr)
 		goto remove;
 
 	/*
+	 * Disconnect card detection pull-up resistor (if requested by card).
+	 */
+	err = sdio_disable_cd(card);
+	if (err)
+		goto remove;
+
+	/*
 	 * Initialize (but don't add) all present functions.
 	 */
 	for (i = 0;i < funcs;i++) {
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index 403aa50..82a8488 100644
--- a/include/linux/mmc/card.h
+++ b/include/linux/mmc/card.h
@@ -62,7 +62,8 @@ struct sdio_cccr {
 				low_speed:1,
 				wide_bus:1,
 				high_power:1,
-				high_speed:1;
+				high_speed:1,
+				disable_cd:1;
 };
 
 struct sdio_cis {
-- 
1.5.4.3


