From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Cross Compiler and loads of issues
Date: Sat, 14 Jun 2008 16:43:32 +1000
Message-ID: <48536894.7030201@snapgear.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com> <20080613092449.GO27937@knossos.aleph1.co.uk> <7b740b700806130500u17bf3adel3b2139e50d7b029f@mail.gmail.com> <0af6abe442d0b93a10a96b27153f04e9.squirrel@www.geekisp.com> <20080613144658.GA21071@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613144658.GA21071@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Bill Traynor <wmat@naoi.ca>, Shaz <shazalive@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>

Jamie Lokier wrote:
> Bill Traynor wrote:
>> Maybe I'm being dense, but what's specifically wrong with the current
>> toolchain universe?
> 
> Back in ye olde days, you could download GCC and Binutils from
> gnu.org, configure for whatever is your architecture, and most times
> it just worked.
> 
> For some reason, that stopped a while ago, and you had to go to
> different places to get working basic tools.  And often, the place to
> go wasn't clear.  Different people advertised their "ARM toolchain",
> "m68k toolchain" etc.  and they were slightly different sets of
> patches on top of mainline tools.  Central authorities you might
> believe in existed, but they were always a few patches behind what you
> actually needed.
> 
> When I last needed a toolchain, Google led to confusing results, and I
> had to try more than one.  I still use mutiple GCC versions (from
> different people) to compile different programs for the same
> architecture: each one fails some things in a different way, including
> run-time failures in the precompiled toolchains.
> 
> Just Google for "uclinux toolchain" and the top hits lead to very old
> releases, with bugs that have long been fixed elsewhere.  "uclinux arm
> toolchain" is no better.

The uClinux arm toolchain case can be put down to noone
having an interest in actually doing the work. There has been
some work over the years, but no coordinated effort for quite
a while now.


> Perhaps current versions (e.g. from Codesourcery?) are more dependable
> for embedded architectures, but I don't have the time to thoroughly
> test them, and my last experience warns me to be careful.
> 
> It seems people release tools, release patches, publish on an obscure
> web page, then forget about the page.  More authoritative-sounding
> uclinux web pages tend to be out of date.  Google isn't finding good
> current authorities in this area, which suggests the space is rather
> fragmented with people pulling in different directions and not working
> together enough to create stable, common places for these things.

Yep, there is a lack of "working together" when it comes to the
uclinux tool chains. You can't force people to work together.

At the very least the packages on uclinux.org give you the build
instructions, and scripts used to build them. You can try to get
newer tool versions working (with fixes if required).


> Contrast with kernel.org: everyone knows where to get a good working
> Linux kernel for the mainstream architectures, and the quality work
> tends to be quite good at reaching mainline there nowadays.

I don't know that comparison exactly holds. kernel.org is source,
just like gnu.org is the source of gcc/binutils/etc. Are you not
talking about binary toolchain packages above?

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a Secure Computing Company      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
