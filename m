From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH 1/2] MMC Agressive clocking framework v3
Date: Thu, 18 Jun 2009 08:57:00 +0200
Message-ID: <1245308220-25069-1-git-send-email-linus.walleij@stericsson.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Ossman <pierre@ossman.eu>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>

This patch modified the MMC core code to optionally call the
set_ios() operation on the driver with the clock frequency set
to 0 to gate the hardware block clock (and thus the MCI clock)
for an MMC host controller after a grace period of at least 8
MCLK cycles. It is inspired by existing clock gating code found
in the OMAP and Atmel drivers and brings this up to the host
abstraction. Gating is performed before and after any MMC
request.

It exemplifies by implementing this for the MMCI/PL180 MMC/SD
host controller, but it should be simple to switch OMAP and
Atmel over to using this instead.

Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
----
ChangeLog v2->v3:

* Swapped alloc*/remove* pair for init*/exit* in the clocking
  functions.

* Remove mmc_clk_enable/disable pair in the mmc_rescan(). It's
  not needed here.

* Rename struct member .clk_users to .clk_requests so as to
  reflect what this is actually counting. It counts the number
  of current requests that need to have the MCI clk enabled.

* Save and restore flags on all spinlocks, the code can be
  called in different contexts according to lockdep.

* Spelling mistakes fixed.
---
 drivers/mmc/core/Kconfig   |   11 +++
 drivers/mmc/core/core.c    |   35 +++++++++
 drivers/mmc/core/core.h    |    2 +
 drivers/mmc/core/debugfs.c |   10 ++-
 drivers/mmc/core/host.c    |  165 +++++++++++++++++++++++++++++++++++++++++++-
 drivers/mmc/core/host.h    |    3 +
 include/linux/mmc/host.h   |    9 +++
 7 files changed, 232 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/core/Kconfig b/drivers/mmc/core/Kconfig
index ab37a6d..6ae2156 100644
--- a/drivers/mmc/core/Kconfig
+++ b/drivers/mmc/core/Kconfig
@@ -14,3 +14,14 @@ config MMC_UNSAFE_RESUME
 	  This option is usually just for embedded systems which use
 	  a MMC/SD card for rootfs. Most people should say N here.
 
+config MMC_CLKGATE
+	bool "MMC host clock gaing (EXPERIMENTAL)"
+	depends on EXPERIMENTAL
+	help
+	  This will attempt to agressively gate the clock to the MMC host,
+	  which typically also will gate the MCI clock to the card. This
+	  is done to save power due to gating off the logic and bus noise
+	  when MMC is not in use. Your host driver has to support this in
+	  order for it to be of any use.
+
+	  Of unsure, say N.
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 2649117..e9093b6 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -113,6 +113,8 @@ void mmc_request_done(struct mmc_host *host, struct mmc_request *mrq)
 
 		if (mrq->done)
 			mrq->done(mrq);
+
+		mmc_clk_disable(host);
 	}
 }
 
@@ -173,6 +175,7 @@ mmc_start_request(struct mmc_host *host, struct mmc_request *mrq)
 			mrq->stop->mrq = mrq;
 		}
 	}
+	mmc_clk_enable(host);
 	host->ops->request(host, mrq);
 }
 
@@ -447,6 +450,38 @@ void mmc_set_clock(struct mmc_host *host, unsigned int hz)
 	mmc_set_ios(host);
 }
 
+#ifdef CONFIG_MMC_CLKGATE
+/*
+ * This gates the clock by setting it to 0 Hz.
+ */
+void mmc_gate_clock(struct mmc_host *host)
+{
+	host->clk_old = host->ios.clock;
+	host->ios.clock = 0;
+	mmc_set_ios(host);
+}
+
+/*
+ * This restores the clock from gating by using the cached
+ * clock value.
+ */
+void mmc_ungate_clock(struct mmc_host *host)
+{
+	/*
+	 * We should previously have gated the clock, so the clock
+	 * shall be 0 here!
+	 * The clock may however be 0 during intialization,
+	 * when some request operations are performed before setting
+	 * the frequency. When ungate is requested in that situation
+	 * we just ignore the call.
+	 */
+	if (host->clk_old) {
+		BUG_ON(host->ios.clock);
+		mmc_set_clock(host, host->clk_old);
+	}
+}
+#endif
+
 /*
  * Change the bus mode (open drain/push-pull) of a host.
  */
diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
index c819eff..ee27f81 100644
--- a/drivers/mmc/core/core.h
+++ b/drivers/mmc/core/core.h
@@ -27,6 +27,8 @@ void mmc_detach_bus(struct mmc_host *host);
 
 void mmc_set_chip_select(struct mmc_host *host, int mode);
 void mmc_set_clock(struct mmc_host *host, unsigned int hz);
