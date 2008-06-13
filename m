From: Rob Landley <rob@landley.net>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] =?utf-8?q?Embedded=09Maintainer?=(s)...)
Date: Thu, 12 Jun 2008 20:25:53 -0500
Message-ID: <200806122025.54791.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <1213285831.26255.152.camel@pmac.infradead.org> <48514D77.4060007@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48514D77.4060007@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thursday 12 June 2008 11:23:19 Tim Bird wrote:
> David Woodhouse wrote:
> > I don't think that's true, unfortunately. Autoconf makes it _easy_ to do
> > the wrong thing, and people will often introduce new problems.
>
> If autoconf is the problem (and I think it is), then that's what
> should be fixed (see my original post).  At a minimum, it would be
> nice if it had more built-in detection and warning of techniques
> that were dangerous for cross-compilation.

If autoconf is currently too complicated for people to use correctly, 
complicating it more probably isn't the answer.  (Down that path lies C++.)

> Paul Mundt wrote:
> > You can
> > either try to fix the packages in question, convince the package
> > developers to rip out the parts that cause trouble for your environment,
> > fix your own build environment to meet the needs of the packages, or
> > whine about it on a mailing list. Empirically we already know which one
> > of those options is going to win out. ;-)
>
> LOL.  Well, at least Rob has put his money where his mouth is (so to
> speak) with Firmware Linux.  The chance that I'll do anything but whine
> about autoconf is slim indeed...  I'll shut up now!

Um, actually Eric Raymond and I have had long talks about this, and if we're 
ever in the same state for more than 3 days we may finally get to do a 
serious research project about the successors to ./configure and make.

He recently converted Battle for Wesnoth to use something called "scons" as 
its build system, and apparently the resulting make stuff was 1/17th the size 
of the original.  You'd have to ask him for details, though...

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
