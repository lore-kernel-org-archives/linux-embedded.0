From: Matt Fleming <matt@console-pimps.org>
Subject: Re: New MMC maintainer needed
Date: Tue, 11 Aug 2009 15:02:24 +0100
Message-ID: <20090811140223.GA4278@console-pimps.org>
References: <20090714153601.6dfe70ff@mjolnir.ossman.eu> <20090722151744.fffd7bf5.akpm@linux-foundation.org> <20090728222334.0c543c47@mjolnir.ossman.eu> <20090731122623.254fd0f1@mjolnir.ossman.eu> <20090731105407.GA31900@console-pimps.org> <20090803123429.390a636f@mjolnir.ossman.eu> <4A76C658.6050002@nokia.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A76C658.6050002@nokia.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Hunter <adrian.hunter@nokia.com>
Cc: Pierre Ossman <pierre@ossman.eu>, Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "nico@cam.org" <nico@cam.org>, "nicolas.ferre@rfo.atmel.com" <nicolas.ferre@rfo.atmel.com>, "hskinnemoen@atmel.com" <hskinnemoen@atmel.com>, "tony@atomide.com" <tony@atomide.com>, "david-b@pacbell.net" <david-b@pacbell.net>, "manuel.lauss@gmail.com" <manuel.lauss@gmail.com>, "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>, "ppisa@pikron.com" <ppisa@pikron.com>, "Lavinen Jarkko (Nokia-D/Helsinki)" <jarkko.lavinen@nokia.com>, "ben@fluff.org" <ben@fluff.org>, "saschasommer@freenet.de" <saschasommer@freenet.de>, "avorontsov@ru.mvista.com" <avorontsov@ru.mvista.com>, "oakad@yahoo.com" <oakad@yahoo.com>, "ian@mnementh.co.uk" <ian@mnementh.co.uk>, HaraldWelte@viate

On Mon, Aug 03, 2009 at 02:13:28PM +0300, Adrian Hunter wrote:
> Pierre Ossman wrote:
>> Con:
>>
>>  - The scanning code gets less clear as you increase the number of
>>    possible paths through it.
>>
>>  - Different systems will have different init sequences, possibly
>>    provoking bugs in the cards.
>>
>>  - Host driver writers now have more capability bits they have to
>>    consider. And these might be less than obvious since SD/MMC/SDIO are
>>    normally compatible so these bits seem useless.
>>
>>  - With the current logic (which was better in the first version),
>>    "normal" drivers will have to explicitly state that they work as
>>    intended by setting all bits.
>
> And the pro is objective.
>
>> Pro:
>>
>>  - A slightly reduced scanning time.
>
> That's great!  Why do you disregard this so easily?
>

Ping. Adrian, do you have any initialisation times for this patch? I'm
afraid I don't have any eMMC hardware, so I'm not able to gather any
numbers.
