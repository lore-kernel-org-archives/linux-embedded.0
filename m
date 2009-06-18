From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH 2/2] Modify MMCI/PL180 to handle agressive clocking v3
Date: Thu, 18 Jun 2009 08:57:31 +0200
Message-ID: <1245308251-25313-1-git-send-email-linus.walleij@stericsson.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Ossman <pierre@ossman.eu>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>

This adds a few clk_enable()/clk_disable() calls to the MMCI
driver so as to handle an set_ios() request with clock
frequency set to 0 as an instruction to gate the block clock.
This also breaks out the clock setting code into its own
function to simplify the set_ios() function a bit.

Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
---
 drivers/mmc/host/mmci.c |   78 ++++++++++++++++++++++++++++++++++------------
 1 files changed, 57 insertions(+), 21 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 36875dc..d9f5c9a 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -37,8 +37,34 @@
 
 static unsigned int fmax = 515633;
 
+/*
+ * This must be called with host->lock held
+ */
+static void mmci_set_clkreg(struct mmci_host *host, unsigned int desired)
+{
+	u32 clk = 0;
+
+	if (desired) {
+		if (desired >= host->mclk) {
+			clk = MCI_CLK_BYPASS;
+			host->cclk = host->mclk;
+			DBG(host, "MMCI: bypass clock divider, cclk = %u Hz\n", host->cclk);
+		} else {
+			clk = host->mclk / (2 * desired) - 1;
+			if (clk >= 256)
+				clk = 255;
+			host->cclk = host->mclk / (2 * (clk + 1));
+			DBG(host, "MMCI: divide cclk to %u Hz (divide %u by %u)\n", host->cclk, host->mclk, clk);
+		}
+		if (host->hw_designer == 0x80)
+			clk |= MCI_FCEN; /* Bug fix in ST IP block */
+		clk |= MCI_CLK_ENABLE;
+	}
+	writel(clk, host->base + MMCICLOCK);
+}
+
 static void
-mmci_request_end(struct mmci_host *host, struct mmc_request *mrq)
+ mmci_request_end(struct mmci_host *host, struct mmc_request *mrq)
 {
 	writel(0, host->base + MMCICOMMAND);
 
@@ -418,22 +444,7 @@ static void mmci_request(struct mmc_host *mmc, struct mmc_request *mrq)
 static void mmci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct mmci_host *host = mmc_priv(mmc);
-	u32 clk = 0, pwr = 0;
-
-	if (ios->clock) {
-		if (ios->clock >= host->mclk) {
-			clk = MCI_CLK_BYPASS;
-			host->cclk = host->mclk;
-		} else {
-			clk = host->mclk / (2 * ios->clock) - 1;
-			if (clk >= 256)
-				clk = 255;
-			host->cclk = host->mclk / (2 * (clk + 1));
-		}
-		if (host->hw_designer == 0x80)
-			clk |= MCI_FCEN; /* Bug fix in ST IP block */
-		clk |= MCI_CLK_ENABLE;
-	}
+	u32 pwr = 0;
 
 	if (host->plat->translate_vdd)
 		pwr |= host->plat->translate_vdd(mmc_dev(mmc), ios->vdd);
@@ -464,12 +475,23 @@ static void mmci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		}
 	}
 
-	writel(clk, host->base + MMCICLOCK);
+	spin_lock(&host->lock);
+
+	if (ios->clock == 0) {
+		clk_disable(host->clk);
+	} else {
+		clk_enable(host->clk);
+		mmci_set_clkreg(host, ios->clock);
+	}
 
 	if (host->pwr != pwr) {
 		host->pwr = pwr;
+		clk_enable(host->clk);
 		writel(pwr, host->base + MMCIPOWER);
+		clk_disable(host->clk);
 	}
+
+	spin_unlock(&host->lock);
 }
 
 static const struct mmc_host_ops mmci_ops = {
@@ -615,6 +637,8 @@ static int __devinit mmci_probe(struct amba_device *dev, void *id)
 	host->timer.expires = jiffies + HZ;
 	add_timer(&host->timer);
 
+	/* The first IOS will turn the clock on again */
+	clk_disable(host->clk);
 	return 0;
 
  irq0_free:
@@ -646,17 +670,22 @@ static int __devexit mmci_remove(struct amba_device *dev)
 
 		mmc_remove_host(mmc);
 
+		/* framework may have gated the block clock */
+		clk_enable(host->clk);
+
 		writel(0, host->base + MMCIMASK0);
 		writel(0, host->base + MMCIMASK1);
 
 		writel(0, host->base + MMCICOMMAND);
 		writel(0, host->base + MMCIDATACTRL);
 
+		clk_disable(host->clk);
+
 		free_irq(dev->irq[0], host);
 		free_irq(dev->irq[1], host);
 
 		iounmap(host->base);
-		clk_disable(host->clk);
+
 		clk_put(host->clk);
 
 		mmc_free_host(mmc);
@@ -677,8 +706,11 @@ static int mmci_suspend(struct amba_device *dev, pm_message_t state)
 		struct mmci_host *host = mmc_priv(mmc);
 
 		ret = mmc_suspend_host(mmc, state);
-		if (ret == 0)
+		if (ret == 0) {
+			clk_enable(host->clk);
 			writel(0, host->base + MMCIMASK0);
+			clk_disable(host->clk);
+		}
 	}
 
 	return ret;
@@ -692,7 +724,11 @@ static int mmci_resume(struct amba_device *dev)
 	if (mmc) {
 		struct mmci_host *host = mmc_priv(mmc);
 
-		writel(MCI_IRQENABLE, host->base + MMCIMASK0);
+		if (ret == 0) {
+			clk_enable(host->clk);
+			writel(MCI_IRQENABLE, host->base + MMCIMASK0);
+			clk_disable(host->clk);
+		}
 
 		ret = mmc_resume_host(mmc);
 	}
-- 
1.6.2.1
