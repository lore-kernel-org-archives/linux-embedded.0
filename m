From: David Brownell <david-b@pacbell.net>
Subject: Re: flash_platform_data namespace collision
Date: Fri, 15 Jan 2010 22:03:45 -0800
Message-ID: <201001152203.45438.david-b@pacbell.net>
References: <1263620475.29868.6280.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1263620475.29868.6280.camel@calx>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Linux Mailing List <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Friday 15 January 2010, Matt Mackall wrote:
> I've got a board here with SPI, NOR, and NAND flash devices and I've
> just run into a namespace collision on flash_platform_data from
> 
>  include/spi/flash.h
> 
> and
> 
>  arch/arm/include/asm/mach/flash.h
> 
> And each appears to have a bunch of users.

ISTR someone noting that before but omitting a patch.

You can do that one better.  :)

I think changing the SPI flash name will affect fewer platforms.

- Dave
