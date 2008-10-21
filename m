From: "David P. Quigley" <dpquigl@tycho.nsa.gov>
Subject: Re: Subject: [PATCH 01/16] Squashfs: inode operations
Date: Tue, 21 Oct 2008 12:14:26 -0400
Message-ID: <1224605666.31157.71.camel@moss-terrapins.epoch.ncsc.mil>
References: <E1KqrTW-0001xC-9M@dylan>  <20081017165300.GA8076@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081017165300.GA8076@logfs.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

On Fri, 2008-10-17 at 18:53 +0200, J=C3=B6rn Engel wrote:
> None of the comments below are a reason against mainline inclusion, i=
mo.
> They should get handled, but whether that happens before or after a
> merge doesn't really matter.
>=20
> On Fri, 17 October 2008 16:42:50 +0100, Phillip Lougher wrote:
> >=20
> > +#include <linux/squashfs_fs.h>
> > +#include <linux/squashfs_fs_sb.h>
> > +#include <linux/squashfs_fs_i.h>
>=20
> Current verdict seems to be that these files should live in fs/squash=
fs/,
> not include/linux/.  No kernel code beside squashfs needs the headers
> and userspace tools should have a private copy.
>=20
[Snip]

I looked at where filesystems such as ext3 store these and it seems to
be in include/linux. I'm assuming this is because usespace utilities
like fsck need them. It seems wrong for userspace tools to have their
own private copy since you can potentially have them out of sync with
the kernel you are running and it provides more chance for you
forgetting to update a structure somewhere.=20

Dave
