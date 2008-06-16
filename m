From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 10:21:55 +0200
Message-ID: <1213604515.1710.25.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806122025.54791.rob@landley.net>
	 <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com>
	 <200806130830.52734.neundorf@eit.uni-kl.de>
	 <20080613185157.GT13599@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613185157.GT13599@pengutronix.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Fre, 2008-06-13 at 20:51 +0200, Robert Schwebel wrote:
> On Fri, Jun 13, 2008 at 08:30:52AM +0200, Alexander Neundorf wrote:
> > Battle of Wesnoth is currently converted to both Scons and CMake, and
> > in the end they will decide about the winner. (since Eric is good at
> > arguing I guess it will be scons).
> 
> The thing is that 'configure && make && make install' plus the usuall
> --enable-foo / --disable-foo / --with-bla=blub semantics is simply *the*
> standard way of configuring stuff for unix systems. You don't need fancy
> tools, you get cross compiling almost for free and unix people simply
> know how to use it.

As long as people avoid AC_TRY_RUN() and similar and allow the
"configurator" to tell `configure.sh` facts for the unavoidable cases
about the target (and there were some apps - and I forgot the names -
out there where this wasn't easily possible with editing the generated
configure.sh. Yes, that's not fault of autotools as such but autotools
make it IMHO far too easy to write that sort without generating lots of
warnings[0]).

> All the cool kids out there who think they know everything better
> usually start with "I hate autotools", then invent something which

That has IMHO 2 main reasons:
- For lost of apps, a Makefile and some coding discipline is more than
  enough to support Linux/*BSD/MacOS-X even on different hardware.
  And there are always cases where you need OS-specific code anyways
  (e.g. manipulating routes).
  Yes, that may need much more coding discipline than the average
  programmer is used to.
- Converting $PROJECT to autotools is not easy. One has to learn and
  understand how the tools work[1] and what should be done in which way.
  And AFAIU (which is not much for autotools) one has to adapt the
  source anyways here and there (so it is not really a drop-in
  replacement).
  And if people consider using autotools, it is probably quite large and
  complex ....

Add that to negative experiences with other autotools packages and I can
understand the above sentence.

> solves 0.1% of the problems (including their very special problem) and
> tell the rest of the world that their shiny new tools is *soooo cooool*.

	Bernd

[0]: Yes, this is free software and I could send patches etc. to fix
     that. But that price is IMHO higher than just not using autotools
     for new stuff.
[1]: And I didn't find a site yet with an easy understandable
     description for seasoned programmers with cross-compile
     and multi-hardware experience.
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


