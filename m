From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: [PATCH V3 05/17] Squashfs: symlink operations
Date: Mon, 05 Jan 2009 11:08:23 +0000
Message-ID: <E1LJnJn-0002LM-Mt@dylan.lougher.demon.co.uk>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, sfr@canb.auug.org.au


Signed-off-by: Phillip Lougher <phillip@lougher.demon.co.uk>
---
 fs/squashfs/symlink.c |  118 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 118 insertions(+), 0 deletions(-)

diff --git a/fs/squashfs/symlink.c b/fs/squashfs/symlink.c
new file mode 100644
index 0000000..83d8788
--- /dev/null
+++ b/fs/squashfs/symlink.c
@@ -0,0 +1,118 @@
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
+ * symlink.c
+ */
+
+/*
+ * This file implements code to handle symbolic links.
+ *
+ * The data contents of symbolic links are stored inside the symbolic
+ * link inode within the inode table.  This allows the normally small symbolic
+ * link to be compressed as part of the inode table, achieving much greater
+ * compression than if the symbolic link was compressed individually.
+ */
+
+#include <linux/fs.h>
+#include <linux/vfs.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/pagemap.h>
+#include <linux/zlib.h>
+
+#include "squashfs_fs.h"
+#include "squashfs_fs_sb.h"
+#include "squashfs_fs_i.h"
+#include "squashfs.h"
+
+static int squashfs_symlink_readpage(struct file *file, struct page *page)
+{
+	struct inode *inode = page->mapping->host;
+	struct super_block *sb = inode->i_sb;
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	int index = page->index << PAGE_CACHE_SHIFT;
+	u64 block = squashfs_i(inode)->start;
+	int offset = squashfs_i(inode)->offset;
+	int length = min_t(int, i_size_read(inode) - index, PAGE_CACHE_SIZE);
+	int bytes, copied;
+	void *pageaddr;
+	struct squashfs_cache_entry *entry;
+
+	TRACE("Entered squashfs_symlink_readpage, page index %ld, start block "
+			"%llx, offset %x\n", page->index, block, offset);
+
+	/*
+	 * Skip index bytes into symlink metadata.
+	 */
+	if (index) {
+		bytes = squashfs_read_metadata(sb, NULL, &block, &offset,
+								index);
+		if (bytes < 0) {
+			ERROR("Unable to read symlink [%llx:%x]\n",
+				squashfs_i(inode)->start,
+				squashfs_i(inode)->offset);
+			goto error_out;
+		}
+	}
+
+	/*
+	 * Read length bytes from symlink metadata.  Squashfs_read_metadata
+	 * is not used here because it can sleep and we want to use
+	 * kmap_atomic to map the page.  Instead call the underlying
+	 * squashfs_cache_get routine.  As length bytes may overlap metadata
+	 * blocks, we may need to call squashfs_cache_get multiple times.
+	 */
+	for (bytes = 0; bytes < length; offset = 0, bytes += copied) {
+		entry = squashfs_cache_get(sb, msblk->block_cache, block, 0);
+		if (entry->error) {
+			ERROR("Unable to read symlink [%llx:%x]\n",
+				squashfs_i(inode)->start,
+				squashfs_i(inode)->offset);
+			squashfs_cache_put(entry);
+			goto error_out;
+		}
+
+		pageaddr = kmap_atomic(page, KM_USER0);
+		copied = squashfs_copy_data(pageaddr + bytes, entry, offset,
+								length - bytes);
+		if (copied == length - bytes)
+			memset(pageaddr + length, 0, PAGE_CACHE_SIZE - length);
+		else
+			block = entry->next_index;
+		kunmap_atomic(pageaddr, KM_USER0);
+		squashfs_cache_put(entry);
+	}
+
+	flush_dcache_page(page);
+	SetPageUptodate(page);
+	unlock_page(page);
+	return 0;
+
+error_out:
+	SetPageError(page);
+	unlock_page(page);
+	return 0;
+}
+
+
+const struct address_space_operations squashfs_symlink_aops = {
+	.readpage = squashfs_symlink_readpage
+};
-- 
1.5.6.3
