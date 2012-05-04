From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Handling of modular boards
Date: Fri, 4 May 2012 21:03:34 +0000
Message-ID: <201205042103.34285.arnd@arndb.de>
References: <20120504185850.GO14230@opensource.wolfsonmicro.com> <201205042039.25794.arnd@arndb.de> <20120504205441.D293120645E@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120504205441.D293120645E@gemini.denx.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfgang Denk <wd@denx.de>, Samuel Ortiz <sameo@linux.intel.com>, linux-embedded@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, Igor Grinberg <grinberg@compulab.co.il>, Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>

On Friday 04 May 2012, Wolfgang Denk wrote:
> There are systems (and I bet it will be a growing number) where U-Boot
> itself uses the DT for configuration.  Also, there are functions that
> are needed both by the boot loader and the kernel - for example to
> dislay a splash screen the boot loader needs to initialize the
> display, so it must be able to detect which type of LCD is attached
> (resolution, color-depth, orientation) - the device tree comes in very
> handy here.  Why should Linux re-do all such things?

Sure, there are a lot of things that the boot loader can use from the
device tree, but I'm not sure if the LCD panel connection fits into
the same category as the devices that Mark was thinking of.

Anyway, display controllers are definitely something that needs to
be handled in some way, which may or may not be the same way we
handle more complex collections of arbitrary devices.

	Arnd
