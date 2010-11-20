From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 10/16 v4] pramfs: xip operations
Date: Sat, 20 Nov 2010 11:01:07 +0100
Message-ID: <4CE79C63.5000508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=WnzsxHU91B+Zxl1f3s8Zo6WiC8CpwubJK5TI57lodz8=;
        b=JDVKoQLNEt4dBtCqm++QUpAJeDKGquVOtZFUTKXOnY7CW/ff2ONpi+w9+2ahbNVmcY
         Sbf9QmHH3qrlldvGiMqTSb4mCvvvOcpQTMV8kFQHM2zjAqi5etMh0ny27Wxtf1eM5NW9
         QtpQ6RDmVlxnNWi+2EtYvNYDOmFXaySY10EWQ=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Tim Bird <tim.bird@am.sony.com>, Greg Kroah-Hartman <gregkh@suse.de>

From: Marco Stornelli <marco.stornelli@gmail.com>

XIP operations.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff -Nurp linux-2.6.36-orig/fs/pramfs/xip.c linux-2.6.36/fs/pramfs/xip.c
--- linux-2.6.36-orig/fs/pramfs/xip.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/xip.c	2010-09-14 18:49:52.000000000 +0200
@@ -0,0 +1,90 @@
+/*
+ * FILE NAME fs/pramfs/xip.c
+ *
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
+
+static int __pram_get_block(struct inode *inode, pgoff_t pgoff, int create,
+		   sector_t *result)
+{
+	int rc = 0;
+	sector_t iblock;
+
+	/* find starting block number to access */
+	iblock = (sector_t)pgoff << (PAGE_CACHE_SHIFT - inode->i_blkbits);
+
+	rc = pram_find_and_alloc_blocks(inode, iblock, result, create);
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
diff -Nurp linux-2.6.36-orig/fs/pramfs/xip.h linux-2.6.36/fs/pramfs/xip.h
--- linux-2.6.36-orig/fs/pramfs/xip.h	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/xip.h	2010-09-14 18:49:52.000000000 +0200
@@ -0,0 +1,24 @@
+/*
+ * FILE NAME fs/pramfs/xip.h
+ *
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
+
+int pram_get_xip_mem(struct address_space *, pgoff_t, int, void **,
+							      unsigned long *);
+
+#else
+
+#define pram_get_xip_mem NULL
+
+#endif
+
 
