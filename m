From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 17:50:44 +0200
Message-ID: <200808211750.45559.arnd@arndb.de>
References: <48AD00F8.1030004@gmail.com> <200808211706.37761.arnd@arndb.de> <6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759192AbYHUPxJ@vger.kernel.org>
In-Reply-To: <6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, carsteno@de.ibm.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>

On Thursday 21 August 2008, Jared Hulbert wrote:
> So /sys/kernel/debug/axfs/volume0 would work?
>=20
> > 4) no profiling at all
> > The profiling code has certainly been useful to you during developm=
ent,
> > and you should keep that code around for your own work on it,
> > but maybe you should not push that upstream, because regular users
> > are not going to need it.
>=20
> Nope. =C2=A0Profiling is absolutely fundamental to how AXFS works. =C2=
=A0Read
> the [PATCH 00/10] thread again.

Ok, understood it now. So it actually is a stable interface into
the file system, which means that debugfs might not be the best
solution.

I need to think about this some more. So far none of the options
are perfect. What I can think of so far includes:

1. An ioctl on the mount point of the fs
2. An ioctl that you need to call on each file
3. sysfs files is /sys/fs/axfs/
4. A new virtual file system to be mounted to /sys/fs/axfs/
5. A file below the device in sysfs, e.g. /sys/block/mtdblk0/axfs-profi=
le

I've also taken a look at the format of the profiling data file.
I'm not sure that it is ideal if you want to be able to share
identical data blocks between files. Do you currently do that
in your mkfs? The fs format certainly allows it. I would expect
that if you checksum each page, you can find duplicates on a page
basis and save some space this way. However, it can make profiling
harder if you count based on blocks but report the data based on
the file name. Not sure what a better solution would look like.

	Arnd <><
