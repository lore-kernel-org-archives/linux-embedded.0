From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 06:56:31 -0600
Message-ID: <200901020656.32013.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com> <20090102094934.GB17841@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090102094934.GB17841@infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Friday 02 January 2009 03:49:34 Christoph Hellwig wrote:
> On Fri, Jan 02, 2009 at 10:26:37AM +0100, Arkadiusz Miskiewicz wrote:
> > On Friday 02 of January 2009, Rob Landley wrote:
> > > Before 2.6.25 (specifically git
> > > bdc807871d58285737d50dc6163d0feb72cb0dc2 ) building a Linux kernel
> > > never required perl to be installed on the build system.  (Various
> > > development and debugging scripts were written in perl and python and
> > > such, but they weren't involved in actually building a kernel.)
> > > Building a kernel before 2.6.25 could be done with a minimal system
> > > built from gcc, binutils, bash, make, busybox, uClibc, and the Linux
> > > kernel, and nothing else.
> >
> > And now bash is going to be required... while some distros don't
> > need/have bash. /bin/sh should be enough.
>
> *nod*  bash is in many ways a worse requirement than perl.  strict posix
> /bin/sh + awk + sed would be nicest, but if that's too much work perl
> seems reasonable.

The scripts should work with dash (modulo the one that needs 64 bit math, 
which dash only provides on a 64 bit host), or with busybox ash (which can 
provide 64 bit math on 32 bit hosts just like bash can).  I'll explicitly 
retest both of those when I respin the patches in the <strike>morning</strike> 
afternoon.

(And yes I thought about writing my own arbitrary precision arithmetic shell 
functions, but it really didn't seem worth the complexity since the only 32 
bit Linux distros I've seen that install dash also install bash by default.  I 
just put in a test for 32 bit math so it can spot it and fail, on the off 
chance you're running a 32 bit host with dash after explicitly uninstalling 
bash.  All the embedded 32 bit ones that try to act as development 
environments use busybox ash, or more often just install bash.)

That said, how is bash _worse_ than perl?  (Where's the second implementation 
of perl?  Even Python had jython, but perl has... what?  The attempt to rebase 
on Parrot went down in flames...)

If the argument is that "depending on a specific shell implementation is as 
bad as depending on the one and only implementation of perl", that argument I 
can at least follow, even if it doesn't actually apply in this case.  But 
where does "worse" come in?

Rob
