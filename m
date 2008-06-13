From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Fri, 13 Jun 2008 10:38:36 +0200
Message-ID: <1213346316.17853.28.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <48513F5A.6010008@am.sony.com>
	 <1213285831.26255.152.camel@pmac.infradead.org>
	 <200806130843.05704.neundorf@eit.uni-kl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806130843.05704.neundorf@eit.uni-kl.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Neundorf <neundorf@eit.uni-kl.de>
Cc: linux-embedded@vger.kernel.org

On Fre, 2008-06-13 at 08:43 +0200, Alexander Neundorf wrote:
> On Thursday 12 June 2008 17:50:31 you wrote:
> > On Thu, 2008-06-12 at 08:23 -0700, Tim Bird wrote:
> > > Rob Landley wrote:
> > > > However, having one or more full-time engineers devoted to debugging
> > > > cross-compile issues is quite a high price to pay too.  Moore's law
> > > > really doesn't help that one.
> > > >
> > > > I'm not saying either solution is perfect, I'm just saying the "build
> > > > under emulation" approach is a viable alternative that gets more
> > > > attractive as time passes, both because of ongoing development on
> > > > emulators and because of Moore's law on the hardware.
> > >
> > > I agree with much that you have said, Rob, and I understand the argument
> > > for getting the most gain from the least resources, but I have a
> > > philosophical problem with working around the cross-compilation problems
> > > instead of fixing them in the upstream packages (or in the autoconf
> > > system itself).
> > >
> > > Once someone fixes the cross-compilation issues for a package, they
> > > usually stay fixed, if the fixes are mainlined.
> >
> > I don't think that's true, unfortunately. Autoconf makes it _easy_ to do
> > the wrong thing, and people will often introduce new problems.
> >
> > If we just made people write portable code and proper Makefiles, it
> > would be less of an issue :)

ACK. And proper build time tools.

> Well, IMO this makes it sound too easy.
> If you write portable software, you have to do platform checks.
> Basically they can be done by
> -checking for the existence of files

That can be done as - sooner or later - one must install the compiled
stuff anyway. So one has root directory somewhere and one can tell the
tools.

> -checking if something builds
> -checking the output of running something you just built

And the above are not really a big problem - embedded people usually
know such details and can tell the autoconf tools.
Even worse is (or at least were) tools like pkg_config and libtool,
which generate directories to the build time library.

The only simple solution so far (without diving into the implementation
and searching for root causes) were AFAICS:
- do not use libtool for linking (as the link line as such without
  libtool works as expected)
- rewrite generated pkg_config files after generation.
Yes, that's pretty ugly.
But perhaps I was just too dumb to find the correct solutions.

> The last one is the problem for cross compiling.
> Example: detecting the size of ints

Why on earth does someone need this explicitly during the build?
If you have portable software, all of that should be hidden in the code
and use "sizeof(int)".

IMHO the code (or whatever piece uses it) should be fixed and the build
time stuff removed.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


