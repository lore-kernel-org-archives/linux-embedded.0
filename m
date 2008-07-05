From: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Subject: Re: optimal hardware design for an ARM9 based single board	computer
 to work with existing linux drivers
Date: Sat, 05 Jul 2008 13:54:28 +0200
Message-ID: <486F60F4.1050109@gmail.com>
References: <486F38CF.40803@gmail.com> <20080705103509.GN4319@pengutronix.de> <486F557D.3090209@gmail.com> <20080705113255.GO4319@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080705113255.GO4319@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded@vger.kernel.org


Robert Schwebel wrote:
> Has it been different in the past? Last time we had an EP93 project (has
> been some time ago), the support for Maverick Crunch was horrible and
> cirrus' effort to support Linux mainline was almost 0.
> 
> If you want to have something which has good community support, check
> what the mainline Linux kernel supports and base your stuff on that.
> 
> rsc


Sounds good to me.
I could still do some peripheral device driver development for the stuff I want
to attach on the EP3902 board I already bought and do some testing as well.
Can you suggest some specific CPU ?

Of course features like LAN, USB and such are nice to have, but they are not
required for my design.
Goals should rather be that the CPU is cheap, easy to get and one should be able
to solder it by hand (e.g. SMD paste and hot-air flow soldering).
For this reason BGA packages are not possible.


Anyway, back to my original question ?
What is the best way to attach peripheral hardware so that existing drivers in
the linux-kernel can be used without having to do a lot of patching ?
It would be great if one could just use I2C expanders to interface low-speed
devices and the device drivers will just work once they know where to find the
hardware.

One of the chips I want to talk to is a voice codec with
data-rates < 15kbytes/sec.

Due to the low data-rate this should work with I2C port expanders.
The other possibility would be to use a multiplexed parallel bus using bus-switches.

How would you hook up such hardware to the CPU ?
What can you suggest ?

Is there something like good documentation on how to attach hardware to an
embedded CPU so that the linux-kernel will work just fine with it ?

stefan
