From: Fundu <fundu_1999@yahoo.com>
Subject: initrd and uImage
Date: Fri, 8 Aug 2008 09:42:41 -0700 (PDT)
Message-ID: <54582.81328.qm@web63407.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded <linux-embedded@vger.kernel.org>

Hi,
First off i have a ppc based board.
and i'm trying to load a kernel image with ramdisk rootfs.

i have build the kernel. it spit uImage,zImage and vmlinux.gz

my question are.
1) what are all the different image types ? 
i know the uImage is just the kernel, what are the rest (zImage & vmlinux.gz)?

2) i'm using u-boot as the bootldr. so i download the uImage (cause zImage and vmlinux.gz aren't bootlable) from tftp server and then do bootm <address> the kernel only load partially. How does the kernel know where/how to load the rootfs ? 


thanks !




      
