From: Rob Landley <rob@landley.net>
Subject: Firmware Linux (was Re: Cross Compiler and loads of issues)
Date: Fri, 13 Jun 2008 12:24:58 -0500
Message-ID: <200806131224.58568.rob@landley.net>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Thursday 12 June 2008 12:52:44 Shaz wrote:
> Hi,
>
> I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
> felt like asking that is there one good way to get a cross compiler
> work. I tried buildroot, scratchbox and even openMoko with
> openEmbedded but all of them had lots of issues and don't know which
> will be the best alternative.

Did you try my FWL project? :)

http://landley.net/code/firmware

To build from source, go to http://landley.net/code/firmware/downloads and 
grab the latest version (firmware-0.4.0.tar.bz2).  Extract it, cd into it, 
and run "./build.sh".  That should list the available platforms, and then run 
with the platform you like as an argument (ala "./build.sh powerpc").

The build.sh wrapper runs the other scripts in sequence:
  ./download.sh - downloads source code if you haven't already got it.
  ./host-tools.sh - compiles stuff on the host platform, (mostly optional).
  ./cross-compiler.sh - build a cross compiler toolchain for your target.
  ./mini-native.sh - Compile a kernel and root filesystem for your target.
  ./package-mini-native.sh - Create an ext2 image out of mini-native.

The other interesting scripts in the directory are:
  ./forkbomb.sh - Build every target (--nofork in series, --fork in parallel).
      Calling with --fork is faster, but needs about 4 gigabytes of ram.
  ./run-emulator.sh - Boot one of the system images you just built under qemu.
      Also sets up the distcc trick (see below).

If you don't feel like compiling any of the above yourself, you can download 
prebuilt binary images from the same downloads link.  The cross-compiler 
directory has the prebuilt cross compilers for each target (for i686 and 
x86_64 hosts).  The mini-native directory has the prebuilt root filesystem 
images as tarballs.  And the system-image.sh directory has a tarball with 
that same mini-native root filesystem as an ext2 image, a kernel for qemu, 
and shell scripts to invoke qemu appropriately for each one:

  ./run-emulator.sh - Run qemu, booting to a shell prompt.
  ./run-with-home.sh - Calls run-emulator with a second hard drive image
      hooked up as /dev/hdb and mounted on /home.  (If you haven't got an
      hdb.img in the directory it'll create an empty 2 gigabyte image and
      format it ext3.)
  ./run-with-distcc.sh - Calls run-with-home with the distcc trick set up.

The reason "mini-native" is called that is because it's a minimal native 
development environment.  It contains gcc, binutils, make, linux kernel 
headers, uClibc for your C library, and standard susv3 command line tools 
(provided by the busybox and toybox packages).  This is theoretically enough 
to build the whole of Linux From Scratch (http://www.linuxfromscratch.org) or 
bootstrap your way up to being able to natively build gentoo or debian using 
their package management systems.  (If you don't _want_ development tools in 
your root filesystem, set the environment variable "BUILD_SHORT=1" before 
running ./mini-native.sh.  That'll also move it out of /tools and up to the 
top level.)

In practice, the environment is still missing seven commands (bzip2, find, 
install, od, sort, diff, and wget) needed to rebuild itself under itself.  
(The busybox versions were either missing or had a bug.)  I'm working on that 
for the next release.

The distcc trick is for speeding up native builds by using distcc to call out 
to the cross compiler.  Running the cross compiler on the host system is 
faster, but cross compiling is very brittle.  This approach does a native 
build under the emulator, but escapes the emulator for the actual compiling 
part.  I did a quick bench test compling make 3.81 (I had it lying around) 
and it sped up the actual compile by a factor of 7.  (Alas, it didn't speed 
up the "./configure" part at all, just the "make" part.)

The ./emulator-build.sh script sets up the distcc trick using the files left 
in the "build" directory after you build it yourself.  (The cross compiler is 
left in there, and the kernel and ext2 system images that got tarred up are 
also left in there.)  The ./run-with-distcc.sh script does it for 
cross-compiler and system-image tarballs.  (It needs one argument: You have 
to tell it the path where you extracted the cross-compiler tarball.)

> I also went through the material provided freely by Free Electron but
> still I am not successful to build a custom kernel. Next I am trying
> MontaVista's kit. I just wish I don't get lost.

I'm happy to answer any questions about the stuff I did... :)

> Anyways, I liked the idea of Qemu based cross compiler. Is it possible
> for the inexperienced to get it working and emulate the exact model
> and devices.

That's what I'm trying to do.  I've got armv4l, armv5l, mips (big endian), 
mipsel (little endian), powerpc (a prep variant), i586, i686, and x86_64 
working.  They all work fine.  Run "./smoketest.sh $ARCH" on each $ARCH after 
building it to see the sucker boot up and compile "hello world" using distcc.  
That means qemu has bootable kernel, serial port, emulates a hard drive, 
uClibc is configured right, there's a working native toolchain, working cross 
toolchain, working virtual network...

I've also got sh4 building (but qemu doesn't quite have enough support to boot 
it yet: it can't emulate any boards with a hard drive attached).  And I've 
got sparc building and mostly booting, but it hangs trying to read 
from /dev/console for reasons I haven't been motivated to track down because 
I don't really know anyone still using sparc.  And I've got most of an m68k 
build config together but gcc is giving me an "internal compiler error" 
trying to build uClibc.  I've also poked at Alpha and blackfin a bit, but 
again lack of sufficient qemu support takes some of the fun out of it.

Oh, and the powerpc emulated prep board/kernel don't agree how to shutdown the 
power to the virtual board, so the qemu process doesn't exit.  You have to 
kill it.  :P

I can has TODO items...

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
