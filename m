From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 21:05:00 -0600
Message-ID: <200901032105.00779.rob@landley.net>
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
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Saturday 03 January 2009 18:44:58 Robert Hancock wrote:
> Rob Landley wrote:
> > For the record, the reason I can't just pregenerate all these suckers on
> > a system that's got an arbitrary precision calculator (ala dc) and then
> > just ship the resulting header files (more or less the what the first
> > version of that first patch did) is that some architectures (arm omap and
> > and arm at91) allow you to enter arbitrary HZ values in kconfig.  (Their
> > help text says that in many cases values that aren't powers of two won't
> > work, but nothing enforces this.)  So if we didn't have the capability to
> > dynamically generate these, you could enter a .config value that would
> > break the build.
>
> Is there a good reason that these archs allow you enter arbitrary HZ
> values?

Not that I've noticed, no.  But you should ask Thomas Gleixner about that 
about that, I'm not a domain expert...

> The use case for using custom HZ values at all nowadays seems
> fairly low now that dynticks is around (if that arch supports it
> anyway), let alone being able to specify wierd obscure values for it.

And high performance event timers.  A kernel can have more than one time 
source these days...

Rob
