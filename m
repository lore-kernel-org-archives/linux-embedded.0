From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [PATCH 5/7] drivers: make macro independent of printk's return value
Date: Wed,  2 Sep 2009 00:31:07 +0200
Message-ID: <1251844269-12394-6-git-send-email-mat@brain-dump.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: mat@brain-dump.org

Because printk might be wrapped by a macro avoid constructs which
assume that the return value can be interpreted as a boolean value.

This doesn't work because the macro has no return value which
results in a compile error "void value not ignored as it ought to be".

Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
---
 drivers/md/raid5.c        |    2 +-
 drivers/net/e100.c        |    2 +-
 drivers/net/ixgb/ixgb.h   |    2 +-
 drivers/net/ixgbe/ixgbe.h |    2 +-
 include/net/sctp/sctp.h   |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index b8a2c5d..d0dac07 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -92,7 +92,7 @@
 #define __inline__
 #endif
 
-#define printk_rl(args...) ((void) (printk_ratelimit() && printk(args)))
+#define printk_rl(args...) ((void)(!printk_ratelimit() ?: printk(args)))
 
 /*
  * We maintain a biased count of active stripes in the bottom 16 bits of
diff --git a/drivers/net/e100.c b/drivers/net/e100.c
index 3a6735d..3598d49 100644
--- a/drivers/net/e100.c
+++ b/drivers/net/e100.c
@@ -199,7 +199,7 @@ MODULE_PARM_DESC(debug, "Debug level (0=none,...,16=all)");
 MODULE_PARM_DESC(eeprom_bad_csum_allow, "Allow bad eeprom checksums");
 MODULE_PARM_DESC(use_io, "Force use of i/o access mode");
 #define DPRINTK(nlevel, klevel, fmt, args...) \
-	(void)((NETIF_MSG_##nlevel & nic->msg_enable) && \
+	(void)(!(NETIF_MSG_##nlevel & nic->msg_enable) ?: \
 	printk(KERN_##klevel PFX "%s: %s: " fmt, nic->netdev->name, \
 		__func__ , ## args))
 
diff --git a/drivers/net/ixgb/ixgb.h b/drivers/net/ixgb/ixgb.h
index d85717e..5208677 100644
--- a/drivers/net/ixgb/ixgb.h
+++ b/drivers/net/ixgb/ixgb.h
@@ -83,7 +83,7 @@ struct ixgb_adapter;
 
 #define PFX "ixgb: "
 #define DPRINTK(nlevel, klevel, fmt, args...) \
-	(void)((NETIF_MSG_##nlevel & adapter->msg_enable) && \
+	(void)(!(NETIF_MSG_##nlevel & adapter->msg_enable) ?: \
 	printk(KERN_##klevel PFX "%s: %s: " fmt, adapter->netdev->name, \
 		__func__ , ## args))
 
diff --git a/drivers/net/ixgbe/ixgbe.h b/drivers/net/ixgbe/ixgbe.h
index 2c4dc82..eb67b31 100644
--- a/drivers/net/ixgbe/ixgbe.h
+++ b/drivers/net/ixgbe/ixgbe.h
@@ -46,7 +46,7 @@
 
 #define PFX "ixgbe: "
 #define DPRINTK(nlevel, klevel, fmt, args...) \
-	((void)((NETIF_MSG_##nlevel & adapter->msg_enable) && \
+	((void)(!(NETIF_MSG_##nlevel & adapter->msg_enable) ?: \
 	printk(KERN_##klevel PFX "%s: %s: " fmt, adapter->netdev->name, \
 		__func__ , ## args)))
 
diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
index d16a304..c13fcf9 100644
--- a/include/net/sctp/sctp.h
+++ b/include/net/sctp/sctp.h
@@ -276,7 +276,7 @@ struct sctp_mib {
 #if SCTP_DEBUG
 extern int sctp_debug_flag;
 #define SCTP_DEBUG_PRINTK(whatever...) \
-	((void) (sctp_debug_flag && printk(KERN_DEBUG whatever)))
+	((void) (!sctp_debug_flag ?: printk(KERN_DEBUG whatever)))
 #define SCTP_DEBUG_PRINTK_IPADDR(lead, trail, leadparm, saddr, otherparms...) \
 	if (sctp_debug_flag) { \
 		if (saddr->sa.sa_family == AF_INET6) { \
-- 
1.6.3.3
