From: Wolfgang Denk <wd@denx.de>
Subject: Re: Handling of modular boards
Date: Fri, 04 May 2012 22:33:57 +0200
Message-ID: <20120504203357.6B79B206451@gemini.denx.de>
References: <20120504185850.GO14230@opensource.wolfsonmicro.com> <201205041934.08830.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <201205041934.08830.arnd@arndb.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, Arnd Bergmann <arnd@ardb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Igor Grinberg <grinberg@compulab.co.il>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Dear Arnd,

In message <201205041934.08830.arnd@arndb.de> you wrote:
>
> One idea that I've heard before is to put device tree fragments into the
> kernel and dynamically add them to the device tree that was passed by the
> boot loader whenever we detect the presence of a specific device.
> This obviously means it works only for boards using DT for booting, but
> it allows us to use some infrastructure that we already have.
> 
> Another idea was to put all the possible extensions into the device tree
> for a given board and disable them by default, putting it into the
> responsibility of the boot loader to enable the one that is actually
> being used. This has serious scalibility problems when there are many
> possible extensions and also relies more on the boot loader than I would
> like.

On the other hand, some of the issues we're trying to solve here
for the kernel are also present in the boot loader, so this needs to
do this anyway - whether by inserting new or modifying (enabling or
disabling) existing properties in the DT is not really relevant here.


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Our business is run on trust.  We trust you will pay in advance.
