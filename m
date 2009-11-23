From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Mon, 23 Nov 2009 21:51:26 +0100
Message-ID: <1259009486.2170.4@antares>
References: <fa686aa40911230939q3c65c681jee8c4098331f70ee@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=-6J6tOFqakI3t3y4bIlJU"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911230939q3c65c681jee8c4098331f70ee@mail.gmail.com>
	(from grant.likely@secretlab.ca on Mon Nov 23 18:39:22 2009)
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: linux-embedded@vger.kernel.org

--=-6J6tOFqakI3t3y4bIlJU
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 23.11.09 18:39 schrieb(en) Grant Likely:
> There is no overlap here (except for the degenerate case of using a PWM a=
s an output only GPIO... which is useful.  Board designers do crazy things)=
.

But there may be cases where a device pin is used as GPIO *and* as pwm outp=
ut.  Think of a relay output driver which may be used a state GPIO to indic=
ate that the device is up, or as a pulsed heartbeat output (some safety sch=
emes require that) for the =20
same purpose, selected by a run-time (not device tree!) config option.

I actually do exactly this with one of the Freescale 5200's pins, and would=
 therefore also appreciate a "unified" approach.

Cheers, Albrecht.

--=-6J6tOFqakI3t3y4bIlJU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iD8DBQBLCvXOn/9unNAn/9ERAhEpAKCHLmjUXjQAxFlNhG6gO0yjWyZecgCfXM6C
eCk1hSa1XX0U+VYrjBFezU0=
=G+KO
-----END PGP SIGNATURE-----

--=-6J6tOFqakI3t3y4bIlJU--
