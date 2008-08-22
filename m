From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 19:37:13 +0100
Message-ID: <20080822183713.GC24179@shareable.org>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org> <6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com> <48AE0476.80109@snapgear.com> <20080822181314.GB24179@shareable.org> <6934efce0808221116w76a662b0t954b0922b69d3232@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6934efce0808221116w76a662b0t954b0922b69d3232@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Greg Ungerer <gerg@snapgear.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

Jared Hulbert wrote:
> On Fri, Aug 22, 2008 at 11:13 AM, Jamie Lokier <jamie@shareable.org> wrote:
> > Greg Ungerer wrote:
> >> One thing for sure is that many people who do non-MMU setups
> >> are interested in XIP to get the space savings. These are very
> >> often small devices with very constrained RAM and flash. (For
> >> whatever it is worth single NOR flash only boards are common in
> >> these smaller form factors :-)
> >
> > I'm using XIP on a device with 32MB RAM.  The reason I use it is
> > _partly_ to save RAM, partly because programs start about 10 times
> > faster (reading NOR flash is slow and I keep the XIP region in RAM)
> 
> What kind of NOR you using?  That is not what I measure with fast
> synchronous burst NOR's.

I think the "fast" in "fast synchronous" gives it away :-)

I'm using Spansion MirrorBit S29GL128N, which reads at about 0.6 MByte/s.

Not because they're good, but because that's what the board I'm coding
for has on it.  I presume they were cheap and familiar to the board
designers.  (There is 32MB of RAM to play with after all.)

So start a sequence of Busybox processes from a shell script is noticable,
if it reads from NOR each time.

Oh, and it's a 166MHz ARM, so it's quite capable of decompressing
faster than the NOR can deliver.

-- Jamie
