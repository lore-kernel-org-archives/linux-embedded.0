From: Matthias Kaehlcke <matthias@kaehlcke.net>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Wed, 20 Jan 2010 08:12:39 +0100
Message-ID: <20100120071239.GR16182@darwin>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com> <20100119095024.GD16182@darwin> <cb9ecdfa1001190213u69469505k9c42142bdc17f750@mail.gmail.com> <20100119102026.GF16182@darwin> <cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com> <Pine.LNX.4.64.1001191414090.32263@lnxricardw.se.axis.com> <20100119140600.GH16182@darwin> <cb9ecdfa1001191832k28961740qa825a8c8d5e631f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cb9ecdfa1001191832k28961740qa825a8c8d5e631f2@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, kernelnewbies <kernelnewbies@nl.linux.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

El Wed, Jan 20, 2010 at 10:32:15AM +0800 Johnny Hung ha dit:

> 2010/1/19 Matthias Kaehlcke <matthias@kaehlcke.net>:
> > El Tue, Jan 19, 2010 at 02:17:22PM +0100 Ricard Wanderlof ha dit:
> >
> >> On Tue, 19 Jan 2010, Johnny Hung wrote:
> >>
> >>> Okay, I think the steps is below if my rootfs is ramdisk and conf=
igure
> >>> files in jffs2,
> >>>
> >>> 1. cp /etc/* /mnt/mtd/etc/ =A0 =A0(/mnt/mtd is my jffs2 fs)
> >>> 2. rm -rf /etc/*
> >>> 3. make symbolic links from all /etc/xx to /mnt/mtd/etc/xxx
> >>> 4. remake ramdisk rootfs
> >>>
> >>> It seems all files in ramdisk rootfs /etc all links to /mnt/mtd/e=
tc/
> >>> and try to modify these files is effective after reboot.
> >>> But is this a common way in embedded linux ?
> >>
>=20
> Thanks, I understand.
>=20
> >> In principle, but it is easier (and cleaner) to make a symbolic li=
nk from
> >> (say) /etc -> /mnt/mtd/etc without linking every individual file a=
nd
> >> directory.
> >
> > i totally agree with ricard when you want to move the entire direct=
ory
> > to jffs2 and not only some selected files
> >
> >> You could also use a jffs2 file system in flash for your rootfs, t=
hat way
> >> you wouldn't need a ramdisk at all.
> >
> > i'd also recommend you to consider if you really need the
> > ramdisk. when using a ram disk its entire content is loaded to the =
RAM
> > occupying space, even if you don't use certain files (or part of
> > them). other filesystems are more efficient in this aspect.
> > if the main purpose is to have a read only rootfs, i'd suggest a lo=
ok
> > at squashfs.
>=20
> I consider to use ramdisk as rootfs because worry about wrong
> operation in rootfs (is use jffs2 rootfs) and it will cause system
> boot up failed.

you could set up a rootfs partition with a read-only file system
(squashfs, jffs2 mounted ro) and a second partition that's writable.

> Another query, does the syslogd/klogd log files also store in jffs2
> rootfs? Write to jffs2 frequently will reduce flash life cycle.

by default the log files will be written to /var/log, if this
directory happens to be on a jffs2 partition writes will go there and
produce wear out. to avoid this you could set up a small tmpfs (in
RAM) and mount it on /var

--=20
Matthias Kaehlcke
Embedded Linux Developer
Barcelona

          We can't solve problems by using the same kind
             of thinking we used when we created them
                         (Albert Einstein)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
