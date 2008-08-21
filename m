From: Sven Wegener <sven.wegener@stealer.net>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Thu, 21 Aug 2008 11:04:38 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0808211002340.12259@titan.stealer.net>
References: <48AD0101.4020505@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD0101.4020505@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Wed, 20 Aug 2008, Jared Hulbert wrote:

> The many different devices AXFS can mount to and the various
> dual device mounting schemes are supported here.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> ---
> diff --git a/fs/axfs/axfs_super.c b/fs/axfs/axfs_super.c
> new file mode 100644
> index 0000000..5efab38
> --- /dev/null
> +++ b/fs/axfs/axfs_super.c
> @@ -0,0 +1,864 @@
> +/*
> + * Advanced XIP File System for Linux - AXFS
> + *   Readonly, compressed, and XIP filesystem for Linux systems big and small
> + *
> + * Copyright(c) 2008 Numonyx
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * Authors:
> + *  Eric Anderson
> + *  Jared Hulbert <jaredeh@gmail.com>
> + *  Sujaya Srinivasan
> + *  Justin Treon
> + *
> + * More info and current contacts at http://axfs.sourceforge.net
> + *
> + * axfs_super.c -
> + *   Contains the core code used to mount the fs.
> + *
> + */
> +
> +#include <linux/axfs.h>
> +#include <linux/fs.h>
> +#include <linux/vmalloc.h>
> +#include <linux/parser.h>
> +#include <linux/statfs.h>
> +#include <linux/module.h>
> +#include <linux/mount.h>
> +#include <linux/mtd/mtd.h>
> +
> +/******************** Function Declarations ****************************/
> +static struct super_operations axfs_sops;
> +static struct axfs_super *axfs_get_sbi(void);
> +static void axfs_put_sbi(struct axfs_super *);

If you reorder the code slightly you can avoid these static forward 
declarations.

> +/***************** functions in other axfs files ***************************/
> +int axfs_get_sb_bdev(struct file_system_type *, int, const char *,
> +		     struct axfs_super *, struct vfsmount *, int *);
> +void axfs_kill_block_super(struct super_block *);
> +int axfs_copy_block(struct super_block *, void *, u64, u64);
> +int axfs_is_dev_bdev(char *);
> +int axfs_map_mtd(struct super_block *);
> +void axfs_unmap_mtd(struct super_block *);
> +int axfs_copy_mtd(struct super_block *, void *, u64, u64);
> +int axfs_get_sb_mtd(struct file_system_type *, int, const char *,
> +		    struct axfs_super *, struct vfsmount *, int *);
> +int axfs_is_dev_mtd(char *, int *);
> +void axfs_kill_mtd_super(struct super_block *);
> +struct inode *axfs_create_vfs_inode(struct super_block *, int);
> +int axfs_get_uml_address(char *, unsigned long *, unsigned long *);
> +int axfs_init_profiling(struct axfs_super *);
> +int axfs_shutdown_profiling(struct axfs_super *);
> +void axfs_profiling_add(struct axfs_super *, unsigned long, unsigned int);
> +struct inode *axfs_create_vfs_inode(struct super_block *, int);
> +/******************************************************************************/

These should probably be in axfs.h.

