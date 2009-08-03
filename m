From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: New MMC maintainer needed
Date: Mon, 3 Aug 2009 14:41:50 -0700
Message-ID: <20090803144150.82f63ffc.akpm@linux-foundation.org>
References: <20090714153601.6dfe70ff@mjolnir.ossman.eu>
	<20090722151744.fffd7bf5.akpm@linux-foundation.org>
	<20090728222334.0c543c47@mjolnir.ossman.eu>
	<20090731122623.254fd0f1@mjolnir.ossman.eu>
	<20090731105407.GA31900@console-pimps.org>
	<20090803123429.390a636f@mjolnir.ossman.eu>
	<4A76C658.6050002@nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A76C658.6050002@nokia.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Hunter <adrian.hunter@nokia.com>
Cc: pierre@ossman.eu, matt@console-pimps.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, ppisa@pikron.com, jarkko.lavinen@nokia.com, ben@fluff.org, saschasommer@freenet.de, avorontsov@ru.mvista.com, oakad@yahoo.com, ian@mnementh.co.uk, HaraldWelte@viatech.com, JosephChan@via.com.tw

On Mon, 03 Aug 2009 14:13:28 +0300
Adrian Hunter <adrian.hunter@nokia.com> wrote:

> Pierre Ossman wrote:
> > On Fri, 31 Jul 2009 11:54:07 +0100
> > Matt Fleming <matt@console-pimps.org> wrote:
> > 
> >> On Fri, Jul 31, 2009 at 12:26:23PM +0200, Pierre Ossman wrote:
> >>> [PATCH 0/32] mmc and omap_hsmmc patches
> >>> http://marc.info/?t=124722953900010&r=1&w=2
> >>>
> >>> I haven't looked through these at all. The ones affecting the core
> >>> probably need some thorough reviews.
> >>>
> >>> I did notice the patch to say which cards a controller supports though,
> >>> and I'm very sceptical about that one. The scanning process should work
> >>> anyway, and the performance impact should be negligible as it is only
> >>> on init. So that patch only adds complexity and confusion IMO.
> >>>
> >> How much complexity does it really add? Surely it's better to give the
> >> host controller driver writers the ability to not entertain supporting
> >> some cards if they cannot be used? If they want to avoid the scanning
> >> process for certain cards, why not let them?
> >>
> > 
> > Let's look at the pros and cons of this:
> 
> But the cons are all subjective.
> 
> > Con:
> > 
> >  - The scanning code gets less clear as you increase the number of
> >    possible paths through it.
> > 
> >  - Different systems will have different init sequences, possibly
> >    provoking bugs in the cards.
> > 
> >  - Host driver writers now have more capability bits they have to
> >    consider. And these might be less than obvious since SD/MMC/SDIO are
> >    normally compatible so these bits seem useless.
> > 
> >  - With the current logic (which was better in the first version),
> >    "normal" drivers will have to explicitly state that they work as
> >    intended by setting all bits.

Subjective or not, they are real and valid.

> And the pro is objective.
> 
> > Pro:
> > 
> >  - A slightly reduced scanning time.
> 
> That's great!  Why do you disregard this so easily?

Coz nobody quantified it.  Let's go to the changelog:

: Some hosts can accept only certain types of cards.  For example, an eMMC
: is MMC only and a uSD slot may be SD only.  However the MMC card scanning
: logic checks for all card types one by one.
: 
: Add host capabilities to specify which card types can be used, and amend
: the card scanning logic to skip scanning for those types which cannot be
: used.

See, it provides no reason at all for adding this additional complexity.

Now we're told "it's faster".  OK.  How much faster?  Show us the
numbers so we can all understand why the change is justifiable!
