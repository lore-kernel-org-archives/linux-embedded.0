From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Re: [PATCH 1/2] MMC Agressive clocking framework v2
Date: Sat, 13 Jun 2009 20:27:15 +0200
Message-ID: <20090613202715.33a03a43@mjolnir.ossman.eu>
References: <63386a3d0906020536t5a3391f9r921959ba6d6dd96e@mail.gmail.com>
	<63386a3d0906130545i4d2227a2h25e9b55df6954a1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1; protocol="application/pgp-signature"; boundary="=_freyr.ossman.eu-28342-1244917639-0001-2"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <63386a3d0906130545i4d2227a2h25e9b55df6954a1@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.ossman.eu-28342-1244917639-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 13 Jun 2009 14:45:09 +0200
Linus Walleij <linus.ml.walleij@gmail.com> wrote:

> 2009/6/2 Linus Walleij <linus.ml.walleij@gmail.com>:
>=20
> > This patch modified the MMC core code to optionally call the
> > set_ios() operation on the driver with the clock frequency set
> > to 0 to gate the hardware block clock (and thus the MCI clock)
>=20
> have you had a chance to look at this for the current merge
> window Pierre?
>=20

Not yet, but I plan to. Sorry about the delay.

Rgds
--=20
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  rdesktop, core developer          http://www.rdesktop.org
  TigerVNC, core developer          http://www.tigervnc.org

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.ossman.eu-28342-1244917639-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkoz74cACgkQ7b8eESbyJLh9GACfYzds2CPZfhluTZUwYAsuOOBD
E6wAniRGBLzATX0HntBkA/BhTXaFqIE5
=3gMc
-----END PGP SIGNATURE-----

--=_freyr.ossman.eu-28342-1244917639-0001-2--
