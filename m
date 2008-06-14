From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Cross Compiler and loads of issues
Date: Sat, 14 Jun 2008 16:57:17 +1000
Message-ID: <48536BCD.8090806@snapgear.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com> <20080613092449.GO27937@knossos.aleph1.co.uk> <7b740b700806130500u17bf3adel3b2139e50d7b029f@mail.gmail.com> <0af6abe442d0b93a10a96b27153f04e9.squirrel@www.geekisp.com> <20080613144658.GA21071@shareable.org> <c109f779883bf249397752373f3606d9.squirrel@www.geekisp.com> <20080614015707.GB32232@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080614015707.GB32232@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Bill Traynor <wmat@naoi.ca>, Shaz <shazalive@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>

Jamie Lokier wrote:
> Bill Traynor wrote:
>>> For some reason, that stopped a while ago, and you had to go to
>>> different places to get working basic tools.  And often, the place to
>>> go wasn't clear.  Different people advertised their "ARM toolchain",
>>> "m68k toolchain" etc.  and they were slightly different sets of
>>> patches on top of mainline tools.  Central authorities you might
>>> believe in existed, but they were always a few patches behind what you
>>> actually needed.
>> I disagree with respect to ARM.  GNU toolchains for ARM have for the last
>> four or five years been relatively up to date for ARM hardware.  This is a
>> direct result of ARM paying for this support to be added.
> 
> I believe you, but they were difficult to _find_.  A couple of years
> ago I looked for up to date ARM GNU tools.  The first few pages from
> Google lead to a small number of places where you could download
> toolchains at least a year out of date, possibly more, and none to get
> anything current in a straightforward format (i.e. not an entire dev
> kit with IDEs etc.).
> 
> That situation has improved greatly since then.
> 
> But, to be honest, ARM-nommu toolchain support is still second class.
> 
> There's no shared library / dynamic loader support for ARM-nommu, and
> no apparent plans to implement it.  (I'd help but I don't have time to
> do it all).  NPTL threads are coming along, but not yet ready; it's
> been quite slow.  C++ sometimes crashes at the linking stage.

Nobody is willing to put in the new effort here required to
make this work. So the "no plans" really means no person power
to make it happen.


>>> When I last needed a toolchain, Google led to confusing results, and I
>>> had to try more than one.  I still use mutiple GCC versions (from
>>> different people) to compile different programs for the same
>>> architecture: each one fails some things in a different way, including
>>> run-time failures in the precompiled toolchains.
>> You didn't have to try more than one, you chose to try more than one.
> 
> I found significant problems with the first.  Fixing obscure looking
> register allocation crash bugs in the compiler was more than I thought
> I had time for - looking for another was less work than that,
> therefore I rationally chose it.
> 
> I figured that bug was fixed in a newer version, and it was.  Then I
> found run-time problems with threads (crashing and impossible to trap
> in GDB - probably distributed libc mismatched my kernel - wtf?), and
> incompatibilities with binary libraries I had to link with.  (That's
> why I use two different toolchain versions in my project now).
> 
> Eventually, for some applications, what worked was a combination:
> tools from one place but headers and libraries from the other.
> 
> To solve this properly, requires that I delve into the toolchain code,
> or find _another_ newer one which might fix these problems.
> 
> It's a substantial time sink to do any of these things.
> 
>> You could have just as easily chosen to use only the current
>> mainline GNU toolchain and worked through your issues with the
>> community, thereby allowing mainline to benefit from your fixes, and
>> you to benefit by getting to use the most current toolchain.
> 
> I agree that is good.  However, my issues were rather specific to my
> application setup and third party commercial dependencies (typical of
> some embedded projects), and depended on older tools and kernels, so I
> wouldn't expect the community to have much interest.  The lack of
> interest in 2.4 kernels is pretty explicit (understandably - I don't
> like using it either), and for GCC 2.old/3.old I'm assuming it.
> 
> The lack of backed-by-action interest in making ARM-nommu tools
> support current GCC features like C++ properly, shared libraries, and
> modern threads, adds to the sense that, while it's good to be in touch
> with the community, there isn't a lot of readiness to work on obscure
> things which don't affect a lot of people, and on hardware which isn't
> the future.
> 
> Eventually I might forward port enough to follow mainline kernels and
> tools.  But that's a substantial time sink too - don't underestimate
> it.  I'm told that mainline current 2.6 doesn't build let alone work
> on ARM-nommu (yet); that does not make forward-porting including local

