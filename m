From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 16/16 v2] pramfs: Makefile and Kconfig
Date: Sat, 06 Nov 2010 10:01:29 +0100
Message-ID: <4CD51969.3060603@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=Wdiv6AppjHrKZNLzIoAG+daKICFrKD40ILBrTbz7ckQ=;
        b=Y+OSoTsROpiX4jJWdXXlVxcLPg/wLJO+jkOo3vYEMpBMGtuAnvhxwbAJPehrVR1ffM
         i04M9Krl4AeOmkaDQ7tV59UIWP9+Av5aZhA4ET8Xd1XMa2Xj/I3lNvKk6yy8R6Wa1XIi
         JS2FU7I0/WRTr++uWkKGkHYR/UcPxDBo+Ljdw=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

From: Marco Stornelli <marco.stornelli@gmail.com>

Makefile and Kconfig.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---
diff -Nurp linux-2.6.36-orig/fs/Makefile linux-2.6.36/fs/Makefile
--- linux-2.6.36-orig/fs/Makefile	2010-09-13 01:07:37.000000000 +0200
+++ linux-2.6.36/fs/Makefile	2010-09-14 18:49:52.000000000 +0200
@@ -126,3 +126,4 @@ obj-$(CONFIG_BTRFS_FS)		+= btrfs/
 obj-$(CONFIG_GFS2_FS)           += gfs2/
 obj-$(CONFIG_EXOFS_FS)          += exofs/
 obj-$(CONFIG_CEPH_FS)		+= ceph/
+obj-$(CONFIG_PRAMFS)		+= pramfs/
diff -Nurp linux-2.6.36-orig/fs/Kconfig linux-2.6.36/fs/Kconfig
--- linux-2.6.36-orig/fs/Kconfig	2010-09-13 01:07:37.000000000 +0200
+++ linux-2.6.36/fs/Kconfig	2010-09-14 18:49:52.000000000 +0200
@@ -13,7 +13,7 @@ source "fs/ext4/Kconfig"
 config FS_XIP
 # execute in place
 	bool
-	depends on EXT2_FS_XIP
+	depends on EXT2_FS_XIP || PRAMFS_XIP
 	default y
  source "fs/jbd/Kconfig"
@@ -25,13 +25,14 @@ config FS_MBCACHE
 	default y if EXT2_FS=y && EXT2_FS_XATTR
 	default y if EXT3_FS=y && EXT3_FS_XATTR
 	default y if EXT4_FS=y && EXT4_FS_XATTR
-	default m if EXT2_FS_XATTR || EXT3_FS_XATTR || EXT4_FS_XATTR
+	default y if PRAMFS=y && PRAMFS_XATTR
+	default m if EXT2_FS_XATTR || EXT3_FS_XATTR || EXT4_FS_XATTR || PRAMFS_XATTR
  source "fs/reiserfs/Kconfig"
 source "fs/jfs/Kconfig"
  config FS_POSIX_ACL
-# Posix ACL utility routines (for now, only ext2/ext3/jfs/reiserfs/nfs4)
+# Posix ACL utility routines (for now, only ext2/ext3/jfs/reiserfs/nfs4/pramfs)
 #
 # NOTE: you can implement Posix ACLs without these helpers (XFS does).
 # 	Never use this symbol for ifdefs.
@@ -189,6 +190,7 @@ source "fs/romfs/Kconfig"
 source "fs/sysv/Kconfig"
 source "fs/ufs/Kconfig"
 source "fs/exofs/Kconfig"
+source "fs/pramfs/Kconfig"
  endif # MISC_FILESYSTEMS
 diff -Nurp linux-2.6.36-orig/fs/pramfs/Kconfig linux-2.6.36/fs/pramfs/Kconfig
--- linux-2.6.36-orig/fs/pramfs/Kconfig	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/Kconfig	2010-10-30 10:30:19.000000000 +0200
@@ -0,0 +1,72 @@
+config PRAMFS
+	tristate "Persistent and Protected RAM file system support"
+	depends on HAS_IOMEM && EXPERIMENTAL
+	select CRC16
+	help
+	   If your system has a block of fast (comparable in access speed to
+	   system memory) and non-volatile RAM and you wish to mount a
+	   light-weight, full-featured, and space-efficient filesystem over it,
+	   say Y here, and read <file:Documentation/filesystems/pramfs.txt>.
+
+	   To compile this as a module,  choose M here: the module will be
+	   called pramfs.
+
+config PRAMFS_XIP
+	bool "Enable Execute-in-place in PRAMFS"
+	depends on PRAMFS && !PRAMFS_WRITE_PROTECT
+	help
+	   Say Y here to enable XIP feature of PRAMFS.
+
+config PRAMFS_WRITE_PROTECT
+	bool "Enable PRAMFS write protection"
+	depends on PRAMFS && MMU && HAVE_SET_MEMORY_RO
+	default y
+	help
+	   Say Y here to enable the write protect feature of PRAMFS.
+
+config PRAMFS_XATTR
+	bool "PRAMFS extended attributes"
+	depends on PRAMFS
+	help
+	  Extended attributes are name:value pairs associated with inodes by
+	  the kernel or by users (see the attr(5) manual page, or visit
+	  <http://acl.bestbits.at/> for details).
+
+	  If unsure, say N.
+
+config PRAMFS_POSIX_ACL
+	bool "PRAMFS POSIX Access Control Lists"
+	depends on PRAMFS_XATTR
+	select FS_POSIX_ACL
+	help
+	  Posix Access Control Lists (ACLs) support permissions for users and
+	  groups beyond the owner/group/world scheme.
+
+	  To learn more about Access Control Lists, visit the Posix ACLs for
+	  Linux website <http://acl.bestbits.at/>.
+
+	  If you don't know what Access Control Lists are, say N.
+
+config PRAMFS_SECURITY
+	bool "PRAMFS Security Labels"
+	depends on PRAMFS_XATTR
+	help
+	  Security labels support alternative access control models
+	  implemented by security modules like SELinux.  This option
+	  enables an extended attribute handler for file security
+	  labels in the pram filesystem.
+
+	  If you are not using a security module that requires using
+	  extended attributes for file security labels, say N.
+
+config PRAMFS_TEST
+	boolean
+	depends on PRAMFS
+
+config TEST_MODULE
+	tristate "PRAMFS Test"
+	depends on PRAMFS && m
+	select PRAMFS_TEST
+	help
+	  Say Y here to build a simple module to test the protection of
+	  PRAMFS. The module will be called pramfs_test.
diff -Nurp linux-2.6.36-orig/fs/pramfs/Makefile linux-2.6.36/fs/pramfs/Makefile
--- linux-2.6.36-orig/fs/pramfs/Makefile	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.36/fs/pramfs/Makefile	2010-09-14 18:49:52.000000000 +0200
@@ -0,0 +1,14 @@
+#
+# Makefile for the linux pram-filesystem routines.
+#
+
+obj-$(CONFIG_PRAMFS) += pramfs.o
+obj-$(CONFIG_TEST_MODULE) += pramfs_test.o
+
+pramfs-y := balloc.o dir.o file.o inode.o namei.o super.o symlink.o
+
+pramfs-$(CONFIG_PRAMFS_WRITE_PROTECT) += wprotect.o
+pramfs-$(CONFIG_PRAMFS_XIP) += xip.o
+pramfs-$(CONFIG_PRAMFS_XATTR) += xattr.o xattr_user.o xattr_trusted.o desctree.o
+pramfs-$(CONFIG_PRAMFS_POSIX_ACL) += acl.o
+pramfs-$(CONFIG_PRAMFS_SECURITY) += xattr_security.o
 
