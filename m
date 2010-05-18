From: "Chan Jeong" <chan.jeong-Hm3cg6mZ9cc@public.gmane.org>
Subject: [PATCH 1/2] Squashfs: add LZO decompression support
Date: Tue, 18 May 2010 12:55:51 +0900
Message-ID: <42180.602081544$1274156263@news.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
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

Hi,

This patch series adds LZO decompression support to Squashfs,
using in-kernel LZO decompression library and Squashfs 
decompressor entries.

The patch series also includes LZO support for Squashfs tools.

Signed-off-by: Chan Jeong <chan.jeong-Hm3cg6mZ9cc@public.gmane.org>
---
 fs/squashfs/Kconfig        |    5 ++
 fs/squashfs/Makefile       |    1 +
 fs/squashfs/decompressor.c |    6 ++
 fs/squashfs/lzo_wrapper.c  |  144 ++++++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/squashfs.h     |    3 +
 5 files changed, 159 insertions(+), 0 deletions(-)

diff --git a/fs/squashfs/Kconfig b/fs/squashfs/Kconfig
index 25a00d1..79e3ca4 100644
--- a/fs/squashfs/Kconfig
+++ b/fs/squashfs/Kconfig
@@ -26,6 +26,11 @@ config SQUASHFS
 
 	  If unsure, say N.
 
+config SQUASHFS_LZO
+	bool "Include support for LZO compressed file systems"
+	depends on SQUASHFS
+	select LZO_DECOMPRESS
+
 config SQUASHFS_EMBEDDED
 
 	bool "Additional option for memory-constrained systems" 
diff --git a/fs/squashfs/Makefile b/fs/squashfs/Makefile
index df8a19e..4dd3e14 100644
--- a/fs/squashfs/Makefile
+++ b/fs/squashfs/Makefile
@@ -5,3 +5,4 @@
 obj-$(CONFIG_SQUASHFS) += squashfs.o
 squashfs-y += block.o cache.o dir.o export.o file.o fragment.o id.o inode.o
 squashfs-y += namei.o super.o symlink.o zlib_wrapper.o decompressor.o
+squashfs-$(CONFIG_SQUASHFS_LZO) += lzo_wrapper.o
diff --git a/fs/squashfs/decompressor.c b/fs/squashfs/decompressor.c
index 157478d..24af9ce 100644
--- a/fs/squashfs/decompressor.c
+++ b/fs/squashfs/decompressor.c
@@ -40,9 +40,11 @@ static const struct squashfs_decompressor squashfs_lzma_unsupported_comp_ops = {
 	NULL, NULL, NULL, LZMA_COMPRESSION, "lzma", 0
 };
 
+#ifndef CONFIG_SQUASHFS_LZO
 static const struct squashfs_decompressor squashfs_lzo_unsupported_comp_ops = {
 	NULL, NULL, NULL, LZO_COMPRESSION, "lzo", 0
 };
