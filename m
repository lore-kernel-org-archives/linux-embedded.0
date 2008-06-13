From: Rob Landley <rob@landley.net>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 14:14:29 -0500
Message-ID: <200806131414.30045.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <1213346316.17853.28.camel@tara.firmix.at> <200806131106.18487.neundorf@eit.uni-kl.de>
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

On Friday 13 June 2008 04:06:18 Alexander Neundorf wrote:
> > And the above are not really a big problem -
>
> "checking if something builds" is no problem, this just works. Running
> something is a problem, as in "it doesn't just work" (...because you cannot
> run it).

Noticing 2 weeks after deployment that signal handling in the mips version of 
perl is using the x86 signal numbers and they're not the same: priceless.

> > The only simple solution so far (without diving into the implementation
> > and searching for root causes) were AFAICS:
> > - do not use libtool for linking (as the link line as such without
> >   libtool works as expected)
>
> Yes, libtool sucks, it's the wrong solution to the problem.
> (and CMake doesn't use it).

Nothing on Linux really _uses_ libtool.  It's supposed to act as a NOP wrapper 
around the linker on any Linux target.  (It's there for things like Sparc and 
HPUX).

The fact that libtool manages to do its nothing _wrong_ so often would be 
hilarious if it wasn't such a pain.  Just uninstall libtool before trying to 
build for a Linux target, this should never cause any problems and will save 
you lots of headaches.

> > Why on earth does someone need this explicitly during the build?
> > If you have portable software, all of that should be hidden in the code
> > and use "sizeof(int)".

According to the LP64 standard which pretty much all modern Unixes adhere to 
(including both Linux and MacOS X) sizeof(int) is always 4.  Guaranteed.

The LP64 standard:
  http://www.unix.org/whitepapers/64bit.html

The LP64 rationale:
  http://www.unix.org/version2/whatsnew/lp64_wp.html

The insane legacy reasons windows doesn't do this, but in fact sizeof(int) 
will still be 4 there anyway:
  http://blogs.msdn.com/oldnewthing/archive/2005/01/31/363790.aspx

Just FYI. :)

> But this was not the point. My point was: testing something by running an
> executable can be _a lot_ easier than testing the same without running
> something.

I think building natively under qemu is the easy way, yes. :)

> Alex
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
