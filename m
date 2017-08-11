From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 0/5] cramfs refresh for embedded usage
Date: Fri, 11 Aug 2017 15:22:47 -0400
Message-ID: <20170811192252.19062-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id; s=sasl; bh=adGWYbE458GrU/EY8ac43Mpjr3Y
        =; b=a0g4ECWH/k/kPBe3H1ko7n+8ITScvvBPcgF/xUC36wk7HE7oUSI+E7a4auS
        OIAchyNpX29pfgf5pWKDuVO3U7vEXH3po4YWGlSgmoC9hT20TOTkRs1QFu44eunj
        9utmZ1j5pnNLxlTqMoeleE9+mxnGlFPhbPeTLqJ1EEcYlh+Q=
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
CONFIG_CRAMFS_PHYSMEM=y the cramfs driver may use only 3704 bytes of code.
That's many times smaller than squashfs. And the runtime memory usage is
also much less with cramfs than squashfs. It packs very tightly already
compared to romfs which has no compression support. And the cramfs format
was simple to extend, allowing for both compressed and uncompressed blocks
within the same file.

Why not accessing ROM via MTD?

The MTD layer is nice and flexible. It also represents a huge overhead
considering its core with no other enabled options weights 19KB.
That's many times the size of the cramfs code for something that
essentially boils down to a glorified argument parser and a call to
memremap().  And if someone still wants to use cramfs via MTD then
it is already possible with mtdblock.

Of course, while this cramfs remains backward compatible with existing
filesystem images, a newer mkcramfs version is necessary to take advantage
of the extended data layout. I created a version of mkcramfs that
detects ELF files and marks text+rodata segments for XIP and compresses the
rest automatically.

So here it is. I'm also willing to step up as cramfs maintainer given
that no sign of any maintenance activities appeared for years.

This series is also available based on v4.13-rc4 via git here:

http://git.linaro.org/people/nicolas.pitre/linux xipcramfs

diffstat:

 Documentation/filesystems/cramfs.txt |  35 ++
 MAINTAINERS                          |   4 +-
 fs/cramfs/Kconfig                    |  39 ++-
 fs/cramfs/README                     |  31 +-
 fs/cramfs/inode.c                    | 500 +++++++++++++++++++++++++----
 include/uapi/linux/cramfs_fs.h       |  20 +-
 init/do_mounts.c                     |   8 +
 7 files changed, 560 insertions(+), 77 deletions(-)
