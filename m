From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 08:55:19 +0200
Message-ID: <200806130855.19609.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain> <200806121925.35883.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806121925.35883.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Friday 13 June 2008 02:25:34 you wrote:
> On Thursday 12 June 2008 11:12:13 Robert P. J. Day wrote:
> > On Thu, 12 Jun 2008, Mike Frysinger wrote:
> > > On Thu, Jun 12, 2008 at 11:50 AM, David Woodhouse wrote:
> > > > If we just made people write portable code and proper Makefiles,
> > > > it would be less of an issue :)
> > >
> > > people cant even write proper *native* makefiles.  mtd-utils for
> > > example ;).
> >
> > meooowww!  :-)  but at the risk of dragging this even further
> > off-topic, i am *constantly* asked by people how to set up makefiles
> > for their software project, and what would be nice is a small
> > collection of examples of a makefile (or makefiles) done *right*.  as
> > in,
>
> Make doesn't scale.
>
> 99% of the builds in the open source world are "make all", and most of the
> smaller projects build natively on modern dual processor 2ghz laptops in
> under 10 seconds anyway.
>
> The larger projects with significant build times usually find that make
> doesn't suit their needs, so that they write some other build system.
> Sometimes they do it on top of make, such as the kernel's kbuild. 
> Sometimes they use another language like apache's ANT.  Sometimes they roll
> their own in C (anybody remember X11's imake?)  KDE switched to cmake:
> http://lwn.net/Articles/188693/

CMake can create Makefiles on all platforms (including complete dependencies, 
i.e. if you build an app which depends even indirectly on some lib then that 
lib will be rebuilt before), additionally XCode projects and MSVC projects 
(and Eclipse, KDevelop3 and CodeBlocks projects, but these use makefiles 
too).
So, we at KDE are still using make mainly, I don't really see how it doesn't 
scale (at least it scales much better than scons).

> Current compilers have a "build at once" mode where they suck the whole
> project in and run the optimizer on it at once, resulting in noticeably
> smaller and faster output at the expense of needing buckets of memory to
> hold all the source code and intermediate structures in memory at once. 
> The main roadblock to making use of this?  Ripping out the existing
> makefiles and replacing them with a very small shell script that does
> something similar to "gcc *.c".

We support that in KDE since a long time, with KDE 2.x to 3.x 
this "include-all" file was created via autotools, now with KDE 4 it's 
created by cmake. It makes compilation of the whole project faster, certainly 
not if you are building only a few files.
So, there is not really a roadblock to this. 

> The first question you should be asking when doing a new build system from
> scratch is probably "should I really be using make"?
>
> > properly recursive,
>
> Recursive make considered harmful:
>   http://aegis.sourceforge.net/auug97.pdf
>
> How is needing to call make recursively _not_ just another way of sayng
> "the dependency checking make does, which was the central idea behind its
> design, is a lost cause and we need to jettison it to do builds"?
>
> I just did a "make distclean" on a qemu tree I had lying around.  On my 1.7
> ghz 64 bit laptop, it took 9.2 seconds to figure out it had nothing to do,
> just because it had to recurse into so many subdirectories to do it.

I'm quite sure for a sufficiently large project this will always be the case. 
There are thousands of files which have to be checked whether they are 
up-to-date, so this takes some time.

> > supports cross-compiling without having to
> > remove your left nad, etc, etc.
>
> Can of worms.  Answering that question would be a longer post than the rest
> of this combined, but I've pointed out that I don't think going there is
> worth it anymore for most packages.
>
> > so ... would anyone like to recommend a software package or two
> > somewhere whose makefile(s) is/are, ITHO, done well?  that i/we could
> > just point at and say, "do it like that!"  anyone?  anyone?  bueller?

Use CMake >= 2.6.0 (http://www.cmake.org).
It supports cross compiling (... and of course everything else you might ever 
need ;-)
In general, cross compiling is not hard. You just have to call the cross 
toolchain, give it the correct parameters, search files in the right location 
and ... make sure you don't test stuff by running programs.
Basically only the last one is problematic (but IMO still less problematic 
than running a virtual system on the host just to build something).

How does cmake support that for cross compiling ?
If it detects a try_run() (which is the command for building a test executable 
and then running it) in cross compiling mode (i.e. when it was told what the 
target platform is instead of just assuming it's the same as the build host), 
then it 
-issues a warning
-stores the created executable in a place so the developer can find it
-running some existing executable and checking its output
-creates a file where the developer can enter the results which running the 
executable on the target host would have brought (includes comments where 
that command was found, the arguments, etc.,). The developer can then run the 
test executable manually on the target and enter the results. This seems to 
be similar to the config.cache somebody mentioned for debian.

So really the hard part is getting rid of running stuff to check the platform. 
If the project does that, all the build tool can do is support the developer 
in finding these spots and caring for them.


Did I mention that getting started with cmake is easy ?
A file CMakeLists.txt containing the following command is all you need for 
a "hello world":
add_executable(hello main.c)

Alex
