From: Jared Hulbert <jaredeh@gmail.com>
Subject: [PATCH 09/10] AXFS: axfs_uml.c
Date: Wed, 20 Aug 2008 22:46:02 -0700
Message-ID: <48AD011A.30505@gmail.com>
Reply-To: jaredeh@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=o1pVxoX5Mh8tpjGEd52bLk/47WY9VPPJh0qLfQGGkxo=;
        b=TqmEfbAw4SjbVHImbhLaT9QL22KFvAOMX4tzs/yd+0D1b94HSBlMQLjB9R7bn68Ue7
         MzbbyCBQTgc5z65tZgcSev+vbk4qQmbZutozbG8VcGw6/ynLAW156kvrT5KSCIK5Urmo
         UcpFHP+95rFjhInF2LioyctAovp//z3YAwXO8=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@d

UML specific code for working with iomem 'devices'.  UML is handy for testing.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
diff --git a/fs/axfs/axfs_uml.c b/fs/axfs/axfs_uml.c
new file mode 100644
index 0000000..7d479a0
--- /dev/null
+++ b/fs/axfs/axfs_uml.c
@@ -0,0 +1,47 @@
+/*
+ * Advanced XIP File System for Linux - AXFS
+ *   Readonly, compressed, and XIP filesystem for Linux systems big and small
+ *
+ * Copyright(c) 2008 Numonyx
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * Authors:
+ *  Jared Hulbert <jaredeh@gmail.com>
+ *
+ * Project url: http://axfs.sourceforge.net
+ *
+ * axfs_uml.c -
+ *   Allows axfs to a UML kernels find_iomem() interface as an XIP device or
+ *   dummy functions if this is not a UML build.
+ */
+
+#include <linux/axfs.h>
+#ifdef CONFIG_UML
+#include <mem_user.h>
+int axfs_get_uml_address(char *iomem, unsigned long *address,
+			 unsigned long *length)
+{
+	*address = find_iomem(iomem, length);
+	if (!(*address)) {
+		printk(KERN_DEBUG "axfs: find_iomem() failed\n");
+		return -EINVAL;
+	}
+
+	if (*length < PAGE_SIZE) {
+		printk(KERN_DEBUG
+		       "axfs: iomem() too small, must be at least %li Bytes\n",
+		       PAGE_SIZE);
+		return -EINVAL;
+	}
+	return 0;
+}
+#else
+int axfs_get_uml_address(char *iomem, unsigned long *address,
+			 unsigned long *length)
+{
+	return 0;
+}
+#endif /* CONFIG_UML */

