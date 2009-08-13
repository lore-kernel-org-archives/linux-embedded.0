From: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: New MMC maintainer needed
Date: Thu, 13 Aug 2009 10:01:57 +0300
Message-ID: <4A83BA65.1080608@nokia.com>
References: <20090714153601.6dfe70ff@mjolnir.ossman.eu> <20090722151744.fffd7bf5.akpm@linux-foundation.org> <20090728222334.0c543c47@mjolnir.ossman.eu> <20090731122623.254fd0f1@mjolnir.ossman.eu> <20090731105407.GA31900@console-pimps.org> <20090803123429.390a636f@mjolnir.ossman.eu> <4A76C658.6050002@nokia.com> <20090811140223.GA4278@console-pimps.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090811140223.GA4278@console-pimps.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Fleming <matt@console-pimps.org>
Cc: Pierre Ossman <pierre@ossman.eu>, Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "nico@cam.org" <nico@cam.org>, "nicolas.ferre@rfo.atmel.com" <nicolas.ferre@rfo.atmel.com>, "hskinnemoen@atmel.com" <hskinnemoen@atmel.com>, "tony@atomide.com" <tony@atomide.com>, "david-b@pacbell.net" <david-b@pacbell.net>, "manuel.lauss@gmail.com" <manuel.lauss@gmail.com>, "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>, "ppisa@pikron.com" <ppisa@pikron.com>, "Lavinen Jarkko (Nokia-D/Helsinki)" <jarkko.lavinen@nokia.com>, "ben@fluff.org" <ben@fluff.org>, "saschasommer@freenet.de" <saschasommer@freenet.de>, "avorontsov@ru.mvista.com" <avorontsov@ru.mvista.com>, "oakad@yahoo.com" <oakad@yahoo.com>, "ian@mnementh.co.uk" <ian@mnementh.co.uk>, HaraldWelte@viate

Matt Fleming wrote:
> On Mon, Aug 03, 2009 at 02:13:28PM +0300, Adrian Hunter wrote:
>> Pierre Ossman wrote:
>>> Con:
>>>
>>>  - The scanning code gets less clear as you increase the number of
>>>    possible paths through it.
>>>
>>>  - Different systems will have different init sequences, possibly
>>>    provoking bugs in the cards.
>>>
>>>  - Host driver writers now have more capability bits they have to
>>>    consider. And these might be less than obvious since SD/MMC/SDIO are
>>>    normally compatible so these bits seem useless.
>>>
>>>  - With the current logic (which was better in the first version),
>>>    "normal" drivers will have to explicitly state that they work as
>>>    intended by setting all bits.
>> And the pro is objective.
>>
>>> Pro:
>>>
>>>  - A slightly reduced scanning time.
>> That's great!  Why do you disregard this so easily?
>>
> 
> Ping. Adrian, do you have any initialisation times for this patch? I'm
> afraid I don't have any eMMC hardware, so I'm not able to gather any
> numbers.
> 

Sorry for the slow reply.

Results in microseconds:

	before		after
eMMC	194145		193641
uSD	4143		2129

However, that excludes powering up.  For example the pbias setting
on omap_hsmmc for MMC1 (uSD for us) has a 100ms delay.

So the difference is negligible.

Although, the notion of unnecessarily sending SDIO commands
to an uSD, and SDIO and SD commands to an eMMC, seems wrong.
Especially when trying to debug very-hard-to-reproduce errors.

