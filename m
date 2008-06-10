From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 14:33:20 +0100
Message-ID: <1213104800.32207.778.camel@pmac.infradead.org>
References: <20080610075432.GB776@uranus.ravnborg.org>
	 <20080610090924.150D9248AC@gemini.denx.de>
	 <20080610131236.GC28565@shareable.org>
	 <87a5b0800806100625m5a6d20dao47b884bff663c24c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <87a5b0800806100625m5a6d20dao47b884bff663c24c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Will Newton <will.newton@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, Wolfgang Denk <wd@denx.de>, Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Tue, 2008-06-10 at 14:25 +0100, Will Newton wrote:
> On Tue, Jun 10, 2008 at 2:12 PM, Jamie Lokier <jamie@shareable.org> wrote:
> > Wolfgang Denk wrote:
> >> Being unable to do this just because we now also would need a  native
> >> Perl is indeed a PITA...
> >
> > You can run the Perl bit with "ssh remote perl", and still do the rest
> > of the compile natively.  It's not pretty, but workable.
> 
> I'm not convinced it matters at all. Self hosting on an embedded
> architecture is, as has been mentioned, pretty pointless.
> 
> Using a kernel compile as a test isn't such a great idea. Stress tests
> of that kind are not particularly useful for pinning down bugs - so
> your kernel compile failed, what now? Far better to use LTP tests or
> similar that are designed to be reproduceable and tunable for your
> system. For example I don't think I'll ever be able to self host a
> kernel build on a board with only 32Mb of on-board RAM.

Actually, cross-building on NFS does tend to find a _lot_ of issues
which crop up with board ports; especially PCI arbitration, DMA
coherency, cache and MMU issues. LTP often doesn't catch the same
problems.

I agree that it's not so easy on a board with 32Mb of RAM, since that's
only 4,000,000 bytes -- but 32MiB ought to be _perfectly_ sufficient :)

-- 
dwmw2

