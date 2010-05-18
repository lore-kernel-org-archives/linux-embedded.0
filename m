From: "Chan Jeong" <chan.jeong-Hm3cg6mZ9cc@public.gmane.org>
Subject: [PATCH 2/2] Squashfs-tools: add LZO support
Date: Tue, 18 May 2010 13:05:05 +0900
Message-ID: <32714.6543110304$1274156813@news.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
References: 
In-Reply-To: 
Content-Language: ko
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
	<mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
	<mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: squashfs-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: 'Phillip Lougher' <phillip-cnXvMjJKhjYG2Il/BtU0GPXRex20P6io@public.gmane.org>, 'Gunho Lee' <gunho.lee-Hm3cg6mZ9cc@public.gmane.org>, 'Tim Bird' <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Hyo Jun Im' <hyojun.im-Hm3cg6mZ9cc@public.gmane.org>

This patch adds LZO compression and decompression to Squashfs tools.

The patch is against the latest cvs version and requires the LZO library
from http://www.oberhumer.com/opensource/lzo.

Signed-off-by: Chan Jeong <chan.jeong-Hm3cg6mZ9cc@public.gmane.org>
---
 Makefile      |   20 +++++++++++
 compressor.c  |    7 ++++
 lzo_wrapper.c |   99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 squashfs_fs.h |    1 
 4 files changed, 127 insertions(+)

diff -uprN -x .cvs squashfs-tools.cvs.orig/Makefile squashfs-tools.cvs/Makefile
--- squashfs-tools.cvs.orig/Makefile	2010-05-13 02:17:06.000000000 +0900
+++ squashfs-tools.cvs/Makefile	2010-05-18 11:36:58.000000000 +0900
@@ -15,6 +15,18 @@
 #LZMA_SUPPORT = 1
 #LZMA_DIR = ../../../LZMA/lzma465
 
+#
+# Building LZO support
+#
+# The LZO library (http://www.oberhumer.com/opensource/lzo/) is supported.
+#
+# To build using the LZO library (2.0.3 used in development, other versions may
+# work) - download, unpack, build and install it, uncomment and set LZO_DIR to
+# installed directory prefix, and uncomment the LZO_SUPPORT line below.
+
+#LZO_SUPPORT = 1
+#LZO_DIR = /usr/local
+
 #Compression default.
 COMP_DEFAULT = gzip
 
@@ -47,6 +59,14 @@ UNSQUASHFS_OBJS += xz_wrapper.o
 LIBS += -llzma
 endif
 
+ifdef LZO_SUPPORT
+CFLAGS += -DLZO_SUPPORT
+INCLUDEDIR += -I$(LZO_DIR)/include
+MKSQUASHFS_OBJS += lzo_wrapper.o
+UNSQUASHFS_OBJS += lzo_wrapper.o
+LIBS += -L$(LZO_DIR)/lib -llzo2
+endif
+
 .PHONY: all
 all: mksquashfs unsquashfs
 
