From: Matthieu castet <castet.matthieu@free.fr>
Subject: Re: modules.dep and depmod.pl
Date: Sat, 14 Jun 2008 09:26:23 +0000 (UTC)
Message-ID: <loom.20080614T092033-823@post.gmane.org>
References: <63386a3d0806131611g61ad6ab1t16bc68ab6407a8dc@mail.gmail.com> <63386a3d0806131633g4721216al566c8b6959e4631@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-embedded@vger.kernel.org

Hi,

Linus Walleij <linus.ml.walleij <at> gmail.com> writes:

>=20
> Hi,
>=20
> what are other embedded developers experience with using the
> script "depmod.pl" from BusyBox to create
> installdir/lib/modules/=E2=89=A4version>/modules.dep
> during compile-time?
> (It's this beast:
>
http://busybox.net/cgi-bin/viewcvs.cgi/trunk/busybox/examples/depmod.pl=
?rev=3D20447&view=3Dmarkup
>=20
> I tried this thing to be able to modprobe off a read-only flash
> rootfilesystem and it "sort of" works, actually.
What's wrong with using your host depmod to build it.
When I build a crosscompilation kernel, and I do make module_install,
modules.dep are generated.






--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
