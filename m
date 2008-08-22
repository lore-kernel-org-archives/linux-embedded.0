From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 18:37:58 +0100
Message-ID: <48AEF976.1010705@lougher.demon.co.uk>
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk> <6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com> <200808221852.38950.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200808221852.38950.arnd@arndb.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jared Hulbert <jaredeh@gmail.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

Arnd Bergmann wrote:
> On Friday 22 August 2008, Jared Hulbert wrote:
>>> This implies for block devices that the entire filesystem metadata has to be
>>> cached in RAM.  This severely limits the size of AXFS filesystems when using
>>> block devices, or the else memory usage will be excessive.
>> This is where 64bit squashfs could be a better fit.
> 
> Is this the only place where squashfs has a significant advantage? 
> If so, you might want to change it in axfs eventually to make the
> decision easier for users ;-)

As you asked here's the list.

1. Support for > 4GB filesystems.  In theory 2^64 bytes.
2. Compressed metadata
3. Inode timestamps
4. Hard-link support, and correct nlink counts
5. Sparse file support
6. Support for ". & ".." in readdir
7. Indexed directories for fast lookup
8. NFS exporting
9. No need to cache entire metadata in memory

Squashfs has been optimised for block-based rotating media like hard 
disks, CDROMS.  AXFS has been optimised for flash based media.  Squashfs 
will outperform AXFS on rotating media, AXFS will outperform Squashfs on 
flash based media.

Squashfs and AXFS should be seen as complementary filesystems, and there 
should be room in the Linux kernel for both.

I don't see what your problem is here.  I think AXFS is an extremely 
good filesystem and should be merged.  But I don't see why this should 
lead to more Squashfs bashing.

Phillip
