From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: RFC: prevent auto binding for some platform devices
Date: Mon, 21 Jul 2008 08:42:24 +0200
Message-ID: <20080721064224.GA28238@digi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

Hello,

I have an emedded machine here on my desk and want to stop some
driver/device pairs from binding.  There are two types of reason for it=
:

  a) pin muxing doesn't allow attaching e.g. spi and serial at the same
     time.  In this case I want a defined "winner" that doesn't depend
     on link (or module load) order.

  b) the devboard has attached an led on a line that is also available
     on a header.  So I don't want to bind the led driver by default
     because there might be another device connected to the gpio line.
     Still I want to provide the led device and driver such that
     userspace can bind these two via sysfs and use it.

I think a patch would be easy:

  - add a flag to struct device(?) settable by platform code that would
    indicate that the device should not autoprobe.

  - change bus_attach_device to check that flag and only call
    device_attach if it's not set.

Would this be sensible?  Would it help anyone else?

Best regards
Uwe

--=20
Uwe Kleine-K=F6nig, Software Engineer
Digi International GmbH Branch Breisach, K=FCferstrasse 8, 79206 Breisa=
ch, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 1=
3962
