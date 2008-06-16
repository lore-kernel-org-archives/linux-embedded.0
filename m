From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 12:44:21 +0100
Message-ID: <20080616114421.GE18857@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806122025.54791.rob@landley.net> <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com> <200806130830.52734.neundorf@eit.uni-kl.de> <20080613185157.GT13599@pengutronix.de> <20080613222523.GA28805@shareable.org> <20080616045715.GC32139@nibiru.local>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080616045715.GC32139@nibiru.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Enrico Weigelt wrote:
> > Imho, Kconfig would be good for more programs than it's currently used for,
> > and could be made to work with those --enable/--with options: you'd be
> > able to configure them entirely on the command line, or interactively
> > with "./configure --menu" (runs menuconfig), or with a config file.
> 
> Yes, that would be fine. But for me the primary constraint is that
> all switches/options can be specified by command line - otherwise
> I'd need extra complexity for each package in my distbuilder tool.

Yes, I agree with that.  It's one of the nice things about Kconfig
that you can use it with pre-specific config files, even when the
config is from a different version and doesn't specify everything.
Doing so as ./configure --enable/--disable arguments seems like a
comfortable fit.

> 
> > Perhaps it might even be possible to write a very small, portable,
> > specialised alternative to Make which is small enough to ship with
> > packages that use it?
> 
> No, I really wouldn't advise this. Make tools are, IMHO, part of 
> the toolchain (in a wider sense). Once point is avoiding code 
> duplication, but the really important one is: a central point of
> adaption/configuration. That's eg. why I like pkg-config so much:
> if I need some tweaking, I just pass my own command (or a wrapper).
> If each package does it's library lookup completely by itself, I
> also need to touch each single package in case I need some tweaks.
> I had exactly that trouble w/ lots of packages, before I ported
> them to pkg-config.

That's interesting, thanks.  I have seen problems with pkg-config, but
adding your own wrapper is a nice way to fix any of them :-)

That said, if you can specify library lookup on the ./configure
command line, that fixes a lot of problems of repeatability too.

Only problem then is you don't always know _which_ options to pass on
the ./configure command line, if you have a package build script, and
a different version of the package.  There's a tendancy to drift apart
which manifests as silent mistakes, until some user reports a bug.

-- Jamie
