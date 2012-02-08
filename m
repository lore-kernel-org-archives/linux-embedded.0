From: Tim Bird <tim.bird@am.sony.com>
Subject: [PATCH 3/5] logger: reorder prepare_to_wait and mutex_lock
Date: Tue, 7 Feb 2012 18:30:09 -0800
Message-ID: <4F31DE31.3040001@am.sony.com>
References: <4F31DC31.6040303@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F31DC31.6040303@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@linuxfoundation.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Dima Zavin <dima@android.com>, Andrew Morton <akpm@osdl.org>

If mutex_lock waits, it will return in state TASK_RUNNING,
rubbing out the effect of prepare_to_wait().

Signed-off-by: Tim Bird <tim.bird@am.sony.com>
---
 drivers/staging/android/logger.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/android/logger.c b/drivers/staging/android/logger.c
index 92cfd94..54b7cdf 100644
--- a/drivers/staging/android/logger.c
+++ b/drivers/staging/android/logger.c
@@ -172,9 +172,10 @@ static ssize_t logger_read(struct file *file, char __user *buf,

 start:
 	while (1) {
+		mutex_lock(&log->mutex);
+
 		prepare_to_wait(&log->wq, &wait, TASK_INTERRUPTIBLE);

-		mutex_lock(&log->mutex);
 		ret = (log->w_off == reader->r_off);
 		mutex_unlock(&log->mutex);
 		if (!ret)
-- 
1.7.2.3
