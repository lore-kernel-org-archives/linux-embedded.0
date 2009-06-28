From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Sun, 28 Jun 2009 10:59:32 +0200
Message-ID: <20090628085932.GA20169@elf.ucw.cz>
References: <4a4254e2.09c5660a.109d.46f8@mx.google.com> <4A425907.2060105@gmail.com> <4A42649D.6080509@gmail.com> <20090624175943.GB6618@elf.ucw.cz> <2ea1731b0906242330t5f379322sdff9880788e9b181@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ea1731b0906242330t5f379322sdff9880788e9b181@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: tim.bird@am.sony.com, jamie@shareable.org, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

> >> > Ah now the write protection is a "needed feature", in your previ=
ous
> >> > comment you talked about why not use ext2/3.......
> >> >
> >> > Marco
> >> >
> >>
> >> Just for your information I tried the same test with pc in a virtu=
al machine with 32MB of RAM:
> >>
> >> Version 1.03e =A0 =A0 =A0 ------Sequential Output------ --Sequenti=
al Input- --Random-
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -Per Chr- --Block-- -Rewri=
te- -Per Chr- --Block-- --Seeks--
> >> Machine =A0 Size:chnk K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/se=
c %CP =A0/sec %CP
> >> hostname =A0 =A0 15M:1k 14156 =A099 128779 100 92240 100 11669 100=
 166242 =A099 80058 =A082
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ------Sequential Create---=
--- --------Random Create--------
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -Create-- --Read--- -Delet=
e-- -Create-- --Read--- -Delete--
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 files =A0/sec %CP =A0/sec %CP =A0/sec =
%CP =A0/sec %CP =A0/sec %CP =A0/sec %CP
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 4 =A02842 =A099 133506 104 450=
88 101 =A02787 =A099 79581 101 58212 102
> >>
> >> These data are the proof of the importance of the environment, wor=
kload and so on when we talk
> >> about benchmark. Your consideration are really superficial.
> >
> > Unfortunately, your numbers are meaningless.
>=20
> I don't think so.
>=20
> > (PCs should have cca 3GB/sec RAM transfer rates; and you demosstrat=
ed
> > cca 166MB/sec read rate; disk is 80MB/sec, so that's too slow. If y=
ou
> > want to prove your filesystem the filesystem is reasonably fast,
> > compare it with ext2 on ramdisk.)
> >
> This is the point. I don't want compare it with ext2 from performance
> point of view. This comparison makes no sense for me. I've done this
> test to prove that if you change environment you can change in a
> purposeful way the results.

Yes, IOW you demonstrated that the numbers are machine-dependend and
really meaningless.

ext2 comparison would tell you how much pramfs sucks (or not).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
