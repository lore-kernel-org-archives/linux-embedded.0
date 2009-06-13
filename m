From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 08/14] Pramfs: Makefile and Kconfig
Date: Sat, 13 Jun 2009 15:56:04 +0200
Message-ID: <20090613135604.GB30053@uranus.ravnborg.org>
References: <4A33A802.8040507@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A33A802.8040507@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

> +
> +config PRAMFS_NOWP
> +	bool "Disable PRAMFS write protection"
> +	depends on PRAMFS
> +	default n
> +	help
> +	   Say Y here to disable the write protect feature of PRAMFS.
n is default so "default n" is not needed.
If you reverse the logic (and add a default y) then..

> +ifneq ($(CONFIG_PRAMFS_NOWP),y)
> +pramfs-objs += wprotect.o
> +endif
This is a trivial:
pramfs-$(PRAMFS_WRITE_PROTECT) += wprotect.o

(I renamed the option to something more descriptive - please do so in the abvoe).


> +++ linux-2.6.30/fs/pramfs/Makefile	2009-04-19 11:58:51.000000000 +0200
> @@ -0,0 +1,13 @@
> +#
> +# Makefile for the linux pram-filesystem routines.
> +#
> +
> +obj-$(CONFIG_PRAMFS) += pramfs.o
> +obj-$(CONFIG_TEST_MODULE) += pramfs_test.o
> +
> +pramfs-objs := balloc.o dir.o file.o inode.o namei.o super.o symlink.o

Use:
pramfs-y := balloc.o ...

This match usa later in this file.

> +
> +ifneq ($(CONFIG_PRAMFS_NOWP),y)
> +pramfs-objs += wprotect.o
> +endif
> +pramfs-$(CONFIG_PRAMFS_XIP) += xip.o


	Sam