diff -uprN -x .cvs squashfs-tools.cvs.orig/compressor.c squashfs-tools.cvs/compressor.c
--- squashfs-tools.cvs.orig/compressor.c	2009-08-29 10:05:34.000000000 +0900
+++ squashfs-tools.cvs/compressor.c	2010-05-18 11:37:46.000000000 +0900
@@ -29,6 +29,8 @@ extern int gzip_compress(void **, char *
 extern int gzip_uncompress(char *, char *, int, int, int *);
 extern int lzma_compress(void **, char *, char *, int, int, int *);
 extern int lzma_uncompress(char *, char *, int, int, int *);
+extern int lzo_compress(void **, char *, char *, int, int, int *);
+extern int lzo_uncompress(char *, char *, int, int, int *);
 
 struct compressor compressor[] = {
 	{ gzip_compress, gzip_uncompress, ZLIB_COMPRESSION, "gzip", 1 },
@@ -37,6 +39,11 @@ struct compressor compressor[] = {
 #else
 	{ NULL, NULL, LZMA_COMPRESSION, "lzma", 0 },
 #endif
+#ifdef LZO_SUPPORT
+	{ lzo_compress, lzo_uncompress, LZO_COMPRESSION, "lzo", 1 },
+#else
+	{ NULL, NULL, LZO_COMPRESSION, "lzo", 0 },
+#endif
 	{ NULL, NULL , 0, "unknown", 0}
 };
 
diff -uprN -x .cvs squashfs-tools.cvs.orig/lzo_wrapper.c squashfs-tools.cvs/lzo_wrapper.c
--- squashfs-tools.cvs.orig/lzo_wrapper.c	1970-01-01 09:00:00.000000000 +0900
+++ squashfs-tools.cvs/lzo_wrapper.c	2010-05-18 11:59:30.000000000 +0900
@@ -0,0 +1,99 @@
+/*
+ * Copyright (c) 2010 LG Electronics
+ * Chan Jeong <chan.jeong-Hm3cg6mZ9cc@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ *
+ * lzo_wrapper.c
+ */
+
+#include <stdlib.h>
+#include <string.h>
+
+#include <lzo/lzoconf.h>
+#include <lzo/lzo1x.h>
+
+/* worst-case expansion calculation during compression,
+   see LZO FAQ for more information */
+#define LZO_OUTPUT_BUFFER_SIZE(size)	(size + (size/16) + 64 + 3)
+
+int lzo_compress(void **strm, char *d, char *s, int size, int block_size,
+		int *error)
+{
+	int res = 0;
+	lzo_bytep out;
+	lzo_uint outlen;
+	lzo_voidp wrkmem;
+	void **buffers = (void **)*strm;
+
+	if(buffers == NULL) {
+		if((buffers = *strm = calloc(2, sizeof(void *))) == NULL)
+			goto malloc_failed;
+
+		/* work memory */
+		if((buffers[0] = malloc(LZO1X_1_MEM_COMPRESS)) == NULL)
+			goto malloc_failed;
+
+		/* temporal output buffer */
+		if((buffers[1] = malloc(LZO_OUTPUT_BUFFER_SIZE(block_size))) == NULL)
+			goto malloc_failed;
+	}
+
+	wrkmem = buffers[0];
+	out = buffers[1];
+	res = lzo1x_1_compress((lzo_bytep)s, size, out, &outlen, wrkmem);
+	if(res != LZO_E_OK) {
+		/*
+		 * All other errors return failure, with the compressor
+		 * specific error code in *error
+		 */
+		*error = res;
+		return -1;
+	}
+
+	if(outlen >= size) {
+		/*
+		 * Output buffer overflow. Return out of buffer space
+		 */
+		return 0;
+	}
+
+	/*
+	 * Success, return the compressed size.
+	 */
+	memcpy(d, out, outlen);
+	return outlen;
+
+malloc_failed:
+	if(buffers) {
+		if(buffers[0]) {
+			free(buffers[0]);
+		}
+		free(buffers);
+	}
+	return -1;
+}
+
+
+int lzo_uncompress(char *d, char *s, int size, int block_size, int *error)
+{
+	int res;
+	lzo_uint bytes = block_size;
+	
+	res = lzo1x_decompress((lzo_bytep)s, size, (lzo_bytep)d, &bytes, NULL);
+
+	*error = res;
+	return res == LZO_E_OK ? bytes : -1;
+}
diff -uprN -x .cvs squashfs-tools.cvs.orig/squashfs_fs.h squashfs-tools.cvs/squashfs_fs.h
--- squashfs-tools.cvs.orig/squashfs_fs.h	2010-05-13 04:28:38.000000000 +0900
+++ squashfs-tools.cvs/squashfs_fs.h	2010-05-18 11:43:22.000000000 +0900
@@ -238,6 +238,7 @@ typedef long long		squashfs_inode_t;
 
 #define ZLIB_COMPRESSION	1
 #define LZMA_COMPRESSION	2
+#define LZO_COMPRESSION		3
 
 struct squashfs_super_block {
 	unsigned int		s_magic;


------------------------------------------------------------------------------
