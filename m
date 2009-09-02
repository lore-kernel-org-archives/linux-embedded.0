From: Marc Andre Tanner <mat@brain-dump.org>
Subject: [PATCH 4/5] char/mem: replace printk with printk_unfiltered
Date: Wed,  2 Sep 2009 16:25:04 +0200
Message-ID: <1251901505-4313-5-git-send-email-mat@brain-dump.org>
References: <1251901505-4313-1-git-send-email-mat@brain-dump.org>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1251901505-4313-1-git-send-email-mat@brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: mat@brain-dump.org

We don't want to filter user space data which comes from /dev/kmsg.

Signed-off-by: Marc Andre Tanner <mat@brain-dump.org>
---
 drivers/char/mem.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index afa8813..ba48b82 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -850,7 +850,7 @@ static ssize_t kmsg_write(struct file * file, const char __user * buf,
 	ret = -EFAULT;
 	if (!copy_from_user(tmp, buf, count)) {
 		tmp[count] = 0;
-		ret = printk("%s", tmp);
+		ret = printk_unfiltered("%s", tmp);
 		if (ret > count)
 			/* printk can add a prefix */
 			ret = count;
-- 
1.6.3.3
