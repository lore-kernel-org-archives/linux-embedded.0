From: Marco <marco.stornelli@gmail.com>
Subject: [PATCH 12/14] Pramfs: test module
Date: Sat, 13 Jun 2009 15:22:51 +0200
Message-ID: <4A33A82B.9070306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=ClYCp9LvW5VEcADEQWunu03rqAygKJ3UKvG306qsCg4=;
        b=RFMGwnFravtLO3pJF+xlhxtoLjY7kuiIVIlWbYTtWHtTcNYKphGTmdBuhLIsmZRfZO
         Rl4gMZQHUwHWZGzryqPzLGzyvK+S5iauR5JhWtXxdNh4+zB0I5bKE4GNA+c7T9QwnjVm
         1tIBEnITCnKD0gyfUul5Fen4cUuL2mkhrJ8H8=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

From: Marco Stornelli <marco.stornelli@gmail.com>

Test module.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff -uprN linux-2.6.30-orig/fs/pramfs/pramfs_test.c linux-2.6.30/fs/pramfs/pramfs_test.c
--- linux-2.6.30-orig/fs/pramfs/pramfs_test.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.30/fs/pramfs/pramfs_test.c	2009-06-13 13:07:38.000000000 +0200
@@ -0,0 +1,50 @@
+/*
+ * FILE NAME fs/pramfs/namei.c
+ *
+ * BRIEF DESCRIPTION
+ *
+ * Inode operations for directories.
+ *
+ * Copyright 2009 Marco Stornelli <marco.stornelli@gmail.com>
+ * Copyright 2003 Sony Corporation
+ * Copyright 2003 Matsushita Electric Industrial Co., Ltd.
+ * 2003-2004 (c) MontaVista Software, Inc. , Steve Longerbeam
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+#include <linux/module.h>
+#include <linux/version.h>
+#include <linux/init.h>
+#include <linux/fs.h>
+#include "pram_fs.h"
+
+int __init test_pramfs_write(void)
+{
+	struct pram_super_block *psb;
+	char *ptr;
+
+	psb = get_pram_super();
+	if (!psb) {
+		printk(KERN_ERR
+		"%s: PRAMFS super block not found (not mounted?)\n",
+		__func__);
+		return 1;
+	}
+
+	/*
+	 * Attempt an unprotected clear of all information in the superblock,
+	 * this should cause a kernel page protection fault.
+	 */
+	printk("%s: writing to kernel VA %p\n", __func__, psb);
+	memset(psb, 0 , PRAM_SB_SIZE);
+
+	return 0;
+}
+
+void test_pramfs_write_cleanup(void) {}
+
+/* Module information */
+MODULE_LICENSE("GPL");
+module_init(test_pramfs_write);
+module_exit(test_pramfs_write_cleanup);

