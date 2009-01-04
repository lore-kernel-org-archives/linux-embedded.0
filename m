From: Valdis.Kletnieks@vt.edu
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sun, 04 Jan 2009 00:07:55 -0500
Message-ID: <25035.1231045675@turing-police.cc.vt.edu>
References: <200901020207.30359.rob@landley.net> <200901020213.30658.rob@landley.net> <200901031328.23079.ioe-lkml@rameria.de>
            <200901031936.04642.rob@landley.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1231045675_3941P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: Your message of "Sat, 03 Jan 2009 19:36:04 CST."
             <200901031936.04642.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Rob Landley <rob@landley.net>
Cc: Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

--==_Exmh_1231045675_3941P
Content-Type: text/plain; charset=us-ascii

On Sat, 03 Jan 2009 19:36:04 CST, Rob Landley said:
> On Saturday 03 January 2009 06:28:22 Ingo Oeser wrote:
> > > +for i in "MSEC 1000" "USEC 1000000"
> > > +do
> > > +	NAME=$(echo $i | awk '{print $1}')
> >
> > cut -d' ' -f1  does the same
> >
> > > +	PERIOD=$(echo $i | awk '{print $2}')
> >
> > cut -d' ' -f2  does the same

Close, but no cee-gar.  cut does something counter-intuitive with multiple
blanks:

% echo 'a    b' | awk '{print $2}'
b
% echo 'a    b' | cut -d' ' -f2

% echo 'a    b' | sed -r 's/[ ]+/ /g' | cut -d' ' -f2
b

Unfortunately, 'sed -r' isn't in the opengroup.org list of required options,
and sed 's/  / /g' doesn't DTRT for 3 or more blanks (as it won't recursively
apply the change to a *new* double blank formed by the previous change).


--==_Exmh_1231045675_3941P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFJYEQrcC3lWbTT17ARAjSfAJsFWvd16dO8/vFBSogpBUGHIGVVuQCdGYxs
DB0Qw6+Ms3XwxrCB1klRqyo=
=Eg7u
-----END PGP SIGNATURE-----

--==_Exmh_1231045675_3941P--
