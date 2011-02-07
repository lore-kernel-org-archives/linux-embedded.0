From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] printk-formats.txt documentation update
Date: Mon, 7 Feb 2011 10:29:30 +0100
Message-ID: <20110207092930.GA3123@pengutronix.de>
References: <AANLkTikj+FU8OF_-KFr2hmTSWqTHMK5JnrnTVyn-XtxQ@mail.gmail.com>
 <AANLkTimcFvq-cSpain--STuVVg3dUJeTCDrykQ=24egg@mail.gmail.com>
 <AANLkTimsTJ4smnJUfkvYEkJixKQoZNfq6RHU4moLhT0o@mail.gmail.com>
 <AANLkTi=bHe_h1F6Lh=rv6BXmVzkyPSW9u5EKXxpYGuL_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=bHe_h1F6Lh=rv6BXmVzkyPSW9u5EKXxpYGuL_@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Andrew Murray <amurray@mpcdata.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-embedded@vger.kernel.org, linux kernel <linux-kernel@vger.kernel.org>, trivial@kernel.org, rdunlap@xenotime.net


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 06, 2011 at 04:23:09PM +0000, Andrew Murray wrote:
> On 6 February 2011 16:14, Andrew Murray <amurray@mpcdata.com> wrote:
> From: Andrew Murray <amurray@mpc-data.co.uk>
>=20
> This patch updates the incomplete documentation concerning the printk
> extended format specifiers.

Good one, thanks!

> +Kernel Pointers:
> +
> +	%pK	0x0
> +
> +	For printing kernel pointers which should be hidden from unprivileged
> +	users. The behaviour of %pK depends on the kptr_resrict sysctl - see

Typo: Should be kptr_restrict.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk1Pu3kACgkQD27XaX1/VRtm1wCgwnMBdLX3kUwURReBPGdgqych
vFEAn0gRJn6kmTXAwYH+B3G1eCusi8+j
=2PET
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
