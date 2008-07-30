From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Wed, 30 Jul 2008 17:40:28 +0200
Message-ID: <20080730174028.67184ea2@surf>
References: <20080729154520.728594017@free-electrons.com>
	<20080729154747.872888047@free-electrons.com>
	<20080729181751.GA24924@parisc-linux.org>
	<20080730142754.GD19966@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KkKrxzsZy/AgKq_3jGyWbPG";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755611AbYG3Pkn@vger.kernel.org>
In-Reply-To: <20080730142754.GD19966@cs181140183.pp.htv.fi>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Matthew Wilcox <matthew@wil.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, mpm@selenic.com, akpm@linux-foundation.org

--Sig_/KkKrxzsZy/AgKq_3jGyWbPG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Wed, 30 Jul 2008 17:27:54 +0300,
Adrian Bunk <bunk@kernel.org> a =C3=A9crit :

> It seems the emails containing the patches never made it to the vger=20
> lists, which makes it a bit hard to comment on them.

Yes, they didn't make it to the lists, for some reason. Maybe it's
because I sent them using "quilt mail --send", which uses my local
exim4 mail server, and for some reason, vger doesn't like that kind of
e-mails. However, my exim4 is configured to sent the e-mails through by
ISP SMTP. From my exim4 mainlog:

2008-07-29 17:47:57 1KNrQS-0007kt-Kg =3D> linux-kernel@vger.kernel.org R=3D=
smarthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> linux-embedded@vger.kernel.org R=3D=
smarthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> netdev@vger.kernel.org R=3Dsmarthos=
t T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> davem@davemloft.net R=3Dsmarthost T=
=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> mpm@selenic.com R=3Dsmarthost T=3Dr=
emote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> akpm@linux-foundation.org R=3Dsmart=
host T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> thomas.petazzoni@free-electrons.com=
 R=3Dsmarthost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
2008-07-29 17:47:57 1KNrQS-0007kt-Kg -> michael@free-electrons.com R=3Dsmar=
thost T=3Dremote_smtp_smarthost H=3Dsmtp.free.fr [212.27.48.4]*
2008-07-29 17:47:57 1KNrQS-0007kt-Kg Completed

So from my side, everything seemed to work well. Does anybody has a
clue ?

> Thomas, can you try to figure out what went wrong and resend them
> then?

I will send them again through my normal MUA, using quilt mail --mbox.
Hopefully it'll work.

Sincerly,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

--Sig_/KkKrxzsZy/AgKq_3jGyWbPG
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIkIts9lPLMJjT96cRAu+gAKCSr8z5X4fgX7KGFQ4svShUTmPovwCfQD0m
i1EN/4GQJAdVZZwhE2QxjY8=
=OwXs
-----END PGP SIGNATURE-----

--Sig_/KkKrxzsZy/AgKq_3jGyWbPG--
