From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Fri, 22 Aug 2008 19:19:59 +0200
Message-ID: <20080822171959.GA30977@logfs.org>
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de> <48AE22F5.3000309@lougher.demon.co.uk> <200808221200.26052.arnd@arndb.de> <48AEF2A3.7020905@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755687AbYHVRUd@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48AEF2A3.7020905@lougher.demon.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, jaredeh@gmail.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Fri, 22 August 2008 18:08:51 +0100, Phillip Lougher wrote:
>=20
> Squashfs stores significantly more metadata than cramfs.  Remember=20
> cramfs has no support for filesystems > ~ 16Mbytes, no inode timestam=
ps,=20
> truncates uid/gids, no hard-links, no nlink counts, no hashed=20
> directories,  no unique inode numbers.  If Squashfs didn't compress t=
he=20
> metadata it would be significantly larger than cramfs.

Elsewhere in this maze of threads Arnd claimed to have tested the
benefits of metadata compression - and it making little impact.

My guess is that it would make a large impact if metadata would be a
significant part of the filesystem image.  Usually metadata is close
enough to 0% to be mistaken for statistical noise.  So compressing it
makes a significant impact on an insignificant amount of data.

J=C3=B6rn

--=20
One of my most productive days was throwing away 1000 lines of code.
-- Ken Thompson.
