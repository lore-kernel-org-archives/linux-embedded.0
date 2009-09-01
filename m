From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [PATCH 2/7] printk: move printk to the end of the file
Date: Wed,  2 Sep 2009 00:31:04 +0200
Message-ID: <1251844269-12394-3-git-send-email-mat@brain-dump.org>
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

A later patch will #undef printk because the macro would otherwise
conflict with the function definition. Moving the printk function
to the end of the file makes sure that the macro is expanded within
the rest of the file.

Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
---
 kernel/printk.c |   72 ++++++++++++++++++++++++++++--------------------------
 1 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/kernel/printk.c b/kernel/printk.c
index b4d97b5..5455d41 100644
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -551,40 +551,6 @@ static int have_callable_console(void)
 	return 0;
 }
 
-/**
- * printk - print a kernel message
- * @fmt: format string
- *
- * This is printk().  It can be called from any context.  We want it to work.
- *
- * We try to grab the console_sem.  If we succeed, it's easy - we log the output and
- * call the console drivers.  If we fail to get the semaphore we place the output
- * into the log buffer and return.  The current holder of the console_sem will
- * notice the new output in release_console_sem() and will send it to the
- * consoles before releasing the semaphore.
- *
- * One effect of this deferred printing is that code which calls printk() and
- * then changes console_loglevel may break. This is because console_loglevel
- * is inspected when the actual printing occurs.
- *
- * See also:
- * printf(3)
- *
- * See the vsnprintf() documentation for format string extensions over C99.
- */
-
-asmlinkage int printk(const char *fmt, ...)
-{
-	va_list args;
-	int r;
-
-	va_start(args, fmt);
-	r = vprintk(fmt, args);
-	va_end(args);
-
-	return r;
-}
-
 /* cpu currently holding logbuf_lock */
 static volatile unsigned int printk_cpu = UINT_MAX;
 
@@ -770,7 +736,6 @@ out_restore_irqs:
 	preempt_enable();
 	return printed_len;
 }
-EXPORT_SYMBOL(printk);
 EXPORT_SYMBOL(vprintk);
 
 #else
@@ -1337,3 +1302,40 @@ bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 }
 EXPORT_SYMBOL(printk_timed_ratelimit);
 #endif
+
+#ifdef CONFIG_PRINTK
+/**
+ * printk - print a kernel message
+ * @fmt: format string
+ *
+ * This is printk().  It can be called from any context.  We want it to work.
+ *
+ * We try to grab the console_sem.  If we succeed, it's easy - we log the output and
+ * call the console drivers.  If we fail to get the semaphore we place the output
+ * into the log buffer and return.  The current holder of the console_sem will
+ * notice the new output in release_console_sem() and will send it to the
+ * consoles before releasing the semaphore.
+ *
+ * One effect of this deferred printing is that code which calls printk() and
+ * then changes console_loglevel may break. This is because console_loglevel
+ * is inspected when the actual printing occurs.
+ *
+ * See also:
+ * printf(3)
+ *
+ * See the vsnprintf() documentation for format string extensions over C99.
+ */
+
+asmlinkage int printk(const char *fmt, ...)
+{
+	va_list args;
+	int r;
+
+	va_start(args, fmt);
+	r = vprintk(fmt, args);
+	va_end(args);
+
+	return r;
+}
+EXPORT_SYMBOL(printk);
+#endif
-- 
1.6.3.3
