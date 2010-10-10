From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 15/16] pramfs: test module
Date: Sun, 10 Oct 2010 18:37:49 +0200
Message-ID: <4CB1EBDD.8050509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=rQg6dttPlqMSQdh0jaIUwCLrPAgZf1hsLvxBJNzRomg=;
        b=A88vT/D1XIeFdpW/DXq6G50AzK5+96uCw+9N5wgQooNSmndDxrNY393v5YWnXV3fj0
         zpacLWHfTQkf2/pOUIKivbScJQXy7fhZuNtWH2GxP8YFKRVXvSuGxxBraj/aUBKcLAqD
         lajvFY1areKvXI0sWZ+JNOL96ViUW32VK3zps=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

From: Marco Stornelli <marco.stornelli@gmail.com>

Test module.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff -Nurp linux-2.6.36-orig/fs/pramfs/pramfs_test.c linux-2.6.36/fs/pramfs/pramfs_test.c
--- linux-2.6.36-orig/fs/pramfs/pramfs_test.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/pramfs_test.c	2010-09-14 18:49:52.000000000 +0200
@@ -0,0 +1,49 @@
+/*
+ * FILE NAME fs/pramfs/namei.c
+ *
+ * BRIEF DESCRIPTION
+ *
+ * Pramfs test module.
+ *
+ * Copyright 2009-2010 Marco Stornelli <marco.stornelli@gmail.com>
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
+#include "pram.h"
+
+int __init test_pramfs_write(void)
+{
+	struct pram_super_block *psb;
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
+	 * Attempt an unprotected clear of checksum information in the
+	 * superblock, this should cause a kernel page protection fault.
+	 */
+	printk("%s: writing to kernel VA %p\n", __func__, psb);
+	psb->s_sum = 0;
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
 
