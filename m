From: Rob Landley <rob@landley.net>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Sun, 20 Dec 2009 20:45:36 -0600
Message-ID: <200912202045.37159.rob@landley.net>
References: <4B29EC68.1040109@0xlab.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B29EC68.1040109@0xlab.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: celinux-dev@tree.celinuxforum.org
Cc: Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org, Andy Green <andy@warmcat.com>

On Thursday 17 December 2009 02:31:36 Matt Hsu wrote:
> Summary: Refactoring Qi, lightweight bootloader.
>
> Proposer: Matt Hsu
>
>
> Description:
>
> Qi (named by Alan Cox on Openmoko kernel list) is a minimal bootloader that
> "breathes life" into Linux.  Its goal is to stay close to the minimum
> needed

Which bits does it do?

Every piece of software needs something to initialize the DRAM controller.  
After that, they could presumably just jump to a known location in flash that 
the kernel lives at, and the kernel can decompress itself and so on.  Doing 
just that much can probably be done in 4k pretty easily.  (I gloss over the 
kernel command line and root filesystem location, which can be hardwired into 
the image if you really don't care about providing the developer with a UI.)

However, if that's your minimum then you can't use the bootloader to re-flash 
the device, which is kind of handy.  (It gives you an un-bricking fallback 
short of pulling out a jtag.)  But doing that requires things like a network 
driver, TCP/IP stack, tftp implementation, serial driver, command line 
interpreter, and so on.  And of course code to erase and write flash blocks for 
your flash chip du jour, plus knowledge of the flash layout.  (In theory, said 
knowledge comes from parsing a device tree.)

I still live in hope that somebody will split the first part (coreboot) out 
from the second part (grub) in embedded bootloaders.  It's sad that the PC has 
a tradition of orthogonality here but the embedded world treats it as a single 
opaque lump.

> http://wiki.openmoko.org/wiki/Qi

Looking at the screen shot there, you've got code to parse ext2 filesystems.  
What is your definition of "minimal"?

Rationale for not providing a boot menu is you don't want to mess with video 
init.  I don't think I've actually seen an embedded bootloader that messes 
with video, they do serial console instead, and you have a screen shot of 
serial console messages so apparently the serial driver part is there...

Confused,

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
