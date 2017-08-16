From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v2 4/5] cramfs: add mmap support
Date: Wed, 16 Aug 2017 13:35:35 -0400
Message-ID: <20170816173536.1879-5-nicolas.pitre@linaro.org>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=Eyav
        aIpcQm6DbPwyHsKWLQzcEY8=; b=tsLpqyXOjwT7+wx6BCLW7kgyQsD/2wHcQShw
        3K6dZ6SgIzLS5a8VbNphc6FvscPFlbmoDV9g1xOMOFiKm/sz1hamAfitT5UdxqZl
        o5NJ0I8/k2xo9UBqAEJPl/oM3/g1dG9TUItRqjDBqjJnRlD/N5nC+1QQEGSC9G71
        Z5PdeVE=
In-Reply-To: <20170816173536.1879-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

When cramfs_physmem is used then we have the opportunity to map files
directly from ROM, directly into user space, saving on RAM usage.
This gives us Execute-In-Place (XIP) support.

For a file to be mmap()-able, the map area has to correspond to a range
of uncompressed and contiguous blocks, and in the MMU case it also has
to be page aligned. A version of mkcramfs with appropriate support is
necessary to create such a filesystem image.

In the MMU case it may happen for a vma structure to extend beyond the
actual file size. This is notably the case in binfmt_elf.c:elf_map().
Or the file's last block is shared with other files and cannot be mapped
as is. Rather than refusing to mmap it, we do a partial map and set up a
special vm_ops fault handler that splits the vma in two: the direct mapping
vma and the memory-backed vma populated by the readpage method.

In the non-MMU case it is the get_unmapped_area method that is responsible
for providing the address where the actual data can be found. No mapping
is necessary of course.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 fs/cramfs/inode.c | 270 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 270 insertions(+)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index b825ae162c..e3884c607b 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/fs.h>
 #include <linux/pagemap.h>
+#include <linux/ramfs.h>
 #include <linux/init.h>
 #include <linux/string.h>
 #include <linux/blkdev.h>
@@ -49,6 +50,7 @@ static inline struct cramfs_sb_info *CRAMFS_SB(struct super_block *sb)
 static const struct super_operations cramfs_ops;
 static const struct inode_operations cramfs_dir_inode_operations;
 static const struct file_operations cramfs_directory_operations;
+static const struct file_operations cramfs_physmem_fops;
 static const struct address_space_operations cramfs_aops;
 
 static DEFINE_MUTEX(read_mutex);