+#endif
 
 static const struct squashfs_decompressor squashfs_unknown_comp_ops = {
 	NULL, NULL, NULL, 0, "unknown", 0
@@ -51,7 +53,11 @@ static const struct squashfs_decompressor squashfs_unknown_comp_ops = {
 static const struct squashfs_decompressor *decompressor[] = {
 	&squashfs_zlib_comp_ops,
 	&squashfs_lzma_unsupported_comp_ops,
+#ifdef CONFIG_SQUASHFS_LZO
+	&squashfs_lzo_comp_ops,
+#else
 	&squashfs_lzo_unsupported_comp_ops,
+#endif
 	&squashfs_unknown_comp_ops
 };
 
diff --git a/fs/squashfs/lzo_wrapper.c b/fs/squashfs/lzo_wrapper.c
new file mode 100644
index 0000000..6577cfa
--- /dev/null
+++ b/fs/squashfs/lzo_wrapper.c
@@ -0,0 +1,144 @@
+/*
+ * Squashfs - a compressed read only filesystem for Linux
+ *
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
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+ *
+ * lzo_wrapper.c
+ */
+
+#include <linux/mutex.h>
+#include <linux/buffer_head.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/lzo.h>
+
+#include "squashfs_fs.h"
+#include "squashfs_fs_sb.h"
+#include "squashfs_fs_i.h"
+#include "squashfs.h"
+#include "decompressor.h"
+
+
+static void *lzo_init(struct squashfs_sb_info *msblk)
+{
+	void **streams;
+
+	streams = (void **)kmalloc(sizeof(void *) * 2, GFP_KERNEL);
+	if (streams == NULL)
+		goto failed;
+
+	/* input workspace */
+	streams[0] = vmalloc(msblk->block_size);
+	if (streams[0] == NULL)
+		goto failed;
+
+	/* output workspace */
+	streams[1] = vmalloc(msblk->block_size);
+	if (streams[1] == NULL)
+		goto failed;
+
+	return streams;
+
+failed:
+	ERROR("Failed to allocate lzo workspace\n");
+	if (streams) {
+		if (streams[0])
+			vfree(streams[0]);
+		kfree(streams);
+	}
+	return NULL;
+}
+
+
+static void lzo_free(void *stream)
+{
+	void **streams = (void **)stream;
+	vfree(streams[1]);
+	vfree(streams[0]);
+	kfree(streams);
+}
+
+
+static int lzo_uncompress(struct squashfs_sb_info *msblk, void **buffer,
+	struct buffer_head **bh, int b, int offset, int length, int srclength,
+	int pages)
+{
+	int lzo_err;
+	int avail, bytes, k = 0, page;
+	void **streams = (void **)msblk->stream;
+	void *in;
+
+	mutex_lock(&msblk->read_data_mutex);
+
+	bytes = length;
+	in = streams[0];
+	while (k < b) {
+		avail = min(bytes, msblk->devblksize - offset);
+		bytes -= avail;
+		wait_on_buffer(bh[k]);
+		if (!buffer_uptodate(bh[k]))
+			goto release_mutex;
+
+		if (k == 0 && avail == 0) {
+			offset = 0;
+			put_bh(bh[k++]);
+			continue;
+		}
+
+		memcpy(in, bh[k]->b_data + offset, avail);
+		in += avail;
+		offset = 0;
+		put_bh(bh[k++]);
+	}
+
+	bytes = in - streams[0];
+	length = msblk->block_size;
+	lzo_err = lzo1x_decompress_safe(streams[0], bytes, streams[1], &length);
+	if (lzo_err != LZO_E_OK)
+		goto release_mutex;
+
+	bytes = length;
+	in = streams[1];
+	page = 0;
+	while (page < pages && bytes > 0) {
+		avail = min((int)PAGE_CACHE_SIZE, bytes);
+		memcpy(buffer[page++], in, avail);
+		in += avail;
+		bytes -= avail;
+	}
+
+	mutex_unlock(&msblk->read_data_mutex);
+	return length;
+
+release_mutex:
+	mutex_unlock(&msblk->read_data_mutex);
+
+	for (; k < b; k++)
+		put_bh(bh[k]);
+
+	return -EIO;
+}
+
+const struct squashfs_decompressor squashfs_lzo_comp_ops = {
+	.init = lzo_init,
+	.free = lzo_free,
+	.decompress = lzo_uncompress,
+	.id = LZO_COMPRESSION,
+	.name = "lzo",
+	.supported = 1
+};
diff --git a/fs/squashfs/squashfs.h b/fs/squashfs/squashfs.h
index fe2587a..1f0ee85 100644
--- a/fs/squashfs/squashfs.h
+++ b/fs/squashfs/squashfs.h
@@ -94,3 +94,6 @@ extern const struct address_space_operations squashfs_symlink_aops;
 
 /* zlib_wrapper.c */
 extern const struct squashfs_decompressor squashfs_zlib_comp_ops;
+
+/* lzo_wrappers.c */
+extern const struct squashfs_decompressor squashfs_lzo_comp_ops;


------------------------------------------------------------------------------
