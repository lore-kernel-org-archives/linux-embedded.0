From: "Dasgupta, Romit" <romit@ti.com>
Subject: RE: prevent auto binding for some platform devices
Date: Mon, 21 Jul 2008 12:54:50 +0530
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB5930111C4F31C@dbde02.ent.ti.com>
References: <20080721064224.GA28238@digi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080721064224.GA28238@digi.com>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hi,
    I think with 2.6.18 or so onwards, there are two entries under /sys=
/bus/<bus_type>/
drivers_autoprobe, drivers_probe. (Here bus_type is platform, usb, pci,=
 etc...)
By default drivers_autoprobe is 1. You need to disable autprobing of th=
e driver by writing a 0 to that entry.
Once you do that you need to write the name of the device that you want=
 the driver to bind to in the drivers_probe entry.

Hope this is useful.

Thanks,
-Romit



>-----Original Message-----
>From: linux-embedded-owner@vger.kernel.org [mailto:linux-embedded-
>owner@vger.kernel.org] On Behalf Of Uwe Kleine-K=F6nig
>Sent: Monday, July 21, 2008 12:12 PM
>To: linux-embedded@vger.kernel.org
>Subject: RFC: prevent auto binding for some platform devices
>
>Hello,
>
>I have an emedded machine here on my desk and want to stop some
>driver/device pairs from binding.  There are two types of reason for i=
t:
>
>  a) pin muxing doesn't allow attaching e.g. spi and serial at the sam=
e
>     time.  In this case I want a defined "winner" that doesn't depend
>     on link (or module load) order.
>
>  b) the devboard has attached an led on a line that is also available
>     on a header.  So I don't want to bind the led driver by default
>     because there might be another device connected to the gpio line.
>     Still I want to provide the led device and driver such that
>     userspace can bind these two via sysfs and use it.
>
>I think a patch would be easy:
>
>  - add a flag to struct device(?) settable by platform code that woul=
d
>    indicate that the device should not autoprobe.
>
>  - change bus_attach_device to check that flag and only call
>    device_attach if it's not set.
>
>Would this be sensible?  Would it help anyone else?
>
>Best regards
>Uwe
>
>--
>Uwe Kleine-K=F6nig, Software Engineer
>Digi International GmbH Branch Breisach, K=FCferstrasse 8, 79206 Breis=
ach, Germany
>Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB =
13962
>--
>To unsubscribe from this list: send the line "unsubscribe linux-embedd=
ed" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
