From: "MinChan Kim" <minchan.kim@gmail.com>
Subject: Re: [PATCH 07/10] AXFS: axfs_bdev.c
Date: Sun, 24 Aug 2008 17:19:58 +0900
Message-ID: <28c262360808240119x44aaa728tc55d2148d14ac3c2@mail.gmail.com>
References: <48AD010B.6030209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=74H1nPLSRPT0Ugsw5M4RcFqc3ibBckF9zPMU1R2oAVg=;
        b=QaRbVnxPrKOtC9xkkD1/wVodpvbvICt5un1/FfxC1ewZRpT6lXWZxWBIYNKHwPgyvj
         yacVk6SL6TgoiJnJjrxmGgCO9MOAh4NQZsHIPurLzduai6aLfHRf4GUlZ8+glhAyIvMv
         dbRUg+SALEDImjhvaFdIF0fU48q7jO2T7zrgo=
In-Reply-To: <48AD010B.6030209@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thu, Aug 21, 2008 at 2:45 PM, Jared Hulbert <jaredeh@gmail.com> wrote:
> All the block device code goes here.
>
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> ---
> diff --git a/fs/axfs/axfs_bdev.c b/fs/axfs/axfs_bdev.c
> new file mode 100644
> index 0000000..4c6f83c
> --- /dev/null
> +++ b/fs/axfs/axfs_bdev.c
> @@ -0,0 +1,158 @@
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
> + *  Jared Hulbert <jaredeh@gmail.com>
> + *
> + * Project url: http://axfs.sourceforge.net
> + *
> + * axfs_bdev.c -
> + *   Allows axfs to use block devices or has dummy functions if block
> + *   device support is compiled out of the kernel.
> + *
> + */
> +
> +#include <linux/axfs.h>
> +#include <linux/mount.h>
> +#ifdef CONFIG_BLOCK
> +#include <linux/buffer_head.h>
> +#include <linux/namei.h>
> +
> +int axfs_fill_super(struct super_block *sb, void *data, int silent);
> +
> +int axfs_get_sb_bdev(struct file_system_type *fs_type, int flags,
> +                    const char *dev_name, struct axfs_super *sbi,
> +                    struct vfsmount *mnt, int *err)
> +{
> +       *err = get_sb_bdev(fs_type, flags, dev_name, sbi, axfs_fill_super, mnt);
> +
> +       if (*err)
> +               return FALSE;
> +       return TRUE;
> +}
> +
> +void axfs_kill_block_super(struct super_block *sb)
> +{
> +       kill_block_super(sb);
> +}
> +
> +/******************************************************************************
> + *
> + * axfs_copy_block_data
> + *
> + * Description: Helper function to read data from block device
> + *
> + * Parameters:
> + *    (IN) sb - pointer to super block structure.
> + *
> + *    (IN) dst_addr - pointer to buffer into which data is to be read.
> + *
> + *    (IN) boffset - offset within block device
> + *
> + *    (IN) len - length of data to be read
> + *
> + * Returns:
> + *     0 or error number
> + *
> + *****************************************************************************/
> +int axfs_copy_block(struct super_block *sb, void *dst_addr, u64 fsoffset,
> +                   u64 len)
> +{
> +       struct axfs_super *sbi = AXFS_SB(sb);
> +       u64 boffset = AXFS_FSOFFSET_2_DEVOFFSET(sbi, fsoffset);
> +       u64 blocks;
> +       u64 blksize = sb->s_blocksize;
> +       unsigned long dst;
> +       unsigned long src;
> +       sector_t block;
> +       size_t bytes;
> +       struct buffer_head *bh;
> +       u64 copied = 0;
> +
> +       if (len == 0)
> +               return 0;
> +
> +       blocks = len / blksize;
> +       if ((len % blksize) > 0)
> +               blocks += 1;

blocks ??
You have to drop blocks variable since anyone don't use it.

> +       while (copied < len) {
> +               /* Explicit casting for ARM linker errors. */
> +               block = (sector_t) boffset + (sector_t) copied;
> +               block /= (sector_t) blksize;
> +               bh = sb_bread(sb, block);
> +               src = (unsigned long)bh->b_data;
> +               dst = (unsigned long)dst_addr;
> +               if (copied == 0) {
> +                       /* Explicit casting for ARM linker errors. */
> +                       bytes = (size_t) blksize;
> +                       bytes -= (size_t) boffset % (size_t) blksize;
> +                       if (bytes > len)
> +                               bytes = len;
> +                       /* Explicit casting for ARM linker errors. */
> +                       src += (unsigned long)boffset % (unsigned long)blksize;
> +               } else {
> +                       dst += copied;
> +                       if ((len - copied) < blksize) {
> +                               bytes = len - copied;
> +                       } else {
> +                               bytes = blksize;
> +                       }
> +               }
> +               memcpy((void *)dst, (void *)src, bytes);
> +               copied += bytes;
> +               brelse(bh);
> +       }
> +       return 0;
> +}
> +
> +int axfs_is_dev_bdev(char *path)
> +{
> +       struct nameidata nd;
> +       int ret = FALSE;
> +
> +       if (!path)
> +               return FALSE;
> +
> +       if (path_lookup(path, LOOKUP_FOLLOW, &nd))
> +               return FALSE;
> +
> +       if (S_ISBLK(nd.path.dentry->d_inode->i_mode))
> +               ret = TRUE;
> +
> +       path_put(&nd.path);
> +       return ret;
> +}
> +
> +#else
> +
> +int axfs_get_sb_bdev(struct file_system_type *fs_type, int flags,
> +                    const char *dev_name, struct axfs_super *sbi,
> +                    struct vfsmount *mnt, int *err)
> +{
> +       return FALSE;
> +}
> +
> +void axfs_kill_block_super(struct super_block *sb)
> +{
> +}
> +
> +int axfs_copy_block(struct super_block *sb, void *dst_addr, u64 fsoffset,
> +                   u64 len)
> +{
> +       return -EINVAL;
> +}
> +
> +int axfs_is_dev_bdev(char *path)
> +{
> +       return FALSE;
> +}
> +
> +#endif /* CONFIG_BLOCK */
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Kinds regards,
MinChan Kim
