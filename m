From: Tim Bird <tim.bird@am.sony.com>
Subject: Status of SquashFS LZMA support in mainline
Date: Wed, 21 Apr 2010 17:29:23 -0700
Message-ID: <4BCF9863.2000903@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: squashfs-devel@lists.sourceforge.net
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, Phillip Lougher <phillip@lougher.demon.co.uk>

Does anyone (Phillip?) know the status of SquashFS support
for LZMA compression in mainline?  I seem to recall that
Phillip got the patches for this into linux-next sometime
in January, but I'm not sure if the latest kernel
(2.6.34-rcxx) includes this or not.

I also see in Linus' git tree the following commits in
March:

2010-03-05	Linus Torvalds	Merge git://git.kernel.org/pub/scm/linux/kernel/git...
...git://git./linux/kernel/git/pkl/squashfs-linus
...org/pub/scm/linux/kernel/git/pkl/squashfs-linus:
Squashfs: get rid of obsolete definition...
Squashfs: get rid of obsolete variable...
Squashfs: add decompressor entries for...
Squashfs: add a decompressor framework
Squashfs: factor out remaining zlib dependencies...
Squashfs: move zlib decompression wrapper...


2010-03-05	Phillip Lougher	Squashfs: get rid of obsolete variable in struct squashfs_sb...
Squashfs: get rid of obsolete variable...

Is this everything, or are there still things outstanding?
In January the V3 patches were labeled:
lzma: Make lzma available to non initramfs/initrd code
lzma: make lzma reentrant

The first one of these modifies lib/Kconfig, but I don't
see a change (in git) authored by Phillip in this time frame.

Thanks for any information you can provide.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Network Entertainment
=============================
