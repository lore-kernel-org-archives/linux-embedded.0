From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Fri, 22 Aug 2008 12:00:25 +0200
Message-ID: <200808221200.26052.arnd@arndb.de>
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de> <48AE22F5.3000309@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AE22F5.3000309@lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: jaredeh@gmail.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?windows-1252?q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Friday 22 August 2008, Phillip Lougher wrote:
> >=20
> > This looks very nice, but could use some comments about how the dat=
a is
> > actually stored on disk. It took me some time to figure out that it=
 actually
> > allows to do tail merging into compressed blocks, which I was about=
 to suggest
> > you implement ;-). Cramfs doesn't have them, and I found that they =
are the
> > main reason why squashfs compresses better than cramfs, besides the=
 default
> > block size, which you can change on either one.
>=20
> Squashfs has much larger block sizes than cramfs (last time I looked =
it=20
> was limited to 4K blocks), and it compresses the metadata which helps=
 to=20
> get better compression. =A0But tail merging (fragments in Squashfs=20
> terminology) is obviously a major reason why Squashfs gets good compr=
ession.

The *default* block size in cramfs is smaller than in squashfs, but the=
y both
have user selectable block sizes. I found the impact of compressed meta=
data
to be almost zero. I hacked up a mksquashfs to avoid tail merging, and =
found
that the image size for squashfs and cramfs is practically identical if=
 you
use the same block size and no tail merging.

> The AXFS code is rather obscure but it doesn't look to me that it doe=
s=20
> tail merging. =A0The following code wouldn't work if the block in que=
stion=20
> was a tail contained in a larger block. =A0It assumes the block exten=
ds to=20
> the end of the compressed block (cblk_size - cnode_offset).

yes, I thought the same thing when I first read that code, and was abou=
t
to send a lengthy reply about how it should be changed when I saw that
it already does exactly that ;-).

	Arnd <><
