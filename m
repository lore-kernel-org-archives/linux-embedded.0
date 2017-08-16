From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 1/5] cramfs: direct memory access support
Date: Wed, 16 Aug 2017 18:28:15 +0000
Message-ID: <SG2PR06MB1165518B81E3855C36CBC9A18A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
 <20170816173536.1879-2-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=71zWb9erKyXLjm7mJV7UTLF1a1rF9y79kLYHuQQ7PyU=;
 b=gIbAqGMo67io1s7pQEgU689PsE5VEVIOitAm5xuBmRdgKP+fk81DpSFKftQtKC6dI+UlIDGvXm2tt0x8ZBqnkPA1uLedXrXvMtyXe5RyJJWgqNHXM7UKhr/bCsGPI6t3y1sPmRDrsycwlnNErlReXuHIkj37/yxPrGB/iw2BBqM=
In-Reply-To: <20170816173536.1879-2-nicolas.pitre@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, August 16, 2017, Nicolas Pitre wrote:
> Small embedded systems typically execute the kernel code in place (XIP)
> directly from flash to save on precious RAM usage. This adds the ability
> to consume filesystem data directly from flash to the cramfs filesystem
> as well. Cramfs is particularly well suited to this feature as it is
> very simple and its RAM usage is already very low, and with this feature
> it is possible to use it with no block device support and even lower RAM
> usage.
>=20
> This patch was inspired by a similar patch from Shane Nay dated 17 years
> ago that used to be very popular in embedded circles but never made it
> into mainline. This is a cleaned-up implementation that uses far fewer
> memory address at run time when both methods are configured in. In the
> context of small IoT deployments, this functionality has become relevant
> and useful again.
>=20
> To distinguish between both access types, the cramfs_physmem filesystem
> type must be specified when using a memory accessible cramfs image, and
> the physaddr argument must provide the actual filesystem image's physical
> memory location.
>=20
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  fs/cramfs/Kconfig |  30 ++++++-
>  fs/cramfs/inode.c | 264 +++++++++++++++++++++++++++++++++++++++++++-----=
-
> -----
>  2 files changed, 242 insertions(+), 52 deletions(-)
>=20
> diff --git a/fs/cramfs/Kconfig b/fs/cramfs/Kconfig
> index 11b29d491b..5eed4ad2d5 100644
> --- a/fs/cramfs/Kconfig
> +++ b/fs/cramfs/Kconfig
> @@ -1,6 +1,5 @@
>  config CRAMFS
>  	tristate "Compressed ROM file system support (cramfs) (OBSOLETE)"
> -	depends on BLOCK
>  	select ZLIB_INFLATE
>  	help
>  	  Saying Y here includes support for CramFs (Compressed ROM File
> @@ -20,3 +19,32 @@ config CRAMFS
>  	  in terms of performance and features.
>=20
>  	  If unsure, say N.
> +
> +config CRAMFS_BLOCKDEV
> +	bool "Support CramFs image over a regular block device" if EXPERT
> +	depends on CRAMFS && BLOCK
> +	default y
> +	help
> +	  This option allows the CramFs driver to load data from a regular
> +	  block device such a disk partition or a ramdisk.
> +


trailing whitespace


> +config CRAMFS_PHYSMEM
> +	bool "Support CramFs image directly mapped in physical memory"
> +	depends on CRAMFS
> +	default y if !CRAMFS_BLOCKDEV
> +	help
> +	  This option allows the CramFs driver to load data directly from
> +	  a linear adressed memory range (usually non volatile memory
> +	  like flash) instead of going through the block device layer.
> +	  This saves some memory since no intermediate buffering is
> +	  necessary.
> +
> +	  The filesystem type for this feature is "cramfs_physmem".
> +	  The location of the CramFs image in memory is board
> +	  dependent. Therefore, if you say Y, you must know the proper
> +	  physical address where to store the CramFs image and specify
> +	  it using the physaddr=3D0x******** mount option (for example:
> +	  "mount -t cramfs_physmem -o physaddr=3D0x100000 none /mnt").
> +
> +	  If unsure, say N.
> +


new blank line at EOF



-Chris
