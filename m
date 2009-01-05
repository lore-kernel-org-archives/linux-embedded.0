From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sun, 4 Jan 2009 23:08:26 -0600
Message-ID: <200901042308.27275.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901020213.30658.rob@landley.net> <2c0942db0901041641v5546a1e2med4ca18fe8d2510f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <2c0942db0901041641v5546a1e2med4ca18fe8d2510f@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ray Lee <ray-lk@madrabbit.org>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Sunday 04 January 2009 18:41:15 Ray Lee wrote:
> On Fri, Jan 2, 2009 at 12:13 AM, Rob Landley <rob@landley.net> wrote:
> > Replace kernel/timeconst.pl with kernel/timeconst.sh.  The new shell
> > script is much simpler, about 1/4 the size, and runs on Red Hat 9 from
> > 2003.
> >
> > Peter Anvin added this perl to 2.6.25.  Before that, the kernel had never
> > required perl to build.
>
> Nice work.

Thanks.  You'll definitely want to look at the _second_ version of that patch 
rather than the first, though. :)

> As the computations can all be done in 64-bit precision
> now, and there have been concerns expressed about some shells not
> supporting 64 bit integers, is there any reason this can't be done
> using long longs in C?

Nope.  Any of this could be done in C.  (And that's the approach Sam Ravnborg 
prefers to take for the second patch in the series, upgrading unifdef.c to do 
everything itself.)

I tend to lean towards scripts that create header files rather than programs 
that create header files, but as long as you remember to use HOSTCC it's 
fairly straightforward. :)

> Other than ruining a good bike shed argument, anyway.

Oh pile on.  It beats being dismissed as the only one on the planet who cares 
about the issue (again). :)

Rob
