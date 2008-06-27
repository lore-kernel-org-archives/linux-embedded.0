From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Re: [PATCH v4 6/6] Atmel MCI: Driver for Atmel on-chip MMC
 controllers
Date: Fri, 27 Jun 2008 21:56:27 +0200
Message-ID: <20080627215627.5d75639c@mjolnir.drzeus.cx>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-5-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-6-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-7-git-send-email-haavard.skinnemoen@atmel.com>
	<20080627211014.0e80db04@siona.local>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=PGP-SHA1; boundary="=_freyr.drzeus.cx-29789-1214595995-0001-2"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080627211014.0e80db04@siona.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_freyr.drzeus.cx-29789-1214595995-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Jun 2008 21:10:14 +0200
Haavard Skinnemoen <haavard.skinnemoen@atmel.com> wrote:

>=20
> Btw, it's probably not that hard to rip the DMA bits out and post them
> as a separate patch. This would mean that:
>   * Pierre can merge the driver independently of the other 5 patches

*snip*

>=20
> If that sounds like a good plan to you, I'll split the driver tomorrow.
>=20

DMA is always nice, but I prefer a PIO-only driver over none at all.

I am a bit concerned about the problems with mmc_test you mentioned
though. Have you sent any info about those previously?

Rgds
--=20
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  rdesktop, core developer          http://www.rdesktop.org

  WARNING: This correspondence is being monitored by the
  Swedish government. Make sure your server uses encryption
  for SMTP traffic and consider using PGP for end-to-end
  encryption.

--=_freyr.drzeus.cx-29789-1214595995-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkhlRe8ACgkQ7b8eESbyJLirSQCfc7iGuqPyo2dIRmBI+9ub0cpw
oFAAoLqY73Ae9D6XvJchU9H6F/dnS+EN
=MhNg
-----END PGP SIGNATURE-----

--=_freyr.drzeus.cx-29789-1214595995-0001-2--
