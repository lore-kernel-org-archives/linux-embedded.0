From: Joe Perches <joe@perches.com>
Subject: [PATCH 1/7] include/linux/printk.h: Move console functions and variables together
Date: Sun,  5 Dec 2010 21:44:15 -0800
Message-ID: <d1b4289178540074f83daa7d35e6efb098a712a9.1291611191.git.joe@perches.com>
References: <cover.1291611190.git.joe@perches.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <cover.1291611190.git.joe@perches.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Signed-off-by: Joe Perches <joe@perches.com>
---
 include/linux/printk.h |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index b772ca5..0b4513b 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -29,6 +29,17 @@ extern int console_printk[];
 #define minimum_console_loglevel (console_printk[2])
 #define default_console_loglevel (console_printk[3])
 
+static inline void console_silent(void)
+{
+	console_loglevel = 0;
+}
+
+static inline void console_verbose(void)
+{
+	if (console_loglevel)
+		console_loglevel = 15;
+}
+
 struct va_format {
 	const char *fmt;
 	va_list *va;
@@ -130,17 +141,6 @@ extern void printk_tick(void);
 extern void asmlinkage __attribute__((format(printf, 1, 2)))
 	early_printk(const char *fmt, ...);
 
-static inline void console_silent(void)
-{
-	console_loglevel = 0;
-}
-
-static inline void console_verbose(void)
-{
-	if (console_loglevel)
-		console_loglevel = 15;
-}
-
 extern void dump_stack(void) __cold;
 
 enum {
-- 
1.7.3.2.245.g03276.dirty
