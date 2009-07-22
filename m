From: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Subject: [PATCH 2/5] include/linux/unaligned/{l,b}e_byteshift.h: Fix usage for compressed kernels
Date: Wed, 22 Jul 2009 16:01:16 +0200
Message-ID: <1248271279-9920-2-git-send-email-albin.tonnerre@free-electrons.com>
References: <1248271279-9920-1-git-send-email-albin.tonnerre@free-electrons.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755802AbZGVOBo@vger.kernel.org>
In-Reply-To: <1248271279-9920-1-git-send-email-albin.tonnerre@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@arm.linux.org.uk, hpa@zytor.com
Cc: alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Albin Tonnerre <albin.tonnerre@free-electrons.com>

When unaligned accesses are required for uncompressing a kernel (such as
for LZO decompression on ARM in a patch that follows), including
<linux/kernel.h> causes issues as it brings in a lot of things that are
not available in the decompression environment.
However, those files apparently use nothing from <linux/kernel.h>, all
they need is the declaration of types such as u32 or u64, so
<linux/types.h> should be enough

Signed-off-by: Albin Tonnerre <albin.tonnerre@free-electrons.com>
---
 include/linux/unaligned/be_byteshift.h |    2 +-
 include/linux/unaligned/le_byteshift.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/unaligned/be_byteshift.h b/include/linux/unaligned/be_byteshift.h
index 46dd12c..9356b24 100644
--- a/include/linux/unaligned/be_byteshift.h
+++ b/include/linux/unaligned/be_byteshift.h
@@ -1,7 +1,7 @@
 #ifndef _LINUX_UNALIGNED_BE_BYTESHIFT_H
 #define _LINUX_UNALIGNED_BE_BYTESHIFT_H
 
-#include <linux/kernel.h>
+#include <linux/types.h>
 
 static inline u16 __get_unaligned_be16(const u8 *p)
 {
diff --git a/include/linux/unaligned/le_byteshift.h b/include/linux/unaligned/le_byteshift.h
index 59777e9..be376fb 100644
--- a/include/linux/unaligned/le_byteshift.h
+++ b/include/linux/unaligned/le_byteshift.h
@@ -1,7 +1,7 @@
 #ifndef _LINUX_UNALIGNED_LE_BYTESHIFT_H
 #define _LINUX_UNALIGNED_LE_BYTESHIFT_H
 
-#include <linux/kernel.h>
+#include <linux/types.h>
 
 static inline u16 __get_unaligned_le16(const u8 *p)
 {
-- 
1.6.0.4
