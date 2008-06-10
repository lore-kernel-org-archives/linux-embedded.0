From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 14:53:28 +0100
Message-ID: <1213106008.32207.784.camel@pmac.infradead.org>
References: <20080610075432.GB776@uranus.ravnborg.org>
	 <20080610090924.150D9248AC@gemini.denx.de>
	 <20080610131236.GC28565@shareable.org>
	 <87a5b0800806100625m5a6d20dao47b884bff663c24c@mail.gmail.com>
	 <1213104800.32207.778.camel@pmac.infradead.org>
	 <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Will Newton <will.newton@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, Wolfgang Denk <wd@denx.de>, Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Tue, 2008-06-10 at 14:47 +0100, Will Newton wrote:
> On Tue, Jun 10, 2008 at 2:33 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> > On Tue, 2008-06-10 at 14:25 +0100, Will Newton wrote:
> >> Using a kernel compile as a test isn't such a great idea. Stress tests
> >> of that kind are not particularly useful for pinning down bugs - so
> >> your kernel compile failed, what now? Far better to use LTP tests or
> >> similar that are designed to be reproduceable and tunable for your
> >> system. For example I don't think I'll ever be able to self host a
> >> kernel build on a board with only 32Mb of on-board RAM.
> >
> > Actually, cross-building on NFS does tend to find a _lot_ of issues
> > which crop up with board ports; especially PCI arbitration, DMA
> > coherency, cache and MMU issues. LTP often doesn't catch the same
> > problems.
> 
> It may trigger a number of bugs, I don't disagree, but as a test it is
> a blunt instrument.

Yes, it's a blunt instrument, but blunt instruments are often effective.

I disagree with your claim that using it as a test isn't a good idea.
I would, however, grant you that using it as your _only_ test is a bad
idea :)

-- 
dwmw2

