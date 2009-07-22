From: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Subject: [PATCH 1/5] lib/decompress_*: only include <linux/slab.h> if STATIC is not defined
Date: Wed, 22 Jul 2009 16:01:15 +0200
Message-ID: <1248271279-9920-1-git-send-email-albin.tonnerre@free-electrons.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755623AbZGVOBY@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@arm.linux.org.uk, hpa@zytor.com
Cc: alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Albin Tonnerre <albin.tonnerre@free-electrons.com>

These includes were added by 079effb6933f34b9b1b67b08bd4fd7fb672d16ef to
fix the build when using kmemtrace. However this is not necessary when
used to create a compressed kernel, and actually creates issues (brings
a lot of things unavailable in the decompression environment), so don't
include it if STATIC is defined.

Signed-off-by: Albin Tonnerre <albin.tonnerre@free-electrons.com>
---
 lib/decompress_bunzip2.c |    2 +-
 lib/decompress_inflate.c |    2 +-
 lib/decompress_unlzma.c  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/decompress_bunzip2.c b/lib/decompress_bunzip2.c
index 708e2a8..14b0c7d 100644
--- a/lib/decompress_bunzip2.c
+++ b/lib/decompress_bunzip2.c
@@ -47,10 +47,10 @@
 
 #ifndef STATIC
 #include <linux/decompress/bunzip2.h>
+#include <linux/slab.h>
 #endif /* !STATIC */
 
 #include <linux/decompress/mm.h>
-#include <linux/slab.h>
 
 #ifndef INT_MAX
 #define INT_MAX 0x7fffffff
diff --git a/lib/decompress_inflate.c b/lib/decompress_inflate.c
index e36b296..fc30d50 100644
--- a/lib/decompress_inflate.c
+++ b/lib/decompress_inflate.c
@@ -19,11 +19,11 @@
 #include "zlib_inflate/inflate.h"
 
 #include "zlib_inflate/infutil.h"
+#include <linux/slab.h>
 
 #endif /* STATIC */
 
 #include <linux/decompress/mm.h>
-#include <linux/slab.h>
 
 #define INBUF_LEN (16*1024)
 
diff --git a/lib/decompress_unlzma.c b/lib/decompress_unlzma.c
index 32123a1..f078c88 100644
--- a/lib/decompress_unlzma.c
+++ b/lib/decompress_unlzma.c
@@ -31,10 +31,10 @@
 
 #ifndef STATIC
 #include <linux/decompress/unlzma.h>
+#include <linux/slab.h>
 #endif /* STATIC */
 
 #include <linux/decompress/mm.h>
-#include <linux/slab.h>
 
 #define	MIN(a, b) (((a) < (b)) ? (a) : (b))
 
-- 
1.6.0.4
