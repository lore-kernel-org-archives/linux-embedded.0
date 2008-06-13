From: "Wang, Baojun" <wangbj@dslab.lzu.edu.cn>
Subject: override an interrupt handler?
Date: Fri, 13 Jun 2008 12:03:50 +0800
Message-ID: <1213329830.17351.13.camel@localhost.dslab>
Reply-To: wangbj@dslab.lzu.edu.cn
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-7VEOa+qCJfEaXkYRwcXc"
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: linux-embedded@vger.kernel.org


--=-7VEOa+qCJfEaXkYRwcXc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

hi,=20

  In my application I want to override the timer interrupt, and I'm
doing in this manner:

	disable_irq(0);		/* disable timer irq first */
	free_irq(0, NULL);	/* free the old irq */
	setup_irq(0, new_irq0);

setup_irq() return with 0, however I got the following OOPs message:

Bad page state in process 'swapper'
page:81003e20 flags:0x00000400 mapping:00000000 mapcount:0 count:0
Trying to fix it up, but a reboot is needed
Backtrace:
Call Trace:
[<8001819c>] dump_stack+0x8/0x34
[<8005ddc8>] bad_page+0x6c/0xa4
[<8005e600>] free_hot_cold_page+0x98/0x1e8
[<802074a8>] xm_init_clockevents+0x90/0xbc
[<80215998>] xm_init+0x208/0x240
[<80206680>] kernel_init+0xec/0x310
[<800149e0>] kernel_thread_helper+0x10/0x18


So, is it possible to override the timer interrupt handler? Any hints is
greatly appreciated.

  Regards,

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


--=-7VEOa+qCJfEaXkYRwcXc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: 
	=?gb2312?Q?=D5=E2=CA=C7=D0=C5=BC=FE=B5=C4=CA=FD=D7=D6=C7=A9?=
	=?gb2312?Q?=C3=FB=B2=BF=B7=D6?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkhR8aYACgkQIuIOr7tpgg0cdwCgiFoNV028t1u3jPzD4DzVvs0w
yZ0AnjiDSf+mojscTPwc7IU5Wp+v1a0d
=xaUM
-----END PGP SIGNATURE-----

--=-7VEOa+qCJfEaXkYRwcXc--

