From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 20:53:59 -0600
Message-ID: <200901032054.00018.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <495FEEAF.5020005@zytor.com> <c384c5ea0901031637k3b571313m934c8881dce1c81@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <c384c5ea0901031637k3b571313m934c8881dce1c81@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On Saturday 03 January 2009 18:37:12 Leon Woestenberg wrote:
> Hello,
>
> On Sun, Jan 4, 2009 at 12:03 AM, H. Peter Anvin <hpa@zytor.com> wrote:
> >> Dependencies very quickly become dependency hell. If A requires B,
> >> then A also inherits all (future) requirements of B, etc. etc.
> >>
> >> In my daily software development work with Linux and GNU software in
> >> general, 10% of it is spent fighting/removing these extremely "thin"
> >> or false depencies, so that it is usuable in embedded devices.
> >
> > First of all, I largely consider this a joke.  All real-life embedded
> > kernel builds take place on hosted platforms; anything else seems to be
> > done "just because it can be done", as a kind of show-off art project.
> > Cute, but hardly worth impeding the rest of the kernel community for.
>
> Let me explain why it is not a joke for me, although yes I agree it's
> a funny way of how software engineering works.
>
> My argument on thin dependencies indeed mostly holds for run-time
> dependencies (to reduce size) but also for build dependency (to reduce
> complexity)*.

I usually just point to the gnucash 1.6 release as where this sort of thing 
leads if you ignore it long enough:
http://lwn.net/2001/0614/

These days, a more modern example is the way that after even the gentoo folks 
gave up on trying to build openoffice (and shipped prebuilt binaries of it in 
their "build everything from source code" OS), Open Office's own developers 
described that project "profoundly sick" and "stagnating" ( 
http://developers.slashdot.org/article.pl?sid=08/12/28/0124230 ).

Neither project _started_ with an inbred development community that presented 
a brick wall to new developers.  Complexity grew because they didn't fight 
against it, and because they didn't have good rules by which they could say 
"no" to any.

Environmental dependencies in your build environment are a cost, and as with 
all costs it's ok if you get enough in return for it.  The Linux kernel has 
historically been extremely lean in this regard, and discarding that strength 
should at the very least come with commensurate concrete benefits.

Rob
