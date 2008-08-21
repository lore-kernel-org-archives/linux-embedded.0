From: Jared Hulbert <jaredeh@gmail.com>
Subject: [PATCH 10/10] AXFS: axfs_uncompress.c
Date: Wed, 20 Aug 2008 22:46:14 -0700
Message-ID: <48AD0126.1050609@gmail.com>
Reply-To: jaredeh@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=vmsyeRdJKQO3vnac2z9RSLKzb3eLaSSXvX3PrXVmF9o=;
        b=id9zLvBLaYE5BJ+lhOqMXJ7dIrEYQxiqitjgYDtACmX3PQ2ZCMtKqoRQIpZnbKCgOq
         5Zc37WCGMfc0azV0vjjFPhGfEhSXZGP1mepKx198Hvt+hh/IubA2en7MyTGRNKCjAA7w
         ty1neAMU52l32blXGEE6xWGiJ+qfQvu24f0t4=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@d

Handles the decompression for axfs, modeled after fs/cramfs/uncompress.c.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
diff --git a/fs/axfs/axfs_uncompress.c b/fs/axfs/axfs_uncompress.c
new file mode 100644
index 0000000..b7a2060
--- /dev/null
+++ b/fs/axfs/axfs_uncompress.c
@@ -0,0 +1,97 @@
+/*
+ * Advanced XIP File System for Linux - AXFS
+ *   Readonly, compressed, and XIP filesystem for Linux systems big and small
+ *
+ *   Modified in 2006 by Eric Anderson
+ *     from the cramfs sources fs/cramfs/uncompress.c
+ *
+ * (C) Copyright 1999 Linus Torvalds
+ *
+ * axfs_uncompress.c -
+ *  axfs interfaces to the uncompression library. There's really just
+ * three entrypoints:
+ *
+ *  - axfs_uncompress_init() - called to initialize the thing.
+ *  - axfs_uncompress_exit() - tell me when you're done
+ *  - axfs_uncompress_block() - uncompress a block.
+ *
+ * NOTE NOTE NOTE! The uncompression is entirely single-threaded. We
+ * only have one stream, and we'll initialize it only once even if it
+ * then is used by multiple filesystems.
+ *
+ */
+
+#include <linux/errno.h>
+#include <linux/vmalloc.h>
+#include <linux/zlib.h>
+#include <linux/mutex.h>
+
+static z_stream stream;
+static int initialized;
+static struct mutex axfs_uncmp_mutex;
+
+int axfs_uncompress_block(void *dst, int dstlen, void *src, int srclen)
+{
+	int err;
+	int out;
+
+	mutex_lock(&axfs_uncmp_mutex);
+
+	stream.next_in = src;
+	stream.avail_in = srclen;
+
+	stream.next_out = dst;
+	stream.avail_out = dstlen;
+
+	err = zlib_inflateReset(&stream);
+	if (err != Z_OK) {
+		printk(KERN_ERR "zlib_inflateReset error %d\n", err);
+		zlib_inflateEnd(&stream);
+		zlib_inflateInit(&stream);
+	}
+
+	err = zlib_inflate(&stream, Z_FINISH);
+	if (err != Z_STREAM_END)
+		goto err;
+
+	out = stream.total_out;
+
+	mutex_unlock(&axfs_uncmp_mutex);
+
+	return out;
+
+err:
+
+	mutex_unlock(&axfs_uncmp_mutex);
+
+	printk(KERN_ERR "Error %d while decompressing!\n", err);
+	printk(KERN_ERR "%p(%d)->%p(%d)\n", src, srclen, dst, dstlen);
+	return 0;
+}
+
+int axfs_uncompress_init(void)
+{
+	if (!initialized++) {
+
+		mutex_init(&axfs_uncmp_mutex);
+
+		stream.workspace = vmalloc(zlib_inflate_workspacesize());
+		if (!stream.workspace) {
+			initialized = 0;
+			return -ENOMEM;
+		}
+		stream.next_in = NULL;
+		stream.avail_in = 0;
+		zlib_inflateInit(&stream);
+	}
+	return 0;
+}
+
+int axfs_uncompress_exit(void)
+{
+	if (!--initialized) {
+		zlib_inflateEnd(&stream);
+		vfree(stream.workspace);
+	}
+	return 0;
+}

