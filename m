From: Rob Landley <rob@landley.net>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 19:25:34 -0500
Message-ID: <200806121925.35883.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com> <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Mike Frysinger <vapier.adi@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thursday 12 June 2008 11:12:13 Robert P. J. Day wrote:
> On Thu, 12 Jun 2008, Mike Frysinger wrote:
> > On Thu, Jun 12, 2008 at 11:50 AM, David Woodhouse wrote:
> > > If we just made people write portable code and proper Makefiles,
> > > it would be less of an issue :)
> >
> > people cant even write proper *native* makefiles.  mtd-utils for
> > example ;).
>
> meooowww!  :-)  but at the risk of dragging this even further
> off-topic, i am *constantly* asked by people how to set up makefiles
> for their software project, and what would be nice is a small
> collection of examples of a makefile (or makefiles) done *right*.  as
> in,

Make doesn't scale.

99% of the builds in the open source world are "make all", and most of the 
smaller projects build natively on modern dual processor 2ghz laptops in 
under 10 seconds anyway.

The larger projects with significant build times usually find that make 
doesn't suit their needs, so that they write some other build system.  
Sometimes they do it on top of make, such as the kernel's kbuild.  Sometimes 
they use another language like apache's ANT.  Sometimes they roll their own 
in C (anybody remember X11's imake?)  KDE switched to cmake: 
http://lwn.net/Articles/188693/

Current compilers have a "build at once" mode where they suck the whole 
project in and run the optimizer on it at once, resulting in noticeably 
smaller and faster output at the expense of needing buckets of memory to hold 
all the source code and intermediate structures in memory at once.  The main 
roadblock to making use of this?  Ripping out the existing makefiles and 
replacing them with a very small shell script that does something similar 
to "gcc *.c".

The first question you should be asking when doing a new build system from 
scratch is probably "should I really be using make"?

> properly recursive, 

Recursive make considered harmful:
  http://aegis.sourceforge.net/auug97.pdf

How is needing to call make recursively _not_ just another way of sayng "the 
dependency checking make does, which was the central idea behind its design, 
is a lost cause and we need to jettison it to do builds"?

I just did a "make distclean" on a qemu tree I had lying around.  On my 1.7 
ghz 64 bit laptop, it took 9.2 seconds to figure out it had nothing to do, 
just because it had to recurse into so many subdirectories to do it.

> supports cross-compiling without having to 
> remove your left nad, etc, etc.

Can of worms.  Answering that question would be a longer post than the rest of 
this combined, but I've pointed out that I don't think going there is worth 
it anymore for most packages.

> so ... would anyone like to recommend a software package or two
> somewhere whose makefile(s) is/are, ITHO, done well?  that i/we could
> just point at and say, "do it like that!"  anyone?  anyone?  bueller?

A software package with makefiles done well is like asking for a _good_ 
example of cobol programming.

The one and only advantage make has right now is that it's ubiquitous.  So 
was "ed", which dates from the same general timeframe.  That's not an 
endorsement.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
