From: Rob Landley <rob@landley.net>
Subject: New aboriginal linux release with 3.14 kernel.
Date: Sun, 04 May 2014 11:45:35 -0500
Message-ID: <53666EAF.80700@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

It's reasonably standlone useful at this point, so I thought you might
want to know:

http://landley.net/aboriginal/about.html

It's a tiny Linux system (9 packages total but they boil down to
"busybox, uClibc, and the last gplv2 release of gcc") all cross compiled
to several different targets (arm, mips, powerpc, sparc, x86, sh4, etc)
and packaged up to run under qemu (tested with qemu 2.0).

You basically wget a tarball, extract it, "./run-emulator.sh", and
you've got a shell prompt in an emulated system. (Type exit when done.)
There are also "./dev-environment.sh" and "./native-build.sh" scripts
that launch qemu in more complicated ways; the about page explains those.

I find it useful for cross platform regression testing (does new release
of package X work on target Y?), and also for replacing cross compiling
with native compiling under emulation. (One of those 9 packages is
distcc so it can call out to the cross compiler while still doing native
compiling; this speeds up the non-autoconf bits of the build by a factor
of 7.)

My smoketest for new releases is building static  strace and dropbear
binaries for each target (you can download those from
http://landley.net/aboriginal/bin even if you don't care about the rest
of the project, or reproduce it yourself with the automated build-image
files in
http://landley.net/aboriginal/control-images/downloads/binaries).

Step 1 of doing real work is often "build Linux From Scratch" under it,
and then play further in that chroot. The lfs-bootstrap.hdc build-image
might help, and the about page tells you how to use it.

Years ago a friend and I did a GIANT PRESENTATION about all of this.
It's a few years out of date but still covers the theory pretty well:
https://speakerdeck.com/mirell/developing-for-non-x86-targets-using-qemu

There's a mailing list if you've got questions.

Rob
