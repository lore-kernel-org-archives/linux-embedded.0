From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: flash_platform_data namespace collision
Date: Sat, 16 Jan 2010 11:04:20 +0000
Message-ID: <20100116110420.GB31282@flint.arm.linux.org.uk>
References: <1263620475.29868.6280.camel@calx>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753954Ab0APLEq@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:In-Reply-To:
	Sender; bh=vZZhoJbz6whkSxPdR+KbMVgkK860YYXO+Mtq4fL7Hgg=; b=eH2ga
	I754GHGGty0glQ92sk1z86VdGSQdR0zoT5xJd2/KkrdzX8Ta7dY7QAjprYvKvDsQ
	nbPhzuQVUHdpuswMDpeRTlKQ/Xb38Lh1rqmaq+MHGqNmRH4qOHuZrabvHlE/3SJY
	5LfLF5v1cYIVwDsqixx2o7pakeuppZfO2e0r8E=
Content-Disposition: inline
In-Reply-To: <1263620475.29868.6280.camel@calx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: David Brownell <david-b@pacbell.net>, David Woodhouse <dwmw2@infradead.org>, Linux Mailing List <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Fri, Jan 15, 2010 at 11:41:15PM -0600, Matt Mackall wrote:
> I've got a board here with SPI, NOR, and NAND flash devices and I've
> just run into a namespace collision on flash_platform_data from

The one in arch/arm/include/asm/mach/flash.h is designed to have great
appeal and flexibility across different platforms, and indeed we have
at least 70 users across six different MTD NOR flash drivers and two
MTD NAND drivers.

If anything, I believe that this header should move into linux/mtd/
and become a standard structure for platforms to communicate their
requirements to flash drivers.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
