From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: Re: prevent auto binding for some platform devices
Date: Mon, 21 Jul 2008 09:33:55 +0200
Message-ID: <20080721073355.GA29676@digi.com>
References: <20080721064224.GA28238@digi.com> <B85A65D85D7EB246BE421B3FB0FBB5930111C4F31C@dbde02.ent.ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB5930111C4F31C@dbde02.ent.ti.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Dasgupta, Romit" <romit@ti.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hello Romit,

Dasgupta, Romit wrote:
>     I think with 2.6.18 or so onwards, there are two entries under /s=
ys/bus/<bus_type>/
> drivers_autoprobe, drivers_probe. (Here bus_type is platform, usb, pc=
i, etc...)
> By default drivers_autoprobe is 1. You need to disable autprobing of =
the driver by writing a 0 to that entry.
I saw that, too, but this fails in two ways:  First if the drivers are
compiled in (as usual with an embedded machine) it's too late when
userspace is able to do that because then the drivers are already bound=
=2E
(The underlain kernel data is currently not available to platform code.=
)
And I don't want to stop the whole bus from binding, only the
conflicting devices.

Thanks
Uwe

--=20
Uwe Kleine-K=F6nig, Software Engineer
Digi International GmbH Branch Breisach, K=FCferstrasse 8, 79206 Breisa=
ch, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 1=
3962
