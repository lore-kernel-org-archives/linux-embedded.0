From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 14/14] Pramfs: XIP operations
Date: Sat, 13 Jun 2009 16:06:47 +0200
Message-ID: <20090613140647.GD30053@uranus.ravnborg.org>
References: <4A33A841.6080902@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A33A841.6080902@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Sat, Jun 13, 2009 at 03:23:13PM +0200, Marco wrote:
> From: Marco Stornelli <marco.stornelli@gmail.com>
> 
> XIP operations.
> 
> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
> ---
> 
> diff -uprN linux-2.6.30-orig/fs/pramfs/xip.c linux-2.6.30/fs/pramfs/xip.c
> --- linux-2.6.30-orig/fs/pramfs/xip.c	1970-01-01 01:00:00.000000000 +0100
> +++ linux-2.6.30/fs/pramfs/xip.c	2009-06-13 12:54:26.000000000 +0200
> @@ -0,0 +1,90 @@
> +/*
> + * FILE NAME fs/pramfs/xip.c
> + *
> + * BRIEF DESCRIPTION
> + *
> + * XIP operations.
> + *
> + * Copyright 2009 Marco Stornelli <marco.stornelli@gmail.com>
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/fs.h>
> +#include <linux/genhd.h>
> +#include <linux/buffer_head.h>
> +#include "pram_fs.h"
> +#include "xip.h"
> +
> +static int pram_find_and_alloc_blocks(struct inode *inode, sector_t iblock,
> +				     sector_t *data_block, int create)
> +{
> +	int err = -EIO;
> +	off_t block;
> +
> +	lock_kernel();

Can we find other solutions than taking the BKL?
We are trying to get rid of it.

> +
> +	block = pram_find_data_block(inode, iblock);
> +
> +	if (!block) {
> +		if (!create) {
> +			err = -ENODATA;
> +			goto err;
> +		}
> +
> +		err = pram_alloc_blocks(inode, iblock, 1);
> +		if (err)
> +			goto err;
> +
> +		block = pram_find_data_block(inode, iblock);
> +		if (!block) {
> +			err = -ENODATA;
> +			goto err;
> +		}
> +	}
> +
> +	*data_block = block;
> +	err = 0;
> +
> + err:
> +	unlock_kernel();
> +	return err;
> +}
> +
