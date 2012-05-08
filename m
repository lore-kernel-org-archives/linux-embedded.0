From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Handling of modular boards
Date: Tue, 8 May 2012 14:26:54 +0200
Message-ID: <CACRpkdb4LGXfJ72uODr841O7M4FGTYKa1X7y6ekeLUw9vaL=mw@mail.gmail.com>
References: <20120504185850.GO14230@opensource.wolfsonmicro.com>
	<201205041934.08830.arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <201205041934.08830.arnd@arndb.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, Arnd Bergmann <arnd@ardb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Igor Grinberg <grinberg@compulab.co.il>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 4, 2012 at 9:34 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> Thanks for getting the discussion started. I've seen the same issue come
> up for arch/arm/mach-ux500/board-mop500*uib.c and for the beaglebone.
> I'm sure there are many more, but we should make sure that everyone
> of these can live with whatever we come up with.

The same issue sort of comes up with any system that uses the idiom
to have a few GPIO lines indicate in a binary code what version of the
board we're dealing with and what devices are thus on it, right?

We have this issue for the U9540 reference design and potentially
on the Snowball as well.

Yours,
Linus Walleij
