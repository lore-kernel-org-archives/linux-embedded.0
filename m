From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 05/16 v5] pramfs: block allocation
Date: Thu, 16 Dec 2010 19:00:18 +0100
Message-ID: <4D0A53B2.8080307@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=Auyj2z+oPL+my/b+v8NZQsNqvs4c+UFqvsuOtHm4QKI=;
        b=Hh1/EGWWFcq81PTZm4SFlOmh4UCy/eN0hzM3rJf8ZHiuN5Xi6HUaMGMfzAwY0hByZs
         tCNCXzDDMXp/qWYEO9mh7miHTBKAtC/sMqMifijA+29kUngsMqxQn3PQ4q4JYGGgwX3Q
         7zsjHDWr4JPxMmF2nJiw2gZmezgMegwDq4lCk=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Tim Bird <tim.bird@am.sony.com>

From: Marco Stornelli <marco.stornelli@gmail.com>

Block allocation operations.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff -Nurp linux-2.6.36-orig/fs/pramfs/balloc.c linux-2.6.36/fs/pramfs/balloc.c
--- linux-2.6.36-orig/fs/pramfs/balloc.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/balloc.c	2010-12-12 17:19:21.000000000 +0100
@@ -0,0 +1,147 @@
+/*
+ * BRIEF DESCRIPTION
+ *
+ * The blocks allocation and deallocation routines.
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
+#include <linux/bitops.h>
+#include "pram.h"
+
+/*
+ * This just marks in-use the blocks that make up the bitmap.
+ * The bitmap must be writeable before calling.
+ */
+void pram_init_bitmap(struct super_block *sb)
+{
+	struct pram_super_block *ps = pram_get_super(sb);
+	unsigned long *bitmap = pram_get_bitmap(sb);
+	int blocks = be32_to_cpu(ps->s_bitmap_blocks);
+
+	memset(bitmap, 0, blocks << sb->s_blocksize_bits);
+
+	bitmap_fill(bitmap, blocks);
+}
+
+
+/* Free absolute blocknr */
+void pram_free_block(struct super_block *sb, unsigned long blocknr)
+{
+	struct pram_super_block *ps;
+	u64 bitmap_block;
+	unsigned long bitmap_bnr;
+	void *bitmap;
+	void *bp;
+
+	lock_super(sb);
+
+	bitmap = pram_get_bitmap(sb);
+	/*
+	 * find the block within the bitmap that contains the inuse bit
+	 * for the block we need to free. We need to unlock this bitmap
+	 * block to clear the inuse bit.
+	 */
+	bitmap_bnr = blocknr >> (3 + sb->s_blocksize_bits);
+	bitmap_block = pram_get_block_off(sb, bitmap_bnr);
+	bp = pram_get_block(sb, bitmap_block);
+
+	pram_memunlock_block(sb, bp);
+	pram_clear_bit(blocknr, bitmap); /* mark the block free */
+	pram_memlock_block(sb, bp);
+	
+	ps = pram_get_super(sb);
+	pram_memunlock_super(sb, ps);
+	
+	if (blocknr < be32_to_cpu(ps->s_free_blocknr_hint))
+		ps->s_free_blocknr_hint = cpu_to_be32(blocknr);
+	be32_add_cpu(&ps->s_free_blocks_count, 1);
+	pram_memlock_super(sb, ps);
+	
+	unlock_super(sb);
+}
+
+
+/*
+ * allocate a block and return it's absolute blocknr. Zeroes out the
+ * block if zero set.
+ */
+int pram_new_block(struct super_block *sb, unsigned long *blocknr, int zero)
+{
+	struct pram_super_block *ps;
+	u64 bitmap_block;
+	unsigned long bnr, bitmap_bnr;
+	int errval;
+	void *bitmap;
+	void *bp;
+
+	lock_super(sb);
+	ps = pram_get_super(sb);
+	bitmap = pram_get_bitmap(sb);
+
+	if (ps->s_free_blocks_count) {
+		/* find the oldest unused block */
+		bnr = pram_find_next_zero_bit(bitmap,
+					 be32_to_cpu(ps->s_blocks_count),
+					 be32_to_cpu(ps->s_free_blocknr_hint));
+
+		if (bnr < be32_to_cpu(ps->s_bitmap_blocks) ||
+				bnr >= be32_to_cpu(ps->s_blocks_count)) {
+			pram_dbg("no free blocks found!\n");
+			errval = -ENOSPC;
+			goto fail;
+		}
+
+		pram_memunlock_super(sb, ps);
+		be32_add_cpu(&ps->s_free_blocks_count, -1);
+		if (bnr < (be32_to_cpu(ps->s_blocks_count)-1))
+			ps->s_free_blocknr_hint = cpu_to_be32(bnr+1);
+		else
+			ps->s_free_blocknr_hint = 0;
+		pram_memlock_super(sb, ps);
+	} else {
+		pram_dbg("all blocks allocated\n");
+		errval = -ENOSPC;
+		goto fail;
+	}
+
+	/*
+	 * find the block within the bitmap that contains the inuse bit
+	 * for the unused block we just found. We need to unlock it to
+	 * set the inuse bit.
+	 */
+	bitmap_bnr = bnr >> (3 + sb->s_blocksize_bits);
+	bitmap_block = pram_get_block_off(sb, bitmap_bnr);
+	bp = pram_get_block(sb, bitmap_block);
+
+	pram_memunlock_block(sb, bp);
+	pram_set_bit(bnr, bitmap); /* mark the new block in use */
+	pram_memlock_block(sb, bp);
+
+	if (zero) {
+		bp = pram_get_block(sb, pram_get_block_off(sb, bnr));
+		pram_memunlock_block(sb, bp);
+		memset(bp, 0, sb->s_blocksize);
+		pram_memlock_block(sb, bp);
+	}
+
+	*blocknr = bnr;
+	pram_dbg("allocated blocknr %lu", bnr);
+	errval = 0;
+ fail:
+	unlock_super(sb);
+	return errval;
+}
+
+unsigned long pram_count_free_blocks(struct super_block *sb)
+{
+	struct pram_super_block *ps = pram_get_super(sb);
+	return be32_to_cpu(ps->s_free_blocks_count);
+}