+void mmc_gate_clock(struct mmc_host *host);
+void mmc_ungate_clock(struct mmc_host *host);
 void mmc_set_bus_mode(struct mmc_host *host, unsigned int mode);
 void mmc_set_bus_width(struct mmc_host *host, unsigned int width);
 u32 mmc_select_voltage(struct mmc_host *host, u32 ocr);
diff --git a/drivers/mmc/core/debugfs.c b/drivers/mmc/core/debugfs.c
index 610dbd1..1a969bd 100644
--- a/drivers/mmc/core/debugfs.c
+++ b/drivers/mmc/core/debugfs.c
@@ -149,11 +149,17 @@ void mmc_add_host_debugfs(struct mmc_host *host)
 	host->debugfs_root = root;
 
 	if (!debugfs_create_file("ios", S_IRUSR, root, host, &mmc_ios_fops))
-		goto err_ios;
+		goto err_remove_files;
+
+#ifdef CONFIG_MMC_CLKGATE
+	if (!debugfs_create_u32("clk_delay", (S_IRUSR | S_IWUSR),
+				root, &host->clk_delay))
+		goto err_remove_files;
+#endif
 
 	return;
 
-err_ios:
+err_remove_files:
 	debugfs_remove_recursive(root);
 	host->debugfs_root = NULL;
 err_root:
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 5e945e6..792bbfe 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -3,6 +3,7 @@
  *
  *  Copyright (C) 2003 Russell King, All Rights Reserved.
  *  Copyright (C) 2007-2008 Pierre Ossman
+ *  Copyright (C) 2009 Linus Walleij
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -48,6 +49,165 @@ void mmc_unregister_host_class(void)
 static DEFINE_IDR(mmc_host_idr);
 static DEFINE_SPINLOCK(mmc_host_lock);
 
