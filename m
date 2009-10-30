From: Luotao Fu <l.fu@pengutronix.de>
Subject: Re: [[RFC] 4/5] An LED "dimmer" trigger, which uses the PWM API to
 vary the brightness of an LED according to system load
Date: Fri, 30 Oct 2009 15:03:38 +0100
Message-ID: <20091030140337.GD4795@pengutronix.de>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com>
 <1255984366-26952-2-git-send-email-bgat@billgatliff.com>
 <1255984366-26952-3-git-send-email-bgat@billgatliff.com>
 <1255984366-26952-4-git-send-email-bgat@billgatliff.com>
 <1255984366-26952-5-git-send-email-bgat@billgatliff.com>
 <8bd0f97a0910191451w89d80ffx9afcdbe31dad0cc7@mail.gmail.com>
 <4ADD158C.2090708@billgatliff.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mR8QP4gmHujQHb1c"
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4ADD158C.2090708@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org


--mR8QP4gmHujQHb1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 19, 2009 at 08:42:36PM -0500, Bill Gatliff wrote:
> Mike Frysinger wrote:
> >On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
> >>--- a/drivers/leds/leds-pwm.c
> >>+++ b/drivers/leds/leds-pwm.c
> >>@@ -1,153 +1,167 @@
> >>-/*
> >>- * linux/drivers/leds-pwm.c
> >>- *
> >>- * simple PWM based LED control
> >>- *
> >>- * Copyright 2009 Luotao Fu @ Pengutronix (l.fu@pengutronix.de)
> >>- *
> >>- * based on leds-gpio.c by Raphael Assenat <raph@8d.com>
> >>- *
> >>- * This program is free software; you can redistribute it and/or modify
> >>- * it under the terms of the GNU General Public License version 2 as
> >>- * published by the Free Software Foundation.
> >>- */
> >
> >this should not be removed.  if you wanted to add your copyright line,
> >then that's fine, but the rest needs to stay.
>=20
> For the record, the reason the file looks like it does is because I
> wrote an original one that replaced the previous leds-pwm.c--- but
> obviously git didn't see it that way when it produced the diff.
>=20
> I certainly wasn't trying to write-out anyone's copyright!  I don't
> have a problem with their names appearing in the file, regardless,
> so I'll put them back in.  If they have problems with their names
> appearing therein, they can let me know.  :)

I certainly don't have any problems with that. ;-) As a matter of fact.
My driver was a really simple spinoff of the gpio led driver. Nothing
fancy in there. So I'm certainly happy that the driver will eventually
see a rewrite. I'm just a little surprsied as I caught up this mail
quite by occasion since I'm not subscribed to linux-embedded (time to do
it now, I think ;-)). 'd be nice if you could put the copyright hint
back in there. I'd test it by chance.

The framework looks nice. The recent pwm stuff was more a loose policy
and spreaded in different places in kernel. Nice to have a real frame
work now. Nice work!

cheers
Luotao Fu
--=20
Pengutronix e.K.                           | Dipl.-Ing. Luotao Fu        |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--mR8QP4gmHujQHb1c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkrq8jkACgkQkLuxfMCkDTa+ogCcCASVMxI9TWRGJFqSnUiEFxr4
1fgAniEYCigcYzwrGC+QS8Ip12xBQS8n
=Oxxc
-----END PGP SIGNATURE-----

--mR8QP4gmHujQHb1c--
