From: Marco <marco.stornelli@gmail.com>
Subject: [PATCH 05/14] Pramfs: File operations for files
Date: Sat, 13 Jun 2009 15:21:38 +0200
Message-ID: <4A33A7E2.9020803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=hTNwo6IgbhU+NZ10Kqp8OB9Eru0mjLLhvcWVAR+nYoE=;
        b=V8xrytwpEplFBwYVqG4QW/cq+zhIfAR3JP6XV5msX9UMcGErIIKrdzD/1hA4X1CVci
         YVkDPKe7bKYc28WdSwOimEISfURFxqqktGMy6/THv2CDKyfiMGJ35SxGr9gi32Zf7MPU
         g9AcsvQIZuD36G2ef7vucb6BQG5LCmLJWRI7Q=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

From: Marco Stornelli <marco.stornelli@gmail.com>

File operations for files.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---

diff -uprN linux-2.6.30-orig/fs/pramfs/file.c linux-2.6.30/fs/pramfs/file.c
--- linux-2.6.30-orig/fs/pramfs/file.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.30/fs/pramfs/file.c	2009-06-13 12:52:56.000000000 +0200
@@ -0,0 +1,141 @@
+/*
+ * FILE NAME fs/pramfs/file.c
+ *
+ * BRIEF DESCRIPTION
+ *
+ * File operations for files.
+ *
+ * Copyright 2009 Marco Stornelli <marco.stornelli@gmail.com>
+ * Copyright 2003 Sony Corporation
+ * Copyright 2003 Matsushita Electric Industrial Co., Ltd.
+ * 2003-2004 (c) MontaVista Software, Inc. , Steve Longerbeam
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+#include <linux/fs.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/uio.h>
+#include <linux/uaccess.h>
+#include "pram_fs.h"
+#include "xip.h"
+
+static int pram_open_file(struct inode *inode, struct file *filp)
+{
+#ifndef CONFIG_PRAMFS_XIP
+	/* Without XIP we force to use Direct IO */
+	filp->f_flags |= O_DIRECT;
+#endif
+	return generic_file_open(inode, filp);
+}
+
+/*
+ * Called when an inode is released. Note that this is different
+ * from pram_open_file: open gets called at every open, but release
+ * gets called only when /all/ the files are closed.
+ */
+static int pram_release_file(struct inode *inode, struct file *filp)
+{
+	return 0;
+}
+
+ssize_t __pram_direct_IO(int rw, struct kiocb *iocb,
+		   const struct iovec *iov,
+		   loff_t offset, unsigned long nr_segs)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file->f_mapping->host;
+	struct super_block *sb = inode->i_sb;
+	int progress = 0;
+	ssize_t retval = 0;
+	struct pram_inode *pi;
+	void *tmp = NULL;
+	unsigned long flags;
+	unsigned long blocknr, blockoff;
+	int num_blocks, blocksize_mask, blocksize, blocksize_bits;
+	char __user *buf = iov->iov_base;
+	size_t length = iov->iov_len;
+
+	flags = 0;
+
+	if (length < 0)
+		return -EINVAL;
+	if ((rw == READ) && (offset + length > inode->i_size))
+		length = inode->i_size - offset;
+	if (!length)
+		goto out;
+
+	blocksize_bits = inode->i_sb->s_blocksize_bits;
+	blocksize = 1 << blocksize_bits;
+	blocksize_mask = blocksize - 1;
+
+	/* find starting block number to access */
+	blocknr = offset >> blocksize_bits;
+	/* find starting offset within starting block */
+	blockoff = offset & blocksize_mask;
+	/* find number of blocks to access */
+	num_blocks = (blockoff + length + blocksize_mask) >> blocksize_bits;
+
+	if (rw == WRITE) {
+		/* prepare a temporary buffer to hold a user data block
+		   for writing. */
+		tmp = kmalloc(blocksize, GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+		/* now allocate the data blocks we'll need */
+		retval = pram_alloc_blocks(inode, blocknr, num_blocks);
+		if (retval)
+			goto fail;
+	}
+
+	pi = pram_get_inode(inode->i_sb, inode->i_ino);
+
+	while (length) {
+		int count;
+		off_t block = pram_find_data_block(inode, blocknr++);
+		u8 *bp = (u8 *)pram_get_block(sb, block);
+		if (!bp)
+			goto fail;
+
+		count = blockoff + length > blocksize ?
+			blocksize - blockoff : length;
+
+		if (rw == READ) {
+			copy_to_user(buf, &bp[blockoff], count);
+		} else {
+			copy_from_user(tmp, buf, count);
+
+			pram_lock_block(inode->i_sb, bp, flags);
+			memcpy(&bp[blockoff], tmp, count);
+			pram_unlock_block(inode->i_sb, bp, flags);
+		}
+
+		progress += count;
+		buf += count;
+		length -= count;
+		blockoff = 0;
+	}
+
+	retval = progress;
+ fail:
+	kfree(tmp);
+ out:
+	return retval;
+}
+
+struct file_operations pram_file_operations = {
+	.llseek		= generic_file_llseek,
+	.read		= pram_read,
+	.write		= pram_write,
+	.aio_read	= pram_aio_read,
+	.aio_write	= pram_aio_write,
+	.mmap		= pram_mmap,
+	.open		= pram_open_file,
+	.release	= pram_release_file,
+	.fsync		= simple_sync_file,
+};
+
+struct inode_operations pram_file_inode_operations = {
+	.truncate	= pram_truncate,
+};

