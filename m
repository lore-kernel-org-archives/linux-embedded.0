From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Tue, 15 Aug 2017 00:10:08 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708150001380.17016@knanqh.ubzr>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org> <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr> <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr> <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=T7EJXDwkdav6pOocjgN3uVAdGfr5yg5Eh6Z9jukm6Jo=;
        b=PJDo/wgjKdU+Dp1MK65egQTl177qnt7ksTuab2DxzBiH7Azi793YiKNDW+ySNBgFgD
         XJ4V2TN961sCLDR3LZDP4lUbOOBkKL17hBaElkRu43pJ+Ye2+1x44fmKg0iB/2MIhXk2
         NzklxFHDvQgfn4sMBTif133CuWwZo4L3rt3xE=
In-Reply-To: <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 14 Aug 2017, Chris Brandt wrote:

> On Monday, August 14, 2017, Nicolas Pitre wrote:
> > > However, now with your mkcramfs tool, I can no longer mount my cramfs
> > > image as the rootfs on boot. I was able to do that before (ie, 30
> > minutes
> > > ago) when using the community mkcramfs (ie, 30 minutes ago).
> > >
> > > I get this:
> > >
> > > [    1.712425] cramfs: checking physical address 0x1b000000 for linear
> > cramfs image
> > > [    1.720531] cramfs: linear cramfs image appears to be 15744 KB in
> > size
> > > [    1.728656] VFS: Mounted root (cramfs_physmem filesystem) readonly on
> > device 0:12.
> > > [    1.737062] devtmpfs: mounted
> > > [    1.741139] Freeing unused kernel memory: 48K
> > > [    1.745545] This architecture does not have kernel memory protection.
> > > [    1.760381] Starting init: /sbin/init exists but couldn't execute it
> > (error -22)
> > > [    1.769685] Starting init: /bin/sh exists but couldn't execute it
> > (error -14)
> > 
> > Is /sbin/init a link to busybox?
> 
> Yes.
> 
> 
> > I suppose it just boots if you do mkcramfs without -X?
> 
> Correct. I just created another image and removed the "-X -X" when 
> creating it. Now I can boot that image as my rootfs.
>   (I'm using -X -X because I'm using a Cortex-A9 with MMU).
> 
> 
> > If so could you share your non-working cramfs image with me?
> 
> I will send it (in a separate email)

I was able to reproduce. The following patch on top should partially fix 
it.  I'm trying to figure out how to split a vma and link it properly in 
the case the vma cannot be mapped entirely. In the mean time shared libs 
won't be XIP.


diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 5aedbd224e..4c7f01fcd2 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -285,10 +285,10 @@ static void *cramfs_read(struct super_block *sb, unsigned int offset,
 
 /*
  * For a mapping to be possible, we need a range of uncompressed and
- * contiguous blocks. Return the offset for the first block if that
- * verifies, or zero otherwise.
+ * contiguous blocks. Return the offset for the first block and number of
+ * valid blocks for which that is true, or zero otherwise.
  */
-static u32 cramfs_get_block_range(struct inode *inode, u32 pgoff, u32 pages)
+static u32 cramfs_get_block_range(struct inode *inode, u32 pgoff, u32 *pages)
 {
 	struct super_block *sb = inode->i_sb;
 	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
@@ -306,11 +306,16 @@ static u32 cramfs_get_block_range(struct inode *inode, u32 pgoff, u32 pages)
 	do {
 		u32 expect = blockaddr + i * (PAGE_SIZE >> 2);
 		expect |= CRAMFS_BLK_FLAG_DIRECT_PTR|CRAMFS_BLK_FLAG_UNCOMPRESSED;
-		pr_debug("range: block %d/%d got %#x expects %#x\n",
-			 pgoff+i, pgoff+pages-1, blockptrs[i], expect);
-		if (blockptrs[i] != expect)
-			return 0;
-	} while (++i < pages);
+		if (blockptrs[i] != expect) {
+			pr_debug("range: block %d/%d got %#x expects %#x\n",
+				 pgoff+i, pgoff+*pages-1, blockptrs[i], expect);
+			if (i == 0)
+				return 0;
+			break;
+		}
+	} while (++i < *pages);
+
+	*pages = i;
 
 	/* stored "direct" block ptrs are shifted down by 2 bits */
 	return blockaddr << 2;
@@ -321,8 +326,8 @@ static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 	struct inode *inode = file_inode(file);
 	struct super_block *sb = inode->i_sb;
 	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
-	unsigned int pages, max_pages, offset;
-	unsigned long length, address;
+	unsigned int pages, vma_pages, max_pages, offset;
+	unsigned long address;
 	char *fail_reason;
 	int ret;
 
@@ -332,17 +337,20 @@ static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
 		return -EINVAL;
 
-	vma->vm_ops = &generic_file_vm_ops;
+	fail_reason = "vma is writable";
 	if (vma->vm_flags & VM_WRITE)
-		return 0;
+		goto fail;
 
-	length = vma->vm_end - vma->vm_start;
-	pages = (length + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	vma_pages = (vma->vm_end - vma->vm_start + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	max_pages = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
-	if (vma->vm_pgoff >= max_pages || pages > max_pages - vma->vm_pgoff)
-		return -EINVAL;
+	fail_reason = "beyond file limit";
+	if (vma->vm_pgoff >= max_pages)
+		goto fail;
+	pages = vma_pages;
+	if (pages > max_pages - vma->vm_pgoff)
+		pages = max_pages - vma->vm_pgoff;
 
-	offset = cramfs_get_block_range(inode, vma->vm_pgoff, pages);
+	offset = cramfs_get_block_range(inode, vma->vm_pgoff, &pages);
 	fail_reason = "unsuitable block layout";
 	if (!offset)
 		goto fail;
@@ -351,37 +359,60 @@ static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!PAGE_ALIGNED(address))
 		goto fail;
 
-	/* Don't map a partial page if it contains some other data */
+	/* Don't map the last page if it contains some other data */
 	if (unlikely(vma->vm_pgoff + pages == max_pages)) {
 		unsigned int partial = offset_in_page(inode->i_size);
 		if (partial) {
 			char *data = sbi->linear_virt_addr + offset;
 			data += (pages - 1) * PAGE_SIZE + partial;
-			fail_reason = "last partial page is shared";
 			while ((unsigned long)data & 7)
 				if (*data++ != 0)
-					goto fail;
+					goto nonzero;
 			while (offset_in_page(data)) {
-				if (*(u64 *)data != 0)
-					goto fail;
+				if (*(u64 *)data != 0) {
+					nonzero:
+					pr_debug("mmap: %s: last page is shared\n",
+						 file_dentry(file)->d_name.name);
+					pages--;
+					break;
+				}
 				data += 8;
 			}
 		}
 	}
-	
-	ret = remap_pfn_range(vma, vma->vm_start, address >> PAGE_SHIFT,
-			      length, vma->vm_page_prot);
-	if (ret)
-		return ret;
-	pr_debug("mapped %s at 0x%08lx, length %lu to vma 0x%08lx, "
+
+	if (pages) {
+		/*
+		 * Split the vma if we can't map it all so normal paging
+		 * will take care of the rest through cramfs_readpage().
+		 */
+		if (pages != vma_pages) {
+			if (1) {
+				fail_reason = "fix me";
+				goto fail;
+			}
+			ret = split_vma(vma->vm_mm, vma,
+					vma->vm_start + pages * PAGE_SIZE, 0);
+			if (ret)
+				return ret;
+		}
+
+		ret = remap_pfn_range(vma, vma->vm_start, address >> PAGE_SHIFT,
+			      	      pages * PAGE_SIZE, vma->vm_page_prot);
+		if (ret)
+			return ret;
+	}
+
+	pr_debug("mapped %s at 0x%08lx, %u/%u pages to vma 0x%08lx, "
 		 "page_prot 0x%llx\n", file_dentry(file)->d_name.name,
-		 address, length, vma->vm_start,
+		 address, pages, vma_pages, vma->vm_start,
 		 (unsigned long long)pgprot_val(vma->vm_page_prot));
 	return 0;
 
 fail:
 	pr_debug("%s: direct mmap failed: %s\n",
 		 file_dentry(file)->d_name.name, fail_reason);
+	vma->vm_ops = &generic_file_vm_ops;
 	return 0;
 }
 
@@ -394,14 +425,15 @@ static unsigned long cramfs_physmem_get_unmapped_area(struct file *file,
 	struct inode *inode = file_inode(file);
 	struct super_block *sb = inode->i_sb;
 	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
-	unsigned int pages, max_pages, offset;
+	unsigned int pages, block_pages, max_pages, offset;
 
 	pages = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	max_pages = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	if (pgoff >= max_pages || pages > max_pages - pgoff)
 		return -EINVAL;
-	offset = cramfs_get_block_range(inode, pgoff, pages);
-	if (!offset)
+	block_pages = pages;
+	offset = cramfs_get_block_range(inode, pgoff, &block_pages);
+	if (!offset || block_pages != pages)
 		return -ENOSYS;
 	addr = sbi->linear_phys_addr + offset;
 	pr_debug("get_unmapped for %s ofs %#lx siz %lu at 0x%08lx\n",
