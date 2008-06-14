From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Sat, 14 Jun 2008 01:07:49 +0100
Message-ID: <20080614000749.GA30652@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806122025.54791.rob@landley.net> <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com> <200806130830.52734.neundorf@eit.uni-kl.de> <20080613185157.GT13599@pengutronix.de> <20080613222523.GA28805@shareable.org> <20080613231932.GW13599@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080613231932.GW13599@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

Robert Schwebel wrote:
> On Fri, Jun 13, 2008 at 11:25:23PM +0100, Jamie Lokier wrote:
> > A trouble with that is some packages have hundreds of user-selectable
> > options - or even thousands.
> 
> I've not seen a package with thousands of user selectable options. It's
> not even desirable, because the more options you have, the more
> difficult it becomes to test all the combinations.

Kernels, uclibc, busybox.  All combinations can't be tested.  But it's
still _very_ useful to compile in only those parts wanted.

Most packages have far fewer.  But some have enough that the command
line is unwieldy and Kconfig would fit.  I'm thinking libcurl - one
configure option for each protocol supported.  iptables (userspace)
would be a candidate, when you have to link statically and save space.

Media players with lots of optional formats and drivers are another.
(They also have considerable problems with their Autoconf in my
experience).

Generally, anything with lots of parts that different applications
might not use, and space or library dependencies are an issue.

> > Some other packages _should_ have more options, but don't because it's
> > too unwieldy to make them highly configurable with Autoconf.  Imho,
> > Kconfig would be good for more programs than it's currently used for,
> > and could be made to work with those --enable/--with options: you'd be
> > able to configure them entirely on the command line, or interactively
> > with "./configure --menu" (runs menuconfig), or with a config file.
> 
> That's exactly what ptxdist does: add a Kconfig frontend to the
> configurable switches. It does it for the user's convenience, although
> the currently implemented method is really developer-unfriendly (but we
> care about our users first).

I agree.  (And it proved about not being able to test more
combinations: last time I tried to build ptxdist, an up to date
version (at the time), it failed in several places.)

> But it's of absolutely no use to whine about the fact that the world is
> such a curel place. *If* Kconfig had been there 20 years ago ... *if*
> 90% of the packages out there would have been Kconfig instead of
> autotools... We have to live with *reality*, and reality is that
> autotools solve real world problems, and they offer *one* standard user
> interface to package building. I can cross build almost all autotoolized
> packages in exactly the same way and people are used to it. All other
> build systems I've seen invented their very special way of doing things,
> leading to wheel-reinvention all over the place.

I agree with you.  There's no need to disagree, and who's whining?
We're trying to think of realistic improvments.

Reality is that Kconfig front end to autotools does work - as you've
proved.  It's a good idea. :-)

> > The "make" / "make install" part is easy to retain even with other
> > build systems, using a trivial Makefile which calls the other tools.
> 
> I still don't understand why all the scons, cmakes and jams out there
> don't even try to provide the *standard* user interface everyone is used
> to on a unix system.

Me neither.

> > Lots of packages need special tools or other software installed to
> > build them; this is no different.
> 
> autotools need only a shell and make

No, that's true only for very simple packages.

Most packages need lots of additional libraries installed - and the
development versions of those libraries, for that matter.  Too often
the right development version - not too recent, not too old.  With the wrong versions, there are surprises.

You said about too many user-selectable options.  Many large packages
_check_ for many installed libraries.  Get them wrong, and you have
the same problems of untested combinations.

Quite a lot of packages require extra tools to build, beyond shell,
make, GCC and Binutils.  Perl, Python are common.

Sure, autotools by themselves don't need much.  But that's not
interesting: Autotools are not used only by themselves.

> > Perhaps it might even be possible to write a very small, portable,
> > specialised alternative to Make which is small enough to ship with
> > packages that use it?
> 
> Why on earth would one want to reinvent make?

Have you felt uncomfortable shipping a package that does use Autoconf,
Automake and Libtool, knowing that the scripts generated by those
tools are huge compared with the entire source of your package?

Have you _written_ Autoconf tests recently?  Made any shell /
shellutils non-portability mistakes in the tests?

Have you _read_ a portable Makefile lately?  Have you tried writing
one for a complex package, confident that it's portable to different
quirky makes, quirky shells and quirky tools, outside the parts which
you might use Automake for?

That's a rationale for the project which is rewriting Autotools in GNU
Make, assuming that to be ubiquitous now, imho.  (Not all interesting
systems have a shell either.)

If you're going to rewrite Autotools using GNU Make, why not ask if
another tool would be better, perhaps a tool specially designed for
the job?

-- Jamie
