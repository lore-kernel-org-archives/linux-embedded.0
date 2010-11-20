From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 14/16 v4] pramfs: write protection
Date: Sat, 20 Nov 2010 11:02:59 +0100
Message-ID: <4CE79CD3.9040203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=yQS3R+dUhEyP0fbwCXqNRrZlU4b9fMeFsezPiaUVNsQ=;
        b=nFv8O59xqSCn6tNQpI077JFAFBr/dhMhitDmZQ0jg7sUqjlrqHDAr2f7QA9WSJSdno
         eKEvizUxvTVI1Ll5QwcqX97VnnH4JjYJMoN3WI5WnhTJidgmsrv8OlXT+2yE7jU65mgW
         60iKzeLxsqZTFXBU2nyw2CKtEnB8qXzWh1xIQ=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>

From: Marco Stornelli <marco.stornelli@gmail.com>

Memory write protection.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff -Nurp linux-2.6.36-orig/fs/pramfs/wprotect.c linux-2.6.36/fs/pramfs/wprotect.c
--- linux-2.6.36-orig/fs/pramfs/wprotect.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/wprotect.c	2010-10-30 11:59:54.000000000 +0200
@@ -0,0 +1,41 @@
+/*
+ * FILE NAME fs/pramfs/wprotect.c
+ *
+ * BRIEF DESCRIPTION
+ *
+ * Write protection for the filesystem pages.
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
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/io.h>
+#include "pram.h"
+
+void pram_writeable(void *vaddr, unsigned long size, int rw)
+{
+	int ret = 0;
+	unsigned long nrpages = size >> PAGE_SHIFT;
+	unsigned long addr = (unsigned long)vaddr;
+
+	/* Page aligned */
+	addr &= PAGE_MASK;
+
+	if (size & (PAGE_SIZE - 1))
+		nrpages++;
+
+	if (rw)
+		ret = set_memory_rw(addr, nrpages);
+	else
+		ret = set_memory_ro(addr, nrpages);
+
+	BUG_ON(ret);
+}
