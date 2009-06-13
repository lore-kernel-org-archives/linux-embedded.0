From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/14] Pramfs: Mounting as root filesystem
Date: Sun, 14 Jun 2009 01:04:42 +0200
Message-ID: <200906140104.43463.arnd@arndb.de>
References: <4A33A7D7.3040008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A33A7D7.3040008@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Saturday 13 June 2009, Marco wrote:
>  void __init mount_root(void)
>  {
> +#ifdef CONFIG_ROOT_PRAMFS
> +       if (MAJOR(ROOT_DEV) == MEM_MAJOR) {
> +               if (mount_pramfs_root())
> +                       return;
> +
> +               printk(KERN_ERR "VFS: Unable to mount root fs via PRAMFS, trying floppy.\n");
> +               ROOT_DEV = Root_FD0;
> +       }
> +#endif

AFAICT, this will prevent booting from /dev/ram0 with a regular file system,
because that also uses MAJOR(ROOT_DEV) == 1.

	Arnd <><
