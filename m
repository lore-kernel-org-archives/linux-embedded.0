From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 10:50:28 +0200
Message-ID: <1213347028.17853.40.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com>
	 <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>
	 <200806121925.35883.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806121925.35883.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, Mike Frysinger <vapier.adi@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Don, 2008-06-12 at 19:25 -0500, Rob Landley wrote:
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
> Sometimes they do it on top of make, such as the kernel's kbuild.  Sometimes 
> they use another language like apache's ANT.  Sometimes they roll their own 

"ant" is also only "make reimplemented in Java" (or did I miss
something). I see no win here.

> in C (anybody remember X11's imake?)  KDE switched to cmake: 

That generated "only" a Makefile IIRC.

[...]
> Current compilers have a "build at once" mode where they suck the whole 
> project in and run the optimizer on it at once, resulting in noticeably 
> smaller and faster output at the expense of needing buckets of memory to hold 
> all the source code and intermediate structures in memory at once.  The main 
> roadblock to making use of this?  Ripping out the existing makefiles and 
> replacing them with a very small shell script that does something similar 
> to "gcc *.c".
> 
> The first question you should be asking when doing a new build system from 
> scratch is probably "should I really be using make"?
> 
> > properly recursive, 
> 
> Recursive make considered harmful:
>   http://aegis.sourceforge.net/auug97.pdf

ACK.

> How is needing to call make recursively _not_ just another way of sayng "the 
> dependency checking make does, which was the central idea behind its design, 
> is a lost cause and we need to jettison it to do builds"?

The problem is that build systems have (at least) two layers:
- the lower are the usual apps and libs and kernel ... bringing their
  working Makefile's with them.
- the upper layer needs to build the kernel, libs and apps.
  This needs usually a defined sequence and set of consistent
  parameters.
But the lower layer doesn't "export" it's local available rule base so
the `make` (or shell script) on the upper layer can't use it and one
must therefore `make -C $tooldir` - even if there is absolutely nothing
to do.
Of course the upper layer may remember if an lib/app has been build to
avoid 60% of all "obviously" useless `make -C` calls. But that doesn't
solve any problem really.

> I just did a "make distclean" on a qemu tree I had lying around.  On my 1.7 
> ghz 64 bit laptop, it took 9.2 seconds to figure out it had nothing to do, 
> just because it had to recurse into so many subdirectories to do it.

"Recursive make considered harmful"
Or you need more RAM and faster disks;-)

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


