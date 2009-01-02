From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 05:13:18 -0600
Message-ID: <200901020513.19593.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901021026.37905.a.miskiewicz@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Cc: linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Friday 02 January 2009 03:26:37 Arkadiusz Miskiewicz wrote:
> On Friday 02 of January 2009, Rob Landley wrote:
> > Before 2.6.25 (specifically git bdc807871d58285737d50dc6163d0feb72cb0dc2
> > ) building a Linux kernel never required perl to be installed on the
> > build system.  (Various development and debugging scripts were written in
> > perl and python and such, but they weren't involved in actually building
> > a kernel.) Building a kernel before 2.6.25 could be done with a minimal
> > system built from gcc, binutils, bash, make, busybox, uClibc, and the
> > Linux kernel, and nothing else.
>
> And now bash is going to be required... while some distros don't need/have
> bash. /bin/sh should be enough.
>
> Heh,

I believe all three scripts run under dash and busybox ash.  (The timeconst.sh 
one needs 64 bit math which dash only provides on 64 bit hosts, which is a 
regression from Red Hat 9 in 2003 by the way.  Busybox ash can also provide 64 
bit math on 32 bit hosts, and the script should run with that just fine if you 
haven't got bash and that's what your "sh" in the path is.)

The makefiles execute those scripts via CONFIG_SHELL, not via the #!/blah line 
at the start, so it's largely irrelevant what gets put there anyway.  If you 
haven't got bash installed it'll use "sh", which should work with dash on a 64 
bit host or with busybox ash.  (That's why that one file has a test to make 
sure 64 bit math _does_ work.  The only Linux development environment I'm 
aware of where that test would trigger is if you use a 32 bit ubuntu and go 
out of your way to _uninstall_ bash.  Even Cygwin uses bash.)

Beyond that, "find linux -type f | xargs grep bin/bash | wc" comes up with 38 
instances (admittedly half of 'em in Documentation, but lots in scripts, and 
makefiles, and defconfigs, at least one hardwired in C code.)  So this would 
not a _new_ dependency.

By the way, what Linux distros install a compiler toolchain but not bash?  I'm 
curious.  (Even after Ubuntu moved #!/bin/sh to point to dash, it still 
installs bash as part of the default environment, even if you don't install 
development tools.)  You've built the kernel on this system before?

Rob
