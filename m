From: "Wang, Baojun" <wangbj@dslab.lzu.edu.cn>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 13:14:16 +0800
Message-ID: <1213334056.17351.21.camel@localhost.dslab>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
	 <20080613043431.GP13599@pengutronix.de>
Reply-To: wangbj@dslab.lzu.edu.cn
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-jM+pxJquyD4NnMmqxWqk"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613043431.GP13599@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Shaz <shazalive@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>


--=-jM+pxJquyD4NnMmqxWqk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2008-06-13=E4=BA=94=E7=9A=84 06:34 +0200=EF=BC=8CRobert Schwebel=
=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Jun 12, 2008 at 10:52:44PM +0500, Shaz wrote:
> > I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
> > felt like asking that is there one good way to get a cross compiler
> > work. I tried buildroot, scratchbox and even openMoko with
> > openEmbedded but all of them had lots of issues and don't know which
> > will be the best alternative.
If you only need to use the cross toolchain, I think ELDK is a good choice.=
 other alternatives would be gentoo cross toolchain (using crossdev ie cros=
sdev -t powerpc64-unknownlinux-gnu) and emdebian/slind.

Gentoo cross toolchain is my favorite, it very simple to (e)merge (just
crossdev -t arch-vendor-platform-libc) and the toolchain is managed by
gentoo package manager (portage) so all packages in the toolchain is
upgradable. I've installed about 12 different (gentoo) cross toolchain
on one machine for cross compiling.

Personally I don't use emdebian/slind but still I think they're also a
good choice.

> There's also OSELAS.Toolchain:
> http://www.pengutronix.de/oselas/toolchain/index_en.html
>=20
> We try to be as close to mainline gcc/binutils as possible, and if there
> are issues, please report or send patches :-)
>=20
> > Anyways, I liked the idea of Qemu based cross compiler. Is it possible
> > for the inexperienced to get it working and emulate the exact model
> > and devices.
>=20
> No.
>=20
> rsc
--=20
Wang, Baojun                                                Lanzhou Univers=
ity
Distributed & Embedded System Lab                      http://dslab.lzu.edu=
.cn
School of Information Science and Engeneering          wangbj@dslab.lzu.edu=
.cn
Tianshui South Road 222. Lanzhou 730000                             .P.R.Ch=
ina
Tel: +86-931-8912025                                      Fax: +86-931-8912=
022


--=-jM+pxJquyD4NnMmqxWqk
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: 
	=?gb2312?Q?=D5=E2=CA=C7=D0=C5=BC=FE=B5=C4=CA=FD=D7=D6=C7=A9?=
	=?gb2312?Q?=C3=FB=B2=BF=B7=D6?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkhSAigACgkQIuIOr7tpgg1KOACeIJs2LdoVMIitDfGssRqV8VCF
d+kAn3RoMta7N5phWCsHdPJZ9RD10dkQ
=rQJp
-----END PGP SIGNATURE-----

--=-jM+pxJquyD4NnMmqxWqk--

