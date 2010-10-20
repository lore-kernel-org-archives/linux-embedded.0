From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Wed, 20 Oct 2010 14:32:16 -0500
Message-ID: <AANLkTik-stsHoEcpJkuszFxyrVPjvEy3iMNkovX_kzXe@mail.gmail.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
	<20101016074240.GC653@angua.secretlab.ca>
	<AANLkTikLnoAiZpZpA-aUPa3kSW7ZO=542wLgzFUqiL_4@mail.gmail.com>
	<20101020183435.GA12480@angua.secretlab.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20101020183435.GA12480@angua.secretlab.ca>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-embedded@vger.kernel.org

Grant:

> Identify by name tends to be a horrible interface in my opinion. The
> lesson has been learned in the network and block layers that names
> change over time and trying to lock them down to something that a use=
r
> finds 'sane' ends up in a mess of workarounds and bad assumptions in
> the code.

The reason it doesn't work for network and block devices is because
the names of those devices aren't relevant; it's only the IP address
assigned and mount point that are of interest.  Furthermore, you
rarely talk directly to an ethernet controller: you just route packets
through it.  And the kernel decides which packets are going to go
where based solely on IP and related information, and never the name
of the device.  So pretending that the name matters is a recipe for
trouble.

PWM devices are different, I think, in that the name of the device
uniquely identifies a physical peripheral in the part, and the channel
number is often mapped to a specific pin on the chip package by the
platform integrator.  If you have a hope of driving your PWM signal to
the right place each time the system builds and boots, you have to be
able to specify things to that level of detail.

And then there's the laziness factor.  :)  I don't like having to
figure out over and over again that "pwm-1:2" is really mapped to the
PWMC peripheral's channel two; and I definitely don't like worrying
that channel enumerations will change just because I plugged in a new
i2c GPIO chip or LED driver.  I want to be able to tell the system
that I want to talk to a specific pin, regardless of when it shows up
relative to all the other pins in the system.

> In userspace, the correct solution is to expose real information abou=
t
> the device (how the instance is connected to the system plus any othe=
r
> identifying data) in the sysfs tree and let udev (or a trivial
> replacement) decode to a stable user-friendly name.

That's precisely what I'm doing.

I don't anticipate that device authors will use names like
"panel_backlight".  Rather, they should use names like "pwmc:2:3",
which means "PWMC peripheral 2 channel number 3".  Then they can look
at a schematic to verify that PWMC2 indeed goes to the panel
backlight.

> Essentially, identifying by name attempts to expose real information
> about which device it is, but the process of encoding a name is lossy
> and so it fails to be robust in the long term.

In the case of semi-transparent devices like ethernet controllers and
block devices, I agree.  But the information for a PWM signal doesn't
merely pass through a PWM controller: it tells the controller what to
do.  Subtle but important difference compared to an ethernet
controller that makes it compelling to use actual names in my case.

> Yeah, by changing to using class attributes, a lot of this could end
> up going away.

Looking at that now, in fact.

> My experience has been there are very few things that cannot be
> deferred to module_initcall() time if the device model is handled
> well. =A0Typically the things that fall outside of that model are cor=
e
> infrastructure things like irq controllers which need to be ready to
> go before many of the subsystems are initialized.

The one situation that comes to mind is i2c GPIO expanders on powerpc.
 Since everything in that world is bound only after the DTS file gets
parsed, finding and registering things can be tricky.  Or maybe it was
the onboard GPIO controllers in the MPC5200.  IIRC, I found a case
where something could call pwm_register() before the PWM framework
itself had even been established.  That caused sysfs to complain, to
say the least.

Of course, the problem could actually be that I'm not using sysfs
quite right yet.  Hmm...


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
