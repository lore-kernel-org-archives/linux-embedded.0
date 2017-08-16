From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v2 0/5] cramfs refresh for embedded usage
Date: Wed, 16 Aug 2017 13:35:31 -0400
Message-ID: <20170816173536.1879-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id; s=sasl; bh=AFEzyseNdalub9CHnLL5FiOS4/g
        =; b=XwpY07T+VaysZALykOJTwlxIQ4N3OIiW9G8UCMNtS0D/bjR8h+5S3Rahin4
        VFUmFL3/GJZq3Gg58I23yXKDXHXkFW3RAhVrcRHC516e5YIqv4PKFTcvdgTMpOIl
        3sCjuxqF+AVaORx2Va8s5CkyZtTzbtJB1pGnHstuHfuqjxeg=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

This series brings a nice refresh to the cramfs filesystem, adding the
following capabilities:

- Direct memory access, bypassing the block and/or MTD layers entirely.

- Ability to store individual data blocks uncompressed.

- Ability to locate individual data blocks anywhere in the filesystem.

The end result is a very tight filesystem that can be accessed directly
from ROM without any other subsystem underneath. Also this allows for
user space XIP which is a very important feature for tiny embedded
systems.

Why cramfs?

  Because cramfs is very simple and small. With CONFIG_CRAMFS_BLOCK=n and
  CONFIG_CRAMFS_PHYSMEM=y the cramfs driver may use as little as 3704 bytes
  of code. That's many times smaller than squashfs. And the runtime memory
  usage is also much less with cramfs than squashfs. It packs very tightly
  already compared to romfs which has no compression support. And the cramfs
  format was simple to extend, allowing for both compressed and uncompressed
  blocks within the same file.

Why not accessing ROM via MTD?

  The MTD layer is nice and flexible. It also represents a huge overhead
  considering its core with no other enabled options weights 19KB.
  That's many times the size of the cramfs code for something that
  essentially boils down to a glorified argument parser and a call to
  memremap() in this case.  And if someone still wants to use cramfs via
  MTD then it is already possible with mtdblock.

Why not using DAX?

  DAX stands for "Direct Access" and is a generic kernel layer helping
  with the necessary tasks involved with XIP. It is tailored for large
  writable filesystems and relies on the presence of an MMU. It also has
  the following shortcoming: "The DAX code does not work correctly on
  architectures which have virtually mapped caches such as ARM, MIPS and
  SPARC." That makes it unsuitable for a large portion of the intended
  targets for this series. And due to the read-only nature of cramfs, it is
  possible to achieve the intended result with a much simpler approach making
  DAX somewhat overkill in this context.

The maximum size of a cramfs image can't exceed 272MB. In practice it is
likely to be much much less. Given this series is concerned with small
memory systems, even in the MMU case there is always plenty of vmalloc
space left to map it all and even a 272MB memremap() wouldn't be a
problem. If it is then maybe your system is big enough with large
resources to manage already and you're pretty unlikely to be using cramfs
in the first place.

Of course, while this cramfs remains backward compatible with existing
filesystem images, a newer mkcramfs version is necessary to take advantage
of the extended data layout. I created a version of mkcramfs that
detects ELF files and marks text+rodata segments for XIP and compresses the
rest of those ELF files automatically.

So here it is. I'm also willing to step up as cramfs maintainer given
that no sign of any maintenance activities appeared for years.

This series is also available based on v4.13-rc4 via git here:

  http://git.linaro.org/people/nicolas.pitre/linux xipcramfs


Changes from v1:

- Improved mmap() support by adding the ability to partially populate a
  mapping and lazily split the non directly mapable pages to a separate
  vma at fault time (thanks to Chris Brandt for testing).

- Clarified the documentation some more.


diffstat:

 Documentation/filesystems/cramfs.txt |  42 ++
 MAINTAINERS                          |   4 +-
 fs/cramfs/Kconfig                    |  39 +-
 fs/cramfs/README                     |  31 +-
 fs/cramfs/inode.c                    | 621 +++++++++++++++++++++++++----
 include/uapi/linux/cramfs_fs.h       |  20 +-
 init/do_mounts.c                     |   8 +
 7 files changed, 688 insertions(+), 77 deletions(-)
