From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [PATCH 4/7] drivers: replace printk with printk_unfiltered
Date: Wed,  2 Sep 2009 00:31:06 +0200
Message-ID: <1251844269-12394-5-git-send-email-mat@brain-dump.org>
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

Use the unfiltered variant in cases where the return value
is of interest.

Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
---
 drivers/char/mem.c                 |    2 +-
 drivers/md/md.c                    |    2 +-
 drivers/scsi/aic7xxx/aic79xx_osm.h |    2 +-
 drivers/scsi/aic7xxx/aic7xxx_osm.h |    2 +-
 kernel/lockdep.c                   |    4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index afa8813..ba48b82 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -850,7 +850,7 @@ static ssize_t kmsg_write(struct file * file, const char __user * buf,
 	ret = -EFAULT;
 	if (!copy_from_user(tmp, buf, count)) {
 		tmp[count] = 0;
-		ret = printk("%s", tmp);
+		ret = printk_unfiltered("%s", tmp);
 		if (ret > count)
 			/* printk can add a prefix */
 			ret = count;
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 9dd8720..85c31bf 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -51,7 +51,7 @@
 #include "bitmap.h"
 
 #define DEBUG 0
-#define dprintk(x...) ((void)(DEBUG && printk(x)))
+#define dprintk(x...) ((void)(DEBUG && printk_unfiltered(x)))
 
 
 #ifndef MODULE
diff --git a/drivers/scsi/aic7xxx/aic79xx_osm.h b/drivers/scsi/aic7xxx/aic79xx_osm.h
index 55c1fe0..65a30c5 100644
--- a/drivers/scsi/aic7xxx/aic79xx_osm.h
+++ b/drivers/scsi/aic7xxx/aic79xx_osm.h
@@ -364,7 +364,7 @@ struct ahd_platform_data {
 };
 
 /************************** OS Utility Wrappers *******************************/
-#define printf printk
+#define printf printk_unfiltered
 #define M_NOWAIT GFP_ATOMIC
 #define M_WAITOK 0
 #define malloc(size, type, flags) kmalloc(size, flags)
diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.h b/drivers/scsi/aic7xxx/aic7xxx_osm.h
index 56f07e5..cf05c2b 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm.h
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm.h
@@ -369,7 +369,7 @@ struct ahc_platform_data {
 };
 
 /************************** OS Utility Wrappers *******************************/
-#define printf printk
+#define printf printk_unfiltered
 #define M_NOWAIT GFP_ATOMIC
 #define M_WAITOK 0
 #define malloc(size, type, flags) kmalloc(size, flags)
diff --git a/kernel/lockdep.c b/kernel/lockdep.c
index 8bbeef9..154756a 100644
--- a/kernel/lockdep.c
+++ b/kernel/lockdep.c
@@ -564,8 +564,8 @@ static void print_lock_class_header(struct lock_class *class, int depth)
 		if (class->usage_mask & (1 << bit)) {
 			int len = depth;
 
-			len += printk("%*s   %s", depth, "", usage_str[bit]);
-			len += printk(" at:\n");
+			len += printk_unfiltered("%*s   %s", depth, "", usage_str[bit]);
+			len += printk_unfiltered(" at:\n");
 			print_stack_trace(class->usage_traces + bit, len);
 		}
 	}
-- 
1.6.3.3
