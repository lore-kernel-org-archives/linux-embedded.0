From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/9] Squashfs: move zlib decompression wrapper code
 into a separate file
Date: Wed, 09 Dec 2009 12:00:52 +0200
Message-ID: <1260352852.19669.1253.camel@localhost>
References: <E1NHTHg-0001sM-NQ@dylan.lougher.demon.co.uk>
	 <20091207145705.cd30cae8.akpm@linux-foundation.org>
	 <4B1ED122.3040309@lougher.demon.co.uk>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B1ED122.3040309@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

On Tue, 2009-12-08 at 22:20 +0000, Phillip Lougher wrote:
> Andrew Morton wrote:
> > On Mon, 07 Dec 2009 02:25:08 +0000
> > Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> >=20
> >> +
> >> +int zlib_uncompress(struct squashfs_sb_info *msblk, void **buffer=
,
> >> +	struct buffer_head **bh, int b, int offset, int length, int srcl=
ength,
> >> +	int pages)
> >=20
> > This isn't a very good function name.  zlib_uncompress() now become=
s a
> > kernel-wide identifier, but it's part of squashfs, not part of zlib=
=2E
> >=20
> > Maybe that gets fixed in a later patch.  If so, thwap me.
> >=20
>=20
> Yes, they get fixed up in [PATCH 3/9] Squashfs: add a decompressor fr=
amework.
> That patch makes the functions static, and instead exports them via a
> suitably named decompressor ops structure.
>=20
> +const struct squashfs_decompressor squashfs_zlib_comp_ops =3D {
> +	.init =3D zlib_init,
> +	.free =3D zlib_free,
> +	.decompress =3D zlib_uncompress,
> +	.id =3D ZLIB_COMPRESSION,
> +	.name =3D "zlib",
> +	.supported =3D 1
> +};
>=20
> I split the patches up to make them easier to review.  The first two =
patches
> move the zlib code out to a separate file (ready for adding the frame=
work).
> The third patch adds the framework.  At the time of the second patch,=
 however,
> to not break compilation, the functions have to be global.  In hindsi=
ght
> I should have made named the functions squashfs_xxx, and removed the =
squashfs_
> when they were made static in the third patch.

Did you consider using cryptoapi? UBIFS uses zlib/lzo in cryptoapi - it
is a very clean way.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
