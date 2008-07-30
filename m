From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 15:58:09 +0200
Message-ID: <1217426289.7892.48.camel@spike.firmix.at>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	 <200807290951.34563.neundorf@eit.uni-kl.de>
	 <1217319612.24988.15.camel@spike.firmix.at>
	 <200807291058.06240.neundorf@eit.uni-kl.de>
	 <1217324838.24988.41.camel@spike.firmix.at>
	 <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
	 <e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com>
	 <20080730102523.GB8992@shareable.org>
	 <e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com>
	 <1217422102.7892.21.camel@spike.firmix.at>
	 <20080730130712.GA12991@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080730130712.GA12991@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Bart Van Assche <bart.vanassche@gmail.com>, "Leisner, Martin" <Martin.Leisner@xerox.com>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Wed, 2008-07-30 at 14:07 +0100, Jamie Lokier wrote:
> Bernd Petrovitsch wrote:
> > If "GOLD" is as old and flexible (and portable?) as binutils,
> 
> The author says it will only work with ELF, and he does not
> intend to add support for all the other things binutils does.

Well, supporting 80% of the deployed systems requires probably only 20%
of the code;-)
But then it won't really replace binutils. And if, some quirky
hardware/systems have a problem .....

> > gcc and/or other huge software maintained to death, it is probably
> > similar complex and odd.  If people take a > 10 year old tool and
> > rewrite it from scratch, I would assume that design is better.
> 
> Only true if the cruft is no longer relevant.  If the cruft is
> intrinsic to the problem, e.g. supporting umpteen quirky architectures
> implies umpteen quirks of cruft, then it'll be in the new design.

Yes, but one can make a better design in always knowing/planning to have
hooks here and there and everywhere.

> Btw, gcc and binutils are more like 30 years old :-)

That doesn't make it better;-)
I was too lazy to search for more exact numbers.

> > And I can't see any direct dependence on the used programming
> > language(s) if one compares running code and what is left of "design"
> > after years of design extensions, changes, enhancements, etc. to a new
> > design from scratch from the lessons learned (hopefully) from the former
> > one.
> 
> Some programming languages allow you to express a problem concisely
> and clearly, and some don't.  That clarity then affects whether an

And if C is too low-level, one abstracts with functions etc. I call that
"design" - independent if the design existed before the source or if the
design evolved over years with the software
And yes, at first it is enough to add a parameter and/or function here
and there without breaking implicit or explicit assumptions.
But at one point from a larger view, the "design problems" will be
obvious and one can either solve them (investing time/money for
effectively no real gain in features and/or functionality, just only
cleanups or refactoring of parts or whatever one wants to call it) or
lives on with patching/maintaining the software to death.

> evolving design becomes loaded with implementation cruft or not - and
> you can't always tell the difference.

Yes.
And over the years and decades, the implementation evolves with the
problems - new and existing ones. If the design doesn't involve - which
IMHO implies refactoring of existing, tested and working code(!)
possible breaking it - you have at some point such a mess that each
"trivial" enhancement takes age (and breaks again somewhere else
something).

> Most languages are well-matched to different problem domains.

Maybe. IMHO these differences are almost nothing compared to the below
point:

> Binutils and bfd look very crufty, but I think it's hard to tell how
> much of that is due to the implementation language and implementation,
> or the design and requirements, and how much would exist in any
> implementation on any language.

IMHO it's (mostly) independent of the implementation language:

If changes in design are not completed (including removal of old
deprecated stuff or at least push it in peripheral places where nobody
cares;-) in the implementation (for whatever reason - no one does it, no
one wants to pay it, one wants to support every API indefinitely, ....),
it will lead more sooner than later to unmaintanable crufty software.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

