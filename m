From: Wolfram Sang <w.sang@pengutronix.de>
Subject: CELF Project Proposal: Create a watchdog framework for the Linux
	kernel
Date: Fri, 18 Dec 2009 00:02:15 +0100
Message-ID: <20091217230215.GC23944@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Proposer: Wolfram Sang

Summary: Create a watchdog framework for the Linux kernel

Description: The watchdog API of the Linux kernel is documented and used for
years. Yet, there is no abstraction for its common functionality (open, wri=
te,
ioctl, close), so every watchdog driver has to implement those methods on i=
ts
own. In addition to the vast amount of code duplication in the kernel sourc=
e,
this is also error-prone as there are subtle corner-cases in handling the
watchdog and the userspace-input correctly. Although there is code review f=
or
new drivers, it seems very desirable to improve the situation as a whole.

There have been two approaches for a generic watchdog framework, one from A=
lan
Cox and one from Wim van Sebroeck, the current watchdog maintainer. Sadly,
nothing from those have made it to mainline so far. This is a bit surprisin=
g;
although watchdogs are usually rather simple devices, they are crucial for =
the
stability concept of an enormous number of devices. The benefit of this
proposal is to have a rock-solid, well maintainable and trustworthy watchdog
framework, which makes writing new drivers faster and less error-prone.

Related work:

 * Proposal by Alan Cox:
        http://git.kernel.org/?p=3Dlinux/kernel/git/wim/linux-2.6-watchdog-=
next.git;a=3Dshortlog;h=3Drefs/heads/alan-generic-watchdog

 * Proposal by Wim van Sebroeck:
        http://git.kernel.org/?p=3Dlinux/kernel/git/wim/linux-2.6-watchdog-=
next.git;a=3Dshortlog;h=3Drefs/heads/wim-generic-watchdog

Scope:
        My estimation would be 4 weeks of development and testing

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAksquHcACgkQD27XaX1/VRuKCgCfQij4v7d8r5BuZGt+L9GgdcK2
A2sAoLKXUHsfVpl22YGCqmLOxOTdCHSj
=W97t
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
