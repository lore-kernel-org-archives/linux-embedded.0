From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: architecture-independent I/o accessors
Date: Tue, 18 Aug 2009 21:37:07 +0000
Message-ID: <200908182137.08044.arnd@arndb.de>
References: <20090818210701.84125833DBD2@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090818210701.84125833DBD2@gemini.denx.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Wolfgang Denk <wd@denx.de>
Cc: linux-embedded@vger.kernel.org

On Tuesday 18 August 2009 21:07:01 Wolfgang Denk wrote:
> Dear Arnd,
> 
> Josh Boyer suggested you might provide some insight...
> 
> I'm currently looking for a solution how to provide architecture
> independent I/O accessor functions to U-Boot. In the past, lots of
> code used direct pointer accesses, relying on the idea that "volatile"
> would be sufficient to convince the compiler and the hardware to do
> what was expected; some architectures (like ARM and others) used
> readl() / writel(), while others (like PPC) used in_8, in_le16,
> in_be16, in_le32, in_be32, in_le64, in_be64 etc.
> 
> As we like to borrow code from Linux, I'm trying to find out what the
> big plan for Linux is.
> 
> My understanding is that in Linux the ioreadX() / iowriteX() /
> ioreadXbe() / iowriteXbe() functions are supposed to provide
> architecture independent I/O accessors, and that the plain ioreadX()
> / iowriteX() functions (without the "be") are always guaranteed to be
> little-endian on all architectures, while the "be" functions are,
> well, big-endian.  Is this understanding correct?

yes. Also, these functions are defined so that you can use them
both for memory mapped I/O *and* for programmed I/O (aka inl/outl).

> If yes, does that mean that in the future we will see more Linux code
> using ioreadX[be]() / iowriteX[be]()? So far I did not find much
> hints that support this aproach - only memory-barriers.txt has only a
> short sentence about these functions, with basicly no explanation.

The most common ones are readl/writel, simply because they are better
known. For devices that only have memory mapped I/O, they are
by definition equivalent to ioread32/iowrite32.

The SATA drivers and others use ioread32/iowrite32 because that
lets the driver ignore the difference between PIO and MMIO.

> What I liked from the in_[le]X() / out_[le]X() accessors on PPC was
> that they allowed for type checking - the compiler would raise a
> warning when you used in_[le]16() to read from a 32 bit wide register.
> However, ioreadX[be]() / iowriteX[be]() use a void * "iomem cookie",
> so no type checking can be done.

Hmm, interesting. I was never aware of that difference. We should
probably change that in the kernel, to add type checking to all
of them.

Another difference on powerpc is that in_le32/out_le32 do not
can not be used on PCI devices but only SoC, because legacy iSeries
and pSeries need some additional magic for PCI accesses.

> Basicly I have two questions:
> 
> 1) Can you make a statement which direction Linux is heading to?
>    Will more (new) code use ioreadX() / iowriteX()?

New subsystems will often use ioreadX/iowriteX by default, but
I expect existing code to keep using readl/writel and new drivers
will also keep using it.

> 2) What would be your recommendation what we should do in U-Boot?
>    Provide for all architectures in_8, in_le16, in_be16, in_le32,
>    in_be32, in_le64, in_be64 etc. similar to what we have for the
>    Power architecture, well knowing that Linux will not follow that
>    route, or use ioreadX[be]() / iowriteX[be]() which does not provide
>    type checking, and which eventually does not find wider use in
>    Linux either? Or even something else - like ioreadX[be]() /
>    iowriteX[be]() with type checking added?

I think ioread32/iowrite32 and friends with type checking would
be the easiest. It would be nice to try adding type checking to
the kernel, just to see what breaks ;-)

	Arnd <><
