From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 1/6] [PWM] Generic PWM API implementation
Date: Tue, 4 Nov 2008 22:08:45 -0700
Message-ID: <200811042108.45735.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <200811041555.18234.david-b@pacbell.net> <8bd0f97a0811041617k6761866bn20e0c8b6e415cd9a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0811041617k6761866bn20e0c8b6e415cd9a@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org

On Tuesday 04 November 2008, Mike Frysinger wrote:
> On Tue, Nov 4, 2008 at 18:55, David Brownell wrote:
> > On Tuesday 04 November 2008, Bill Gatliff wrote:
> >> So, what's the next step?  How do I advocate for getting
> >> this API into mainline?
> >
> > The number of backing implementations seemed a bit low ...
> > just one.  And that's switching Atmel's dedicated PWM, but
> > not the other PWM driver in the tree (for PXA); so it's
> > not terrifically accessible.
> >
> > My rule of thumb is that it's not worth considering a
> > framework as being general enough until it's got three
> > fairly different backing implementations.  Two is enough
> > to consider merging, especially with complicated drivers.
> 
> every Blackfin processor so far has had dedicated PWM hardware in it,
> so a backend driver for that arch would show up ...

I'm not questioning the notion that more generic PWM support
would be useful, note!  Just pointing out my rule of thumb,
which has proven to be a good one.

A variety of implementations shakes out portability issues,
and highlights (what *WE* already know!) that this stuff is
actually generally useful.  And when there's no test harness,
having most of a 3-providers vs 3-users matrix known to work
is a good stand-in.


> > Plus the number of framework users is an issue. ...
> 
> there is an lcd driver or two in the tree (probably Blackfin specific)
> that uses the PWM hardware as an output to drive the hsync/vsync
> signals.

... Right, but not through *this* framework.  The proof that
the framework is sufficient for that application too would be
the code.  And hsync/vsync seems like a usefully "different" app
context to me.  Certainly not one that came quickly to my mind!

But as we know, PWM gets used in all kinds of ways.  :)

 
> and while LIRC is still out-of-tree for mainline, i wrote a driver
> using the PWM hardware as an input ... but there wasnt anything else
> Blackfin specific in said driver other than the PWM stuff ...
> 
> i'm guessing you'd prefer to see those implemented before moving to
> mainline though ?

Well, more than just Bill's single implementation and client, yes.
Maybe the Blackfin PWM provider, and one more API client ... though
more of each would be fine too.

I'd imagine Bill would be glad to have more active hands on the
code too ... a few issues always seem to turn up with the first
users, and it's better to sort them out with "early adopters"
before the floodgates open.

Plus:  more users provides some evidence to folk like Andrew and
Linus that the code is useful enough to merge.  Embedded Linux
isn't as visible to them as x86.

- Dave
