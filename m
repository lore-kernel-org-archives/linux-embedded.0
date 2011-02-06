From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH] Kconfig: XIP doesn't depend on block
Date: Sun, 06 Feb 2011 16:15:00 +0100
Message-ID: <4D4EBAF4.9070403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:content-type:content-transfer-encoding;
        bh=Ar52BP6sCPw52EC68o3WwIlnBHbWKn+zuaBA46EI6BQ=;
        b=DfLCsgv4dx0m/fv78dPEWy7Cf6NyKbI1EoPQMhDr7b+kF4QKCKk7kAG790PLPas6k4
         xaI+JIOLLSAvdpc7WGpiFu1V4P/lAMk3eoWEndoeGDZMpIicG3SLL2TKrzWfFiaTYX8z
         8O2TS4RVd0di174kfhO47Hgj2fKc58EiEdTCY=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, rdunlap@xenotime.net

From: Marco Stornelli <marco.stornelli@gmail.com>

XIP doesn't depend on block symbol, then we can reorder the Kconfig.
For ext2 doesn't change the Kconfig behavior but if other fs will use
FS_XIP it won't need to include block support if not needed.

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
---

--- Kconfig.orig	2011-01-19 00:14:02.000000000 +0100
+++ Kconfig	2011-02-06 16:04:51.000000000 +0100
@@ -9,13 +9,6 @@ if BLOCK
 source "fs/ext2/Kconfig"
 source "fs/ext3/Kconfig"
 source "fs/ext4/Kconfig"
-
-config FS_XIP
-# execute in place
-	bool
-	depends on EXT2_FS_XIP
-	default y
-
 source "fs/jbd/Kconfig"
 source "fs/jbd2/Kconfig"
 
@@ -38,6 +31,12 @@ source "fs/nilfs2/Kconfig"
 
 endif # BLOCK
 
+config FS_XIP
+# execute in place
+	bool
+	depends on EXT2_FS_XIP
+	default y
+
 # Posix ACL utility routines
 #
 # Note: Posix ACLs can be implemented without these helpers.  Never use
