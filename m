From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 23:25:23 +0100
Message-ID: <20080613222523.GA28805@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806122025.54791.rob@landley.net> <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com> <200806130830.52734.neundorf@eit.uni-kl.de> <20080613185157.GT13599@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613185157.GT13599@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

Robert Schwebel wrote:
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

A trouble with that is some packages have hundreds of user-selectable
options - or even thousands.  It is unfeasible to use --enable-foo
options for all of those when configuring then.

Some other packages _should_ have more options, but don't because it's
too unwieldy to make them highly configurable with Autoconf.  Imho,
Kconfig would be good for more programs than it's currently used for,
and could be made to work with those --enable/--with options: you'd be
able to configure them entirely on the command line, or interactively
with "./configure --menu" (runs menuconfig), or with a config file.

The "make" / "make install" part is easy to retain even with other
build systems, using a trivial Makefile which calls the other tools.
Lots of packages need special tools or other software installed to
build them; this is no different.

Perhaps it might even be possible to write a very small, portable,
specialised alternative to Make which is small enough to ship with
packages that use it?

-- Jamie
