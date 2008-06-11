From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Wed, 11 Jun 2008 00:34:31 -0500
Message-ID: <200806110034.33111.rob@landley.net>
References: <20080610075432.GB776@uranus.ravnborg.org> <1213104800.32207.778.camel@pmac.infradead.org> <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Will Newton <will.newton@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Jamie Lokier <jamie@shareable.org>, Wolfgang Denk <wd@denx.de>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Tuesday 10 June 2008 08:47:20 Will Newton wrote:
> On Tue, Jun 10, 2008 at 2:33 PM, David Woodhouse <dwmw2@infradead.org> 
wrote:
> > On Tue, 2008-06-10 at 14:25 +0100, Will Newton wrote:
> >> On Tue, Jun 10, 2008 at 2:12 PM, Jamie Lokier <jamie@shareable.org> 
wrote:
> >> > Wolfgang Denk wrote:
> >> >> Being unable to do this just because we now also would need a  native
> >> >> Perl is indeed a PITA...
> >> >
> >> > You can run the Perl bit with "ssh remote perl", and still do the rest
> >> > of the compile natively.  It's not pretty, but workable.
> >>
> >> I'm not convinced it matters at all. Self hosting on an embedded
> >> architecture is, as has been mentioned, pretty pointless.
> >>
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
> a blunt instrument. It's likely to be hard to reproduce and have an
> inconsistent failure mode. If you're really serious about testing it's
> not the best solution. It's like using gcc instead of memtest86 to
> test your memory. Eventually it might go wrong but you won't be much
> the wiser about why, or have any way to trim your testcase down so you
> can run it on an in-circuit emulator or pass it to your silicon
> vendor.
>
> > I agree that it's not so easy on a board with 32Mb of RAM, since that's
> > only 4,000,000 bytes -- but 32MiB ought to be _perfectly_ sufficient :)
>
> I would be surprised if it was possible to compile Linux with gcc 4.2
> with 32MiB of total system memory.

Haven't tried, but I generally run emulated builds in 128 megs of ram (on 32 
bit hosts), and I use this:

# This tells gcc to aggressively garbage collect its internal data
# structures.  Without this, gcc triggers the OOM killer trying to rebuild
# itself in 128 megs of ram, which is the QEMU default size.
export CFLAGS="--param ggc-min-expand=0 --param ggc-min-heapsize=8192"

Don't do that on a 64 bit host or your build will slow to a crawl, of course.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
