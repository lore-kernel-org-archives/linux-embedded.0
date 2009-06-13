From: Daniel Walker <dwalker@fifo99.com>
Subject: Re: [PATCH 05/14] Pramfs: File operations for files
Date: Sat, 13 Jun 2009 06:47:17 -0700
Message-ID: <1244900837.5982.213.camel@desktop>
References: <4A33A7E2.9020803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4A33A7E2.9020803@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Sat, 2009-06-13 at 15:21 +0200, Marco wrote:
> From: Marco Stornelli <marco.stornelli@gmail.com>
> 
> File operations for files.
> 
> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
> ---
> 
> diff -uprN linux-2.6.30-orig/fs/pramfs/file.c linux-2.6.30/fs/pramfs/file.c
> --- linux-2.6.30-orig/fs/pramfs/file.c	1970-01-01 01:00:00.000000000 +0100
> +++ linux-2.6.30/fs/pramfs/file.c	2009-06-13 12:52:56.000000000 +0200
> @@ -0,0 +1,141 @@
> +/*
> + * FILE NAME fs/pramfs/file.c
> + *
> + * BRIEF DESCRIPTION
> + *
> + * File operations for files.
> + *
> + * Copyright 2009 Marco Stornelli <marco.stornelli@gmail.com>
> + * Copyright 2003 Sony Corporation
> + * Copyright 2003 Matsushita Electric Industrial Co., Ltd.
> + * 2003-2004 (c) MontaVista Software, Inc. , Steve Longerbeam
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +#include <linux/fs.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/uio.h>
> +#include <linux/uaccess.h>
> +#include "pram_fs.h"
> +#include "xip.h"

It would be cleaner if the xip.h include was added in patch 14 of 14,
since that's the XIP support patch.

> +static int pram_open_file(struct inode *inode, struct file *filp)
> +{
> +#ifndef CONFIG_PRAMFS_XIP
> +	/* Without XIP we force to use Direct IO */
> +	filp->f_flags |= O_DIRECT;
> +#endif

Same as above .. It's better to have all the support for a given feature
all in the same patch. The rest of your patches are dotted with these
bits of code that should really be refactored into other patches.

Daniel

