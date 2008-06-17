From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 17 Jun 2008 16:11:58 +0200
Message-ID: <20080617141157.GE32139@nibiru.local>
References: <20080610134932.B27D62430C@gemini.denx.de> <200806110025.27575.rob@landley.net> <20080612181806.GA7423@nibiru.local> <200806151648.57679.rob@landley.net>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806151648.57679.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Rob Landley <rob@landley.net> schrieb:

Hi,

> You can't get away from cross compiling whenever you want to bootstrap a new 
> platform.  But cross compiling can be minimized and encapsulated.  It can be 
> a stage you pass through to get it over with and no longer have to deal with 
> it on the other side, which is the approach I take.

That's not enought for me. I want more encapsulation (yes, but buildfarm 
is also running in a VZ, but still sysroot'ed). For example, I *want* certain
tests (like running target code) to fail, since I *do not* trust them.
(btw: I also let compiler warnings fail, just to be sure).

I, personally, prefer high build-time constraints, because runtime tests
are quite limited.

> By my count sysroot is the fifth layer of path logic the gcc guys have added 
> in an attempt to paint over the dry rot.

I see this as a quite good separation between running and target system,
just one more fence for clear borders. As long as you don't pass absolute
search pathes to it, you can be sure that it doesn't mix up target and host.

Actually, I never want to crosscompile w/o it. 

> Personally I use a derivative of the old uClibc wrapper script that rewrites 
> the command line to start with "--nostdinc --nostdlib" and then builds it 
> back up again without having any paths in there it shouldn't.

Might work, but then you're limited to some specific cases. 
If you *only* intent bootstrapping of an minimal system, fine, but for
my projects too complex to handle.

> > #2: fix broken configure.in's (and feed back to upstream or OSS-QM)
> 
> Whack-a-mole.  Fun for the whole family.  Only problem is, it never stops.

Most times, it as only to be done one per package. And it's an clean solution.

> > #3: replace libtool by unitool
> 
> Uninstall libtool and don't replace it with anything, it's a NOP on Linux.

The problem is: many packages are entirely built upon this. So you'll have
to de-libtoolize them. Very much work. As I already had Unitool, I preferred
investing just a few hours for creating an generic drop-in replacement for 
libtool instead of touching each single package.

> > Only crap sw looks at /proc at build time.
> > Yes, there's *much* crap sw out there :(
> 
> 99% of all the developers out there don't really care about portability, and 
> never will.  Even if you eliminate the windows guys and the people who don't 
> do C, 90% of the people who are _left_ get to work on the PC first, get it to 
> work natively on other Linux platforms afterwards.

True :(
Some packages out there even don't have an clean native build path, eg. 
requiring parts of the package already built and installed (-> firebird-db)
 
> Cross compiling is a step beyond "portability".  They'll _never_ care about 
> cross compiling.  If they get inspired to make it work on MacOS X, then 
> you'll have to extract the source and _build_ it on MacOS X to make that 
> work.  And 99% of all developers will nod their heads and go "quite right, as 
> it should be".
> 
> This isn't going to change any time soon.

Actually, I don't care much about that. I concentrate on getting those 
packages I need cleaned-up and crosscompile'able - even if this means 
going alone and maintaining an own branch.

If I sum up all the invested working hours of all the last years
on that and substract the total saved time from other projects 
where I'm reusing this work, I get a positive balance ;-P


cu
-- 
---------------------------------------------------------------------
 Enrico Weigelt    ==   metux IT service - http://www.metux.de/
---------------------------------------------------------------------
 Please visit the OpenSource QM Taskforce:
 	http://wiki.metux.de/public/OpenSource_QM_Taskforce
 Patches / Fixes for a lot dozens of packages in dozens of versions:
	http://patches.metux.de/
---------------------------------------------------------------------
