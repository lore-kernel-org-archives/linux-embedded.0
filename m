From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Sun, 15 Jun 2008 16:48:57 -0500
Message-ID: <200806151648.57679.rob@landley.net>
References: <20080610134932.B27D62430C@gemini.denx.de> <200806110025.27575.rob@landley.net> <20080612181806.GA7423@nibiru.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080612181806.GA7423@nibiru.local>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: weigelt@metux.de
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Thursday 12 June 2008 13:18:07 Enrico Weigelt wrote:
> * Rob Landley <rob@landley.net> schrieb:
>
> Hi,
>
> > There's also qemu.  You can native build under emulation.
>
> did you ever consider that crosscompiling is not only good for
> some other arch, but a few more things ?

Sure, such as building a uClibc system on a glibc host, which my _previous_ 
firmware linux project (http://landley.net/code/firmware/old) was aimed at.

That used User Mode Linux instead of qemu, because "fakeroot" wasn't good 
enough and chroot A) requires the build to run as root, B) sometimes gets a 
little segfaulty if you build uClibc with newer kernel headers than the 
kernel in the system you're running on.

You can't get away from cross compiling whenever you want to bootstrap a new 
platform.  But cross compiling can be minimized and encapsulated.  It can be 
a stage you pass through to get it over with and no longer have to deal with 
it on the other side, which is the approach I take.

> > In addition, if you have a cross compiler but don't want to spend all
> > your time lying to ./configure, preventing gcc from linking against the
> > host's zlib or grabbing stuff out of /usr/include that your target hasn't
> > got, or
>
> #1: use a proper (sysroot'ed) toolchain

I break everything.  (I've broken native toolchains.  I just break them 
_less_.)

By my count sysroot is the fifth layer of path logic the gcc guys have added 
in an attempt to paint over the dry rot.

Personally I use a derivative of the old uClibc wrapper script that rewrites 
the command line to start with "--nostdinc --nostdlib" and then builds it 
back up again without having any paths in there it shouldn't.

> #2: fix broken configure.in's (and feed back to upstream or OSS-QM)

Whack-a-mole.  Fun for the whole family.  Only problem is, it never stops.

> #3: replace libtool by unitool

Uninstall libtool and don't replace it with anything, it's a NOP on Linux.

> > libraries are linked inside the emulator, anything that wants to look
> > at /proc or sysinfo does it natively inside the emulator...)
>
> Only crap sw looks at /proc at build time.
> Yes, there's *much* crap sw out there :(

99% of all the developers out there don't really care about portability, and 
never will.  Even if you eliminate the windows guys and the people who don't 
do C, 90% of the people who are _left_ get to work on the PC first, get it to 
work natively on other Linux platforms afterwards.

Cross compiling is a step beyond "portability".  They'll _never_ care about 
cross compiling.  If they get inspired to make it work on MacOS X, then 
you'll have to extract the source and _build_ it on MacOS X to make that 
work.  And 99% of all developers will nod their heads and go "quite right, as 
it should be".

This isn't going to change any time soon.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
