From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 08:43:05 +0200
Message-ID: <200806130843.05704.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213285831.26255.152.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Thursday 12 June 2008 17:50:31 you wrote:
> On Thu, 2008-06-12 at 08:23 -0700, Tim Bird wrote:
> > Rob Landley wrote:
> > > However, having one or more full-time engineers devoted to debugging
> > > cross-compile issues is quite a high price to pay too.  Moore's law
> > > really doesn't help that one.
> > >
> > > I'm not saying either solution is perfect, I'm just saying the "build
> > > under emulation" approach is a viable alternative that gets more
> > > attractive as time passes, both because of ongoing development on
> > > emulators and because of Moore's law on the hardware.
> >
> > I agree with much that you have said, Rob, and I understand the argument
> > for getting the most gain from the least resources, but I have a
> > philosophical problem with working around the cross-compilation problems
> > instead of fixing them in the upstream packages (or in the autoconf
> > system itself).
> >
> > Once someone fixes the cross-compilation issues for a package, they
> > usually stay fixed, if the fixes are mainlined.
>
> I don't think that's true, unfortunately. Autoconf makes it _easy_ to do
> the wrong thing, and people will often introduce new problems.
>
> If we just made people write portable code and proper Makefiles, it
> would be less of an issue :)

Well, IMO this makes it sound too easy.
If you write portable software, you have to do platform checks.
Basically they can be done by
-checking for the existence of files
-checking if something builds
-checking the output of running something you just built

The last one is the problem for cross compiling.
Example: detecting the size of ints

Easy way:

...
printf("%d\n", sizeof(long));
...

and then building and running that code and checking the output. Converting 
checks like this, which seem perfectly fine for native builds, to something 
which doesn't need to run an executable is not always trivial (but the way to 
go if you want to make your package cross-compilable).
(and yes, we converted this test in cmake 2.6 to a build-only test)

Alex
