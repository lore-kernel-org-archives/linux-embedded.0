From: Marco <marco.stornelli@gmail.com>
Subject: [PATCH 04/14] Pramfs: Mounting as root filesystem
Date: Sat, 13 Jun 2009 15:21:27 +0200
Message-ID: <4A33A7D7.3040008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=2Mdc/iwpFSuJcmCIQUAD/FR4KJSv6NbLgTMRMyjf1Kw=;
        b=fBsETK9xbTlvwjlPqncxm8DgY+5ieqluzdBBiA6XHTU4gvzKy2xV7ql95/NAoAc7Mm
         psQ9LzaJSlWssKSJpIZmLR2mPZK2rUTm0hUOax14MCiBSjAnyx8pGNcDGQrWayfwi8pw
         /1bZ5qNqB09/EcuV4eO490OeRSHxuUxS6yDPU=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

From: Marco Stornelli <marco.stornelli@gmail.com>

Pramfs can be used even as root filesystem.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---

diff -uprN linux-2.6.30-orig/init/do_mounts.c linux-2.6.30/init/do_mounts.c
--- linux-2.6.30-orig/init/do_mounts.c	2009-06-10 05:05:27.000000000 +0200
+++ linux-2.6.30/init/do_mounts.c	2009-06-13 12:50:36.000000000 +0200
@@ -299,6 +299,17 @@ static int __init mount_nfs_root(void)
 }
 #endif
 
+#ifdef CONFIG_ROOT_PRAMFS
+static int __init mount_pramfs_root(void)
+{
+	create_dev("/dev/root", ROOT_DEV);
+	if (do_mount_root("/dev/root", "pramfs",
+				root_mountflags, root_mount_data) == 0)
+		return 1;
+        return 0;
+}
+#endif
+
 #if defined(CONFIG_BLK_DEV_RAM) || defined(CONFIG_BLK_DEV_FD)
 void __init change_floppy(char *fmt, ...)
 {
@@ -331,6 +342,15 @@ void __init change_floppy(char *fmt, ...
 
 void __init mount_root(void)
 {
+#ifdef CONFIG_ROOT_PRAMFS
+	if (MAJOR(ROOT_DEV) == MEM_MAJOR) {
+		if (mount_pramfs_root())
+			return;
+
+		printk(KERN_ERR "VFS: Unable to mount root fs via PRAMFS, trying floppy.\n");
+		ROOT_DEV = Root_FD0;
+	}
+#endif
 #ifdef CONFIG_ROOT_NFS
 	if (MAJOR(ROOT_DEV) == UNNAMED_MAJOR) {
 		if (mount_nfs_root())



