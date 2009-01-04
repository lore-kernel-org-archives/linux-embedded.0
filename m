From: David Brownell <david-b@pacbell.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 17:39:27 -0800
Message-ID: <200901031739.28517.david-b@pacbell.net>
References: <200901020207.30359.rob@landley.net> <200901031346.01325.rob@landley.net> <4960068A.3040109@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4960068A.3040109@shaw.ca>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Hancock <hancockr@shaw.ca>
Cc: Rob Landley <rob@landley.net>, Matthieu CASTET <matthieu.castet@parrot.com>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Saturday 03 January 2009, Robert Hancock wrote:
> Rob Landley wrote:
> > ... some architectures (arm omap and and arm at91) 
> > allow you to enter arbitrary HZ values in kconfig.  (Their help text says that 
> > in many cases values that aren't powers of two won't work, but nothing 
> > enforces this.)
> 
> Is there a good reason that these archs allow you enter arbitrary HZ 
> values?

Power-of-two can be desirable when using a 32 KiHz oscillator, because
other values accumulate rounding errors ... you can't make 100 Hz, or
250 Hz, or 300 Hz, or 1000 Hz, by a binary division of 32 KiHz.

Other values were supported to help work around stupid software making
bad assumptions about HZ.  IMO, enforcing power-of-two would be better;
that software breaks with dyntick anyway, and needs fixing.


> The use case for using custom HZ values at all nowadays seems  
> fairly low now that dynticks is around (if that arch supports it 
> anyway),

A better argument would be that GENERIC_TIME exists (and works
on OMAP and AT91), which avoids some flavors of rounding error.
ISTR those CONFIG_HZ options predate GENERIC_TIME support.

However, the issue remains that most kernel times are measured in
jiffies not ktime_t -- they're easier and more efficient, all
those 64-bit multiplies can hurt on ARM (32-bit, non-GHz) -- so
it's still good to be able to ensure that jiffies-centric logic
won't always be inserting easily avoidable errors.

- Dave
