From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 12:03:53 +0200
Message-ID: <1213351433.17853.61.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806130843.05704.neundorf@eit.uni-kl.de>
	 <1213346316.17853.28.camel@tara.firmix.at>
	 <200806131106.18487.neundorf@eit.uni-kl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806131106.18487.neundorf@eit.uni-kl.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Neundorf <neundorf@eit.uni-kl.de>
Cc: linux-embedded@vger.kernel.org

On Fre, 2008-06-13 at 11:06 +0200, Alexander Neundorf wrote:
> On Friday 13 June 2008 10:38:36 you wrote:
> > On Fre, 2008-06-13 at 08:43 +0200, Alexander Neundorf wrote:
> ...
> > > Well, IMO this makes it sound too easy.
> > > If you write portable software, you have to do platform checks.
> > > Basically they can be done by
> > > -checking for the existence of files
> >
> > That can be done as - sooner or later - one must install the compiled
> > stuff anyway. So one has root directory somewhere and one can tell the
> > tools.
> 
> Yes.
> 
> > > -checking if something builds
> > > -checking the output of running something you just built
> >
> > And the above are not really a big problem - 
> 
> "checking if something builds" is no problem, this just works. Running 
> something is a problem, as in "it doesn't just work" (...because you cannot 
> run it).

ACK. AC_TRY_RUN() must die completely.

> > embedded people usually know such details and can tell the autoconf tools.
> 
> Basically yes. But if you have a big number of packages (or a huge package) 
> which you didn't write yourself, there will be tests which run executables. 
> Figuring out what all the tests are supposed to test in a complex unknown 
> software project is not trivial.

Yes, you get used to find the relevant lines in config.log and similar
with `grep` and similar tools;-)
But most embedded projects haven't that much number of "large tools" -
mainly because the space is limited.

> > Even worse is (or at least were) tools like pkg_config and libtool,
> > which generate directories to the build time library.
> 
> What do you mean with "generate directories" ? RPATH ?

pkg-config generated (and generates? - I didn't check recently)
references to libraries including the full absolute path (which is the
one at build time. And at run-time there is usually
no /home/bernd/src/... or where some build may just run).

[...]
> > - rewrite generated pkg_config files after generation.
> > Yes, that's pretty ugly.
> > But perhaps I was just too dumb to find the correct solutions.
> 
> Can you please explain ? How do the generated pkg_config files look like ?
> Ahh, you mean they contain e.g -L/my/build/host/target/environment/opt/foo/lib 
> instead of just -L/opt/foo/lib ?

Yes. And even worse the compiled lib "foo" had explicit dependencies (on
lib "bar") on
"/my/build/host/target/environment/opt/bar/lib/libbar.so.1.2.3.4". And
that is not trivially overridable at run-time AFAIK so that ld-linux
finds "/opt/bar/lib/libbar.so.1.2.3.4" instead.
For real world names: glib is pretty commonly used by other libs. Voila,
an indirect dependency.

And BTW pkg-config didn't support the concept of a "DESTDIR" variable
(and I don't care about the name of that variable).

> > > The last one is the problem for cross compiling.
> > > Example: detecting the size of ints
> >
> > Why on earth does someone need this explicitly during the build?
> > If you have portable software, all of that should be hidden in the code
> > and use "sizeof(int)".
> 
> From the "developer of a buildsystem" POV: there will be users who will need 
> it. 

If there is at least one valid technical reason: Yes.
If the only reasons are "we had it since 10 years with the old system"
or "we don't want to fix the code because it takes us too much time":
well, tough decision.


> But this was not the point. My point was: testing something by running an 
> executable can be _a lot_ easier than testing the same without running 
> something.

Of course. But *that's* in general possible for cross-compiling. And
having a 100% binary compatible qemu installation for every ARM and MIPS
core out there is IMHO also not feasible.

Actually the size of ints (or any other type) can be easily deduced
without running a (for the target) compiled binary:
- compile the binary (for the target) with an initialized variable with
  that value.
- use cross nm (or a similar tool) to read it from there.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


