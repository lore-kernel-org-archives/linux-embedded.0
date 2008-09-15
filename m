From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Mon, 15 Sep 2008 17:40:12 +0100
Message-ID: <20080915164012.GB13631@shareable.org>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org> <6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com> <48AE0476.80109@snapgear.com> <20080822181314.GB24179@shareable.org> <6934efce0808221116w76a662b0t954b0922b69d3232@mail.gmail.com> <20080822183713.GC24179@shareable.org> <6934efce0809121317r418c80e8s4755669cc74975c4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6934efce0809121317r418c80e8s4755669cc74975c4@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Greg Ungerer <gerg@snapgear.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

Jared Hulbert wrote:
> > I think the "fast" in "fast synchronous" gives it away :-)
> 
> Yes, I suppose it does.
> 
> > I'm using Spansion MirrorBit S29GL128N, which reads at about 0.6 MByte/s.
> 
> I think you should get more like an order of magnitude higher.... Get
> an expert to look at your timings in the bootloader.  Make sure things
> are cached too.  ioremap_cached()...

Yes, looking at the Spansion datasheet, if it were interfaced properly
it should be quite fast.  (25ns access time for in-page 16-bit reads,
100ns for random reads).

I'll see if ioremap_cached() makes a difference to streaming read
performance.

The BSP suppliers have been quite cautious in places, flushing cache a
bit too often.  (I'm not surprised - we had disk ext3 filesystem
corruption due to insufficient cache flushing in places too.)

> > Oh, and it's a 166MHz ARM, so it's quite capable of decompressing
> > faster than the NOR can deliver.
> 
> Depends on how you are measuring it.   You ought to be able to get at
> least 2 orders of magnitude higher read speeds with a good sync Flash.
>  Some of the newer stuff is even faster.

Thanks.

Oh, how I look forward to the day of working with current kernels and
current hardware.

-- Jamie
