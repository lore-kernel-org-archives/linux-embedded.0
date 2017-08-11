From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 4/5] cramfs: add mmap support
Date: Fri, 11 Aug 2017 15:22:51 -0400
Message-ID: <20170811192252.19062-5-nicolas.pitre@linaro.org>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=DzuM
        hcjKpeO64sAi186SeOtt4D8=; b=WlSeqeW3WrmeF+WC6Eil1HU8C7iSaMDUMDmG
        auTX6oSHRp/HbYpbrCgpwL5ZIJGeEebAAtnyrFydObGsXoYMqE+YSGBQ6zyDeJeW
        JEbfEk+67IA7ZV3IPUkaTjw++U0AZF9nGztD1AsgcRCoGkGHiKK7FV6wMig0Thjn
        6NYPY8g=
In-Reply-To: <20170811192252.19062-1-nicolas.pitre@linaro.org>
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

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 fs/cramfs/inode.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index b825ae162c..5aedbd224e 100644
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
@@ -277,6 +283,149 @@ static void *cramfs_read(struct super_block *sb, unsigned int offset,
 		return NULL;
 }
 
+/*
+ * For a mapping to be possible, we need a range of uncompressed and
+ * contiguous blocks. Return the offset for the first block if that
+ * verifies, or zero otherwise.
+ */
+static u32 cramfs_get_block_range(struct inode *inode, u32 pgoff, u32 pages)
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
+		pr_debug("range: block %d/%d got %#x expects %#x\n",
+			 pgoff+i, pgoff+pages-1, blockptrs[i], expect);
+		if (blockptrs[i] != expect)
+			return 0;
+	} while (++i < pages);
+
+	/* stored "direct" block ptrs are shifted down by 2 bits */
+	return blockaddr << 2;
+}
+
+static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct inode *inode = file_inode(file);
+	struct super_block *sb = inode->i_sb;
+	struct cramfs_sb_info *sbi = CRAMFS_SB(sb);
+	unsigned int pages, max_pages, offset;
+	unsigned long length, address;
+	char *fail_reason;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_MMU))
+		return vma->vm_flags & (VM_SHARED | VM_MAYSHARE) ? 0 : -ENOSYS;
+
+	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
+		return -EINVAL;
+
+	vma->vm_ops = &generic_file_vm_ops;
+	if (vma->vm_flags & VM_WRITE)
+		return 0;
+
+	length = vma->vm_end - vma->vm_start;
+	pages = (length + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	max_pages = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	if (vma->vm_pgoff >= max_pages || pages > max_pages - vma->vm_pgoff)
+		return -EINVAL;
+
+	offset = cramfs_get_block_range(inode, vma->vm_pgoff, pages);
+	fail_reason = "unsuitable block layout";
+	if (!offset)
+		goto fail;
+	address = sbi->linear_phys_addr + offset;
+	fail_reason = "data is not page aligned";
+	if (!PAGE_ALIGNED(address))
+		goto fail;
+
+	/* Don't map a partial page if it contains some other data */
+	if (unlikely(vma->vm_pgoff + pages == max_pages)) {
+		unsigned int partial = offset_in_page(inode->i_size);
+		if (partial) {
+			char *data = sbi->linear_virt_addr + offset;
+			data += (pages - 1) * PAGE_SIZE + partial;
+			fail_reason = "last partial page is shared";
+			while ((unsigned long)data & 7)
+				if (*data++ != 0)
+					goto fail;
+			while (offset_in_page(data)) {
+				if (*(u64 *)data != 0)
+					goto fail;
+				data += 8;
+			}
+		}
+	}
+	
+	ret = remap_pfn_range(vma, vma->vm_start, address >> PAGE_SHIFT,
+			      length, vma->vm_page_prot);
+	if (ret)
+		return ret;
+	pr_debug("mapped %s at 0x%08lx, length %lu to vma 0x%08lx, "
+		 "page_prot 0x%llx\n", file_dentry(file)->d_name.name,
+		 address, length, vma->vm_start,
+		 (unsigned long long)pgprot_val(vma->vm_page_prot));
+	return 0;
+
+fail:
+	pr_debug("%s: direct mmap failed: %s\n",
+		 file_dentry(file)->d_name.name, fail_reason);
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
+	unsigned int pages, max_pages, offset;
+
+	pages = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	max_pages = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	if (pgoff >= max_pages || pages > max_pages - pgoff)
+		return -EINVAL;
+	offset = cramfs_get_block_range(inode, pgoff, pages);
+	if (!offset)
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
2.9.4

