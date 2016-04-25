From: Nick Gifford <nick.gifford@ingenu.com>
Subject: RE: mounting squashfs as initrd from RAM
Date: Mon, 25 Apr 2016 18:36:51 +0000
Message-ID: <20FFB90893A2AB4492D9DFB3B61CC8C403A372F9@MBX028-W1-CA-4.exch028.domain.local>
References: <20FFB90893A2AB4492D9DFB3B61CC8C403A15778@MBX028-W1-CA-4.exch028.domain.local>,<5717BBF5.1000401@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <5717BBF5.1000401@landley.net>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Rob Landley <rob@landley.net>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Thanks for the help, Rob.  Comments inline...

nick
________________________________________
From: Rob Landley [rob@landley.net]
Sent: Wednesday, April 20, 2016 10:27 AM
To: Nick Gifford; linux-embedded@vger.kernel.org
Subject: Re: mounting squashfs as initrd from RAM

On 04/12/2016 04:42 PM, Nick Gifford wrote:
> I have a squashfs filesystem that I want to mount as initrd.  I don't
> want to use initramfs since the squashfs compresses better.  I'm ok
> with the wasted RAM since our system is much more constrained by flash
> space than RAM.

Did we ever hook up initramfs xz compression in the kernel? That really
should compress better than squashfs (for the same reason tar compresses
better than zip, no need to retain random access capabaility to the data).

[nick] I can look into that.  I'm not against using initramfs, but I tried that and had a similar issue.  My main requirement is that the rootfs is not bundled with the kernel.

> I want to mount it from RAM so that the flash partition can be safely
> written/upgraded while linux is running with the RAM copy mounted.

So you're using a squashfs formatted initrd.
[nick] yes

> Eventually, I want the linux kernel and the initrd to each have their
> own partition (for upgradeability), but right now I'm just copying them
> directly into RAM from u-boot and passing the initrd RAM address as the
> second arg to bootm.  Below is my u-boot environment and console log.

Let's see...

> Trying to unpack rootfs image as initramfs...
> DEBUG unpack_to_rootfs buf=[fe7f9000], len=15958016
> Unable to handle kernel paging request at virtual address fe7f9000

That second line does not exist in the kernel source I have, so I'm
guessing that's a debug printf you added. Given that, I don't know if
that's the source buffer or the destination buffer, but whatever it is
the kernel can't access it.

[nick] I'll attach a diff below.  Those are the arguments to the unpack_to_rootfs function.

Sounds like your u-boot isn't correctly telling the kernel where to find
the blob it loaded? Let's see...

[nick] I believe uboot is doing the right thing.  It was not even booting linux until I got the uboot image header right.  Also, the "len=15958016" in my linux debug log is exactly the right size, so the blob size is being passed to linux correctly.

> Virtual kernel memory layout:
>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>     fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
>     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
>     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
>     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
>     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
>       .text : 0xc0008000 - 0xc071b584   (7246 kB)
>       .init : 0xc071c000 - 0xc0756880   ( 235 kB)
>       .data : 0xc0758000 - 0xc07ae0b8   ( 345 kB)
>        .bss : 0xc07ae0b8 - 0xc0fb33b8   (8213 kB)

It's in the vmalloc space. So presumably destination buffer?

> TFTP from server 10.50.4.82; our IP address is 10.50.6.251
> Filename 'urootfs.squashfs'.
> Load address: 0x1000000

Your u-boot thinks it loaded the initrd at 0x1000000, which is not
mentioned in your printk. Not knowing where you added your printk, I
couldn't tell you what variable it corresponds to...

[nick] Due to reasons above, I my guess is that uboot is moving the image from 0x1000000 to 0x3e7f9000 before booting linux.  This somewhat makes sense to me since it is near the top of the 1GB of RAM on this system.

> Any help on why I'd be seeing the unhandled paging request?

Not without knowing what you've done to your code, no.

> I added the "DEBUG: phys to virt addr 3e7f9000 --> fe7f9000" where it
> looks like 0xfe7f9000 is being mapped for the initrd in
arch/arm/mm/init.c.

That's a 790 line file, which contains 45 instances of "initrd" but does
not contain the word "buf" so i have no idea what variable you printed out.

[nick] What I took from this is that after being moved to 0x3e7f9000, it is then being mapped to virtual memory at 0xfe7f9000.  Note that 0xfe7f9000 is the address that is later given to unpack_to_rootfs (with the correct size).

And it's architecture independent code where it looks like you're having
a board-specific problem. Possibly this is the first vmalloc use in the
kernel and vmalloc doesn't work on your board, it's hard to tell from here.

[nick] I don't think it is a board problem as everything boots up fine when I mount the rootfs out of flash with kernel arguments of "console=ttyPS1,115200 earlyprintk noinitrd root=/dev/mtdblock6 rootfstype=squashfs ro"

Rob

[nick] And here is the diff:

[ngifford@localhost xlnx-3.17]$ svn diff
Index: init/initramfs.c
===================================================================
--- init/initramfs.c	(revision 103446)
+++ init/initramfs.c	(working copy)
@@ -463,6 +463,7 @@
 	state = Start;
 	this_header = 0;
 	message = NULL;
+    printk(KERN_INFO "DEBUG unpack_to_rootfs buf=[%x], len=%d\n", buf, len);
 	while (!message && len) {
 		loff_t saved_offset = this_header;
 		if (*buf == '0' && !(this_header & 3)) {
@@ -616,6 +617,7 @@
 		printk(KERN_INFO "Trying to unpack rootfs image as initramfs...\n");
 		err = unpack_to_rootfs((char *)initrd_start,
 			initrd_end - initrd_start);
+
 		if (!err) {
 			free_initrd();
 			goto done;
Index: arch/arm/mm/init.c
===================================================================
--- arch/arm/mm/init.c	(revision 103446)
+++ arch/arm/mm/init.c	(working copy)
@@ -60,6 +60,7 @@
 
 		phys_initrd_start = start;
 		phys_initrd_size = size;
+        printk(KERN_WARNING "early_initrd %x %d", phys_initrd_start, phys_initrd_size);
 	}
 	return 0;
 }
@@ -80,6 +81,7 @@
 {
 	phys_initrd_start = tag->u.initrd.start;
 	phys_initrd_size = tag->u.initrd.size;
+        printk(KERN_WARNING "parse_tag_initrd2 %x %d", phys_initrd_start, phys_initrd_size);
 	return 0;
 }
 
@@ -306,6 +308,7 @@
 
 		/* Now convert initrd to virtual addresses */
 		initrd_start = __phys_to_virt(phys_initrd_start);
+        printk(KERN_INFO "DEBUG: phys to virt addr %x --> %x", phys_initrd_start, initrd_start);
 		initrd_end = initrd_start + phys_initrd_size;
 	}
 #endif
