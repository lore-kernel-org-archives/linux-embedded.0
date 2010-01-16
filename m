From: Matt Mackall <mpm@selenic.com>
Subject: flash_platform_data namespace collision
Date: Fri, 15 Jan 2010 23:41:15 -0600
Message-ID: <1263620475.29868.6280.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>, Russell King <rmk+kernel@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>
Cc: Linux Mailing List <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

I've got a board here with SPI, NOR, and NAND flash devices and I've
just run into a namespace collision on flash_platform_data from

 include/spi/flash.h

and

 arch/arm/include/asm/mach/flash.h

And each appears to have a bunch of users.

-- 
http://selenic.com : development and support for Mercurial and Linux

