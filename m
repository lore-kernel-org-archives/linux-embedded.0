From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [PATCH 6/7] video/stk-webcam: change use of STK_ERROR
Date: Wed,  2 Sep 2009 00:31:08 +0200
Message-ID: <1251844269-12394-7-git-send-email-mat@brain-dump.org>
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

Don't rely on the return value of STK_ERROR which is a wrapper
around printk use a normal if clause instead.

Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
---
 drivers/media/video/stk-webcam.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/video/stk-webcam.c b/drivers/media/video/stk-webcam.c
index b154bd9..ea7e70e 100644
--- a/drivers/media/video/stk-webcam.c
+++ b/drivers/media/video/stk-webcam.c
@@ -386,8 +386,8 @@ static void stk_isoc_handler(struct urb *urb)
 
 	if (list_empty(&dev->sio_avail)) {
 		/*FIXME Stop streaming after a while */
-		(void) (printk_ratelimit() &&
-		STK_ERROR("isoc_handler without available buffer!\n"));
+		if (printk_ratelimit())
+			STK_ERROR("isoc_handler without available buffer!\n");
 		goto resubmit;
 	}
 	fb = list_first_entry(&dev->sio_avail,
@@ -422,10 +422,10 @@ static void stk_isoc_handler(struct urb *urb)
 			/* This marks a new frame */
 			if (fb->v4lbuf.bytesused != 0
 				&& fb->v4lbuf.bytesused != dev->frame_size) {
-				(void) (printk_ratelimit() &&
-				STK_ERROR("frame %d, "
-					"bytesused=%d, skipping\n",
-					i, fb->v4lbuf.bytesused));
+				if (printk_ratelimit())
+					STK_ERROR("frame %d, "
+						"bytesused=%d, skipping\n",
+						i, fb->v4lbuf.bytesused);
 				fb->v4lbuf.bytesused = 0;
 				fill = fb->buffer;
 			} else if (fb->v4lbuf.bytesused == dev->frame_size) {
@@ -450,8 +450,8 @@ static void stk_isoc_handler(struct urb *urb)
 
 		/* Our buffer is full !!! */
 		if (framelen + fb->v4lbuf.bytesused > dev->frame_size) {
-			(void) (printk_ratelimit() &&
-			STK_ERROR("Frame buffer overflow, lost sync\n"));
+			if (printk_ratelimit())
+				STK_ERROR("Frame buffer overflow, lost sync\n");
 			/*FIXME Do something here? */
 			continue;
 		}
-- 
1.6.3.3