@@ -96,6 +98,10 @@ static struct inode *get_cramfs_inode(struct super_block *sb,
 	case S_IFREG:
 		inode->i_fop = &generic_ro_fops;
 		inode->i_data.a_ops = &cramfs_aops;
+		if (IS_ENABLED(CONFIG_CRAMFS_PHYSMEM) &&
+		    CRAMFS_SB(sb)->flags & CRAMFS_FLAG_EXT_BLOCK_POINTERS &&
+		    CRAMFS_SB(sb)->linear_phys_addr)
+			inode->i_fop = &cramfs_physmem_fops;
 		break;
 	case S_IFDIR:
 		inode->i_op = &cramfs_dir_inode_operations;
@@ -277,6 +283,270 @@ static void *cramfs_read(struct super_block *sb, unsigned int offset,
 		return NULL;
 }
 
+/*
+ * For a mapping to be possible, we need a range of uncompressed and
+ * contiguous blocks. Return the offset for the first block and number of
+ * valid blocks for which that is true, or zero otherwise.
+ */
+static u32 cramfs_get_block_range(struct inode *inode, u32 pgoff, u32 *pages)
+{
+	struct super_block *sb = inode->i_sb;
+	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
+	int i;
+	u32 *blockptrs, blockaddr;
+
+	/*
+	 * We can dereference memory directly here as this code may be
+	 * reached only when there is a direct filesystem image mapping
+	 * available in memory.
+	 */
+	blockptrs = (u32 *)(sbi->linear_virt_addr + OFFSET(inode) + pgoff*4);
+	blockaddr = blockptrs[0] & ~CRAMFS_BLK_FLAGS;
+	i = 0;
+	do {
+		u32 expect = blockaddr + i * (PAGE_SIZE >> 2);
+		expect |= CRAMFS_BLK_FLAG_DIRECT_PTR|CRAMFS_BLK_FLAG_UNCOMPRESSED;
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
+
+	/* stored "direct" block ptrs are shifted down by 2 bits */
+	return blockaddr << 2;
+}
+
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
+static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct inode *inode = file_inode(file);
+	struct super_block *sb = inode->i_sb;
+	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
+	unsigned int pages, vma_pages, max_pages, offset;
+	unsigned long address;
+	char *fail_reason;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_MMU))
+		return vma->vm_flags & (VM_SHARED | VM_MAYSHARE) ? 0 : -ENOSYS;
+
+	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
+		return -EINVAL;
+
+	/* Could COW work here? */
+	fail_reason = "vma is writable";
+	if (vma->vm_flags & VM_WRITE)
+		goto fail;
+
+	vma_pages = (vma->vm_end - vma->vm_start + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	max_pages = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	fail_reason = "beyond file limit";
+	if (vma->vm_pgoff >= max_pages)
+		goto fail;
+	pages = vma_pages;
+	if (pages > max_pages - vma->vm_pgoff)
+		pages = max_pages - vma->vm_pgoff;
+
+	offset = cramfs_get_block_range(inode, vma->vm_pgoff, &pages);
+	fail_reason = "unsuitable block layout";
+	if (!offset)
+		goto fail;
+	address = sbi->linear_phys_addr + offset;
+	fail_reason = "data is not page aligned";
+	if (!PAGE_ALIGNED(address))
+		goto fail;
+
+	/* Don't map the last page if it contains some other data */
+	if (unlikely(vma->vm_pgoff + pages == max_pages)) {
+		unsigned int partial = offset_in_page(inode->i_size);
+		if (partial) {
+			char *data = sbi->linear_virt_addr + offset;
+			data += (max_pages - 1) * PAGE_SIZE + partial;
+			while ((unsigned long)data & 7)
+				if (*data++ != 0)
+					goto nonzero;
+			while (offset_in_page(data)) {
+				if (*(u64 *)data != 0) {
+					nonzero:
+					pr_debug("mmap: %s: last page is shared\n",
+						 file_dentry(file)->d_name.name);
+					pages--;
+					break;
+				}
+				data += 8;
+			}
+		}
+	}
+
+	if (pages) {
+		/*
+		 * If we can't map it all, page faults will occur if the
+		 * unmapped area is accessed. Let's handle them to split the
+		 * vma and let the normal paging machinery take care of the
+		 * rest through cramfs_readpage(). Because remap_pfn_range()
+		 * repurposes vma->vm_pgoff, we have to save it somewhere.
+		 * Let's use vma->vm_private_data to hold both the pgoff and the actual address split point.
+		 * Maximum file size is 16MB so we can pack both together.
+		 */
+		if (pages != vma_pages) {
+			unsigned int split_pgoff = vma->vm_pgoff + pages;
+			unsigned long split_val = split_pgoff + (pages << 16);
+			vma->vm_private_data = (void *)split_val;
+			vma->vm_ops = &cramfs_vmasplit_ops;
+			/* to keep remap_pfn_range() happy */
+			vma->vm_end = vma->vm_start + pages * PAGE_SIZE;
+		}
+
+		ret = remap_pfn_range(vma, vma->vm_start, address >> PAGE_SHIFT,
+			      	      pages * PAGE_SIZE, vma->vm_page_prot);
+		/* restore vm_end in case we cheated it above */
+		vma->vm_end = vma->vm_start + vma_pages * PAGE_SIZE;
+		if (ret)
+			return ret;
+
+		pr_debug("mapped %s at 0x%08lx (%u/%u pages) to vma 0x%08lx, "
+			 "page_prot 0x%llx\n", file_dentry(file)->d_name.name,
+			 address, pages, vma_pages, vma->vm_start,
+			 (unsigned long long)pgprot_val(vma->vm_page_prot));
+		return 0;
+	}
+	fail_reason = "no suitable block remaining";
+
+fail:
+	pr_debug("%s: direct mmap failed: %s\n",
+		 file_dentry(file)->d_name.name, fail_reason);
+
+	/* We failed to do a direct map, but normal paging will do it */
+	vma->vm_ops = &generic_file_vm_ops;
+	return 0;
+}
+
+#ifndef CONFIG_MMU
+
+static unsigned long cramfs_physmem_get_unmapped_area(struct file *file,
+			unsigned long addr, unsigned long len,
+			unsigned long pgoff, unsigned long flags)
+{
+	struct inode *inode = file_inode(file);
+	struct super_block *sb = inode->i_sb;
+	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
+	unsigned int pages, block_pages, max_pages, offset;
+
+	pages = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	max_pages = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	if (pgoff >= max_pages || pages > max_pages - pgoff)
+		return -EINVAL;
+	block_pages = pages;
+	offset = cramfs_get_block_range(inode, pgoff, &block_pages);
+	if (!offset || block_pages != pages)
+		return -ENOSYS;
+	addr = sbi->linear_phys_addr + offset;
+	pr_debug("get_unmapped for %s ofs %#lx siz %lu at 0x%08lx\n",
+		 file_dentry(file)->d_name.name, pgoff*PAGE_SIZE, len, addr);
+	return addr;
+}
+
+static unsigned cramfs_physmem_mmap_capabilities(struct file *file)
+{
+	return NOMMU_MAP_COPY | NOMMU_MAP_DIRECT | NOMMU_MAP_READ | NOMMU_MAP_EXEC;
+}
+#endif
+
+static const struct file_operations cramfs_physmem_fops = {
+	.llseek			= generic_file_llseek,
+	.read_iter		= generic_file_read_iter,
+	.splice_read		= generic_file_splice_read,
+	.mmap			= cramfs_physmem_mmap,
+#ifndef CONFIG_MMU
+	.get_unmapped_area	= cramfs_physmem_get_unmapped_area,
+	.mmap_capabilities	= cramfs_physmem_mmap_capabilities,
+#endif
+};
+
 static void cramfs_blkdev_kill_sb(struct super_block *sb)
 {
 	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
-- 
2.9.5

