From: Michelle Konzack <linux4michelle@tamay-dogan.net>
Subject: Atmel AT91SAM7S and AT91SAM7A3
Date: Wed, 25 Jun 2008 19:16:45 +0200
Message-ID: <20080625171645.GN7064@freenet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="citGix+cyBYE+lqp"
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Embedded <linux-embedded@vger.kernel.org>


--citGix+cyBYE+lqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have several projects where I have the need for a microcontroller  and
I considered to use 8051 compatibles but not it  is  not  more  possible
because I need an USBHID-PDU device interface,  which  can  only  solved
using Linux.

I like to use the AT91SAM7S and the AT91SAM7A3 (it has 16 AD-Converters)
and want to know, whether there is support for accessing the  8  and  16
AD-Converters directly via the Kernel.

Also I like to know, which memory size for the AT91 you recommend.

The current projects are:

1)  Solar-Volatge regulator
    (Uin <=3D68V, Uout=3D30V) with USB interface to PC or Master controller)

2)  24V PbGel charger
    (Uin=3D30V and nearly the same hardware as above)

3)  24V DV modular ATX PSU
    (special for solarsystems and must support minimal features of an
    UPS to protect the computer)

Q:  I have downloaded nearly all stuff about  specifications  to  USBHID
    and like to know, whether someone can point me to sample  codes  HOW
    to code the device stuff...  which seems currently not availlable in
    the Kernel...  (It seems, I am the first one WHO  need  this  stuff,
    but I am not a genie in C programming)

Note: "eCosCentric" sell USB stacks,  but  for  an  inacceptable  price,=20
      since I build only small quantities for my projects.

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

--citGix+cyBYE+lqp
Content-Type: application/pgp-signature; name="signature.pgp"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFIYn19C0FPBMSS+BIRAsDgAKC6WN1uktkN5yl/gBLK23RxcjD7igCgmj8t
gPjsbcCW4P1nxWJWpaqDbJ4=
=CHkf
-----END PGP SIGNATURE-----

--citGix+cyBYE+lqp--
