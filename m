From: Jared Hulbert <jaredeh@gmail.com>
Subject: [PATCH 02/10] AXFS: Kconfig and Makefiles
Date: Wed, 20 Aug 2008 22:45:03 -0700
Message-ID: <48AD00DF.9080207@gmail.com>
Reply-To: jaredeh@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=IgB3mlr3haMM80s/qop/CIGViHVUVvqS/X3T2GrGWEo=;
        b=e8Elv9e4W+cd1Jcfg1YWjMjOAOyHOV0jakxkebbv88wZBOvnHX9jgZvqc6a6hpGJwK
         3tw5bePP1UkEAXuyn8Jr+7DC+7WZKbQnU7HEuAMc5mHUM4C9MJ/uZnLXPzy4I9teciOq
         fWqD6Qq7I7PYvPsU+L7dSaXgmi+fb1ijDs82w=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@d

The Kconfig edits and Makefiles required for AXFS.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
diff --git a/fs/Kconfig b/fs/Kconfig
index d387358..02d5f48 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -1033,6 +1033,26 @@ config AFFS_FS
 	  To compile this file system support as a module, choose M here: the
 	  module will be called affs.  If unsure, say N.
 
+config AXFS
+	tristate "Advanced XIP File System (AXFS) support (EXPERIMENTAL)"
+	select FS_XIP
+	select ZLIB_INFLATE
+	default n
+	help
+	  The Advanced XIP File System or (AXFS) is a highly compressed
+	  readonly filesystem like cramfs or squashfs.  It also can be
+	  configured to store individual pages of files compressed or
+	  uncompressed as XIP pages.  This allows for faster boot up and
+	  application launch time with a smaller memory footprint.
+
+config AXFS_PROFILING
+	bool "Profiling extensions for AXFS (EXPERIMENTAL)"
+	depends on AXFS
+	default n
+	help
+	  Profiling tooling used to identify what pages in the filesystem
+	  image are actually accessed and how much.
+
 config ECRYPT_FS
 	tristate "eCrypt filesystem layer support (EXPERIMENTAL)"
 	depends on EXPERIMENTAL && KEYS && CRYPTO && NET
diff --git a/fs/Makefile b/fs/Makefile
index a1482a5..8636019 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_JBD)		+= jbd/
 obj-$(CONFIG_JBD2)		+= jbd2/
 obj-$(CONFIG_EXT2_FS)		+= ext2/
 obj-$(CONFIG_CRAMFS)		+= cramfs/
+obj-$(CONFIG_AXFS)		+= axfs/
 obj-y				+= ramfs/
 obj-$(CONFIG_HUGETLBFS)		+= hugetlbfs/
 obj-$(CONFIG_CODA_FS)		+= coda/
diff --git a/fs/axfs/Makefile b/fs/axfs/Makefile
new file mode 100644
index 0000000..4c40e13
--- /dev/null
+++ b/fs/axfs/Makefile
@@ -0,0 +1,7 @@
+#
+# Makefile for the linux axfs routines
+#
+
+obj-$(CONFIG_AXFS) += axfs.o
+
+axfs-objs := axfs_inode.o axfs_super.o axfs_uncompress.o axfs_profiling.o axfs_uml.o axfs_mtd.o axfs_bdev.o

