From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 15/17] pramfs: test module
Date: Thu, 06 Jan 2011 13:04:32 +0100
Message-ID: <4D25AFD0.9030809@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=lZ2SqAml33Teoma64riIzFyrVQGHoFeW8zZEbtmBkcg=;
        b=jX5Y8dXJLxai2aL6buVyxY2uTf624hRO3yQavJmPC6ewJDZyRvNL4mYP5lDzeSYZFI
         Kk9bKmeTcBOIJXejWHGMxWjIKAiM68Li5WE4mU2gp3mvrtIg33QsNpp7coKR/nu+2Gaz
         zlkZHBMZL/mz6NlTH2eI4qZ0EcgwTuMz6xX6U=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

From: Marco Stornelli <marco.stornelli@gmail.com>

Test module.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff --git a/fs/pramfs/pramfs_test.c b/fs/pramfs/pramfs_test.c
new file mode 100644
index 0000000..24e016f
--- /dev/null
+++ b/fs/pramfs/pramfs_test.c
@@ -0,0 +1,47 @@
+/*
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
+			"%s: PRAMFS super block not found (not mounted?)\n",
+			__func__);
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
