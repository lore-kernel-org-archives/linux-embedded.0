From: Joe Perches <joe@perches.com>
Subject: [PATCH 4/7] include/linux/printk.h: Add pr_<level>_once macros
Date: Sun,  5 Dec 2010 21:44:18 -0800
Message-ID: <44c658626c01f8005b43a663f03513d8bab7c7b4.1291611192.git.joe@perches.com>
References: <cover.1291611190.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1291611190.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Move printk_once definitions and add an #ifdef CONFIG_PRINTK
Add pr_<level>_once so printks can use pr_fmt

Signed-off-by: Joe Perches <joe@perches.com>
---
 include/linux/printk.h |   59 +++++++++++++++++++++++++++++++++++------------
 1 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index e3858f2..8a9a2ee 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -111,18 +111,6 @@ extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 extern int printk_delay_msec;
 extern int dmesg_restrict;
 
-/*
- * Print a one-time message (analogous to WARN_ONCE() et al):
- */
-#define printk_once(x...) ({			\
-	static bool __print_once;		\
-						\
-	if (!__print_once) {			\
-		__print_once = true;		\
-		printk(x);			\
-	}					\
-})
-
 void log_buf_kexec_setup(void);
 #else
 static inline __attribute__ ((format (printf, 1, 0)))
@@ -145,9 +133,6 @@ static inline bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 	return false;
 }
 
-/* No effect, but we still get type checking even in the !PRINTK case: */
-#define printk_once(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
-
 static inline void log_buf_kexec_setup(void)
 {
 }
@@ -214,6 +199,50 @@ extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
 #endif
 
 /*
+ * Print a one-time message (analogous to WARN_ONCE() et al):
+ */
+
+#ifdef CONFIG_PRINTK
+#define printk_once(fmt, ...)			\
+({						\
+	static bool __print_once;		\
+						\
+	if (!__print_once) {			\
+		__print_once = true;		\
+		printk(fmt, ##__VA_ARGS__);	\
+	}					\
+})
+#else
+#define printk_once(fmt, ...)			\
+	no_printk(fmt, ##__VA_ARGS__)
+#endif
+
+#define pr_emerg_once(fmt, ...)					\
+	printk_once(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_alert_once(fmt, ...)					\
+	printk_once(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_crit_once(fmt, ...)					\
+	printk_once(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_err_once(fmt, ...)					\
+	printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_warn_once(fmt, ...)					\
+	printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_notice_once(fmt, ...)				\
+	printk_once(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_info_once(fmt, ...)					\
+	printk_once(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
+#define pr_cont_once(fmt, ...)					\
+	printk_once(KERN_CONT pr_fmt(fmt), ##__VA_ARGS__)
+/* If you are writing a driver, please use dev_dbg instead */
+#if defined(DEBUG)
+#define pr_debug_once(fmt, ...)					\
+	printk_once(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#else
+#define pr_debug_once(fmt, ...)					\
+	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#endif
+
+/*
  * ratelimited messages with local ratelimit_state,
  * no local ratelimit_state used in the !PRINTK case
  */
-- 
1.7.3.2.245.g03276.dirty
