From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [PATCH 1/7] printk: introduce CONFIG_PRINTK_VERBOSITY
Date: Wed,  2 Sep 2009 00:31:03 +0200
Message-ID: <1251844269-12394-2-git-send-email-mat@brain-dump.org>
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

Introduce a config option which allows to selectively compile out
printk messages based on a specified verbosity level.

Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
---
 init/Kconfig |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 3f7e609..3618168 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -833,6 +833,34 @@ config PRINTK
 	  very difficult to diagnose system problems, saying N here is
 	  strongly discouraged.
 
+config PRINTK_VERBOSITY
+	int "Printk compile time verbosity"
+	depends on EMBEDDED && PRINTK
+	range 0 7
+	default 0
+	help
+
+	  Select the maximum printk verbosity level to be compiled into
+	  the kernel.
+
+ 	  Messages above the specified verbosity level are removed from
+ 	  the kernel at compile time. This reduces the kernel image size
+ 	  at the cost of a calmer kernel.
+
+ 	  Possible verbosity levels are:
+
+	   0  Disable this feature and compile all messages in.
+
+ 	   1  KERN_ALERT        /* action must be taken immediately  */
+ 	   2  KERN_CRIT         /* critical conditions               */
+ 	   3  KERN_ERR          /* error conditions                  */
+ 	   4  KERN_WARNING      /* warning conditions                */
+ 	   5  KERN_NOTICE       /* normal but significant condition  */
+ 	   6  KERN_INFO         /* informational                     */
+ 	   7  KERN_DEBUG        /* debug-level messages              */
+
+	  If unsure, just move on and leave this option alone.
+
 config BUG
 	bool "BUG() support" if EMBEDDED
 	default y
-- 
1.6.3.3
