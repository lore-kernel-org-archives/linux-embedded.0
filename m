From: Tom Cooksey <thomas.cooksey@trolltech.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Tue, 14 Oct 2008 08:36:26 +0200
Message-ID: <200810140836.27710.thomas.cooksey@trolltech.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <20081013155820.GE2556@mvista.com> <20081013160927.GC9852@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081013160927.GC9852@pengutronix.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Monday 13 October 2008 18:09:27 Robert Schwebel wrote:
> On Mon, Oct 13, 2008 at 11:58:20AM -0400, George G. Davis wrote:
> > It comes down to decisions of bill-of-materials and performance, the
> > MBX/SGX options mentioned already are part of the SoCs and have high
> > bandwidth connections to the processor. External options increase cost
> > and won't match bandwidth of on chip options, but that's just my
> > ignorant opinion w/o looking at the low-level detail comparisons.
> > Unless you intend to encourage the SoC vendors to use the SM50x
> > instead?  : )  Of course, that won't help for the current and planned
> > generation(s) of devices...
> 
> The BoM argument is probably true for high volume consumer or automotive
> use cases. For industrial usage, long term maintainability and thus
> availability of documentation and code is usually a more important
> argument.
> 
> Just my 0.02 ct. I'm just a poor open source guy :)

<RANT>
What I don't understand is that I'm trying to do some pretty interesting & cool
stuff with their processors (of course I would say that!), which will probably
help them sell more units. Why then do they make it so difficult to work with
them? It feels like they're shooting themselves in the foot. Madness.
</RANT>

Cheers,

Tom
