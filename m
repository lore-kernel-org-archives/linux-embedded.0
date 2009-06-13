From: Marco <marco.stornelli@gmail.com>
Subject: [PATCH 11/14] Pramfs: Symbolic link operations
Date: Sat, 13 Jun 2009 15:22:41 +0200
Message-ID: <4A33A821.4070605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=Wpz/wOx7G+UC6YjWDfhfxO+t2RtDMAw80Lde10sEF4I=;
        b=ckiY35H2h0GHQJr/VMiTniD/KT8bCJdiJYqhi3Un7fL6+Kpbfrrfn1slMcMY2hYgXj
         UGGkaatGU22R6Pb0RQduyPRw+ZlavbaH55EzrLYLVsIplYQTI0qqexcS0XiHh68/uP7S
         nlc/QcF/fNZN2+SBr0tGTEj0LYa/XtNw6VLaY=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

From: Marco Stornelli <marco.stornelli@gmail.com>

Symbolic link operations.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---

diff -uprN linux-2.6.30-orig/fs/pramfs/symlink.c linux-2.6.30/fs/pramfs/symlink.c
--- linux-2.6.30-orig/fs/pramfs/symlink.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.30/fs/pramfs/symlink.c	2009-06-13 12:54:07.000000000 +0200
@@ -0,0 +1,73 @@
+/*
+ * FILE NAME fs/pramfs/symlink.c
+ *
+ * BRIEF DESCRIPTION
+ *
+ * Symlink operations
+ *
+ * Copyright 2009 Marco Stornelli <marco.stornelli@gmail.com>
+ * Copyright 2003 Sony Corporation
+ * Copyright 2003 Matsushita Electric Industrial Co., Ltd.
+ * 2003-2004 (c) MontaVista Software, Inc. , Steve Longerbeam
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/fs.h>
+#include "pram_fs.h"
+
+int pram_block_symlink(struct inode *inode, const char *symname, int len)
+{
+	struct super_block *sb = inode->i_sb;
+	off_t block;
+	char *blockp;
+	int err;
+	unsigned long flags;
+
+	flags = 0;
+
+	err = pram_alloc_blocks(inode, 0, 1);
+	if (err)
+		return err;
+
+	block = pram_find_data_block(inode, 0);
+	blockp = pram_get_block(sb, block);
+
+	pram_lock_block(sb, blockp, flags);
+	memcpy(blockp, symname, len);
+	blockp[len] = '\0';
+	pram_unlock_block(sb, blockp, flags);
+	return 0;
+}
+
+static int pram_readlink(struct dentry *dentry, char *buffer, int buflen)
+{
+	struct inode *inode = dentry->d_inode;
+	struct super_block *sb = inode->i_sb;
+	off_t block;
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
+};



