From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Thu, 31 Jul 2008 08:27:18 +0200
Message-ID: <20080731062718.GA25325@digi.com>
References: <20080729154520.728594017@free-electrons.com> <20080729154747.872888047@free-electrons.com> <20080729181751.GA24924@parisc-linux.org> <20080730142754.GD19966@cs181140183.pp.htv.fi> <20080730174028.67184ea2@surf>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080730174028.67184ea2@surf>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Adrian Bunk <bunk@kernel.org>, Matthew Wilcox <matthew@wil.cx>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "mpm@selenic.com" <mpm@selenic.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

Hello Thomas,

Thomas Petazzoni wrote:
> Le Wed, 30 Jul 2008 17:27:54 +0300,
> Adrian Bunk <bunk@kernel.org> a =E9crit :
>=20
> > It seems the emails containing the patches never made it to the vge=
r=20
> > lists, which makes it a bit hard to comment on them.
>=20
> Yes, they didn't make it to the lists, for some reason. Maybe it's
> because I sent them using "quilt mail --send", which uses my local
> exim4 mail server, and for some reason, vger doesn't like that kind o=
f
> e-mails. However, my exim4 is configured to sent the e-mails through =
by
> ISP SMTP. From my exim4 mainlog:
>=20
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg =3D> linux-kernel@vger.kernel.or=
g R=3Dsmarthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4=
]*
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> linux-embedded@vger.kernel.or=
g R=3Dsmarthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4=
]*
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> netdev@vger.kernel.org R=3Dsm=
arthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> davem@davemloft.net R=3Dsmart=
host T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> mpm@selenic.com R=3Dsmarthost=
 T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> akpm@linux-foundation.org R=3D=
smarthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> thomas.petazzoni@free-electro=
ns.com R=3Dsmarthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27=
=2E48.4]*
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> michael@free-electrons.com R=3D=
smarthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
> 2008-07-29 17:47:57 1KNrQS-0007kt-Kg Completed
>=20
> So from my side, everything seemed to work well. Does anybody has a
> clue ?
Don't know if this is the problem, but I had problems getting mails
through some time ago, too.  For me the problem was that the source
address was myusername@mymachine.intranet.$mycompany.$tld and
vger.kernel.org didn't want to take these because the host name had no
DNS entry.

I fixed that by rewriting the From line in outgoing mails on my host.
I'm using postfix (from Debian) so I had to add an entry to
/etc/postfix/sender_canonical.

Best regards
Uwe

--=20
Uwe Kleine-K=F6nig, Software Engineer
Digi International GmbH Branch Breisach, K=FCferstrasse 8, 79206 Breisa=
ch, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 1=
3962
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
