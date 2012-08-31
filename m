From: Hein Tibosch <hein_tibosch@yahoo.es>
Subject: [PATCH]  lib/decompress.c adding __init to decompress_method and
 data
Date: Fri, 31 Aug 2012 14:24:50 +0800
Message-ID: <504058B2.2080901@yahoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-embedded@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, Phillip Lougher <phillip@lougher.demon.co.uk>, hpa@linux.intel.com

Every time when compiling a new Linux kernel, I'm surprised that
this warning still occurs:

WARNING: vmlinux.o(.text+0x14cfd8): Section mismatch in
reference from the variable compressed_formats to the function
.init.text:gunzip()
The function compressed_formats() references
the function __init gunzip().
etc..

This patch should solve it:

Within decompress.c, compressed_formats[] needs 'a __initdata annotation', because
some of it's data members refer to functions which will be unloaded after init.

Consequently, it's user decompress_method() will get the __init prefix.

Signed-off-by: Hein Tibosch <hein_tibosch@yahoo.es>
---
 lib/decompress.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/decompress.c b/lib/decompress.c
index 3d766b7..31a8042 100644
--- a/lib/decompress.c
+++ b/lib/decompress.c
@@ -14,6 +14,7 @@
 
 #include <linux/types.h>
 #include <linux/string.h>
+#include <linux/init.h>
 
 #ifndef CONFIG_DECOMPRESS_GZIP
 # define gunzip NULL
@@ -31,11 +32,13 @@
 # define unlzo NULL
 #endif
 
-static const struct compress_format {
+struct compress_format {
 	unsigned char magic[2];
 	const char *name;
 	decompress_fn decompressor;
-} compressed_formats[] = {
+};
+
+static const struct compress_format compressed_formats[] __initdata = {
 	{ {037, 0213}, "gzip", gunzip },
 	{ {037, 0236}, "gzip", gunzip },
 	{ {0x42, 0x5a}, "bzip2", bunzip2 },
@@ -45,7 +48,7 @@ static const struct compress_format {
 	{ {0, 0}, NULL, NULL }
 };
 
-decompress_fn decompress_method(const unsigned char *inbuf, int len,
+decompress_fn __init decompress_method(const unsigned char *inbuf, int len,
 				const char **name)
 {
 	const struct compress_format *cf;
-- 
1.7.8.0
