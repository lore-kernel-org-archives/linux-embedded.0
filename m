From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 01:08:45 +0900
Message-ID: <20080612160845.GB9327@linux-sh.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213285831.26255.152.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 04:50:31PM +0100, David Woodhouse wrote:
> On Thu, 2008-06-12 at 08:23 -0700, Tim Bird wrote:
> > Rob Landley wrote:
> > > However, having one or more full-time engineers devoted to debugging 
> > > cross-compile issues is quite a high price to pay too.  Moore's law really 
> > > doesn't help that one.
> > > 
> > > I'm not saying either solution is perfect, I'm just saying the "build under 
> > > emulation" approach is a viable alternative that gets more attractive as time 
> > > passes, both because of ongoing development on emulators and because of 
> > > Moore's law on the hardware.
> > 
> > I agree with much that you have said, Rob, and I understand the argument
> > for getting the most gain from the least resources, but I have a philosophical
> > problem with working around the cross-compilation problems instead of fixing
> > them in the upstream packages (or in the autoconf system itself).
> > 
> > Once someone fixes the cross-compilation issues for a package, they usually
> > stay fixed, if the fixes are mainlined.
> 
> I don't think that's true, unfortunately. Autoconf makes it _easy_ to do
> the wrong thing, and people will often introduce new problems.
> 
> If we just made people write portable code and proper Makefiles, it
> would be less of an issue :)
> 
The other issue is that people that are working in this space tend to do
very little beyond solving their immediate troubles. Since perl was
mentioned, it also makes a good example. Embedded distros have been
cross-compiling perl for pretty much the last decade, yet even today
people are having the exact same issues and acting as this is some sort
of surprise that needs to be worked arond, rather than treating it as a
solved problem. If you opt to cross-compile, having to deal with those
sorts of things is the price you pay.

Holding the kernel hostage to this kind of brain-damage is simply beyond
ridiculous. There are a lot of things outside of the kernel that have a
dependency on perl too, how much time do people want to spend trying to
fix the build system to match their environment before they realize their
environment needs to scale to match the build environment that everyone
else is already using?

Building under qemu in a "native" environment is one way to work around
this problem, and a lot of companies have opted for that approach rather
than trying to fix the problematic packages. If you aren't building
natively, your options are effectively limited by convention. You can
either try to fix the packages in question, convince the package
developers to rip out the parts that cause trouble for your environment,
fix your own build environment to meet the needs of the packages, or
whine about it on a mailing list. Empirically we already know which one
of those options is going to win out. ;-)
