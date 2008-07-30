From: Jamie Lokier <jamie@shareable.org>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 14:07:12 +0100
Message-ID: <20080730130712.GA12991@shareable.org>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain> <200807290951.34563.neundorf@eit.uni-kl.de> <1217319612.24988.15.camel@spike.firmix.at> <200807291058.06240.neundorf@eit.uni-kl.de> <1217324838.24988.41.camel@spike.firmix.at> <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net> <e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com> <20080730102523.GB8992@shareable.org> <e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com> <1217422102.7892.21.camel@spike.firmix.at>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1217422102.7892.21.camel@spike.firmix.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: Bart Van Assche <bart.vanassche@gmail.com>, "Leisner, Martin" <Martin.Leisner@xerox.com>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

Bernd Petrovitsch wrote:
> If "GOLD" is as old and flexible (and portable?) as binutils,

The author says it will only work with ELF, and he does not
intend to add support for all the other things binutils does.

> gcc and/or other huge software maintained to death, it is probably
> similar complex and odd.  If people take a > 10 year old tool and
> rewrite it from scratch, I would assume that design is better.

Only true if the cruft is no longer relevant.  If the cruft is
intrinsic to the problem, e.g. supporting umpteen quirky architectures
implies umpteen quirks of cruft, then it'll be in the new design.

Btw, gcc and binutils are more like 30 years old :-)

> And I can't see any direct dependence on the used programming
> language(s) if one compares running code and what is left of "design"
> after years of design extensions, changes, enhancements, etc. to a new
> design from scratch from the lessons learned (hopefully) from the former
> one.

Some programming languages allow you to express a problem concisely
and clearly, and some don't.  That clarity then affects whether an
evolving design becomes loaded with implementation cruft or not - and
you can't always tell the difference.

Most languages are well-matched to different problem domains.

Binutils and bfd look very crufty, but I think it's hard to tell how
much of that is due to the implementation language and implementation,
or the design and requirements, and how much would exist in any
implementation on any language.

-- Jamie
