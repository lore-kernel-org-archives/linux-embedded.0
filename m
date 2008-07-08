From: Michelle Konzack <linux4michelle@tamay-dogan.net>
Subject: Re: optimal hardware design for an ARM9 based single board	computer to work with existing linux drivers
Date: Wed, 9 Jul 2008 01:36:10 +0200
Message-ID: <20080708233610.GE2066@freenet.de>
References: <486F38CF.40803@gmail.com> <20080705103509.GN4319@pengutronix.de> <486F557D.3090209@gmail.com> <20080705113255.GO4319@pengutronix.de> <486F60F4.1050109@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <486F60F4.1050109@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: linux-embedded@vger.kernel.org


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hallo Stefan,

Am 2008-07-05 13:54:28, schrieb Stefan Schoenleitner:
> I could still do some peripheral device driver development for the stuff =
I want
> to attach on the EP3902 board I already bought and do some testing as wel=
l.
> Can you suggest some specific CPU ?
>=20
> Of course features like LAN, USB and such are nice to have, but they are =
not
> required for my design.

Philips/NXP:  LH7A400/10/11

00 =3D I=B2C,...
10 =3D Ethetnet without CAN
11 =3D Ethernet, CAN, I=C2=B2C,...

> Goals should rather be that the CPU is cheap, easy to get and one should =
be able
> to solder it by hand (e.g. SMD paste and hot-air flow soldering).
> For this reason BGA packages are not possible.

No InfraRed-Welding System available?

I have goten one from eBay AOYUE 710 which cost new 2000=A4, but on eBay
400=A4 + transport.

> Is there something like good documentation on how to attach hardware to an
> embedded CPU so that the linux-kernel will work just fine with it ?

Thanks, Greetings and nice Day/Evening
    Michelle Konzack
    Systemadministrator
    24V Electronic Engineer
    Tamay Dogan Network
    Debian GNU/Linux Consultant


--=20
Linux-User #280138 with the Linux Counter, http://counter.li.org/
##################### Debian GNU/Linux Consultant #####################
Michelle Konzack   Apt. 917                  ICQ #328449886
+49/177/9351947    50, rue de Soultz         MSN LinuxMichi
+33/6/61925193     67100 Strasbourg/France   IRC #Debian (irc.icq.com)

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.pgp"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFIc/nqC0FPBMSS+BIRAr2dAJ9xyCKIFrE2vhSrFs77d9EUjP7tCACfa446
iT9DydN7G3JlqG0AJLEFRj4=
=aUk7
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
