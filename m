From: Dag Bakke <dag@bakke.com>
Subject: video (VGA) object-files unconditionally built/included?
Date: Fri, 10 Apr 2009 18:55:54 +0200
Message-ID: <49DF7A1A.7070308@bakke.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi.

I am putting together a tiny kernel for an embedded x86 target. Space is
tight, so I try to shave every kB I can get rid of.
I don't have anything resembling VGA or graphics, and my .config
reflects that. (Serial console.)

Yet, when building the kernel I see:

  LZMA    arch/x86/boot/compressed/vmlinux.bin.lzma
  CC      arch/x86/boot/video.o
  CC      arch/x86/boot/video-mode.o
  CC      arch/x86/boot/version.o
  CC      arch/x86/boot/video-vga.o
  CC      arch/x86/boot/video-vesa.o
  CC      arch/x86/boot/video-bios.o

# strings arch/x86/boot/bzImage | egrep -i 'vesa|vga|bios|mode'
+VESA
0123456789ABCDEFPress <ENTER> to see video modes available, <SPACE> to
continue, or wait 30 sec
Mode: Resolution:  Type:
Enter a video mode or "scan" to scan for additional modes:
Undefined video mode number: %x
VESA
BIOS


The video* objects sums up to 87kB. Can I get rid of that somehow? I am
using current git.

This is my .config:
http://tapas.homeip.net/~dagb/tiny.config

Cc: is appreciated.



Thanks,

Dag B

