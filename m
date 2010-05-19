From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Squashfs extended attribute file system support
Date: Wed, 19 May 2010 04:41:49 +0100
Message-ID: <4BF35DFD.7050609@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>
Cc: Phillip Lougher <phillip.lougher@gmail.com>

Hi,

As promised way back in 2008, I have finished xattr support for Squashfs.

Xattr layout highlights

1. Layout can store up to 2^48 bytes of compressed xattr data.
2. Number of xattrs per inode unlimited.
3. Total size of xattr data per inode 2^48 bytes of compressed data.
4. Up to 4 Gbytes of data per xattr value.
5. Inline and out-of-line xattr values supported for higher performance
    in xattr scanning (listxattr & getxattr), and to allow xattr value
    de-duplication.
6. Both whole inode xattr duplicate detection and individual xattr value
    duplicate detection supported.  These can obviously nest, file C's
    xattrs can be a complete duplicate of file B, and file B's xattrs
    can be a partial duplicate of file A.
7. Xattr name prefix types stored, allowing the redundant "user.", "trusted."
    etc. characters to be eliminated and more concisely stored.
8. Support for files, directories, symbolic links, device nodes, fifos
    and sockets.

Xattr support for mksquashfs is now in squashfs CVS.  Support for xattrs in
mksquashfs append mode, and in Unsquashfs will be finished ASAP.

The latest version of mksquashfs in CVS can be obtained here

http://sourceforge.net/projects/squashfs/develop

Kernel xattr support is in git, here

git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-xattr.git master

gitweb http://git.kernel.org/?p=linux/kernel/git/pkl/squashfs-xattr.git;a=summary

Phillip
