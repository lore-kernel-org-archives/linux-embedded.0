From: David Brownell <david-b@pacbell.net>
Subject: Re: flash_platform_data namespace collision
Date: Sat, 16 Jan 2010 11:23:15 -0800
Message-ID: <201001161123.15502.david-b@pacbell.net>
References: <1263620475.29868.6280.camel@calx> <20100116110420.GB31282@flint.arm.linux.org.uk> <1263664079.29868.6289.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1263664079.29868.6289.camel@calx>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: Russell King <rmk+lkml@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Linux Mailing List <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Saturday 16 January 2010, Matt Mackall wrote:
> On Sat, 2010-01-16 at 11:04 +0000, Russell King wrote:
> > On Fri, Jan 15, 2010 at 11:41:15PM -0600, Matt Mackall wrote:
> > > I've got a board here with SPI, NOR, and NAND flash devices and I've
> > > just run into a namespace collision on flash_platform_data from
> > 
> > The one in arch/arm/include/asm/mach/flash.h is designed to have great
> > appeal and flexibility across different platforms, and indeed we have
> > at least 70 users across six different MTD NOR flash drivers and two
> > MTD NAND drivers.

Yet it doesn't do what's needed for SPI flash (identify the chip type,
when it can't probed); and for that application none of those methods
are useful (and their slots are just wasted/confusing space).


> > If anything, I believe that this header should move into linux/mtd/
> > and become a standard structure for platforms to communicate their
> > requirements to flash drivers.
> 
> Yeah, I think this is probably the way to go. Davids, any objections?

I had similar thoughts when I first happened across that structure.

But such a move wouldn't resolve $SUBJECT ... which is IMO best addressed
by the obvious rename of the one to spi_flash_platform_data.

- dave
