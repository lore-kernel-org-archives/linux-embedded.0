From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: Saving the kernel log accross boots
Date: Thu, 25 Jun 2009 17:29:54 +0200
Message-ID: <20090625152954.GB8445@pengutronix.de>
References: <op.uv238aaxq25ece@thur.netmodule.intranet> <4A43968A.2020905@billgatliff.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A43968A.2020905@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Martin Meuli <Martin.Meuli@gmx.ch>, linux-embedded@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Before digging any deeper I would like to know if someone as a better
> > (more general) idea.
>=20
> Could you stuff the output into an MTD device?

For that, see CONFIG_MTD_OOPS.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpDl/IACgkQD27XaX1/VRuY2gCeIoV39x3Apnr5sS4VKg8p4A5P
NekAoLOPmo+EMnXjYI0nFpcVRITqPXZO
=6phJ
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
