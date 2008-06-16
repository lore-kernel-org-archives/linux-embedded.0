From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 13:43:02 +0200
Message-ID: <1213616582.1710.58.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806122025.54791.rob@landley.net>
	 <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com>
	 <200806130830.52734.neundorf@eit.uni-kl.de>
	 <20080613185157.GT13599@pengutronix.de>
	 <20080613222523.GA28805@shareable.org>
	 <20080613231932.GW13599@pengutronix.de>
	 <20080614000749.GA30652@shareable.org>
	 <1213605214.1710.38.camel@tara.firmix.at>
	 <20080616111752.GB18857@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080616111752.GB18857@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Mon, 2008-06-16 at 12:17 +0100, Jamie Lokier wrote:
> Bernd Petrovitsch wrote:
> > > _check_ for many installed libraries.  Get them wrong, and you have
> > > the same problems of untested combinations.
> > 
> > As long as I can specify that libfoo support must be compiled in (and
> > thus libfoo must be present) and the tools throw an error if it doesn't
> > find it, I have no problem.
> > Otherwise all package builders have a serious problem.
> 
> They do have problems, when you want to repeatably build and deploy,
> if the build environment isn't very similar each time.

Sometimes you have a different build environments - if only that you
want to rebuild e.g. your .src.rpm on several versions of CentOS and
Fedora.

> Typically the way you specify that libfoo support must be compiled in
> is --with-libfoo=/path/to/libfoo.
> 
> That way lies bitrot between your build script which calls ./configure

Cannot be really avoided IMHO. 

> (since you won't by typing it manually with 20+ options like that each
> time you rebuild), and the changing version of an upstream package you
> configure.

So be it. At least one sees errors/bugs immediately.

> To prevent it trying to compile in libs you don't want, you also need
> --without-libfoo.  Using Kerberos as an example, which I remember when
> building CVS ages ago: If you don't _prevent_ it using libraries you
> don't want, you get different binariesn depending on whether a
> Kerberos library was installed on the build system at build time.  You
> might then send a built program to another system, and find it won't
> run at all, or has unwanted behaviour.
> 
> Do you really see package building scripts with 20 --with-libfoo= and
> --without-libfoo= options in them for every library?  Sometimes.  But

For (in an ideal world 100%) repeatable builds - for a .rpm. .deb, some
cross-compiled embedded device - one usually ends up with that explicit
list (and IMHO it's the smaller PITA than to cope with strange bug
reports because something was broken in the build weeks ago).
Mainly because the dependency information is also present elsewehre
(e.g. in the package). Or you really want control over the installed
software.

> more often, not: instead, they more often have build-time installed
> prerequisites.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


