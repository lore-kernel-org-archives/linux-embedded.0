From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: initrd and uImage
Date: Mon, 11 Aug 2008 13:17:56 -0400
Message-ID: <1218475076.10489.10.camel@localhost.localdomain>
References: <54582.81328.qm@web63407.mail.re1.yahoo.com>
	 <48A064E7.1070104@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=nd7reyOjFVExOG4yGO3I363SI/N34jhYGgDNVQYmnck=;
        b=mJaIdhe5ln11WR8JiqpnwLZypxVchf3wbX0pLSnIW3tXgYcKYGN+WalU4vsRH0QXsZ
         +6f9YoK+Js01ks7QTp0kRgB19apTERbChofcyHZX/L/okKNZigYlgpyLk88uZIJNQhRV
         guxSi1PYNAlgnaywzWgdp90Lr2f08tqqYMlPQ=
In-Reply-To: <48A064E7.1070104@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: fundu_1999@yahoo.com, linux-embedded <linux-embedded@vger.kernel.org>

On Mon, 2008-08-11 at 09:12 -0700, Tim Bird wrote:
> Fundu wrote:
> > Hi,
> > First off i have a ppc based board.
> > and i'm trying to load a kernel image with ramdisk rootfs.
> > 
> > i have build the kernel. it spit uImage,zImage and vmlinux.gz
> 
> 
> > my question are.
> > 1) what are all the different image types ? 
> > i know the uImage is just the kernel, what are the rest (zImage & vmlinux.gz)?
> 
> vmlinux is the uncompressed result of compiling and linking the kernel.
> 
> I presume that vmlinux.gz is a gzipped version of vmlinux.
> 
> zImage is some other compressed kernel image format.

zImage (for ppc at least), is a "wrapper" around the kernel that does
the load and decompress.  It's akin to how uImage works, just for
non-U-Boot platforms.

> uImage is another kernel image format, with information
> specifically for loading with U-Boot.
> 
> You can see what commands are being used to create these different
> images by using "V=1" with your kernel make.  (e.g. make V=1 uImage)
> 
> On my machine, I see the following:
> /bin/sh /a/home/tbird/work/tiny/branch_ss/scripts/mkuboot.sh -A arm -O linux -T kernel -C none -a 0x10008000 -e 0x10008000 -n 'Linux-2.6.23.17-alp_nl-gfcc28266' -d arch/arm/boot/zImage
> arch/arm/boot/uImage
> 
> If I recall correctly, mkuboot.sh prepends the
> size and start location for the kernel onto the zImage, in order to create
> the uImage.  However, don't take my word for it -- see the U-Boot
> documentation, or even better read the mkuboot.sh source, or the source
> for U-Boot itself.  That's the beauty of open source.  You can see all
> the software and examine/modify any part you want.

mkuboot.sh is a script that calls the 'mkimage' tool that is provided
with the U-Boot source code.  I'd also recommend reading the U-Boot
source code to better understand this if your board uses U-Boot as the
bootloader.

> 
> If the source is impenetrable, there's always the U-Boot mailing list.
> 
> > 2) i'm using u-boot as the bootldr. so i download the uImage (cause
> > zImage and vmlinux.gz aren't bootlable) from tftp server and then do
> > bootm <address> the kernel only load partially. How does the kernel
> > know where/how to load the rootfs ?
> 
> Usually, you tell it with a command line option (root=...).
> The command line can come from the boot loader, or it may be compiled
> into the kernel binary.  See Documentation/kernel-parameters.txt
> for information about kernel command line options.

And for U-Boot, you want to make sure the command line is set via the
'bootargs' U-Boot environment variable.

josh
