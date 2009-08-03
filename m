From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: flicker free booting
Date: Mon, 3 Aug 2009 10:37:46 +0200 (CEST)
Message-ID: <alpine.LRH.2.00.0908031035080.15308@vixen.sonytel.be>
References: <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de>
 <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net> <20090731180932.GC29245@pengutronix.de> <4A733B1B.2000009@billgatliff.com> <20090803081905.GP2714@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090803081905.GP2714@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="ks_c_5601-1987"
To: Sascha Hauer <sha@pengutronix.de>
Cc: Bill Gatliff <bgat@billgatliff.com>, Robert Schwebel <r.schwebel@pengutronix.de>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

On Mon, 3 Aug 2009, Sascha Hauer wrote:
> On Fri, Jul 31, 2009 at 01:42:35PM -0500, Bill Gatliff wrote:
> > Could your bootloader pre-initialize the graphics hardware to the s=
ame =20
> > mode that the Linux driver will ultimately select, and then throw u=
p a =20
> > static graphic?  That would give you some output until the driver i=
tself =20
> > comes online.
>=20
> I implemented exactly this for the i.MX framebuffer last week. It wor=
ks
> by looking at the controllers physical screen start address, ioremapp=
ing
> this address and copying the content to the newly allocated framebuff=
er.
> Currently the driver still reinitilializes the controller with exactl=
y
> the same values. We could skip this initialization step depending on =
a
> imxfb.preinitialized=3D1 command line parameter and read back
> resolution/depth from the device in order to fill the fb_info struct.
>=20
> This approach works good, I just wonder how acceptable it is for
> mainline.

If the actual frame buffer driver doesn't do much after initialization,=
 we
already have (at least) two similar drivers in the kernel: vesafb and o=
ffb.
Both rely on firmware (PC BIOS vs. Open Firmware) to initialize the gra=
phics
mode. Feel free to unify all of this into `staticfb.c'...

With kind regards,

Geert Uytterhoeven
Software Architect
Techsoft Centre

Technology and Software Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
