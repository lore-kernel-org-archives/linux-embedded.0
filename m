From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: initrd and uImage
Date: Fri, 8 Aug 2008 20:16:08 +0200
Message-ID: <20080808181608.GL10168@pengutronix.de>
References: <54582.81328.qm@web63407.mail.re1.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54582.81328.qm@web63407.mail.re1.yahoo.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fundu <fundu_1999@yahoo.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Fri, Aug 08, 2008 at 09:42:41AM -0700, Fundu wrote:
> First off i have a ppc based board.
> and i'm trying to load a kernel image with ramdisk rootfs.

Why? You can also boot your root fs for example directly from a flash
partition.

> i have build the kernel. it spit uImage,zImage and vmlinux.gz

That depends on your build system ...

> my question are.
> 1) what are all the different image types ? 
> i know the uImage is just the kernel, what are the rest (zImage & vmlinux.gz)?

An uImage can contain a kernel but also other things. Please check the
U-Boot documentation for more details.

zImage and vmlinux.gz are kernel images. You usually need only one of
them, but the details do surely depend also on your build system.

> 2) i'm using u-boot as the bootldr. so i download the uImage (cause
> zImage and vmlinux.gz aren't bootlable) from tftp server and then do
> bootm <address> the kernel only load partially. How does the kernel
> know where/how to load the rootfs ? 

In U-Boot you can add a kernel command line by setting the bootargs
environment variable.

It's probably a good idea to start reading the U-Boot documentation, or
whatever came with your board support package.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
