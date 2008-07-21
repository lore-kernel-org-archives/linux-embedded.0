From: Ben Nizette <bn@niasdigital.com>
Subject: Re: RFC: prevent auto binding for some platform devices
Date: Mon, 21 Jul 2008 17:44:05 +1000
Message-ID: <1216626245.4004.158.camel@moss.renham>
References: <20080721064224.GA28238@digi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080721064224.GA28238@digi.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Cc: linux-embedded@vger.kernel.org


On Mon, 2008-07-21 at 08:42 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> I have an emedded machine here on my desk and want to stop some
> driver/device pairs from binding.  There are two types of reason for =
it:
>=20
>   a) pin muxing doesn't allow attaching e.g. spi and serial at the sa=
me
>      time.  In this case I want a defined "winner" that doesn't depen=
d
>      on link (or module load) order.
>=20
>   b) the devboard has attached an led on a line that is also availabl=
e
>      on a header.  So I don't want to bind the led driver by default
>      because there might be another device connected to the gpio line=
=2E
>      Still I want to provide the led device and driver such that
>      userspace can bind these two via sysfs and use it.
>=20

While most boards probably have these decisions make in platform code
and compiled in, I certainly see value in being able to keep dev-board
owners out of the kernel source.

> I think a patch would be easy:
>=20
>   - add a flag to struct device(?) settable by platform code that wou=
ld
>     indicate that the device should not autoprobe.
>=20
>   - change bus_attach_device to check that flag and only call
>     device_attach if it's not set.
>=20
> Would this be sensible?  Would it help anyone else?

This would be a good first step but it still requires a source change
and recompile if you want to change any device in the boot branch.
Anything not in the boot path can be probed later by sysfs interaction
which I like.  This would solve (most of?) the "deferred module init"
problems which have come across this list [1] as well as things like th=
e
recent mmc-over-spi-over-gpio-fake-hotplug thing [2].

That said, I don't have any sensible comments on how to implement the
below, but my $0.02 would be to go about things a bit differently.

I reckon some arch-independent version of FDT kinda thing would be a
good way to go.  That is, some easy way for the user to specify the
whole hardware layout and tell the kernel about it without that tedious
mucking about inside kernel source.

If not the whole hardware layout (which I guess is quite arch-dependant=
)
then at least the list of devices to probe in a way which allows you to
play with the boot devices too (and doesn't need an initramfs).

So yes, I reckon it'd help others, certainly a worthy topic for
discussion :-D

>=20
> Best regards
> Uwe
>=20

Thanks,
	--Ben.

[1]
http://www.mail-archive.com/linux-embedded@vger.kernel.org/msg00370.htm=
l

[2]
http://groups.google.com/group/linux.kernel/browse_thread/thread/f57ac9=
3bd37626eb/587d1302f0f497ad?lnk=3Draot