I am down to 3 or 4 patches for mainline to work on arm non-mmu.
It could be made to work on almost all 2.6.x kernels with only a
few patches - and those have always been available from uclinux.org.
That is not a barrier. I am working out the wrinkles in these last
changes, they will get in sooner or later.


> drivers and architecture quirks sound like it will be quick.  If slow,
> it's not worth the effort to me alone.

>>> Just Google for "uclinux toolchain" and the top hits lead to very old
>>> releases, with bugs that have long been fixed elsewhere.  "uclinux arm
>>> toolchain" is no better.
>> The "fixed elsewhere" is the problem.  If everyone used the most current
>> release and worked through issues with the community, this problem would
>> go away.
> 
> I agree.  I would like to do that, and with a thriving, interested
> community I will.  I'm hoping linux-embedded@vger.kernel.org might
> help catalyse it - perhaps by creating the perception of it to people
> like me.
> 
> It only really works if lots of people do that together, and it seems
> to be particularly _not_ the culture in some segments of the embedded
> development community.
> 
> I base this on Google leading to lots of pages with old announcements
> of compilers, cross-compilation scripts and so on.  Why aren't those
> pages links to a few standard "good" places which are actively kept up
> to date?  It appears to be (or have been) a fragmented community - and
> so who to work with, that's a question.
> 
>>> Perhaps current versions (e.g. from Codesourcery?) are more dependable
>>> for embedded architectures, but I don't have the time to thoroughly
>>> test them, and my last experience warns me to be careful.
>> I know from experience, having worked for CodeSourcery that their
>> toolchains are exhaustively tested.  And any problems reported to their
>> public mailing lists are fixed, if legitimate.  These fixes are typically
>> submitted upstream to the FSF very quickly when the bugs exist in mainline
>> as well.
> 
> I know from experience that "bugs" are fixed, but feature requests
> like reliable C++, shared libraries and NPTL threads are long in
> coming to some architectures, if they ever will be before those
> architectures are no longer manufactured.
> 
>>> It seems people release tools, release patches, publish on an obscure
>>> web page, then forget about the page.  More authoritative-sounding
>>> uclinux web pages tend to be out of date.  Google isn't finding good
>>> current authorities in this area, which suggests the space is rather
>>> fragmented with people pulling in different directions and not working
>>> together enough to create stable, common places for these things.
>> But isn't the FSF repositories for the GNU Tools, and the uClinux projects
>> repositories the stable, common place for these things?
> 
> You can't even build an ARM-nommu executable with GNU tools from FSF!

Thats true of any of the non-mmu architectures that rely on
elf2flt. So arm is no different.

Like many open source projects uClinux isn't a finished "thing".
It is actively being developed. Not everything works, not everything
works well. The quality of what is there now depends very much
on the amount of effort input...


> It needs an extra tool.  I'm not even sure which version of that is
> the recommended one - the C one or the shell script both have issues
> outstanding.  By the way, neither work with some C++ programs on
> ARM-nommu: they crash with messages about unfixable relocations.  More
> often with GCC 4 than GCC 3.  See what I mean about things not being
> in great shape?

Well, what can I say, you are welcome to fix them :-)
Sometimes you need to be the one to step up and make
things better, especially if you want to use them :-)


>>> Contrast with kernel.org: everyone knows where to get a good working
>>> Linux kernel for the mainstream architectures, and the quality work
>>> tends to be quite good at reaching mainline there nowadays.
>> IMHO, the same is true for the GNU tool.
> 
> If that's true for ARM-nommu support, it has improved dramatically.  I
> will try again, in time, but prior experience tells me not to spend
> too long on it.  It's much better use of time to find some patched
> combination that is working well for someone else.  But who to
> ask/trust?  Even the pre-built toolchains don't always work right.
> (See my earlier mention of undebuggable thread problems in executables
> built with a googd-distributed.)

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a Secure Computing Company      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