> +static int axfs_fill_region_descriptors(struct super_block *sb,
> +					struct axfs_super_onmedia *sbo)
> +{
> +	struct axfs_super *sbi = AXFS_SB(sb);
> +	struct axfs_region_desc_onmedia *out;
> +
> +	out = kmalloc(sizeof(*out), GFP_KERNEL);
> +	if (!out)
> +		return -ENOMEM;
> +	memset(out, 0, sizeof(*out));

kzalloc()

> +
> +	axfs_fill_region_desc(sb, out, sbo->strings, &sbi->strings);
> +	axfs_fill_region_desc(sb, out, sbo->xip, &sbi->xip);
> +	axfs_fill_region_desc(sb, out, sbo->compressed, &sbi->compressed);
> +	axfs_fill_region_desc(sb, out, sbo->byte_aligned, &sbi->byte_aligned);
> +	axfs_fill_region_desc(sb, out, sbo->node_type, &sbi->node_type);
> +	axfs_fill_region_desc(sb, out, sbo->node_index, &sbi->node_index);
> +	axfs_fill_region_desc(sb, out, sbo->cnode_offset, &sbi->cnode_offset);
> +	axfs_fill_region_desc(sb, out, sbo->cnode_index, &sbi->cnode_index);
> +	axfs_fill_region_desc(sb, out, sbo->banode_offset, &sbi->banode_offset);
> +	axfs_fill_region_desc(sb, out, sbo->cblock_offset, &sbi->cblock_offset);
> +	axfs_fill_region_desc(sb, out, sbo->inode_file_size,
> +			      &sbi->inode_file_size);
> +	axfs_fill_region_desc(sb, out, sbo->inode_name_offset,
> +			      &sbi->inode_name_offset);
> +	axfs_fill_region_desc(sb, out, sbo->inode_num_entries,
> +			      &sbi->inode_num_entries);
> +	axfs_fill_region_desc(sb, out, sbo->inode_mode_index,
> +			      &sbi->inode_mode_index);
> +	axfs_fill_region_desc(sb, out, sbo->inode_array_index,
> +			      &sbi->inode_array_index);
> +	axfs_fill_region_desc(sb, out, sbo->modes, &sbi->modes);
> +	axfs_fill_region_desc(sb, out, sbo->uids, &sbi->uids);
> +	axfs_fill_region_desc(sb, out, sbo->gids, &sbi->gids);
> +
> +	kfree(out);
> +
> +	return 0;
> +}


> +int axfs_set_compression_type(struct axfs_super *sbi)

static

And this function actually doesn't set anything, check might be a better 
name.

> +{
> +	if (sbi->compression_type != ZLIB)
> +		return -EINVAL;
> +
> +	return 0;
> +}


> +/* Read the last four bytes of the volume and make sure the AXFS magic is
> +   present. */
> +int axfs_verify_eofs_magic(struct super_block *sb)
> +{
> +	struct axfs_super *sbi = AXFS_SB(sb);
> +	u32 buf = 0;
> +	int err;
> +	u32 fsoffset = sbi->size - sizeof(u32);
> +	int len = sizeof(u32);
> +
> +	err = axfs_copy_metadata(sb, &buf, fsoffset, len);

sizeof(buf) instead of an additional variable named len.

> +
> +	if (err)
> +		return -EINVAL;
> +
> +	if (be32_to_cpu(buf) != AXFS_MAGIC) {
> +		printk(KERN_ERR "READ: 0x%x\n", be32_to_cpu(buf));
> +		printk(KERN_ERR "ERROR: Filesystem is incomplete and cannot be "
> +		       "mounted!\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}


> +int axfs_fill_super(struct super_block *sb, void *data, int silent)
> +{
> +	struct axfs_super *sbi_in = (struct axfs_super *)data;
> +	struct axfs_super *sbi;
> +	struct inode *root;
> +	int err;
> +
> +	sbi = axfs_get_sbi();

missing check for failure

> +	sb->s_fs_info = (void *)sbi;
> +	memcpy(sbi, sbi_in, sizeof(*sbi));
> +
> +	/* fully populate the incore superblock structures */
> +	err = axfs_do_fill_super(sb);
> +	if (err)
> +		goto out;
> +
> +	sb->s_flags |= MS_RDONLY;
> +
> +	/* Setup the VFS super block now */
> +	sb->s_op = &axfs_sops;
> +	root = axfs_create_vfs_inode(sb, 0);
> +	if (!root) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	sb->s_root = d_alloc_root(root);
> +	if (!sb->s_root) {
> +		iput(root);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	err = axfs_init_profiling(sbi);
> +	if (err)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	axfs_put_super(sb);
> +	return err;
> +}


> +static struct axfs_super *axfs_get_sbi(void)
> +{
> +	struct axfs_super *sbi;
> +
> +	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
> +	if (sbi)
> +		return sbi;
> +
> +	axfs_put_sbi(sbi);

Looks useless, sbi is NULL here.

> +	return ERR_PTR(-ENOMEM);
> +}


> +static int __init init_axfs_fs(void)
> +{
> +	axfs_uncompress_init();
> +	return register_filesystem(&axfs_fs_type);
> +}
> +
> +static void __exit exit_axfs_fs(void)
> +{
> +	axfs_uncompress_exit();
> +	unregister_filesystem(&axfs_fs_type);

Order looks wrong compared to init_axfs_fs()

> +}
> +
> +module_init(init_axfs_fs);
> +module_exit(exit_axfs_fs);
> +MODULE_LICENSE("GPL");
