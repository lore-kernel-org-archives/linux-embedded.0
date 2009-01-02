From: Christoph Hellwig <hch@infradead.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 04:49:34 -0500
Message-ID: <20090102094934.GB17841@infradead.org>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200901021026.37905.a.miskiewicz@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Fri, Jan 02, 2009 at 10:26:37AM +0100, Arkadiusz Miskiewicz wrote:
> On Friday 02 of January 2009, Rob Landley wrote:
> > Before 2.6.25 (specifically git bdc807871d58285737d50dc6163d0feb72cb0dc2 )
> > building a Linux kernel never required perl to be installed on the build
> > system.  (Various development and debugging scripts were written in perl
> > and python and such, but they weren't involved in actually building a
> > kernel.) Building a kernel before 2.6.25 could be done with a minimal
> > system built from gcc, binutils, bash, make, busybox, uClibc, and the Linux
> > kernel, and nothing else.
> 
> And now bash is going to be required... while some distros don't need/have 
> bash. /bin/sh should be enough.

*nod*  bash is in many ways a worse requirement than perl.  strict posix
/bin/sh + awk + sed would be nicest, but if that's too much work perl
seems reasonable.
