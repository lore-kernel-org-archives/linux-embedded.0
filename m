From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 21:49:20 +0200
Message-ID: <200808222149.21186.arnd@arndb.de>
References: <48AD0101.4020505@gmail.com> <200808221852.38950.arnd@arndb.de> <48AEF976.1010705@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AEF976.1010705@lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Jared Hulbert <jaredeh@gmail.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Friday 22 August 2008, Phillip Lougher wrote:
> 1. Support for > 4GB filesystems. =C2=A0In theory 2^64 bytes.
> 2. Compressed metadata
> 3. Inode timestamps
> 4. Hard-link support, and correct nlink counts
> 5. Sparse file support
> 6. Support for ". & ".." in readdir
> 7. Indexed directories for fast lookup
> 8. NFS exporting
> 9. No need to cache entire metadata in memory
>
> Squashfs has been optimised for block-based rotating media like hard=20
> disks, CDROMS. =C2=A0AXFS has been optimised for flash based media. =C2=
=A0Squashfs=20
> will outperform AXFS on rotating media, AXFS will outperform Squashfs=
 on=20
> flash based media.

Ok, thanks for the list. I'm sure that sparse files are already
part of AXFS, and among the other things, I would consider some
to be AXFS bugs rather than squashfs features ("." in readdir, in
particular), but I get the point.

> Squashfs and AXFS should be seen as complementary filesystems, and th=
ere=20
> should be room in the Linux kernel for both.
>=20
> I don't see what your problem is here. =C2=A0I think AXFS is an extre=
mely=20
> good filesystem and should be merged. =C2=A0But I don't see why this =
should=20
> lead to more Squashfs bashing.

Sorry, I didn't mean to be abusive. From first look, it appeared to do
everything that squashfs does, with less code, but you've made it clear
that there is need for both of them.
I would still expect axfs to replace cramfs for all practical purposes,
even though that was written by our Emperor Penguin ;-)

	Arnd <><
