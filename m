From: David Wagner <david.wagner@free-electrons.com>
Subject: [PATCH] document ubiblk's usage of the same ioctl magic as a part of UBI
Date: Wed, 24 Aug 2011 18:21:56 +0200
Message-ID: <1314202916-6982-1-git-send-email-david.wagner@free-electrons.com>
References: <1314202540-5562-1-git-send-email-david.wagner@free-electrons.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1314202540-5562-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd <linux-mtd@lists.infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>, David Wagner <david.wagner@free-electrons.com>

---
 include/mtd/ubi-user.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 3c41097..7c8bfe3 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -188,6 +188,7 @@
 /* Set an UBI volume property */
 #define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
 			       struct ubi_set_vol_prop_req)
+/* If you add ioctls here, please note that ubiblk uses 'O'/0x10-0x11 */
 
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
-- 
1.7.0.4
