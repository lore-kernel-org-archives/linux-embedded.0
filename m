From: Joe Perches <joe@perches.com>
Subject: [PATCH 3/7] include/linux/printk.h: Use and neaten no_printk
Date: Sun,  5 Dec 2010 21:44:17 -0800
Message-ID: <f732712d7709bc3563de78990bb565499f10626c.1291611192.git.joe@perches.com>
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

Move no_printk above first CONFIG_PRINTK block so it can be used
by printk_once.
Convert statement expression if (0) printk macros to no_printk.
Convert printk_once(x...) to more normally used (fmt, ...) fmt, ##__VA_ARGS__.
Standardize __attribute__ use.
Expand single line inline functions.
Remove space before pointer.

Signed-off-by: Joe Perches <joe@perches.com>
---
 include/linux/printk.h |   75 +++++++++++++++++++++++++++--------------------
 1 files changed, 43 insertions(+), 32 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index b6218d3..e3858f2 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -76,11 +76,27 @@ struct va_format {
  */
 #define HW_ERR		"[Hardware Error]: "
 
+/*
+ * Dummy printk for disabled debugging statements to use whilst maintaining
+ * gcc's format and side-effect checking.
+ */
+static inline __attribute__ ((format (printf, 1, 2)))
+int no_printk(const char *fmt, ...)
+{
+	return 0;
+}
+
+extern asmlinkage __attribute__ ((format (printf, 1, 2)))
+void early_printk(const char *fmt, ...);
+
+extern int printk_needs_cpu(int cpu);
+extern void printk_tick(void);
+
 #ifdef CONFIG_PRINTK
-asmlinkage int vprintk(const char *fmt, va_list args)
-	__attribute__ ((format (printf, 1, 0)));
-asmlinkage int printk(const char * fmt, ...)
-	__attribute__ ((format (printf, 1, 2))) __cold;
+asmlinkage __attribute__ ((format (printf, 1, 0)))
+int vprintk(const char *fmt, va_list args);
+asmlinkage __attribute__ ((format (printf, 1, 2))) __cold
+int printk(const char *fmt, ...);
 
 /*
  * Please don't use printk_ratelimit(), because it shares ratelimiting state
@@ -109,38 +125,34 @@ extern int dmesg_restrict;
 
 void log_buf_kexec_setup(void);
 #else
-static inline int vprintk(const char *s, va_list args)
-	__attribute__ ((format (printf, 1, 0)));
-static inline int vprintk(const char *s, va_list args) { return 0; }
-static inline int printk(const char *s, ...)
-	__attribute__ ((format (printf, 1, 2)));
-static inline int __cold printk(const char *s, ...) { return 0; }
-static inline int printk_ratelimit(void) { return 0; }
-static inline bool printk_timed_ratelimit(unsigned long *caller_jiffies, \
-					  unsigned int interval_msec)	\
-		{ return false; }
+static inline __attribute__ ((format (printf, 1, 0)))
+int vprintk(const char *s, va_list args)
+{
+	return 0;
+}
+static inline __attribute__ ((format (printf, 1, 2))) __cold
+int printk(const char *s, ...)
+{
+	return 0;
+}
+static inline int printk_ratelimit(void)
+{
+	return 0;
+}
+static inline bool printk_timed_ratelimit(unsigned long *caller_jiffies,
+					  unsigned int interval_msec)
+{
+	return false;
+}
 
 /* No effect, but we still get type checking even in the !PRINTK case: */
-#define printk_once(x...) printk(x)
+#define printk_once(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
 
 static inline void log_buf_kexec_setup(void)
 {
 }
 #endif
 
-/*
- * Dummy printk for disabled debugging statements to use whilst maintaining
- * gcc's format and side-effect checking.
- */
-static inline __attribute__ ((format (printf, 1, 2)))
-int no_printk(const char *s, ...) { return 0; }
-
-extern int printk_needs_cpu(int cpu);
-extern void printk_tick(void);
-
-extern void asmlinkage __attribute__((format(printf, 1, 2)))
-	early_printk(const char *fmt, ...);
-
 extern void dump_stack(void) __cold;
 
 enum {
@@ -185,7 +197,7 @@ extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
 	printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #else
 #define pr_devel(fmt, ...) \
-	({ if (0) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__); 0; })
+	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #endif
 
 /* If you are writing a driver, please use dev_dbg instead */
@@ -198,7 +210,7 @@ extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
 	dynamic_pr_debug(fmt, ##__VA_ARGS__)
 #else
 #define pr_debug(fmt, ...) \
-	({ if (0) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__); 0; })
+	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #endif
 
 /*
@@ -241,8 +253,7 @@ extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
 	printk_ratelimited(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #else
 #define pr_debug_ratelimited(fmt, ...) \
-	({ if (0) printk_ratelimited(KERN_DEBUG pr_fmt(fmt), \
-				     ##__VA_ARGS__); 0; })
+	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #endif
 
 #endif
-- 
1.7.3.2.245.g03276.dirty
