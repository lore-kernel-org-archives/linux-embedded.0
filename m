From: Wolfgang Denk <wd@denx.de>
Subject: Re: Handling of modular boards
Date: Fri, 04 May 2012 22:38:57 +0200
Message-ID: <20120504203857.49EAD206451@gemini.denx.de>
References: <20120504185850.GO14230@opensource.wolfsonmicro.com> <4FA432E9.9050606@wwwdotorg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <4FA432E9.9050606@wwwdotorg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, Arnd Bergmann <arnd@ardb.de>, Olof Johansson <olof@lixom.net>, Igor Grinberg <grinberg@compulab.co.il>, linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

Dear Stephen,

In message <4FA432E9.9050606@wwwdotorg.org> you wrote:
>
> representation of how to identify the child boards, and then have the
> kernel only use/parse certain chunks of the DT based on the ID results.

I expect that this will quickly cause problems, for example in those
many cases where pins and peripheral functions are multiplexed, or
usable for different purposes. I would not want to maintain a DT that
has to describe all combinations used by some boards - in a way that
does not cause conflicts on either of them.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
CONSUMER NOTICE:  Because  of  the  "Uncertainty  Principle,"  It  Is
Impossible  for  the  Consumer  to  Find  Out  at  the Same Time Both
Precisely Where This Product Is and How Fast It Is Moving.
