From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Sat, 14 Jun 2008 01:19:32 +0200
Message-ID: <20080613231932.GW13599@pengutronix.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806122025.54791.rob@landley.net> <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com> <200806130830.52734.neundorf@eit.uni-kl.de> <20080613185157.GT13599@pengutronix.de> <20080613222523.GA28805@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613222523.GA28805@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Fri, Jun 13, 2008 at 11:25:23PM +0100, Jamie Lokier wrote:
> A trouble with that is some packages have hundreds of user-selectable
> options - or even thousands.

I've not seen a package with thousands of user selectable options. It's
not even desirable, because the more options you have, the more
difficult it becomes to test all the combinations.

> Some other packages _should_ have more options, but don't because it's
> too unwieldy to make them highly configurable with Autoconf.  Imho,
> Kconfig would be good for more programs than it's currently used for,
> and could be made to work with those --enable/--with options: you'd be
> able to configure them entirely on the command line, or interactively
> with "./configure --menu" (runs menuconfig), or with a config file.

That's exactly what ptxdist does: add a Kconfig frontend to the
configurable switches. It does it for the user's convenience, although
the currently implemented method is really developer-unfriendly (but we
care about our users first).

But it's of absolutely no use to whine about the fact that the world is
such a curel place. *If* Kconfig had been there 20 years ago ... *if*
90% of the packages out there would have been Kconfig instead of
autotools... We have to live with *reality*, and reality is that
autotools solve real world problems, and they offer *one* standard user
interface to package building. I can cross build almost all autotoolized
packages in exactly the same way and people are used to it. All other
build systems I've seen invented their very special way of doing things,
leading to wheel-reinvention all over the place.

> The "make" / "make install" part is easy to retain even with other
> build systems, using a trivial Makefile which calls the other tools.

I still don't understand why all the scons, cmakes and jams out there
don't even try to provide the *standard* user interface everyone is used
to on a unix system.

> Lots of packages need special tools or other software installed to
> build them; this is no different.

autotools need only a shell and make

> Perhaps it might even be possible to write a very small, portable,
> specialised alternative to Make which is small enough to ship with
> packages that use it?

Why on earth would one want to reinvent make?

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9

