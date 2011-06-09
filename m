From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] printk-formats.txt documentation update
Date: Thu, 9 Jun 2011 15:37:42 -0700
Message-ID: <20110609153742.2ad54aaa.rdunlap@xenotime.net>
References: <20110609124549.48117a75.rdunlap@xenotime.net>
	<1307654688-28015-1-git-send-email-amurray@mpcdata.com>
	<20110609145130.7fda9bd1.rdunlap@xenotime.net>
	<1307656829.13329.53.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1307656829.13329.53.camel@Joe-Laptop>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Perches <joe@perches.com>
Cc: Andrew Murray <amurray@mpcdata.com>, w.sang@pengutronix.de, geert@linux-m68k.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, udknight@gmail.com, namhyung@gmail.com, Andrew Murray <amurray@mpc-data.co.uk>

On Thu, 09 Jun 2011 15:00:29 -0700 Joe Perches wrote:

> On Thu, 2011-06-09 at 14:51 -0700, Randy Dunlap wrote:
> > On Thu,  9 Jun 2011 22:24:48 +0100 Andrew Murray wrote:
> > > +	For printing-16 byte UUID/GUIDs addresses. The additional 'l', 'L',
> > 	For printing 16-byte
> > You want to resend or shall I just fix it?
> 
> Hey Randy.
> 
> I find your seeming insistence on using a dash
> between the numeric count and the word byte to
> be a bit odd.
> 
> Stylistically, why do you want it there?

Mostly to make it clear.  It's too easy to be ambiguous.


> cheers, Joe

Without hyphen:

	For printing 16 byte UUID/GUIDs addresses.

Those adjectives are confusing.  I don't know what that phrase means.
It could easily mean 16 UUID/GUIDs, but it's ambiguous.

But

	For printing 16-byte UUID/GUIDs addresses.

That means (clearly to me) that UUID/GUIDs are 16-byte entities.

Or see www.incredibleenglish.com/pdf/Hyphens.pdf, section 1,
"Hyphenate unit modifiers."

Or see http://www.ehow.com/how_4473498_use-hyphen-sentence.html, section 1,
"Link compound modifiers with hyphens."

Or see http://www.getitwriteonline.com/archive/040201HyphAdj.htm


HTH.
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
