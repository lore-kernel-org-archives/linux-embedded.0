From: Rob Landley <rob@landley.net>
Subject: Re: linux under emulator
Date: Fri, 8 Aug 2008 13:12:43 -0500
Message-ID: <200808081312.45595.rob@landley.net>
References: <78ef7ce10808051028r14aa7973t3aaa3bc92132cbba@mail.gmail.com> <fa686aa40808051030g5aeaf166q6146014e30b80982@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40808051030g5aeaf166q6146014e30b80982@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mihaela Grigore <grigore.mihaela@gmail.com>, linux-embedded@vger.kernel.org

On Tuesday 05 August 2008 12:30:45 Grant Likely wrote:
> On Tue, Aug 5, 2008 at 11:28 AM, Mihaela Grigore
>
> <grigore.mihaela@gmail.com> wrote:
> > If I intend to run a 2.6 linux kernel under a powerpc emulator, what
> > is needed to make a minimal bootable system? I mean, apart from the
> > kernel itself and busybox, do I need a bootloader ? If no actual
> > hardware is used and the kernel can reside directly in ram from the
> > emulator's point of view (so no relocation is needed), what else is to
> > be done before the kernel can start running ?
>
> Look at the firmware linux documentation.  It should tell you
> everything you need.

I'm actually rewriting the documentation.  It could be made to suck less.

Currently http://landley.net/code/firmware/downloads/README is more or less in 
final form, but the about.html and the design.html pages are somewhere 
between "in flux" and "in pieces".  (Working on it...)

I try to answer questions promptly, though. :)

> http://www.landley.net/code/firmware/

If you want to be lazy and try out the prebuilt binaries, you can also grab:

http://landley.net/code/firmware/downloads/binaries/system-image/system-image-powerpc.tar.bz2

Extract it, and ./run-emulator.sh (or ./run-with-home.sh if you'd like a 2 gig 
hdb image attached on /home so you have some scratch space to build stuff 
with.)  Installing qemu 0.9.1 is left as an exercise to the reader.

Rob

P.S.  Things you don't actually need to know, but just in case:

The sucker is a complete native build environment, gcc and everything.  It's 
set up like a Linux From Scratch chapter 6 "intermediate" system, with only 
the /tools directory existing by default, so you can build a new system 
without traces of the old one cluttering it up.  The boot script 
(/tools/bin/qemu-setup.sh) creates a bunch of symlinks and empty mount point 
directories at the top level to make the system behave like a normal build 
environment, so you can actually compile stuff and it should work.  See 
http://www.linuxfromscratch.org/lfs/view/stable/chapter06/chapter06.html for 
details on that.

If you want to use the distcc acceleration trick to compile stuff (calling out 
to the cross compiler from inside qemu, so whatever you're compiling still 
acts like fully native build but isn't _quite_ as painfully slow about it), 
grab cross-compiler-powerpc.tar.bz2 from the 
downloads/binaries/cross-compiler directory and extract that into your 
system-impage-powerpc directory, then run:
  ./run-with-emulator.sh cross-compiler-powerpc
(which calls ./run-with-home.sh, which calls ./run-emulator.sh, which calls 
qemu, which probably gets transferred to voicemail by that point...)
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
