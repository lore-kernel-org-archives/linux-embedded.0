From: Carsten Otte <cotte@de.ibm.com>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Thu, 21 Aug 2008 10:55:27 +0200
Message-ID: <48AD2D7F.9070109@de.ibm.com>
References: <48AD0101.4020505@gmail.com>
Reply-To: carsteno@de.ibm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD0101.4020505@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, nickpiggin@yahoo.com.au

Jared Hulbert wrote:
> diff --git a/fs/axfs/axfs_super.c b/fs/axfs/axfs_super.c
> new file mode 100644
> index 0000000..5efab38
> --- /dev/null
> +++ b/fs/axfs/axfs_super.c
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
Please put these definitions into a header file.
