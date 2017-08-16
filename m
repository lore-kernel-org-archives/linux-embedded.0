From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Wed, 16 Aug 2017 01:10:40 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708160105470.17016@knanqh.ubzr>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org> <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr> <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr> <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708150001380.17016@knanqh.ubzr>
 <SG2PR06MB1165749BD3C8336AB0CD27618A8D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=RyqzoZU/lBKz1xrKS/wUubKzmba07s7+YlfqKmy47lA=;
        b=Q/SOwxSh95ZFY17vqEMzNtGhiqAMbte2tvXqydyEJ/AbUcAWTo81b57PNLMCrQipKq
         hhjk0m3cq3v+J7LAHRkzsIXnI5mqjm2HVvbCIwqd+Ycdjw9m4ZqSBU/8H/uINYgA6+l2
         LDtN6IV41HaiQDlH77oeqYWPyf95p4s3yGTiY=
In-Reply-To: <SG2PR06MB1165749BD3C8336AB0CD27618A8D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, 15 Aug 2017, Chris Brandt wrote:

> On Tuesday, August 15, 2017 1, Nicolas Pitre wrote:
> > I was able to reproduce. The following patch on top should partially fix
> > it.  I'm trying to figure out how to split a vma and link it properly in
> > the case the vma cannot be mapped entirely. In the mean time shared libs
> > won't be XIP.
> > 
> > 
> > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> > index 5aedbd224e..4c7f01fcd2 100644
> > --- a/fs/cramfs/inode.c
> > +++ b/fs/cramfs/inode.c
> 
> 
> Yes, now I can boot with my rootfs being a XIP cramfs.
> 
> However, like you said, libc is not XIP.

I think I have it working now. Probably learned more about the memory 
management internals than I ever wanted to know. Please try the patch 
below on top of all the previous ones. If it works for you as well then 
I'll rebase and repost the whole thing.

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 4c7f01fcd2..0b651f985c 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -321,6 +321,86 @@ static u32 cramfs_get_block_range(struct inode *inode, u32 pgoff, u32 *pages)
 	return blockaddr << 2;
 }
 
+/*
+ * It is possible for cramfs_physmem_mmap() to partially populate the mapping
+ * causing page faults in the unmapped area. When that happens, we need to
+ * split the vma so that the unmapped area gets its own vma that can be backed
+ * with actual memory pages and loaded normally. This is necessary because
+ * remap_pfn_range() overwrites vma->vm_pgoff with the pfn and filemap_fault()
+ * no longer works with it. Furthermore this makes /proc/x/maps right.
+ * Q: is there a way to do split vma at mmap() time?
+ */
+static const struct vm_operations_struct cramfs_vmasplit_ops;
+static int cramfs_vmasplit_fault(struct vm_fault *vmf)
+{
+	struct mm_struct *mm = vmf->vma->vm_mm;
+	struct vm_area_struct *vma, *new_vma;
+	unsigned long split_val, split_addr;
+	unsigned int split_pgoff, split_page;
+	int ret;
+
+	/* Retrieve the vma split address and validate it */
+	vma = vmf->vma;
+	split_val = (unsigned long)vma->vm_private_data;
+	split_pgoff = split_val & 0xffff;
+	split_page = split_val >> 16;
+	split_addr = vma->vm_start + split_page * PAGE_SIZE;
+	pr_debug("fault: addr=%#lx vma=%#lx-%#lx split=%#lx\n",
+		 vmf->address, vma->vm_start, vma->vm_end, split_addr);
+	if (!split_val || split_addr >= vma->vm_end || vmf->address < split_addr)
+		return VM_FAULT_SIGSEGV;
+
+	/* We have some vma surgery to do and need the write lock. */
+	up_read(&mm->mmap_sem);
+	if (down_write_killable(&mm->mmap_sem))
+		return VM_FAULT_RETRY;
+
+	/* Make sure the vma didn't change between the locks */
+	vma = find_vma(mm, vmf->address);
+	if (vma->vm_ops != &cramfs_vmasplit_ops) {
+		/*
+		 * Someone else raced with us and could have handled the fault.
+		 * Let it go back to user space and fault again if necessary.
+		 */
+		downgrade_write(&mm->mmap_sem);
+		return VM_FAULT_NOPAGE;
+	}
+
+	/* Split the vma between the directly mapped area and the rest */
+	ret = split_vma(mm, vma, split_addr, 0);
+	if (ret) {
+		downgrade_write(&mm->mmap_sem);
+		return VM_FAULT_OOM;
+	}
+
+	/* The direct vma should no longer ever fault */
+	vma->vm_ops = NULL;
+
+	/* Retrieve the new vma covering the unmapped area */
+	new_vma = find_vma(mm, split_addr);
+	BUG_ON(new_vma == vma);
+	if (!new_vma) {
+		downgrade_write(&mm->mmap_sem);
+		return VM_FAULT_SIGSEGV;
+	}
+
+	/*
+	 * Readjust the new vma with the actual file based pgoff and
+	 * process the fault normally on it.
+	 */
+	new_vma->vm_pgoff = split_pgoff;
+	new_vma->vm_ops = &generic_file_vm_ops;
+	vmf->vma = new_vma;
+	vmf->pgoff = split_pgoff;
+	vmf->pgoff += (vmf->address - new_vma->vm_start) >> PAGE_SHIFT;
+	downgrade_write(&mm->mmap_sem);
+	return filemap_fault(vmf);
+}
+
+static const struct vm_operations_struct cramfs_vmasplit_ops = {
+	.fault	= cramfs_vmasplit_fault,
+};
+
 static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct inode *inode = file_inode(file);
