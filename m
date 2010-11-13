From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 07/16 v3] pramfs: symbolic links
Date: Sat, 13 Nov 2010 15:51:26 +0100
Message-ID: <4CDEA5EE.6000008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=80z8+TTcxKqm7gnlpq+BK4N6i4DSl3tZ4xnJPYUksfY=;
        b=qE653tqeGbKGeqYz8xp6diQX4NzEc4h13CoHW0IXIiqZB26RaG+ZhBqd3xj8zaZw3N
         xUdxrq7Le9lh4qoWXc+qxhm1G/zv9ZrX4bKmaK8jwUq+NLibaFOsSUq3dDlljGj04aha
         UUv+T18lv1B0zHvJOYaN5E7q73If+5gyKOPAQ=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

From: Marco Stornelli <marco.stornelli@gmail.com>

Symlink operations.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff -Nurp linux-2.6.36-orig/fs/pramfs/symlink.c linux-2.6.36/fs/pramfs/symlink.c
--- linux-2.6.36-orig/fs/pramfs/symlink.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/symlink.c	2010-09-14 18:49:52.000000000 +0200
@@ -0,0 +1,78 @@
+/*
+ * FILE NAME fs/pramfs/symlink.c
+ *
+ * BRIEF DESCRIPTION
+ *
+ * Symlink operations
+ *
+ * Copyright 2009-2010 Marco Stornelli <marco.stornelli@gmail.com>
+ * Copyright 2003 Sony Corporation
+ * Copyright 2003 Matsushita Electric Industrial Co., Ltd.
+ * 2003-2004 (c) MontaVista Software, Inc. , Steve Longerbeam
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/fs.h>
+#include "pram.h"
+#include "xattr.h"
+
+int pram_block_symlink(struct inode *inode, const char *symname, int len)
+{
+	struct super_block *sb = inode->i_sb;
+	u64 block;
+	char *blockp;
+	int err;
+
+	err = pram_alloc_blocks(inode, 0, 1);
+	if (err)
+		return err;
+
+	block = pram_find_data_block(inode, 0);
+	blockp = pram_get_block(sb, block);
+
+	pram_memunlock_block(sb, blockp);
+	memcpy(blockp, symname, len);
+	blockp[len] = '\0';
+	pram_memlock_block(sb, blockp);
+	return 0;
+}
+
+static int pram_readlink(struct dentry *dentry, char *buffer, int buflen)
+{
+	struct inode *inode = dentry->d_inode;
+	struct super_block *sb = inode->i_sb;
+	u64 block;
+	char *blockp;
+
+	block = pram_find_data_block(inode, 0);
+	blockp = pram_get_block(sb, block);
+	return vfs_readlink(dentry, buffer, buflen, blockp);
+}
+
+static void *pram_follow_link(struct dentry *dentry, struct nameidata *nd)
+{
+	struct inode *inode = dentry->d_inode;
+	struct super_block *sb = inode->i_sb;
+	off_t block;
+	int status;
+	char *blockp;
+
+	block = pram_find_data_block(inode, 0);
+	blockp = pram_get_block(sb, block);
+	status = vfs_follow_link(nd, blockp);
+	return ERR_PTR(status);
+}
+
+struct inode_operations pram_symlink_inode_operations = {
+	.readlink	= pram_readlink,
+	.follow_link	= pram_follow_link,
+	.setattr	= pram_notify_change,
+#ifdef CONFIG_PRAMFS_XATTR
+	.setxattr	= generic_setxattr,
+	.getxattr	= generic_getxattr,
+	.listxattr	= pram_listxattr,
+	.removexattr	= generic_removexattr,
+#endif
+};
 
