From: Rob Landley <rob@landley.net>
Subject: Re: determine boot device in initrd
Date: Fri, 21 Jan 2011 20:48:52 -0600
Message-ID: <4D3A4594.5040900@landley.net>
References: <A4B10BB8CE8F86468ABF12A5E4A5CC9920F919A3C4@mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <A4B10BB8CE8F86468ABF12A5E4A5CC9920F919A3C4@mail>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jacob Avraham <jacob@compass-eos.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 01/20/2011 03:57 AM, Jacob Avraham wrote:
> Hi,
> 
> I have a system with several USB disks, each of them is boot-capable.
> Each such device has a kernel and initrd in its filesystem.
> I want to be able to determine in initrd from which USB device it (and the kernel) were
> loaded from, so I can mount the root filesystem from that device.
> Is that doable?
> I don't want to use a static "root=" entry in grub, since I don't know which sd device it will be.

Your bootloader loads the kernel and hands off control to it.  Unless
the bootloader informs the kernel where it loaded it from, the kernel
has know way of knowing since it was a separate program that did it.
(Who says it was a local device?  It could have been a PXE boot.  It may
have been loadlin from Windows that got the kernel off of a network
share.  It could be the qemu -kernel option that manually populates the
virtual system's DRAM with a kernel image and jumps to the start of it
when it initializes the virtual CPU.)

One of the motivations behind the "device tree" stuff is that the
bootloader hands the kernel a standardized data structure telling it
where all the hardware is in the system, and one of the things it can
annotate this tree with is "and _this_ one was the boot device".  Of
course both the x86 guys and the ARM maintainer have come out against
cross-platform standardization that would require them to change what
they're already doing in any way.

In general, unless the bootloader tells you where it loaded stuff from,
the kernel has no way of knowing.  Once upon a time PC hardware had
standardized layouts for stuff and the kernel could use heuristics based
on knowledge of that to go "ah, first hard drive on the first IDE
controller, this partition has the boot flag set, we came from HERE".
Then IBM went "this doesn't help us enumerate hardware in our mainframes
with 30,000 disks: Linux on the dekstop must accept a standardized
mechanism that will inflict the full pain of mainframe device
enumeration on the Linux desktop community or this will never be fixed
for us!"  There hasn't really been much of a Linux desktop community
ever since that I've noticed, and device enumeration still sucks, but
that's udev for you.

Anyway, the kernel can try to guess this info by looking at various
devices and seeing if it recognizes any of them.  But it's up to you to
annotate your devices with with something it can recognize, and
programming your initrd to look for that annotation.  UUID partition
labels are fairly popular.

Rob
