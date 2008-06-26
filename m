From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: [PATCH v4 2/6] dmaengine: Add dma_chan_is_in_use() function
Date: Thu, 26 Jun 2008 15:23:19 +0200
Message-ID: <1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
 <1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760123AbYFZNZp@vger.kernel.org>
In-Reply-To: <1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Pierre Ossman <drzeus-list@drzeus.cx>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>, Haavard Skinnemoen <haavard.skinnemoen@atmel.com>

This moves the code checking if a DMA channel is in use from
show_in_use() into an inline helper function, dma_is_in_use(). DMA
controllers can use this in order to give clients exclusive access to
channels (usually necessary when setting up slave DMA.)

I have to admit that I don't really understand the channel refcounting
logic at all... dma_chan_get() simply increments a per-cpu value. How
can we be sure that whatever CPU calls dma_chan_is_in_use() sees the
same value?

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
 drivers/dma/dmaengine.c   |   12 +-----------
 include/linux/dmaengine.h |   17 +++++++++++++++++
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index a57c337..ad8d811 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -105,17 +105,7 @@ static ssize_t show_bytes_transferred(struct device *dev, struct device_attribut
 static ssize_t show_in_use(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct dma_chan *chan = to_dma_chan(dev);
-	int in_use = 0;
-
-	if (unlikely(chan->slow_ref) &&
-		atomic_read(&chan->refcount.refcount) > 1)
-		in_use = 1;
-	else {
-		if (local_read(&(per_cpu_ptr(chan->local,
-			get_cpu())->refcount)) > 0)
-			in_use = 1;
-		put_cpu();
-	}
+	int in_use = dma_chan_is_in_use(chan);
 
 	return sprintf(buf, "%d\n", in_use);
 }
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index cffb95f..4b602d3 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -180,6 +180,23 @@ static inline void dma_chan_put(struct dma_chan *chan)
 	}
 }
 
+static inline bool dma_chan_is_in_use(struct dma_chan *chan)
+{
+	bool in_use = false;
+
+	if (unlikely(chan->slow_ref) &&
+		atomic_read(&chan->refcount.refcount) > 1)
+		in_use = true;
+	else {
+		if (local_read(&(per_cpu_ptr(chan->local,
+			get_cpu())->refcount)) > 0)
+			in_use = true;
+		put_cpu();
+	}
+
+	return in_use;
+}
+
 /*
  * typedef dma_event_callback - function pointer to a DMA event callback
  * For each channel added to the system this routine is called for each client.
-- 
1.5.5.4
