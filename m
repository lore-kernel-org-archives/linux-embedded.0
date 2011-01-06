From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 10/17] pramfs: xip operations
Date: Thu, 06 Jan 2011 13:03:20 +0100
Message-ID: <4D25AF88.4020204@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=064PWwmQcAnTBPqOfeOQf4FCXr1lzM+dwJVJmqv02vY=;
        b=oJ+PrsCtZwhIhja9Q7pFv0gUGYG7v4tdiy0QbfwNZ2yAMWTWHHbQpmj+ETwLEhMlC3
         sJ29uVYsmDqf2+hZAVD+kZvnGWOT91XVV+QZW+h7NuOBjwaZ21rmr1G8R3uOBhGn2zLp
         JE5P2sKDs5Bh9DD5ERqGjM/O0Vrnx46YIYfXc=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

From: Marco Stornelli <marco.stornelli@gmail.com>

XIP operations.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff --git a/fs/pramfs/xip.c b/fs/pramfs/xip.c
new file mode 100644
index 0000000..9ad8caf
--- /dev/null
+++ b/fs/pramfs/xip.c
@@ -0,0 +1,83 @@
+/*
+ * BRIEF DESCRIPTION
+ *
+ * XIP operations.
+ *
+ * Copyright 2009-2010 Marco Stornelli <marco.stornelli@gmail.com>
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/mm.h>
+#include <linux/fs.h>
+#include <linux/genhd.h>
+#include <linux/buffer_head.h>
+#include "pram.h"
+#include "xip.h"
+
+static int pram_find_and_alloc_blocks(struct inode *inode, sector_t iblock,
+				     sector_t *data_block, int create)
+{
+	int err = -EIO;
+	u64 block;
+
+	mutex_lock(&PRAM_I(inode)->truncate_mutex);
+
+	block = pram_find_data_block(inode, iblock);
+
+	if (!block) {
+		if (!create) {
+			err = -ENODATA;
+			goto err;
+		}
+
+		err = pram_alloc_blocks(inode, iblock, 1);
+		if (err)
+			goto err;
+
+		block = pram_find_data_block(inode, iblock);
+		if (!block) {
+			err = -ENODATA;
+			goto err;
+		}
+	}
+
+	*data_block = block;
+	err = 0;
+
+ err:
+	mutex_unlock(&PRAM_I(inode)->truncate_mutex);
+	return err;
+}
+
+static inline int __pram_get_block(struct inode *inode, pgoff_t pgoff, int create,
+		   sector_t *result)
+{
+	int rc = 0;
+
+	rc = pram_find_and_alloc_blocks(inode, (sector_t)pgoff, result, create);
+
+	if (rc == -ENODATA)
+		BUG_ON(create);
+
+	return rc;
+}
+
+int pram_get_xip_mem(struct address_space *mapping, pgoff_t pgoff, int create,
+				void **kmem, unsigned long *pfn)
+{
+	int rc;
+	sector_t block;
+
+	/* first, retrieve the block */
+	rc = __pram_get_block(mapping->host, pgoff, create, &block);
+	if (rc)
+		goto exit;
+
+	*kmem = pram_get_block(mapping->host->i_sb, block);
+	*pfn = page_to_pfn(virt_to_page((unsigned long)*kmem));
+
+exit:
+	return rc;
+}
diff --git a/fs/pramfs/xip.h b/fs/pramfs/xip.h
new file mode 100644
index 0000000..797f1b0
--- /dev/null
+++ b/fs/pramfs/xip.h
@@ -0,0 +1,28 @@
+/*
+ * BRIEF DESCRIPTION
+ *
+ * XIP operations.
+ *
+ * Copyright 2009-2010 Marco Stornelli <marco.stornelli@gmail.com>
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#ifdef CONFIG_PRAMFS_XIP
+int pram_get_xip_mem(struct address_space *, pgoff_t, int, void **,
+							      unsigned long *);
+static inline int pram_use_xip(struct super_block *sb)
+{
+	struct pram_sb_info *sbi = (struct pram_sb_info *)sb->s_fs_info;
+	return sbi->s_mount_opt & PRAM_MOUNT_XIP;
+}
+#define mapping_is_xip(map) unlikely(map->a_ops->get_xip_mem)
+
+#else
+
+#define mapping_is_xip(map)	0
+#define pram_use_xip(sb)	0
+#define pram_get_xip_mem	NULL
+
+#endif
