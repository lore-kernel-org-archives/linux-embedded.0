From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Subject: [PATCH 13/14] Squashfs: Makefiles
Date: Fri, 17 Oct 2008 16:42:51 +0100
Message-ID: <E1KqrTX-0001y9-MO@dylan>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com


Signed-off-by: Phillip Lougher <phillip@lougher.demon.co.uk>
---
 fs/Makefile          |    1 +
 fs/squashfs/Makefile |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/fs/Makefile b/fs/Makefile
index b6f27dc..42d881b 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_JBD)		+= jbd/
 obj-$(CONFIG_JBD2)		+= jbd2/
 obj-$(CONFIG_EXT2_FS)		+= ext2/
 obj-$(CONFIG_CRAMFS)		+= cramfs/
+obj-$(CONFIG_SQUASHFS)		+= squashfs/
 obj-y				+= ramfs/
 obj-$(CONFIG_HUGETLBFS)		+= hugetlbfs/
 obj-$(CONFIG_CODA_FS)		+= coda/
diff --git a/fs/squashfs/Makefile b/fs/squashfs/Makefile
new file mode 100644
index 0000000..8258cf9
--- /dev/null
+++ b/fs/squashfs/Makefile
@@ -0,0 +1,8 @@
+#
+# Makefile for the linux squashfs routines.
+#
+
+obj-$(CONFIG_SQUASHFS) += squashfs.o
+squashfs-y += block.o cache.o dir.o export.o file.o fragment.o id.o inode.o
+squashfs-y += namei.o super.o symlink.o
+#squashfs-y += squashfs2_0.o
-- 
1.5.2.5
