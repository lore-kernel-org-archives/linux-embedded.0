From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Sun, 15 Jun 2008 16:43:55 -0500
Message-ID: <200806151643.56572.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806111941.51221.rob@landley.net> <c384c5ea0806150839l4b18b988pf69990bc87e52bcf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <c384c5ea0806150839l4b18b988pf69990bc87e52bcf@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Sunday 15 June 2008 10:39:43 Leon Woestenberg wrote:
> Hello all,
>
> On Thu, Jun 12, 2008 at 2:41 AM, Rob Landley <rob@landley.net> wrote:
> > Most packages don't cross compile at all.  Debian has somewhere north of
> > 30,000 packages.  Every project that does large scale cross compiling
> > (buildroot, gentoo embedded, timesys making fedora cross compile, etc)
> > tends to have about 200 packages that cross compile more or less easily,
> > another 400 or so that can be made to cross compile with _lot_ of effort
> > and a large enough rock, and then the project stalls at about that size.
>
> Agreed, OpenEmbedded has a few thousands, but your point is valid.
> However, fleeing to target-native compilation is not the way to
> improve the situation IMHO.

You say it like fleeing is a bad thing. :)

I believe building natively under emulation is the Right Thing.  Cross 
compiling has always historically been a transitional step until native 
compiling became available on the target.

When Ken Thompson and Dennis Ritchie were originally creating Unix for the 
PDP-7, they cross compiled their code from a honking big GE mainframe because 
that was their only option.  One of the first things they wrote was a PDP-7 
assembler that ran on the PDP-7.  The reason they created the B programming 
language in the first place was to have a tiny compiler that could run 
natively on the PDP-7, and when they moved up to a PDP-11 Dennis had more 
space to work with and expanded B into C.

When they severed the mainframe umbilical cord as soon as they were able to 
get the system self-hosting, it wasn't because the PDP-7 had suddenly become 
faster than the GE mainframe.

Compiling natively where possible has been the normal way to build Unix 
software ever since.  Linux became a real project when Linus stopped needing 
Minix to cross-compile it.  Linus didn't "flee" Minix, he assures us he 
erased his minix partition purely by accident. :)

> Moore's law on hardware also goes for the host, 

Which is why people no longer regularly write application software in assembly 
language, because we don't need to do that anymore.  The result would be 
faster, but not better.

The rise of scripting languages like Python and javascript that run the source 
code directly is also related (and if you don't think people don't write 
complete applications in those you haven't seen any of the google apps).  The 
big push for Java in 1998 could happen because the hardware was now fast 
enough to run _everything_ under an emulator for a processor that didn't 
actually exist (until Rockwell built one, anyway).

Build environments are now literally thousands of times faster than when I 
started programming.  The first machine I compiled code on was a commodore 64 
(1mhz, 8 bits, the compiler was called "blitz" and the best accelerator for 
it was a book).  The slowest machine I ever ran Linux on was a 16 mhz 386sx.

According to my blog, I moved from a 166mhz laptop to a 266mhz one on April 
13, 2002.  I started building entire Linux From Scratch systems on the 166mhz 
machine, including a ton of optional packages (apache, postgresql, openssh, 
samba, plus it was based on glibc and coreutils and stuff back then so the 
build was _slow_), hence the necessity of scripting it and leaving the build 
to its own devices for a few hours.

Even without distcc calling out to the cross compiler, the emulated system 
running on my laptop is several times faster than the build environment I had 
7 years ago (2001), somewhat faster than the one I had 5 years ago (2003), 
and somewhat slower than the one I had 3 years ago (2005).  (That's emulating 
an x86 build environment on my x86_64 laptop.  I didn't _have_ a non-x86 
build enviornment 5 years ago for comparison purposes.)

> I think the progress is even bigger on big iron.

Not that I've noticed, unless by "big iron", you mean "PC clusters".  (You can 
expand laterally if you've got the money for it and your problem distributes 
well...)

> Also, how much of the 30000 packages are useful for something like
> your own firmware Linux?