@@ -337,6 +417,7 @@ static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
 		return -EINVAL;
 
+	/* Could COW work here? */
 	fail_reason = "vma is writable";
 	if (vma->vm_flags & VM_WRITE)
 		goto fail;
@@ -364,7 +445,7 @@ static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 		unsigned int partial = offset_in_page(inode->i_size);
 		if (partial) {
 			char *data = sbi->linear_virt_addr + offset;
-			data += (pages - 1) * PAGE_SIZE + partial;
+			data += (max_pages - 1) * PAGE_SIZE + partial;
 			while ((unsigned long)data & 7)
 				if (*data++ != 0)
 					goto nonzero;
@@ -383,35 +464,42 @@ static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 
 	if (pages) {
 		/*
-		 * Split the vma if we can't map it all so normal paging
-		 * will take care of the rest through cramfs_readpage().
+		 * If we can't map it all, page faults will occur if the
+		 * unmapped area is accessed. Let's handle them to split the
+		 * vma and let the normal paging machinery take care of the
+		 * rest through cramfs_readpage(). Because remap_pfn_range()
+		 * repurposes vma->vm_pgoff, we have to save it somewhere.
+		 * Let's use vma->vm_private_data to hold both the pgoff and the actual address split point.
+		 * Maximum file size is 16MB so we can pack both together.
 		 */
 		if (pages != vma_pages) {
-			if (1) {
-				fail_reason = "fix me";
-				goto fail;
-			}
-			ret = split_vma(vma->vm_mm, vma,
-					vma->vm_start + pages * PAGE_SIZE, 0);
-			if (ret)
-				return ret;
+			unsigned int split_pgoff = vma->vm_pgoff + pages;
+			unsigned long split_val = split_pgoff + (pages << 16);
+			vma->vm_private_data = (void *)split_val;
+			vma->vm_ops = &cramfs_vmasplit_ops;
+			/* to keep remap_pfn_range() happy */
+			vma->vm_end = vma->vm_start + pages * PAGE_SIZE;
 		}
 
 		ret = remap_pfn_range(vma, vma->vm_start, address >> PAGE_SHIFT,
 			      	      pages * PAGE_SIZE, vma->vm_page_prot);
+		/* restore vm_end in case we cheated it above */
+		vma->vm_end = vma->vm_start + vma_pages * PAGE_SIZE;
 		if (ret)
 			return ret;
+		pr_debug("mapped %s at 0x%08lx, %u/%u pages to vma 0x%08lx, "
+			 "page_prot 0x%llx\n", file_dentry(file)->d_name.name,
+			 address, pages, vma_pages, vma->vm_start,
+			 (unsigned long long)pgprot_val(vma->vm_page_prot));
+		return 0;
 	}
-
-	pr_debug("mapped %s at 0x%08lx, %u/%u pages to vma 0x%08lx, "
-		 "page_prot 0x%llx\n", file_dentry(file)->d_name.name,
-		 address, pages, vma_pages, vma->vm_start,
-		 (unsigned long long)pgprot_val(vma->vm_page_prot));
-	return 0;
+	fail_reason = "no suitable block remaining";
 
 fail:
 	pr_debug("%s: direct mmap failed: %s\n",
 		 file_dentry(file)->d_name.name, fail_reason);
+
+	/* We failed to do a direct map, but normal paging will do it */
 	vma->vm_ops = &generic_file_vm_ops;
 	return 0;
 }
