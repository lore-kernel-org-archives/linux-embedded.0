From: Tim Bird <tim.bird@am.sony.com>
Subject: [PATCH 4/5] logger: clarify code in clock_interval
Date: Tue, 7 Feb 2012 18:32:02 -0800
Message-ID: <4F31DEA2.7000702@am.sony.com>
References: <4F31DC31.6040303@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4F31DC31.6040303@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@linuxfoundation.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Dima Zavin <dima@android.com>, Andrew Morton <akpm@osdl.org>

Add commentary, rename the function and make the code easier to read.

Signed-off-by: Tim Bird <tim.bird@am.sony.com>
---
 drivers/staging/android/logger.c |   28 ++++++++++++++++++++--------
 1 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/android/logger.c b/drivers/staging/android/logger.c
index 54b7cdf..8d9d4f1 100644
--- a/drivers/staging/android/logger.c
+++ b/drivers/staging/android/logger.c
@@ -242,16 +242,28 @@ static size_t get_next_entry(struct logger_log *log, size_t off, size_t len)
 }

 /*
- * clock_interval - is a < c < b in mod-space? Put another way, does the line
- * from a to b cross c?
+ * is_between - is a < c < b, accounting for wrapping of a, b, and c
+ *    positions in the buffer
+ *
+ * That is, if a<b, check for c between a and b
+ * and if a>b, check for c outside (not between) a and b
+ *
+ * |------- a xxxxxxxx b --------|
+ *               c^
+ *
+ * |xxxxx b --------- a xxxxxxxxx|
+ *    c^
+ *  or                    c^
  */
-static inline int clock_interval(size_t a, size_t b, size_t c)
+static inline int is_between(size_t a, size_t b, size_t c)
 {
-	if (b < a) {
-		if (a < c || b >= c)
+	if (a < b) {
+		/* is c between a and b? */
+		if (a < c && c <= b)
 			return 1;
 	} else {
-		if (a < c && b >= c)
+		/* is c outside of b through a? */
+		if (c <= b || a < c)
 			return 1;
 	}

@@ -272,11 +284,11 @@ static void fix_up_readers(struct logger_log *log, size_t len)
 	size_t new = logger_offset(log, old + len);
 	struct logger_reader *reader;

-	if (clock_interval(old, new, log->head))
+	if (is_between(old, new, log->head))
 		log->head = get_next_entry(log, log->head, len);

 	list_for_each_entry(reader, &log->readers, list)
-		if (clock_interval(old, new, reader->r_off))
+		if (is_between(old, new, reader->r_off))
 			reader->r_off = get_next_entry(log, reader->r_off, len);
 }

-- 
1.7.2.3
