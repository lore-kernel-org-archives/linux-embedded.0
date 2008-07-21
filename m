From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: Re: RFC: prevent auto binding for some platform devices
Date: Mon, 21 Jul 2008 09:44:45 +0200
Message-ID: <20080721074445.GA30156@digi.com>
References: <20080721064224.GA28238@digi.com> <f19298770807210038u76b62f28uea55a631f7e13834@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f19298770807210038u76b62f28uea55a631f7e13834@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alexey Zaytsev <alexey.zaytsev@gmail.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hello Alexey,

Alexey Zaytsev wrote:
> [Sorry, probably a gmail web-interface bug?]
>=20
> On Mon, Jul 21, 2008 at 10:42 AM, Uwe Kleine-K=F6nig
> <Uwe.Kleine-Koenig@digi.com> wrote:
> > Hello,
> >
> > I have an emedded machine here on my desk and want to stop some
> > driver/device pairs from binding.  There are two types of reason fo=
r it:
> >
> >  a) pin muxing doesn't allow attaching e.g. spi and serial at the s=
ame
> >     time.  In this case I want a defined "winner" that doesn't depe=
nd
> >     on link (or module load) order.
> >
> >  b) the devboard has attached an led on a line that is also availab=
le
> >     on a header.  So I don't want to bind the led driver by default
> >     because there might be another device connected to the gpio lin=
e.
> >     Still I want to provide the led device and driver such that
> >     userspace can bind these two via sysfs and use it.
> >
> > I think a patch would be easy:
> >
> >  - add a flag to struct device(?) settable by platform code that wo=
uld
> >    indicate that the device should not autoprobe.
> >
> >  - change bus_attach_device to check that flag and only call
> >    device_attach if it's not set.
> >
> > Would this be sensible?  Would it help anyone else?
>=20
> How about simply not registering the missing devices in your
> board setup code?
They are not missing.  In the a) case above they just conflict and I
want to provide a way to change the default from userspace.  E.g.

	echo "serialdevice.1" > /sys/bus/platform/drivers/serialdriver/unbind
	echo "spidevice.1" > /sys/bus/platform/drivers/spidriver/bind

and for b) I want to be able to enable the led if nothing else is
connected to the line.

Best regards
Uwe

--=20
Uwe Kleine-K=F6nig, Software Engineer
Digi International GmbH Branch Breisach, K=FCferstrasse 8, 79206 Breisa=
ch, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 1=
3962
