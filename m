From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 11:06:18 +0200
Message-ID: <200806131106.18487.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de> <1213346316.17853.28.camel@tara.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213346316.17853.28.camel@tara.firmix.at>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Friday 13 June 2008 10:38:36 you wrote:
> On Fre, 2008-06-13 at 08:43 +0200, Alexander Neundorf wrote:
...
> > Well, IMO this makes it sound too easy.
> > If you write portable software, you have to do platform checks.
> > Basically they can be done by
> > -checking for the existence of files
>
> That can be done as - sooner or later - one must install the compiled
> stuff anyway. So one has root directory somewhere and one can tell the
> tools.

Yes.

> > -checking if something builds
> > -checking the output of running something you just built
>
> And the above are not really a big problem - 

"checking if something builds" is no problem, this just works. Running 
something is a problem, as in "it doesn't just work" (...because you cannot 
run it).

> embedded people usually know such details and can tell the autoconf tools.

Basically yes. But if you have a big number of packages (or a huge package) 
which you didn't write yourself, there will be tests which run executables. 
Figuring out what all the tests are supposed to test in a complex unknown 
software project is not trivial.

> Even worse is (or at least were) tools like pkg_config and libtool,
> which generate directories to the build time library.

What do you mean with "generate directories" ? RPATH ?

> The only simple solution so far (without diving into the implementation
> and searching for root causes) were AFAICS:
> - do not use libtool for linking (as the link line as such without
>   libtool works as expected)

Yes, libtool sucks, it's the wrong solution to the problem.
(and CMake doesn't use it).

> - rewrite generated pkg_config files after generation.
> Yes, that's pretty ugly.
> But perhaps I was just too dumb to find the correct solutions.

Can you please explain ? How do the generated pkg_config files look like ?
Ahh, you mean they contain e.g -L/my/build/host/target/environment/opt/foo/lib 
instead of just -L/opt/foo/lib ?

> > The last one is the problem for cross compiling.
> > Example: detecting the size of ints
>
> Why on earth does someone need this explicitly during the build?
> If you have portable software, all of that should be hidden in the code
> and use "sizeof(int)".

From the "developer of a buildsystem" POV: there will be users who will need 
it. 
But this was not the point. My point was: testing something by running an 
executable can be _a lot_ easier than testing the same without running 
something.

Alex
