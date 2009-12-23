From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Wed, 23 Dec 2009 02:28:38 +0000
Message-ID: <20091223022837.GE19806@shareable.org>
References: <4B29EC68.1040109@0xlab.org> <200912202045.37159.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200912202045.37159.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: celinux-dev@tree.celinuxforum.org, Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org, Andy Green <andy@warmcat.com>

Rob Landley wrote:
> However, if that's your minimum then you can't use the bootloader to
> re-flash the device, which is kind of handy.  (It gives you an
> un-bricking fallback short of pulling out a jtag.)  But doing that
> requires things like a network driver, TCP/IP stack, tftp
> implementation, serial driver, command line interpreter, and so on.
> And of course code to erase and write flash blocks for your flash
> chip du jour, plus knowledge of the flash layout.  (In theory, said
> knowledge comes from parsing a device tree.)

What a lot of bloat you added for such a basic requirement. :-)
You don't need all that to unbrick.

It's enough to have a serial/USB/network driver (choose one),
obediently listen for a kernel to be sent for booting from RAM,
and boot it.  In the network case it can be a simple UDP protocol,
or even raw ethernet.

No TCP/IP, no TFTP, not even BOOTP (but it's a nice bonus), no command
line interpreter (just a GPIO on board to boot into "unbrick me" mode
:-), and most strikingly _no_ flash driver for flash chip du jour.

To flash it you send a kernel to boot from RAM which is capable of
flashing it.

> > http://wiki.openmoko.org/wiki/Qi
> 
> Looking at the screen shot there, you've got code to parse ext2 filesystems.  
> What is your definition of "minimal"?

Ew, ext2 doesn't even satisfy powerfail-during-kernel-upgrade safety.

I agree it does beg the question of what is "minimal".

The proposal did explain quite well what Qi aims for: not duplicating
lots of kernel drivers badly.  If it succeeds in the area of flash
writing, network drivers, network protocols and so on it would be no
bad thing.

One area for potential common ground among bootloaders could be to
share the code for parsing filesystems.  It'd be great to see that in
a library shared by GRUB, Qi, U-boot and so on as it's not device
specific at all and not particularly large, but not so trivial that
it's good to have lots of clones.

It's possible to boot without parsing filesystems, but that is one
rather nice feature, and with the right filesystems it can make system
updates powerfail-safe.

> Rationale for not providing a boot menu is you don't want to mess with video 
> init.  I don't think I've actually seen an embedded bootloader that messes 
> with video, they do serial console instead, and you have a screen shot of 
> serial console messages so apparently the serial driver part is there...

In perspective, serial is usually quite simple.  Output only serial is
even simpler, though :-)

-- Jamie
