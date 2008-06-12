From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Wed, 11 Jun 2008 19:41:50 -0500
Message-ID: <200806111941.51221.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <484F66F8.4020409@snapgear.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Ungerer <gerg@snapgear.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Wednesday 11 June 2008 00:47:36 Greg Ungerer wrote:
> Hi Rob,
>
> Rob Landley wrote:
> > On Tuesday 10 June 2008 02:54:32 Sam Ravnborg wrote:
> >>> (Maybe I _am_ the only person who still cares about
> >>> building on a host without perl.  If I wasn't, somebody else would have
> >>> acked the patch...)
> >>
> >> perl is pretty standard
> >
> > An implementation is not the same thing as a standard.  If you mean
> > "there is one implementation everybody uses, ala excel and Word, and even
> > the Perl guys can't reproduce it from scratch as parrot showed", then
> > you're using a different definition of the word "standard" than I am.
> >
> > Or do you mean it comes preinstalled on most modern systems, the way
> > Windows does, and who could object to that?
> >
> > I know from experience that it's an _amazing_ pain to try to cross
> > compile the sucker...
>
> Ain't that the truth!
>
> >> and I fail to see the benefits of avoiding it.
> >> For embedded development I see even less benefits as I assume
> >> any sane embedded development environment are based on a
> >> cross-toolchain so you do the build on a high perfomance box.
> >>
> >> Building everything for my arm board on the arm board would be a disater
> >> for example.
> >
> > I build everything for my arm board natively, on an arm system running
> > under qemu, calling out to the cross compiler via distcc to accelerate
> > the limited parts of the process that cross compiling doesn't actually
> > break.  To get to that point, I cross compile just enough to get a native
> > development environment, and then I avoid cross compiling from then on
> > because it's an enormous source of complexity and random breakage.
>
> Random breakage?

Cross compiling breaks stuff, yes.

Most packages don't cross compile at all.  Debian has somewhere north of 
30,000 packages.  Every project that does large scale cross compiling 
(buildroot, gentoo embedded, timesys making fedora cross compile, etc) tends 
to have about 200 packages that cross compile more or less easily, another 
400 or so that can be made to cross compile with _lot_ of effort and a large 
enough rock, and then the project stalls at about that size.

> > I did this because throwing hardware at the problem is cheaper than
> > throwing engineering time at the problem, because Moore's Law is on my
> > side, and
>
> Are you sure about that?
> How well does qemu do SMP?  At all?

QEMU does not currently do SMP at all.  There are proposals to make qemu 
multi-threaded and handle SMP that way, but they're at least a year away from 
anybody actually trying to implement them.  (The big destabilization right 
now is the new code generator, and that's plenty for the moment.  Anybody who 
wanted to wave money at codesourcery could probably get it implemented on a 
deadline for their platforms of interest, but in the absence of that it's not 
really a priority right now.)

Distcc can take advantage of smp, but that won't help the ./configure stage 
and I need to do some work on distcc to teach it to understand more gcc 
command lines.  (For one thing, distcc can't break "compile and link" 
commands ala "gcc hello.c" into separate "compile" and "link" stages, this it 
can't distribute those.  This takes out pretty much the entire uClibc build, 
for example.  But the gcc build parallelizes quite well.)

> Modern x86 and friends are getting most new performance from
> more cores. A cross compile today can take advantage of those
> for the most part. Your emulated system probably can't.

It can if you're using distcc to call out to the cross compiler, which my 
scripts do (./emulator-build.sh does it with the build/* stuff 
and ./run-with-distcc.sh does it for the shipped system-image tarballs).

Some of the other build systems out there hook qemu application emulation up 
to the kernel's misc binary support so a ./configure that builds arm 
executables can run them.  (Openembedded, was it?  Open moko?  Something like 
that.)  But this only solves one of about a dozen major problems cross 
compiling is prone to.  Building natively solves all of 'em, except for 
speed.

> An order of magnitude compile time (or more) for a native build
> is quite a high price to pay :-)

Yup.  Agreed.  No argument there.

However, having one or more full-time engineers devoted to debugging 
cross-compile issues is quite a high price to pay too.  Moore's law really 
doesn't help that one.

I'm not saying either solution is perfect, I'm just saying the "build under 
emulation" approach is a viable alternative that gets more attractive as time 
passes, both because of ongoing development on emulators and because of 
Moore's law on the hardware.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
