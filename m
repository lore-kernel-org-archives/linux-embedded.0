From: Constantine Shulyupin <const@makelinux.com>
Subject: Super Fast Boot of Embedded Linux: 300 ms from boot loader to shell
Date: Mon, 11 Apr 2011 17:02:19 +0300
Message-ID: <BANLkTi=Zahmo_d1Fo7JnaD3iJHAuhSAZGQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hello all,

Make Linux Software presents the fastest ever embedded Linux boot for
720 MHz ARM and NAND flash memory. Linux boot time is 300 milliseconds
from boot loader to shell. The first goal of the project is to achieve
a minimal boot time of a minimal but functional Linux system on common
hardware. The second goal is to provide a platform for developing more
functional systems with an even minimized boot time.

Video of boot process:   http://youtu.be/747XLVbTgA4

Boot log with timestamps:

0.000 0.000: TI X-Loader 1.4.4ss Mar 26 2011 01:45:43
0.000 0.000: Optimised by www.MakeLinux.com
0.000 0.000: Loading
0.237 0.237: Running
0.237 0.000: CFG_LOADADDR=80008000
0.249 0.012: *(int*)CFG_LOADADDR=e321f0d3
0.276 0.027: Linux version 2.6.32 (const@makelinux.com)
0.276 0.000: Starting application
0.296 0.020: BusyBox v1.16.2 hush - the humble shell

To learn more, please visit http://www.makelinux.com/emb/fastboot/omap

Thanks.

-- 
Constantine Shulyupin
http://www.MakeLinux.com/
Embedded Linux Systems,
Device Drivers, TI DaVinci
