From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: [PATCH V2 6/8] lzma: Make lzma available to non initramfs/initrd
 code
Date: Thu, 07 Jan 2010 00:49:54 +0000
Message-ID: <4b452fb2.pHrkBSPmj0OXtjq3%phillip@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: albin.tonnerre@free-electrons.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org


Fix up patch resend using a nice and dumb email client.
If I'm lucky, email readers may even get the threading right :-)

Phillip

From 1cf6d32e1427398368ff189aece68aa533092e98 Mon Sep 17 00:00:00 2001
From: Phillip Lougher <phillip@lougher.demon.co.uk>
Date: Wed, 6 Jan 2010 23:50:12 +0000
Subject: [PATCH] lzo: Fix-up add support for lzo compressed kernels patch

The add support for lzo compressed kernels patch relies on
INIT and error definitions which have been moved to
separate xxx_mm.h files for each decompressor.

This patch adds a unlzo_mm.h file which supplies these
definitions.

Signed-off-by: Phillip Lougher <phillip@lougher.demon.co.uk>
---
 include/linux/decompress/unlzo_mm.h |   13 +++++++++++++
 lib/decompress_unlzo.c              |    1 +
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 include/linux/decompress/unlzo_mm.h

diff --git a/include/linux/decompress/unlzo_mm.h b/include/linux/decompress/unlzo_mm.h
new file mode 100644
index 0000000..27fe0ab
--- /dev/null
+++ b/include/linux/decompress/unlzo_mm.h
@@ -0,0 +1,13 @@
+#ifndef UNLZO_MM_H
+#define UNLZO_MM_H
+
+#ifdef STATIC
+/* Code active when included from pre-boot environment: */
+#define INIT
+#else
+/* Compile for initramfs/initrd code only */
+#define INIT __init
+static void(*error)(char *m);
+#endif
+
+#endif
diff --git a/lib/decompress_unlzo.c b/lib/decompress_unlzo.c
index db521f4..edd82c3 100644
--- a/lib/decompress_unlzo.c
+++ b/lib/decompress_unlzo.c
@@ -39,6 +39,7 @@
 
 #include <linux/types.h>
 #include <linux/lzo.h>
+#include <linux/decompress/unlzo_mm.h>
 #include <linux/decompress/mm.h>
 
 #include <linux/compiler.h>
-- 
1.6.3.3