+#ifdef CONFIG_MMC_CLKGATE
+
+/*
+ * Enabling clock gating will make the core call out to the host
+ * once up and once down when it performs a request or card operation
+ * intermingled in any fashion. The driver will see this through
+ * set_ios() operations with ios.clock field set to 0 to gate
+ * (disable) the block clock, and to the old frequency to enable
+ * it again.
+ */
+static void mmc_clk_disable_delayed(struct mmc_host *host)
+{
+	unsigned long tick_ns;
+	unsigned long freq = host->ios.clock;
+	unsigned long flags;
+	int users;
+
+	if (!freq) {
+		pr_err("%s: frequency set to 0 in disable function, "
+		       "this means the clock is already disabled.\n",
+		       mmc_hostname(host));
+		return;
+	}
+	/*
+	 * New requests may have appeared while we were scheduling,
+	 * then there is no reason to delay the check before
+	 * clk_disable().
+	 */
+	spin_lock_irqsave(&host->clk_lock, flags);
+	users = host->clk_requests;
+	/*
+	 * Delay 8 bus cycles (from MMC spec) before attempting
+	 * to disable the MMCI block clock. The reference count
+	 * may have gone up again after this delay due to
+	 * rescheduling!
+	 */
+	if (!users) {
+		spin_unlock_irqrestore(&host->clk_lock, flags);
+		tick_ns = (1000000000 + freq - 1) / freq;
+		ndelay(host->clk_delay * tick_ns);
+	} else {
+		/* New users appeared while waiting for this work */
+		host->clk_pending_gate = false;
+		spin_unlock_irqrestore(&host->clk_lock, flags);
+		return;
+	}
+	spin_lock_irqsave(&host->clk_lock, flags);
+	if (!host->clk_requests) {
+		spin_unlock_irqrestore(&host->clk_lock, flags);
+		/* this will set host->ios.clock to 0 */
+		mmc_gate_clock(host);
+		spin_lock_irqsave(&host->clk_lock, flags);
+#ifdef CONFIG_MMC_DEBUG
+		pr_debug("%s: disabled MCI clock\n",
+			 mmc_hostname(host));
+#endif
+	}
+	host->clk_pending_gate = false;
+	spin_unlock_irqrestore(&host->clk_lock, flags);
+}
+
+/*
+ * Internal work. Work to disable the clock at some later point.
+ */
+static void mmc_clk_disable_work(struct work_struct *work)
+{
+	struct mmc_host *host = container_of(work, struct mmc_host,
+					      clk_disable_work);
+
+	mmc_clk_disable_delayed(host);
+}
+
+/*
+ *	mmc_clk_enable - enable hardware MCI clock
+ *	@host: host with potential hardware clock to control
+ *
+ *	Increase clock reference count and enable clock if first user.
+ */
+void mmc_clk_enable(struct mmc_host *host)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&host->clk_lock, flags);
+	/* If a gate is pending the clock is still on */
+	if (!host->clk_requests &&
+	    !host->clk_pending_gate) {
+		spin_unlock_irqrestore(&host->clk_lock, flags);
+		mmc_ungate_clock(host);
+		spin_lock_irqsave(&host->clk_lock, flags);
+#ifdef CONFIG_MMC_DEBUG
+		pr_debug("%s: enabled MCI clock\n",
+			 mmc_hostname(host));
+#endif
+	}
+	host->clk_requests++;
+	spin_unlock_irqrestore(&host->clk_lock, flags);
+}
+
+/*
+ *	mmc_clk_disable - disable hardware MCI clock
+ *	@host: host with potential hardware clock to control
+ *
+ *	Decrease clock reference count and schedule disablement of clock.
+ */
+void mmc_clk_disable(struct mmc_host *host)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&host->clk_lock, flags);
+	host->clk_requests--;
+	if (!host->clk_requests) {
+		host->clk_pending_gate = true;
+		schedule_work(&host->clk_disable_work);
+	}
+	spin_unlock_irqrestore(&host->clk_lock, flags);
+}
+
+/*
+ *	mmc_clk_init - set up clock gating code
+ *	@host: host with potential hardware clock to control
+ */
+static inline void mmc_clk_init(struct mmc_host *host)
+{
+	host->clk_requests = 0;
+	host->clk_delay = 8; /* hold MCI clock in 8 cycles by default */
+	host->clk_pending_gate = false;
+	INIT_WORK(&host->clk_disable_work, mmc_clk_disable_work);
+	spin_lock_init(&host->clk_lock);
+}
+
+/*
+ *	mmc_clk_exit - shut down clock gating code
+ *	@host: host with potential hardware clock to control
+ */
+static inline void mmc_clk_exit(struct mmc_host *host)
+{
+	if (cancel_work_sync(&host->clk_disable_work))
+		mmc_clk_disable_delayed(host);
+	BUG_ON(host->clk_requests > 0);
+}
+
+#else
+inline void mmc_clk_enable(struct mmc_host *host)
+{
+}
+
+inline void mmc_clk_disable(struct mmc_host *host)
+{
+}
+
+static inline void mmc_clk_init(struct mmc_host *host)
+{
+}
+
+static inline void mmc_clk_exit(struct mmc_host *host)
+{
+}
+#endif
+
 /**
  *	mmc_alloc_host - initialise the per-host structure.
  *	@extra: sizeof private data structure
@@ -80,6 +240,8 @@ struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
 	host->class_dev.class = &mmc_host_class;
 	device_initialize(&host->class_dev);
 
+	mmc_clk_init(host);
+
 	spin_lock_init(&host->lock);
 	init_waitqueue_head(&host->wq);
 	INIT_DELAYED_WORK(&host->detect, mmc_rescan);
@@ -156,6 +318,8 @@ void mmc_remove_host(struct mmc_host *host)
 	device_del(&host->class_dev);
 
 	led_trigger_unregister_simple(host->led);
+
+	mmc_clk_exit(host);
 }
 
 EXPORT_SYMBOL(mmc_remove_host);
@@ -176,4 +340,3 @@ void mmc_free_host(struct mmc_host *host)
 }
 
 EXPORT_SYMBOL(mmc_free_host);
-
diff --git a/drivers/mmc/core/host.h b/drivers/mmc/core/host.h
index c2dc3d2..b36aef9 100644
--- a/drivers/mmc/core/host.h
+++ b/drivers/mmc/core/host.h
@@ -10,9 +10,12 @@
  */
 #ifndef _MMC_CORE_HOST_H
 #define _MMC_CORE_HOST_H
+#include <linux/mmc/host.h>
 
 int mmc_register_host_class(void);
 void mmc_unregister_host_class(void);
+void mmc_clk_enable(struct mmc_host *host);
+void mmc_clk_disable(struct mmc_host *host);
 
 #endif
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 3e7615e..13e9534 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -119,6 +119,15 @@ struct mmc_host {
 #define MMC_CAP_NEEDS_POLL	(1 << 5)	/* Needs polling for card-detection */
 #define MMC_CAP_8_BIT_DATA	(1 << 6)	/* Can the host do 8 bit transfers */
 
+#ifdef CONFIG_MMC_CLKGATE
+	int			clk_requests;	/* internal reference counter */
+	unsigned int		clk_delay;	/* number of MCI clk hold cycles */
+	bool			clk_pending_gate; /* pending clock gating */
+	struct work_struct	clk_disable_work; /* delayed clock disablement */
+	unsigned int		clk_old;	/* old clock value cache */
+	spinlock_t		clk_lock;	/* lock for clk fields */
+#endif
+	
 	/* host specific block data */
 	unsigned int		max_seg_size;	/* see blk_queue_max_segment_size */
 	unsigned short		max_hw_segs;	/* see blk_queue_max_hw_segments */
-- 
1.6.2.1
