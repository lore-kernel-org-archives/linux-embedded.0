From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: initrd and uImage
Date: Mon, 11 Aug 2008 09:12:23 -0700
Message-ID: <48A064E7.1070104@am.sony.com>
References: <54582.81328.qm@web63407.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <54582.81328.qm@web63407.mail.re1.yahoo.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux-embedded <linux-embedded@vger.kernel.org>

Fundu wrote:
> Hi,
> First off i have a ppc based board.
> and i'm trying to load a kernel image with ramdisk rootfs.
> 
> i have build the kernel. it spit uImage,zImage and vmlinux.gz


> my question are.
> 1) what are all the different image types ? 
> i know the uImage is just the kernel, what are the rest (zImage & vmlinux.gz)?

vmlinux is the uncompressed result of compiling and linking the kernel.

I presume that vmlinux.gz is a gzipped version of vmlinux.

zImage is some other compressed kernel image format.

uImage is another kernel image format, with information
specifically for loading with U-Boot.

You can see what commands are being used to create these different
images by using "V=1" with your kernel make.  (e.g. make V=1 uImage)

On my machine, I see the following:
/bin/sh /a/home/tbird/work/tiny/branch_ss/scripts/mkuboot.sh -A arm -O linux -T kernel -C none -a 0x10008000 -e 0x10008000 -n 'Linux-2.6.23.17-alp_nl-gfcc28266' -d arch/arm/boot/zImage
arch/arm/boot/uImage

If I recall correctly, mkuboot.sh prepends the
size and start location for the kernel onto the zImage, in order to create
the uImage.  However, don't take my word for it -- see the U-Boot
documentation, or even better read the mkuboot.sh source, or the source
for U-Boot itself.  That's the beauty of open source.  You can see all
the software and examine/modify any part you want.

If the source is impenetrable, there's always the U-Boot mailing list.

> 2) i'm using u-boot as the bootldr. so i download the uImage (cause
> zImage and vmlinux.gz aren't bootlable) from tftp server and then do
> bootm <address> the kernel only load partially. How does the kernel
> know where/how to load the rootfs ?

Usually, you tell it with a command line option (root=...).
The command line can come from the boot loader, or it may be compiled
into the kernel binary.  See Documentation/kernel-parameters.txt
for information about kernel command line options.

This mentions root=, but I didn't see any examples in my quick glance
just now.  Here are some examples I use:

Use the first partition on the first IDE hard drive:
root=/dev/hda1
or (later kernels):
root=/dev/sda1

Use NFS root filesystem (kernel config must support this)
root=/dev/nfs

(Usually you need to add some other arguments to make sure
the kernel IP address gets configured, or to specify the
host NFS path.)

Use flash device partition 2:
root/dev/mtd/2

I hope this helps.

 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
