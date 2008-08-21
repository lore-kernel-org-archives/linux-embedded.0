From: Jared Hulbert <jaredeh@gmail.com>
Subject: [PATCH 01/10] AXFS: exporting xip_file_fault() for use with AXFS
Date: Wed, 20 Aug 2008 22:44:53 -0700
Message-ID: <48AD00D5.5010904@gmail.com>
Reply-To: jaredeh@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=nev/Wve9Uin2pFm8xbbCcIk2HCvsCvDj6VNStkG79yM=;
        b=VDEXRD0PqK/ltjtKl/QwMaCSJ5+rNYYAAdg3ImYhwvBk8JWkIuVrHe68LzOi9qLbQU
         J0mdBOhSm6lFFb/7F2nYkzbs9YdC4YG+9k96uJnj3gJqnXzZMy/LV1Z4IC7QykryuMQD
         jJKKPXQCXZPobV95Tr6DOaq60XhQv4dUN2HUQ=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@d

We'll need this for AXFS.  The equivalent function in filemap.c is exported.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
 include/linux/mm.h |    4 ++++
 mm/filemap_xip.c   |    3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 72a15dc..2be5c22 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -161,6 +161,10 @@ struct vm_fault {
 					 */
 };
 
+#ifdef CONFIG_FS_XIP
+extern int xip_file_fault(struct vm_area_struct *vma, struct vm_fault *vmf);
+#endif
+
 /*
  * These are the virtual MM functions - opening of an area, closing and
  * unmapping it (needed to keep files on disk up-to-date etc), pointer
diff --git a/mm/filemap_xip.c b/mm/filemap_xip.c
index 380ab40..ab2f174 100644
--- a/mm/filemap_xip.c
+++ b/mm/filemap_xip.c
@@ -206,7 +206,7 @@ __xip_unmap (struct address_space * mapping,
  *
  * This function is derived from filemap_fault, but used for execute in place
  */
-static int xip_file_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
+int xip_file_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
 {
 	struct file *file = vma->vm_file;
 	struct address_space *mapping = file->f_mapping;
@@ -262,6 +262,7 @@ found:
 		return 0;
 	}
 }
+EXPORT_SYMBOL_GPL(xip_file_fault);
 
 static struct vm_operations_struct xip_file_vm_ops = {
 	.fault	= xip_file_fault,
