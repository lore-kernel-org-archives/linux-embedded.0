From: Valdis.Kletnieks@vt.edu
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 16 Jan 2009 09:54:42 -0500
Message-ID: <15458.1232117682@turing-police.cc.vt.edu>
References: <495FEEAF.5020005@zytor.com> <20090112103820.GF28564@linux-sh.org> <20090114025115.GB22154@shareable.org>
            <200901160011.11679.rob@landley.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1232117682_11157P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: Your message of "Fri, 16 Jan 2009 00:11:09 CST."
             <200901160011.11679.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Rob Landley <rob@landley.net>
Cc: Jamie Lokier <jamie@shareable.org>, Paul Mundt <lethal@linux-sh.org>, Sam Ravnborg <sam@ravnborg.org>, "Mark A. Miller" <mark@mirell.org>, Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--==_Exmh_1232117682_11157P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Jan 2009 00:11:09 CST, Rob Landley said:
> P.S.  I still hope autoconf dies off and the world wakes up and moves a=
way=20
> from that.  And from makefiles for that matter.  But in the meantime, I=
 can=20
> work around it with enough effort.

What do you propose autoconf and makefiles get replaced by?

% wc pidgin/configure*
  34287  118303 1004074 pidgin/configure
   2499    7684   81532 pidgin/configure.ac

Which you rather code, 2.5K lines of autoconf or 35K lines of configure
script? As long as there's enough diversity to require configure scripts,=

there's going to be a demand for an autoconf-ish feature to ease writing =
them.


--==_Exmh_1232117682_11157P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFJcJ+ycC3lWbTT17ARAmzHAJ9dXiFYWL88pY/jhJRdwBuHTNSLdQCgk+0Q
BJXEaXpMuPEVKm7itutVlWE=
=SXda
-----END PGP SIGNATURE-----

--==_Exmh_1232117682_11157P--
