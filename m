From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Subject: [PATCH 09/16] Squashfs: uid/gid lookup operations
Date: Fri, 17 Oct 2008 16:42:51 +0100
Message-ID: <E1KqrTX-0001xo-4N@dylan>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com


Signed-off-by: Phillip Lougher <phillip@lougher.demon.co.uk>
---
 fs/squashfs/id.c |   84 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 84 insertions(+), 0 deletions(-)

diff --git a/fs/squashfs/id.c b/fs/squashfs/id.c
new file mode 100644
index 0000000..b4881d7
--- /dev/null
+++ b/fs/squashfs/id.c
@@ -0,0 +1,84 @@
+/*
+ * Squashfs - a compressed read only filesystem for Linux
+ *
+ * Copyright (c) 2002, 2003, 2004, 2005, 2006, 2007, 2008
+ * Phillip Lougher <phillip@lougher.demon.co.uk>
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
+ * id.c
+ */
+
+/*
+ * This file implements code to handle uids and gids.
+ *
+ * For space efficiency inodes store uid and gid indexes, which are
+ * converted to 32-bit uids/gids using an id look up table.  This table is
+ * stored compressed into metadata blocks.  A second index table is used to
+ * locate these.  This second index table for speed of access (and because it
+ * is small) is read at mount time and cached in memory.
+ */
+
+#include <linux/fs.h>
+#include <linux/vfs.h>
+#include <linux/slab.h>
+#include <linux/zlib.h>
+#include <linux/squashfs_fs.h>
+#include <linux/squashfs_fs_sb.h>
+#include <linux/squashfs_fs_i.h>
+
+#include "squashfs.h"
+
+int squashfs_get_id(struct super_block *s, unsigned int index, unsigned int *id)
+{
+	struct squashfs_sb_info *msblk = s->s_fs_info;
+	int block = SQUASHFS_ID_BLOCK(index);
+	int offset = SQUASHFS_ID_BLOCK_OFFSET(index);
+	long long start_block = le64_to_cpu(msblk->id_table[block]);
+	__le32 disk_id;
+
+	if (!squashfs_read_metadata(s, &disk_id, start_block, offset,
+				 sizeof(disk_id), &start_block, &offset))
+		return 0;
+
+	*id = le32_to_cpu(disk_id);
+	return 1;
+}
+
+
+__le64 *read_id_index_table(struct super_block *s, long long id_table_start,
+	unsigned short no_ids)
+{
+	unsigned int length = SQUASHFS_ID_BLOCK_BYTES(no_ids);
+	__le64 *id_table;
+
+	TRACE("In read_id_index_table, length %d\n", length);
+
+	/* Allocate id index table */
+	id_table = kmalloc(length, GFP_KERNEL);
+	if (id_table == NULL) {
+		ERROR("Failed to allocate id index table\n");
+		return NULL;
+	}
+
+	if (!squashfs_read_data(s, id_table, id_table_start, length |
+			SQUASHFS_COMPRESSED_BIT_BLOCK, NULL, length)) {
+		ERROR("unable to read id index table\n");
+		kfree(id_table);
+		return NULL;
+	}
+
+	return id_table;
+}
-- 
1.5.2.5

