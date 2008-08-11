From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: initrd and uImage
Date: Mon, 11 Aug 2008 22:56:41 +0200
Message-ID: <20080811205641.GB9467@game.jcrosoft.org>
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

On 09:42 Fri 08 Aug     , Fundu wrote:
> Hi,
> First off i have a ppc based board.
> and i'm trying to load a kernel image with ramdisk rootfs.

Which version of U-Boot do you use?
Which features do you enable?

> 
> i have build the kernel. it spit uImage,zImage and vmlinux.gz
> 
> my question are.
> 1) what are all the different image types ? 
> i know the uImage is just the kernel, what are the rest (zImage & vmlinux.gz)?
> 
> 2) i'm using u-boot as the bootldr. so i download the uImage (cause zImage and vmlinux.gz aren't bootlable) from tftp server and then do bootm <address> the kernel only load partially. How does the kernel know where/how to load the rootfs ? 

It's depend on which uImage you use.

In U-Boot, you can generate a Multi-File Image with the ramdisk inside,
FDT, multiple configuration etc...

In the case you describe you are supposed to download the ramdisk via
tftp also and set the kernel parameter via the bootargs variable and do
bootm.

example

U-Boot> tftp 200000 uImage
U-Boot> tftp a00000 uRamdisk
U-Boot> bootm 200000 a00000

good examples on these pages

http://www.denx.de/wiki/view/DULG/Manual
http://www.denx.de/wiki/view/DULG/RootFileSystemOnARamdisk
http://www.denx.de/wiki/view/DULG/CombiningKernelAndRamdisk

Best Regards,
J.
