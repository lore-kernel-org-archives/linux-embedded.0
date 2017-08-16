From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 4/5] cramfs: add mmap support
Date: Wed, 16 Aug 2017 18:28:40 +0000
Message-ID: <SG2PR06MB1165127DD361AD94483F15CA8A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
 <20170816173536.1879-5-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=M8q6NA5h2170dEGk1ZL9bsSaUPZx8rkz3mUywq//uvY=;
 b=klSJJ2q7rdOK1dfVrEqp4fYMcR/Nv693sCFg3gosDORsNZmfjlXK0f57sRsPG+4fXeHY7nsmtdUuAsHNW6rFmyUSsym99NJbmRPEeIlRpND1l4dEOlwJH2O/2H8BfOMID2Ug9XfIT7z946GFj7tbxy0tbzQ6ADuf/DUgSnU6IWo=
In-Reply-To: <20170816173536.1879-5-nicolas.pitre@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, August 16, 2017, Nicolas Pitre wrote:
> When cramfs_physmem is used then we have the opportunity to map files
> directly from ROM, directly into user space, saving on RAM usage.
> This gives us Execute-In-Place (XIP) support.
>=20
> For a file to be mmap()-able, the map area has to correspond to a range
> of uncompressed and contiguous blocks, and in the MMU case it also has
> to be page aligned. A version of mkcramfs with appropriate support is
> necessary to create such a filesystem image.
>=20
> In the MMU case it may happen for a vma structure to extend beyond the
> actual file size. This is notably the case in binfmt_elf.c:elf_map().
> Or the file's last block is shared with other files and cannot be mapped
> as is. Rather than refusing to mmap it, we do a partial map and set up a
> special vm_ops fault handler that splits the vma in two: the direct
> mapping
> vma and the memory-backed vma populated by the readpage method.
>=20
> In the non-MMU case it is the get_unmapped_area method that is responsibl=
e
> for providing the address where the actual data can be found. No mapping
> is necessary of course.
>=20
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  fs/cramfs/inode.c | 270
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 270 insertions(+)
>=20
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index b825ae162c..e3884c607b 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/fs.h>
>  #include <linux/pagemap.h>
> +#include <linux/ramfs.h>
>  #include <linux/init.h>
>  #include <linux/string.h>
>  #include <linux/blkdev.h>
> @@ -49,6 +50,7 @@ static inline struct cramfs_sb_info *CRAMFS_SB(struct
> super_block *sb)
>  static const struct super_operations cramfs_ops;
>  static const struct inode_operations cramfs_dir_inode_operations;
>  static const struct file_operations cramfs_directory_operations;
> +static const struct file_operations cramfs_physmem_fops;
>  static const struct address_space_operations cramfs_aops;
>=20
>  static DEFINE_MUTEX(read_mutex);
> @@ -96,6 +98,10 @@ static struct inode *get_cramfs_inode(struct
> super_block *sb,
>  	case S_IFREG:
>  		inode->i_fop =3D &generic_ro_fops;
>  		inode->i_data.a_ops =3D &cramfs_aops;
> +		if (IS_ENABLED(CONFIG_CRAMFS_PHYSMEM) &&
> +		    CRAMFS_SB(sb)->flags & CRAMFS_FLAG_EXT_BLOCK_POINTERS &&
> +		    CRAMFS_SB(sb)->linear_phys_addr)
> +			inode->i_fop =3D &cramfs_physmem_fops;
>  		break;
>  	case S_IFDIR:
>  		inode->i_op =3D &cramfs_dir_inode_operations;
> @@ -277,6 +283,270 @@ static void *cramfs_read(struct super_block *sb,
> unsigned int offset,
>  		return NULL;
>  }
>=20
> +/*
> + * For a mapping to be possible, we need a range of uncompressed and
> + * contiguous blocks. Return the offset for the first block and number o=
f
> + * valid blocks for which that is true, or zero otherwise.
> + */
> +static u32 cramfs_get_block_range(struct inode *inode, u32 pgoff, u32
> *pages)
> +{
> +	struct super_block *sb =3D inode->i_sb;
> +	struct cramfs_sb_info *sbi =3D CRAMFS_SB(sb);
> +	int i;
> +	u32 *blockptrs, blockaddr;
> +
> +	/*
> +	 * We can dereference memory directly here as this code may be
> +	 * reached only when there is a direct filesystem image mapping
> +	 * available in memory.
> +	 */
> +	blockptrs =3D (u32 *)(sbi->linear_virt_addr + OFFSET(inode) +
> pgoff*4);
> +	blockaddr =3D blockptrs[0] & ~CRAMFS_BLK_FLAGS;
> +	i =3D 0;
> +	do {
> +		u32 expect =3D blockaddr + i * (PAGE_SIZE >> 2);
> +		expect |=3D
> CRAMFS_BLK_FLAG_DIRECT_PTR|CRAMFS_BLK_FLAG_UNCOMPRESSED;
> +		if (blockptrs[i] !=3D expect) {
> +			pr_debug("range: block %d/%d got %#x expects %#x\n",
> +				 pgoff+i, pgoff+*pages-1, blockptrs[i], expect);
> +			if (i =3D=3D 0)
> +				return 0;
> +			break;
> +		}
> +	} while (++i < *pages);
> +
> +	*pages =3D i;
> +
> +	/* stored "direct" block ptrs are shifted down by 2 bits */
> +	return blockaddr << 2;
> +}
> +
> +/*
> + * It is possible for cramfs_physmem_mmap() to partially populate the
> mapping
> + * causing page faults in the unmapped area. When that happens, we need
> to
> + * split the vma so that the unmapped area gets its own vma that can be
> backed
> + * with actual memory pages and loaded normally. This is necessary
> because
> + * remap_pfn_range() overwrites vma->vm_pgoff with the pfn and
> filemap_fault()
> + * no longer works with it. Furthermore this makes /proc/x/maps right.
> + * Q: is there a way to do split vma at mmap() time?
> + */
> +static const struct vm_operations_struct cramfs_vmasplit_ops;
> +static int cramfs_vmasplit_fault(struct vm_fault *vmf)
> +{
> +	struct mm_struct *mm =3D vmf->vma->vm_mm;
> +	struct vm_area_struct *vma, *new_vma;
> +	unsigned long split_val, split_addr;
> +	unsigned int split_pgoff, split_page;
> +	int ret;
> +
> +	/* Retrieve the vma split address and validate it */
> +	vma =3D vmf->vma;
> +	split_val =3D (unsigned long)vma->vm_private_data;
> +	split_pgoff =3D split_val & 0xffff;
> +	split_page =3D split_val >> 16;
> +	split_addr =3D vma->vm_start + split_page * PAGE_SIZE;
> +	pr_debug("fault: addr=3D%#lx vma=3D%#lx-%#lx split=3D%#lx\n",
> +		 vmf->address, vma->vm_start, vma->vm_end, split_addr);
> +	if (!split_val || split_addr >=3D vma->vm_end || vmf->address <
> split_addr)
> +		return VM_FAULT_SIGSEGV;
> +
> +	/* We have some vma surgery to do and need the write lock. */
> +	up_read(&mm->mmap_sem);
> +	if (down_write_killable(&mm->mmap_sem))
> +		return VM_FAULT_RETRY;
> +
> +	/* Make sure the vma didn't change between the locks */
> +	vma =3D find_vma(mm, vmf->address);
> +	if (vma->vm_ops !=3D &cramfs_vmasplit_ops) {
> +		/*
> +		 * Someone else raced with us and could have handled the fault.
> +		 * Let it go back to user space and fault again if necessary.
> +		 */
> +		downgrade_write(&mm->mmap_sem);
> +		return VM_FAULT_NOPAGE;
> +	}
> +
> +	/* Split the vma between the directly mapped area and the rest */
> +	ret =3D split_vma(mm, vma, split_addr, 0);
> +	if (ret) {
> +		downgrade_write(&mm->mmap_sem);
> +		return VM_FAULT_OOM;
> +	}
> +
> +	/* The direct vma should no longer ever fault */
> +	vma->vm_ops =3D NULL;
> +
> +	/* Retrieve the new vma covering the unmapped area */
> +	new_vma =3D find_vma(mm, split_addr);
> +	BUG_ON(new_vma =3D=3D vma);
> +	if (!new_vma) {
> +		downgrade_write(&mm->mmap_sem);
> +		return VM_FAULT_SIGSEGV;
> +	}
> +
> +	/*
> +	 * Readjust the new vma with the actual file based pgoff and
> +	 * process the fault normally on it.
> +	 */
> +	new_vma->vm_pgoff =3D split_pgoff;
> +	new_vma->vm_ops =3D &generic_file_vm_ops;
> +	vmf->vma =3D new_vma;
> +	vmf->pgoff =3D split_pgoff;
> +	vmf->pgoff +=3D (vmf->address - new_vma->vm_start) >> PAGE_SHIFT;
> +	downgrade_write(&mm->mmap_sem);
> +	return filemap_fault(vmf);
> +}
> +
> +static const struct vm_operations_struct cramfs_vmasplit_ops =3D {
> +	.fault	=3D cramfs_vmasplit_fault,
> +};
> +
> +static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct
> *vma)
> +{
> +	struct inode *inode =3D file_inode(file);
> +	struct super_block *sb =3D inode->i_sb;
> +	struct cramfs_sb_info *sbi =3D CRAMFS_SB(sb);
> +	unsigned int pages, vma_pages, max_pages, offset;
> +	unsigned long address;
> +	char *fail_reason;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_MMU))
> +		return vma->vm_flags & (VM_SHARED | VM_MAYSHARE) ? 0 : -
> ENOSYS;
> +
> +	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
> +		return -EINVAL;
> +
> +	/* Could COW work here? */
> +	fail_reason =3D "vma is writable";
> +	if (vma->vm_flags & VM_WRITE)
> +		goto fail;
> +
> +	vma_pages =3D (vma->vm_end - vma->vm_start + PAGE_SIZE - 1) >>
> PAGE_SHIFT;
> +	max_pages =3D (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +	fail_reason =3D "beyond file limit";
> +	if (vma->vm_pgoff >=3D max_pages)
> +		goto fail;
> +	pages =3D vma_pages;
> +	if (pages > max_pages - vma->vm_pgoff)
> +		pages =3D max_pages - vma->vm_pgoff;
> +
> +	offset =3D cramfs_get_block_range(inode, vma->vm_pgoff, &pages);
> +	fail_reason =3D "unsuitable block layout";
> +	if (!offset)
> +		goto fail;
> +	address =3D sbi->linear_phys_addr + offset;
> +	fail_reason =3D "data is not page aligned";
> +	if (!PAGE_ALIGNED(address))
> +		goto fail;
> +
> +	/* Don't map the last page if it contains some other data */
> +	if (unlikely(vma->vm_pgoff + pages =3D=3D max_pages)) {
> +		unsigned int partial =3D offset_in_page(inode->i_size);
> +		if (partial) {
> +			char *data =3D sbi->linear_virt_addr + offset;
> +			data +=3D (max_pages - 1) * PAGE_SIZE + partial;
> +			while ((unsigned long)data & 7)
> +				if (*data++ !=3D 0)
> +					goto nonzero;
> +			while (offset_in_page(data)) {
> +				if (*(u64 *)data !=3D 0) {
> +					nonzero:
> +					pr_debug("mmap: %s: last page is shared\n",
> +						 file_dentry(file)->d_name.name);
> +					pages--;
> +					break;
> +				}
> +				data +=3D 8;
> +			}
> +		}
> +	}
> +
> +	if (pages) {
> +		/*
> +		 * If we can't map it all, page faults will occur if the
> +		 * unmapped area is accessed. Let's handle them to split the
> +		 * vma and let the normal paging machinery take care of the
> +		 * rest through cramfs_readpage(). Because remap_pfn_range()
> +		 * repurposes vma->vm_pgoff, we have to save it somewhere.
> +		 * Let's use vma->vm_private_data to hold both the pgoff and
> the actual address split point.
> +		 * Maximum file size is 16MB so we can pack both together.
> +		 */
> +		if (pages !=3D vma_pages) {
> +			unsigned int split_pgoff =3D vma->vm_pgoff + pages;
> +			unsigned long split_val =3D split_pgoff + (pages << 16);
> +			vma->vm_private_data =3D (void *)split_val;
> +			vma->vm_ops =3D &cramfs_vmasplit_ops;
> +			/* to keep remap_pfn_range() happy */
> +			vma->vm_end =3D vma->vm_start + pages * PAGE_SIZE;
> +		}
> +
> +		ret =3D remap_pfn_range(vma, vma->vm_start, address >>
> PAGE_SHIFT,
> +			      	      pages * PAGE_SIZE, vma->vm_page_prot);


space before tab in indent



-Chris
