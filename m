From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,
	lightweight bootloader
Date: Wed, 23 Dec 2009 10:43:23 +0100
Message-ID: <20091223094323.GG22533@pengutronix.de>
References: <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com> <20091221231922.GO22533@pengutronix.de> <4B3081C3.3000909@warmcat.com> <20091222111250.GW22533@pengutronix.de> <4B3146E9.3010101@warmcat.com> <20091222232804.GB22533@pengutronix.de> <4B31D6F0.2040009@warmcat.com> <20091223085607.GE22533@pengutronix.de> <4B31E2F2.4010206@warmcat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B31E2F2.4010206@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Green <andy@warmcat.com>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

On Wed, Dec 23, 2009 at 09:29:22AM +0000, Andy Green wrote:
> > If you don't step into for example toolchain problems or other crazy
> > things...
>
> Again this is buildroot thinking. The distro provides both the native
> and cross toolchains for you. You're going to want to use the same
> distro as you normally use on your box so the cross toolchain installs
> as a package there.
>
> If all that's left is the risk of "crazy things" happening well that's
> a risk whatever you do or even if you do nothing :-)

What I mean is that in the past we had more than once the case that
we've found showstopper bugs in upstream gcc, binutils etc. (ARM has
much less coverage than x86). It was never a problem in the project,
because we actually have been able to port test cases to the latest gcc,
reproduc, report to upstream, get it fixed, port it back. That at least
implies that you *are* able to rebuild everything (which is possible in
both ways, of course).

> The only thing I know of that matches "outside the kernel" requirement
> is the machine ID that's passed in on ATAG. I agree it's generally
> good to have a single build that's multipurpose.

Machine ID is a good concept, but doesn't work on everything. What's the
machine on a system that consists of a cpu module and a baseboard?
Things move into the oftree direction, and I think bootloaders have to
deal with that, or there has to be a possibility that an early kernel
stage deals with the oftree. But that just moves the hackery-code from
the bootloader into the kernel, which is no gain.

> On iMX you have to go read IIM to get device info but actually that's
> not hard.

... as long as the hardware guys don't decide in their great wisdom to
change the meaning of some bits from chip to chip ...

> But that device ID will itself alone tell you the on-SoC peripherals
> since there's an ID per die; it makes no difference if this expanded
> SoC oftree data itself lives in the kernel then. The non-SoC stuff
> can just be probed.

Off-board devices behind SPI, I2C and chip select busses cannot be
probed.

You are observing a subset of the embedded universe, and you are right
if you limit to it. Bootloaders like barebox or u-boot provide a concept
for *all* use cases.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
