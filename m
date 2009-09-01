From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [PATCH 3/7] printk: introduce printk_unfiltered as an alias to printk
Date: Wed,  2 Sep 2009 00:31:05 +0200
Message-ID: <1251844269-12394-4-git-send-email-mat@brain-dump.org>
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

The standard printk function will be wrapped by a macro.
However this doesn't work in all situations (for example
when the return value of printk is of interest). We
therefore provide a new function which is just an alias
to printk and therefore bypasses the macro.

Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
---
 include/linux/kernel.h |    5 +++++
 kernel/printk.c        |   24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index d6320a3..c2b3047 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -239,6 +239,8 @@ asmlinkage int vprintk(const char *fmt, va_list args)
 	__attribute__ ((format (printf, 1, 0)));
 asmlinkage int printk(const char * fmt, ...)
 	__attribute__ ((format (printf, 1, 2))) __cold;
+asmlinkage int printk_unfiltered(const char *fmt, ...)
+	__attribute__ ((format (printf, 1, 2))) __cold;
 
 extern struct ratelimit_state printk_ratelimit_state;
 extern int printk_ratelimit(void);
@@ -265,6 +267,9 @@ static inline int vprintk(const char *s, va_list args) { return 0; }
 static inline int printk(const char *s, ...)
 	__attribute__ ((format (printf, 1, 2)));
 static inline int __cold printk(const char *s, ...) { return 0; }
+static inline int printk_unfiltered(const char *s, ...)
+	__attribute__ ((format (printf, 1, 2)));
+static inline int __cold printk_unfiltered(const char *s, ...) { return 0; }
 static inline int printk_ratelimit(void) { return 0; }
 static inline bool printk_timed_ratelimit(unsigned long *caller_jiffies, \
 					  unsigned int interval_msec)	\
diff --git a/kernel/printk.c b/kernel/printk.c
index 5455d41..20379b5 100644
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -1310,6 +1310,11 @@ EXPORT_SYMBOL(printk_timed_ratelimit);
  *
  * This is printk().  It can be called from any context.  We want it to work.
  *
+ * Note that depending on the kernel configuration printk might be wrapped by
+ * a macro. In cases where it's important that the implementation is a function
+ * (for example when the return value of printk is of interest) printk_unfiltered
+ * which bypasses the macro should be used instead.
+ *
  * We try to grab the console_sem.  If we succeed, it's easy - we log the output and
  * call the console drivers.  If we fail to get the semaphore we place the output
  * into the log buffer and return.  The current holder of the console_sem will
@@ -1326,6 +1331,14 @@ EXPORT_SYMBOL(printk_timed_ratelimit);
  * See the vsnprintf() documentation for format string extensions over C99.
  */
 
+/*
+ * We need to #undef the printk macro from <linux/kernel.h> because
+ * it would otherwise conflict with the function implementation.
+ */
+#ifdef printk
+# undef printk
+#endif
+
 asmlinkage int printk(const char *fmt, ...)
 {
 	va_list args;
@@ -1338,4 +1351,15 @@ asmlinkage int printk(const char *fmt, ...)
 	return r;
 }
 EXPORT_SYMBOL(printk);
+ 
+/*
+ * Because printk might be wrapped by a macro which doesn't work in all
+ * circumstances (for example when the return value of printk is of
+ * interest) we make the functionality also available as a normal
+ * function.
+ */
+
+asmlinkage int printk_unfiltered(const char *fmt, ...)
+	__attribute__((alias("printk")));
+EXPORT_SYMBOL(printk_unfiltered);
 #endif
-- 
1.6.3.3
