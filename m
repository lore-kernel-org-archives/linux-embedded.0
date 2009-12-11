From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: [PATCH V2 0/9] Squashfs: Add support for LZMA compressed filesystems
Date: Fri, 11 Dec 2009 01:34:08 +0000
Message-ID: <E1NIuOW-0001oE-7h@dylan.lougher.demon.co.uk>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762196AbZLKBeI@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

Hi,

This a respin of my LZMA decompression support patches, taking into
account Andrew Morton's comments regarding poorly named globals:

Changes:
	1. zlib_uncompress() renamed to squashfs_zlib_uncompress() (patch 1)
	2. zlib_init() and zlib_free() renamed to squashfs_zlib_init() and
	   squashfs_zlib_free() (patch 2)
	3. Merged patch 7 (make decompressor init function pass superblock
	   info) into patch 3.  This was a development commit which
	   should not have been a separate patch for review

Original patch series info:

The following patches add LZMA decompression support to Squashfs, using the
in-kernel LZMA decompression library.

The patches also add a decompression framework to Squashfs.
This allows LZMA decompression to be added cleanly, and it allows
additional decompressors to be easily added in the future.

To enable the in-kernel LZMA decompression code to be used by Squashfs,
there are two patches to the lzma code itself: one to make lzma available
to non-init code, and one to make lzma reentrant.  These are obviously
not restricted to Squashfs, but are needed by any non-init code that
may wish to use lzma compression.

These patches are available in my squashfs-devel git tree in a slightly
different format (these patches have been refactored for posting, they'll
be put into a git tree ASAP).

http://git.kernel.org/?p=linux/kernel/git/pkl/squashfs-devel.git;a=summary

I would like to thank the CE Linux Forum (CELF) for supporting this work.

Thanks

Phillip
