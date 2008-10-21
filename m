From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Subject: [PATCH 01/16] Squashfs: inode operations
Date: Tue, 21 Oct 2008 20:03:41 +0200
Message-ID: <20081021180340.GA11588@logfs.org>
References: <E1KqrTW-0001xC-9M@dylan> <20081017165300.GA8076@logfs.org> <1224605666.31157.71.camel@moss-terrapins.epoch.ncsc.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1224605666.31157.71.camel@moss-terrapins.epoch.ncsc.mil>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "David P. Quigley" <dpquigl@tycho.nsa.gov>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

On Tue, 21 October 2008 12:14:26 -0400, David P. Quigley wrote:
> On Fri, 2008-10-17 at 18:53 +0200, J=C3=B6rn Engel wrote:
> > None of the comments below are a reason against mainline inclusion,=
 imo.
> > They should get handled, but whether that happens before or after a
> > merge doesn't really matter.
> >=20
> > On Fri, 17 October 2008 16:42:50 +0100, Phillip Lougher wrote:
> > >=20
> > > +#include <linux/squashfs_fs.h>
> > > +#include <linux/squashfs_fs_sb.h>
> > > +#include <linux/squashfs_fs_i.h>
> >=20
> > Current verdict seems to be that these files should live in fs/squa=
shfs/,
> > not include/linux/.  No kernel code beside squashfs needs the heade=
rs
> > and userspace tools should have a private copy.
> >=20
> [Snip]
>=20
> I looked at where filesystems such as ext3 store these and it seems t=
o
> be in include/linux. I'm assuming this is because usespace utilities
> like fsck need them. It seems wrong for userspace tools to have their
> own private copy since you can potentially have them out of sync with
> the kernel you are running and it provides more chance for you
> forgetting to update a structure somewhere.=20

Existing headers remain where they are.  New headers are supposed to
go... or at least that's what I was told to do.

And being out of sync is definitely not an argument you can use with a
filesystem.  The data on your disk doesn't magically change when you
upgrade a kernel.  Nor can you assume that any given filesystem is
accessed only by Linux.  If you change the format, then locating
external copies of the header will be the least of your problems.

J=C3=B6rn

--=20
Do not stop an army on its way home.
-- Sun Tzu
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
