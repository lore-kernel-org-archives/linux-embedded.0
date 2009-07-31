From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 17:53:52 +0200
Message-ID: <20090731155352.GA29245@pengutronix.de>
References: <1243956140.4229.25.camel@mulgrave.int.hansenpartnership.com> <20090602172941.GL3095@hansolo.jdub.homelinux.org> <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090731152617.GW29245@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

On Tue, Jun 02, 2009 at 08:35:35PM -0700, Greg KH wrote:
> On Tue, Jun 02, 2009 at 11:34:52PM +0200, Robert Schwebel wrote:
> > Could flickerfree-bootsplash be a topic? Or is that completely
> > pushed into the userspace these fastboot days?
>
> We have that working today, no in-kernel work needed other than the
> already-present KMS stuff. See the recent Moblin images for proof of
> this.

Well, I assume that the issue you've addressed is being flicker free
between the kernel and x.org; what I mean is flicker-free even with the
bootloader in mind.

What we want to address is another problem which is present on almost
all display-enabled SoC-type embedded hardware. This kind of hardware is
BIOS-free and is booted from an embedded bootloader like u-boot. These
processors are often pretty slow, being in the 200 MHz ARM926 league.

The boot scenario on these boxes looks like this:

1)  power-on
2a) on NAND-only systems, pre-bootloader is fetched from NAND block
2b) bootloader starts from NAND or NOR flash
3)  the bootloader fetches Linux from NAND/NOR flash
4)  kernel starts
5)  userspace starts
6)  application starts (i.e. app against qt+dfb or gtk+dfb)

These SoCs are usually built into "devices" which don't look like PCs;
think of it as mobile phones (although our applications are usually more
industry-style, like machine controllers, measurement systems etc). Most
industry applications have been built with microcontrollers + 2x16 alpha
numeric displays in the last generation; this type of hardware has a
boot time (from power-on to full operation) of something like 0.5 s.

So what I would like to see is this:

a) power on
b) almost immediately (< 1s) a splash screen appears
c) optionally be able to do some animation, progress bar etc
d) application appears (instantanously or by fading)

At the moment, we do this by using random hacks in the kernel, which is
pretty bad. So what I'm searching for is a clean API which may be
accesptable form the Linux mainline.

Here's a proposal from my kernel team:

- u-boot initializes framebuffer on some <address> + shows image
- kernel commandline: mem=127MB framebuffer=<num>:<address>:<size>
  The framebuffer is reserved at the given address (i.e. 1 MB
  at the upper end of the memory, so we have to reduce the
  overall memory available for Linux)
- kernel driver recognizes that the framebuffer was already set up and
  skips the initialisation step (which would otherwhise result in
  flicker)

A second step could be:

- Have this initial framebuffer as /dev/fb0 (mem at the end of RAM)
- In order to avoid flicker, the driver sets up a 2nd framebuffer,
  in dynamically allocated memory -> /dev/fb1. This framebuffer
  continues to display the splash image (or an animation). Switching
  from fb0 -> fb1 is done during VSync.
- While the splash image is still visible in fb1, the application
  starts, up to the point where it shows it's main screen. This usually
  never works flicker-free, but we don't see it, as fb1 is visible.
- switch back to fb0 (during a VSync to avoid flicker)
- optionally discard fb1 ressources

On some hardware, the switch could be done by fading from fb1 to fb0
(i.e. on i.MX27 this should be possible).

Drivers which see the framebuffer= parameter would have to skip their
hardware initialisation step.

What do you think? Would something like this be acceptable? Other ideas?

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
