From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 0/5] cramfs refresh for embedded usage
Date: Thu, 31 Aug 2017 02:30:41 +0000
Message-ID: <SG2PR06MB1165C1FB6FB5D43A10FD7D758A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=H4Iy3Wppv461hlDykrx+0T5uukTIQ248ZvPPVPqGO+M=;
 b=WKQ8A0XXTLsYz9IgIZCfYxI/jXZxUk4JgRZjs+x+JfOXBx9eoO6/bwiIfJKwUP8akQvgQ1A7t3UfgJ6w8Wg/I8BzG8xm7FdhOC8oOVoA1MssfWiiR8GCGcgdcw2tune9pFEoQ38KYuDivHbKCpQ4U5t8WIewDrlSOMptwKL12dY=
In-Reply-To: <20170816173536.1879-1-nicolas.pitre@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, August 16, 2017, Nicolas Pitre wrote:
> This series brings a nice refresh to the cramfs filesystem, adding the
> following capabilities:
>=20
> - Direct memory access, bypassing the block and/or MTD layers entirely.
>=20
> - Ability to store individual data blocks uncompressed.
>=20
> - Ability to locate individual data blocks anywhere in the filesystem.
>=20
> The end result is a very tight filesystem that can be accessed directly
> from ROM without any other subsystem underneath. Also this allows for
> user space XIP which is a very important feature for tiny embedded
> systems.
>=20
> Why cramfs?
>=20
>   Because cramfs is very simple and small. With CONFIG_CRAMFS_BLOCK=3Dn a=
nd
>   CONFIG_CRAMFS_PHYSMEM=3Dy the cramfs driver may use as little as 3704
> bytes
>   of code. That's many times smaller than squashfs. And the runtime memor=
y
>   usage is also much less with cramfs than squashfs. It packs very tightl=
y
>   already compared to romfs which has no compression support. And the
> cramfs
>   format was simple to extend, allowing for both compressed and
> uncompressed
>   blocks within the same file.
>=20
> Why not accessing ROM via MTD?
>=20
>   The MTD layer is nice and flexible. It also represents a huge overhead
>   considering its core with no other enabled options weights 19KB.
>   That's many times the size of the cramfs code for something that
>   essentially boils down to a glorified argument parser and a call to
>   memremap() in this case.  And if someone still wants to use cramfs via
>   MTD then it is already possible with mtdblock.
>=20
> Why not using DAX?
>=20
>   DAX stands for "Direct Access" and is a generic kernel layer helping
>   with the necessary tasks involved with XIP. It is tailored for large
>   writable filesystems and relies on the presence of an MMU. It also has
>   the following shortcoming: "The DAX code does not work correctly on
>   architectures which have virtually mapped caches such as ARM, MIPS and
>   SPARC." That makes it unsuitable for a large portion of the intended
>   targets for this series. And due to the read-only nature of cramfs, it
> is
>   possible to achieve the intended result with a much simpler approach
> making
>   DAX somewhat overkill in this context.
>=20
> The maximum size of a cramfs image can't exceed 272MB. In practice it is
> likely to be much much less. Given this series is concerned with small
> memory systems, even in the MMU case there is always plenty of vmalloc
> space left to map it all and even a 272MB memremap() wouldn't be a
> problem. If it is then maybe your system is big enough with large
> resources to manage already and you're pretty unlikely to be using cramfs
> in the first place.
>=20
> Of course, while this cramfs remains backward compatible with existing
> filesystem images, a newer mkcramfs version is necessary to take advantag=
e
> of the extended data layout. I created a version of mkcramfs that
> detects ELF files and marks text+rodata segments for XIP and compresses
> the
> rest of those ELF files automatically.
>=20
> So here it is. I'm also willing to step up as cramfs maintainer given
> that no sign of any maintenance activities appeared for years.
>=20
> This series is also available based on v4.13-rc4 via git here:
>=20
>   http://git.linaro.org/people/nicolas.pitre/linux xipcramfs
>=20
>=20
> Changes from v1:
>=20
> - Improved mmap() support by adding the ability to partially populate a
>   mapping and lazily split the non directly mapable pages to a separate
>   vma at fault time (thanks to Chris Brandt for testing).
>=20
> - Clarified the documentation some more.
>=20
>=20
> diffstat:
>=20
>  Documentation/filesystems/cramfs.txt |  42 ++
>  MAINTAINERS                          |   4 +-
>  fs/cramfs/Kconfig                    |  39 +-
>  fs/cramfs/README                     |  31 +-
>  fs/cramfs/inode.c                    | 621 +++++++++++++++++++++++++----
>  include/uapi/linux/cramfs_fs.h       |  20 +-
>  init/do_mounts.c                     |   8 +
>  7 files changed, 688 insertions(+), 77 deletions(-)


For this whole series:

Tested-by: Chris Brandt <chris.brandt@renesas.com>






