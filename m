From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] Kconfig: XIP doesn't depend on block
Date: Sun, 6 Feb 2011 08:44:40 -0800
Message-ID: <20110206084440.a6c2df3b.rdunlap@xenotime.net>
References: <4D4EBAF4.9070403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D4EBAF4.9070403@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Sun, 06 Feb 2011 16:15:00 +0100 Marco Stornelli wrote:

> From: Marco Stornelli <marco.stornelli@gmail.com>
> 
> XIP doesn't depend on block symbol, then we can reorder the Kconfig.
> For ext2 doesn't change the Kconfig behavior but if other fs will use
> FS_XIP it won't need to include block support if not needed.

Hi Marco,

Do you know of a filesystem where this matters?

> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
> ---
> 
> --- Kconfig.orig	2011-01-19 00:14:02.000000000 +0100
> +++ Kconfig	2011-02-06 16:04:51.000000000 +0100

This filename should include path, like
--- fs/Kconfig.orig
+++ fs/Kconfig

> @@ -9,13 +9,6 @@ if BLOCK
>  source "fs/ext2/Kconfig"
>  source "fs/ext3/Kconfig"
>  source "fs/ext4/Kconfig"
> -

The 3 filesystems above are immediately under:

if BLOCK

so ext[234] depend on BLOCK.  Why would it matter about FS_XIP?

I don't object to the patch if FS_XIP builds/works without BLOCK being
enabled.


> -config FS_XIP
> -# execute in place
> -	bool
> -	depends on EXT2_FS_XIP
> -	default y
> -
>  source "fs/jbd/Kconfig"
>  source "fs/jbd2/Kconfig"
>  
> @@ -38,6 +31,12 @@ source "fs/nilfs2/Kconfig"
>  
>  endif # BLOCK
>  
> +config FS_XIP
> +# execute in place
> +	bool
> +	depends on EXT2_FS_XIP
> +	default y
> +
>  # Posix ACL utility routines
>  #
>  # Note: Posix ACLs can be implemented without these helpers.  Never use
> 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
