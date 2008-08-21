From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
Date: Thu, 21 Aug 2008 13:31:35 +0200
Message-ID: <200808211331.36346.arnd@arndb.de>
References: <48AD00E6.2070505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD00E6.2070505@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thursday 21 August 2008, Jared Hulbert wrote:
>
> +#ifndef __AXFS_H
> +#define __AXFS_H
> +
> +
> +#ifdef __KERNEL__
> +#include <linux/rwsem.h>
> +#endif
> +#include <linux/errno.h>
> +#include <linux/time.h>
> +
> +#define AXFS_MAGIC	0x48A0E4CD	/* some random number */
> +#define AXFS_SIGNATURE	"Advanced XIP FS"
> +#define AXFS_MAXPATHLEN 255
> +
> +/* Uncompression interfaces to the underlying zlib */
> +int axfs_uncompress_block(void *, int, void *, int);
> +int axfs_uncompress_init(void);
> +int axfs_uncompress_exit(void);

You already have both __KERNEL__ and user space parts in your header.
Function declarations clearly don't belong in the user visible parts.
I suggest you only leave on-disk data structure definitions and user
interfaces in the user-visible include/linux/axfs.h file, and move
all internal interfaces to fs/axfs/axfs.h.

> +/*
> + *  on media struct describing a data region
> + */
> +struct axfs_region_desc_onmedia {
> +	u64 fsoffset;
> +	u64 size;
> +	u64 compressed_size;
> +	u64 max_index;
> +	u8 table_byte_depth;
> +	u8 incore;
> +};

For on-disk data structures, I would use __be64 or __le64 types,
preferrably the opposite of your native CPU byte order on the system
you are developing most code on, to make sure that you get endianess
right.

> +#define AXFS_PAGE_SIZE 4096

What happens on systems where AXFS_PAGE_SIZE != PAGE_SIZE?

> +#ifndef TRUE
> +#define TRUE 1
> +#endif
> +#ifndef FALSE
> +#define FALSE 0
> +#endif
> +

These are already defined in <linux/kernel.h>, so please use the
existing definitions.

	Arnd <><
