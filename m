From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 18:04:39 +0000
Message-ID: <20090112180439.0938ab5a@lxorguk.ukuu.org.uk>
References: <200901020207.30359.rob@landley.net>
	<31014a580901120118u55256b51g448f22e9e0ef5d1f@mail.gmail.com>
	<20090112094121.GD28564@linux-sh.org>
	<200901121156.17377.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901121156.17377.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Paul Mundt <lethal@linux-sh.org>, "Mark A. Miller" <mark@mirell.org>, Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

> I didn't say it was incapable of being supported.  We're _capable_ of 
> reimplementing the entire kernel in perl 

Which perl. What minor release, what day of the week syntax.

Ask anyone in the distribution business about the joy of perl and you can
listen to the screams for hours.

Perl5 has no formal grammar and you cannot tell what perl of the week
does and perl of last week doesn't do.

That makes it a bad candidate for our toolchain dependencies.


Alan
--
   "I don't want world domination if it means I have to deal with more
	people like this" - Mike Wangsmo
