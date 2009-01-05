From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: [PATCH V3 00/17] Squashfs: compressed read-only filesystem
Date: Mon, 05 Jan 2009 11:08:23 +0000
Message-ID: <E1LJnJn-0002Kx-Dd@dylan.lougher.demon.co.uk>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, sfr@canb.auug.org.au

Hi,

This a second respin of the Squashfs patches incorporating the review comments
received.  Thanks to everyone who have sent comments.

Summary of changes in patch respin:

1. Vmalloc removed, smaller PAGE_CACHE_SIZE buffers are now allocated
2. Renamed some global functions, prefixing with squashfs_
3. brelse changed to put_bh
4. cache->lock coverage extended in squashfs_put_cache() and
   squashfs_cache_get()
5. New squashfs.txt file in Documentation/filesystems
6. Changed 'long long' usage to u64 for variables referring to 64-bit
   filesystem locations
7. SQUASHFS_I() renamed to squashfs_i()
8. Renamed locked variable to refcount to clarify usage
9. Renamed waiting variable to num_waiters, making it clear it is a count
   rather than a boolean
10. Made pending and error fields int rather than char

These 17 patches are against the latest linux-2.6.git (will apply to 2.6.28).

These patches are also available from
git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-linus.git

As requested by Andrew Morton I have prepared a tree for linux-next inclusion.
This is git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git

The Squashfs patches have been tested against both linus-2.6.git and
linux-next.git.

Finally, I would like to acknowledge the financial support of the Consumer
Embedded Linux Forum (CELF).  They've made it possible for me to spend the
last six months working full time on this mainlining attempt.

Thanks

Phillip
