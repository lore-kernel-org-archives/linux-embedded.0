From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Thu, 21 Aug 2008 13:35:35 +0200
Message-ID: <200808211335.36020.arnd@arndb.de>
References: <48AD00F0.5030403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD00F0.5030403@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thursday 21 August 2008, Jared Hulbert wrote:
> +/***************** functions in other axfs files ******************************/
> +int axfs_get_sb(struct file_system_type *, int, const char *, void *,
> +		struct vfsmount *);
> +void axfs_kill_super(struct super_block *);
> +void axfs_profiling_add(struct axfs_super *, unsigned long, unsigned int);
> +int axfs_copy_mtd(struct super_block *, void *, u64, u64);
> +int axfs_copy_block(struct super_block *, void *, u64, u64);

*Never* put extern declarations into a .c file, that's what headers are for.
If you ever change the definition, the compiler doesn't get a chance to
warn you otherwise.

> +/******************************************************************************/
> +static int axfs_readdir(struct file *, void *, filldir_t);
> +static int axfs_mmap(struct file *, struct vm_area_struct *);
> +static ssize_t axfs_file_read(struct file *, char __user *, size_t, loff_t *);
> +static int axfs_readpage(struct file *, struct page *);
> +static int axfs_fault(struct vm_area_struct *, struct vm_fault *);
> +static struct dentry *axfs_lookup(struct inode *, struct dentry *,
> +				  struct nameidata *);
> +static int axfs_get_xip_mem(struct address_space *, pgoff_t, int, void **,
> +			    unsigned long *);

For style reasons, also please don't put static forward declarations anywhere,
but define the functions in the right order so you don't need them.

	Arnd <><
