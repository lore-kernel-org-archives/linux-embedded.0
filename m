From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 16/16 v2] pramfs: Makefile and Kconfig
Date: Sat, 6 Nov 2010 08:48:36 -0700
Message-ID: <20101106084836.b9ba01f6.randy.dunlap@oracle.com>
References: <4CD51969.3060603@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4CD51969.3060603@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

On Sat, 06 Nov 2010 10:01:29 +0100 Marco Stornelli wrote:

> From: Marco Stornelli <marco.stornelli@gmail.com>
> 
> Makefile and Kconfig.
> 
> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
> ---
> +config TEST_MODULE
> +	tristate "PRAMFS Test"
> +	depends on PRAMFS && m
> +	select PRAMFS_TEST
> +	help
> +	  Say Y here to build a simple module to test the protection of
> +	  PRAMFS. The module will be called pramfs_test.

Since kconfig symbols are global, this one needs something like
PRAMFS_ as a prefix, please.


> diff -Nurp linux-2.6.36-orig/fs/pramfs/Makefile linux-2.6.36/fs/pramfs/Makefile
> --- linux-2.6.36-orig/fs/pramfs/Makefile	1970-01-01 01:00:00.000000000 +0100
> +++ linux-2.6.36/fs/pramfs/Makefile	2010-09-14 18:49:52.000000000 +0200
> @@ -0,0 +1,14 @@
> +#
> +# Makefile for the linux pram-filesystem routines.
> +#
> +
> +obj-$(CONFIG_PRAMFS) += pramfs.o
> +obj-$(CONFIG_TEST_MODULE) += pramfs_test.o
> +
> +pramfs-y := balloc.o dir.o file.o inode.o namei.o super.o symlink.o
> +
> +pramfs-$(CONFIG_PRAMFS_WRITE_PROTECT) += wprotect.o
> +pramfs-$(CONFIG_PRAMFS_XIP) += xip.o
> +pramfs-$(CONFIG_PRAMFS_XATTR) += xattr.o xattr_user.o xattr_trusted.o desctree.o
> +pramfs-$(CONFIG_PRAMFS_POSIX_ACL) += acl.o
> +pramfs-$(CONFIG_PRAMFS_SECURITY) += xattr_security.o


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
