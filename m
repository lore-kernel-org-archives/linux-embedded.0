From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed,  2 Sep 2009 00:31:09 +0200
Message-ID: <1251844269-12394-8-git-send-email-mat@brain-dump.org>
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

The macro filters out printk messages based on a configurable verbosity
level (CONFIG_PRINTK_VERBOSITY).

Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
---
 include/linux/kernel.h |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index c2b3047..1f5d01f 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -242,6 +242,30 @@ asmlinkage int printk(const char * fmt, ...)
 asmlinkage int printk_unfiltered(const char *fmt, ...)
 	__attribute__ ((format (printf, 1, 2))) __cold;
 
+#if defined(CONFIG_PRINTK_VERBOSITY) && CONFIG_PRINTK_VERBOSITY > 0
+/*
+ * The idea here is to wrap the actual printk function with a macro which
+ * will filter out all messages above a certain verbosity level. Because
+ * the if condition evaluates to a constant expression the compiler will be
+ * able to eliminate it and the resulting kernel image will be smaller.
+ *
+ * The check with sizeof(void*) should make sure that we don't operate on
+ * pointers, which the compiler wouldn't be able to optimize out, but only
+ * on string constants.
+ */
+
+#include <linux/stringify.h>
+
+#define printk(fmt, ...) ({ 							 \
+	if (sizeof(fmt) == sizeof(void *) ||					 \
+	    (((const char *)(fmt))[0] != '<' && CONFIG_PRINTK_VERBOSITY >= 4) || \
+	    (((const char *)(fmt))[0] == '<' && 				 \
+	     ((const char *)(fmt))[1] <= *__stringify(CONFIG_PRINTK_VERBOSITY))) \
+		printk((fmt), ##__VA_ARGS__); 					 \
+})
+
+#endif /* CONFIG_PRINTK_VERBOSITY */
+
 extern struct ratelimit_state printk_ratelimit_state;
 extern int printk_ratelimit(void);
 extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
-- 
1.6.3.3