None of them, because Firmware Linux has a strictly limited agenda: provide a 
native build environment on every system emulation supported by qemu.  That's 
the 1.0 release criteria.  (Some day I may add other emulators like hercules 
for s390, but the principle's the same.)

Once you have the native build environment, you can bootstrap Gentoo, or 
Debian, or Linux From Scratch, or whatever you like.  I've got instructions 
for some of 'em.

The buildroot project fell into the trap of becoming a distro and having to 
care about the interaction between hundreds of packages.  I'm not interested 
in repeating that mistake.

Figuring out what packages will other people might need is something I stopped 
trying to predict a long time ago.  If it exists, somebody wanted it.  People 
want/need the weirdest stuff: the accelerometer in laptops is used for 
rolling marble games, and the iPhone is a cell phone with 3D support for 
(among other things) video playback.

> > Distcc can take advantage of smp, but that won't help the ./configure
> > stage and I need to do some work on distcc to teach it to understand more
> > gcc
>
> If you want to build 1000+ packages, you don't need to run configure
> itself multithreaded. There are enough jobs available to keep 16/32
> processors busy (beyond that, you probably end up in
> inter-package-dependencies stalling the build). This is just a guess
> from what I see during a multi-threaded bake and multi-threaded make
> on OpenEmbedded.

If your package management system can work out the dependencies and launch the 
package builds in parallel, have at.  Another reason I'm not trying to 
address package management: lots of people have already done it, and put a 
lot more work into it than I ever would.  I'm just trying to help them do 
their thing while staying out of their way.

> > However, having one or more full-time engineers devoted to debugging
> > cross-compile issues is quite a high price to pay too.  Moore's law
> > really doesn't help that one.
>
> How about 30+ volunteers.

I presume you're referring to OpenEmbedded, rather than Gentoo Embedded, 
Debian Embedded, buildroot, openmoko, or any of the others?

Making cross compiling work is tied to your choice of package management 
systems.  Making native compling work, less so.  The point of my project is 
to _unbundle_ stuff.  Separate out that layer, and make it as thin as 
possible.

> > I'm not saying either solution is perfect, I'm just saying the "build
> > under emulation" approach is a viable alternative that gets more
> > attractive as time passes, both because of ongoing development on
> > emulators and because of Moore's law on the hardware.
>
> I cannot follow your reasoning - Moore's law will help you more on the
> big iron side of things.

Actually it helps exactly as much, just on about a 5 year delay.

Moore's Law does not reduce the need for your above mentioned 30+ volunteers 
to endlessly debug cross compiling bugs.

My point is that building under emulation didn't used to be even _feasible_.  
Now it's an option.  Building under an emulator in 2008 gives us about the 
speed of building natively around 2003, and that seemed tolerable at the 
time.  Both the emulators and the hardware should improve going forward.

> That said, I welcome any effort (such as yours) to help improve the
> embedded Linux domain, I rather try to fix the cross-compile stuff of
> the few thousand packages I am interested in.

I've gotten involved in too many big complicated projects that got sidelined 
by somebody figuring out how to substitute a simpler problem and solve that 
one instead.  (Remember how much work maintaining kernel headers was 
before "make headers_install"?)

These days when I see big problem that can most obviously be solved by lots of 
people doing lots of work for a long time, my first instinct is try to figure 
out how to avoid needing to do that.

> Yes it hurts my brain.

It hurts everybody's brain.

There are two ways to build natively: you can do so under an emulator, or you 
can do so on real hardware.

The Fedora for Arm project builds natively, and started by using real ARM 
hardware to do it.  (They've added qemu since; I note that the guy who runs 
that project used to be my boss back before we all left TimeSys.) 
http://fedoraproject.org/wiki/Architectures/ARM#Technical_Approach

The Ubuntu for Arm project did the same, bought high end arm machines and made 
a compile farm out of them: 
http://mojo.handhelds.org/files/HandheldsMojo_ELC2008.pdf

If you're going to throw money at the problem, you can get a lot of 
specialized native hardware to build on, and that's an option a number of 
large projects have been taking.

The advantage of using emulators is that it's cheaper and more flexible.  
Anybody can do it, it's just a build environment you can take with you on 
your laptop (no contention for a limited number of devices and your 
developers aren't tethered to them to get work/testing done).  PC hardware is 
the cheapest and most flexible way to buy raw computing power (including 
memory/disk/network), and pretty much everybody already has it or they 
wouldn't be doing Linux development in the first place.

You don't snag hobbyists by saying "buy this hardware to play".  You snag 
hobbyists by giving them something they can download and poke at with the 
lowest threshold possible, which is why I provide precompiled images ala
http://landley.net/code/firmware/downloads/system-image

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
