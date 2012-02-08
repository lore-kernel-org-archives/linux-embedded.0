From: Tim Bird <tim.bird@am.sony.com>
Subject: [PATCH 5/5] logger: clarify non-update of w_off in do_write_log_from_user
Date: Tue, 7 Feb 2012 18:34:28 -0800
Message-ID: <4F31DF34.8000205@am.sony.com>
References: <4F31DC31.6040303@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F31DC31.6040303@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@linuxfoundation.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Dima Zavin <dima@android.com>, Andrew Morton <akpm@osdl.org>

Add comment to explain when w_off is not updated in case of failed second
fragment copy to buffer.

Signed-off-by: Tim Bird <tim.bird@am.sony.com>
---
 drivers/staging/android/logger.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/android/logger.c b/drivers/staging/android/logger.c
index 8d9d4f1..115d8ed 100644
--- a/drivers/staging/android/logger.c
+++ b/drivers/staging/android/logger.c
@@ -330,6 +330,12 @@ static ssize_t do_write_log_from_user(struct logger_log *log,

 	if (count != len)
 		if (copy_from_user(log->buffer, buf + len, count - len))
+			/*
+			 * Note that by not updating w_off, this abandons the
+			 * portion of the new entry that *was* successfully
+			 * copied, just above.  This is intentional to avoid
+			 * message corruption from missing fragments.
+			 */
 			return -EFAULT;

 	log->w_off = logger_offset(log, log->w_off + count);
-- 
1.7.2.3
