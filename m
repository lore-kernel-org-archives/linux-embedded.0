From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded	Maintainer(s)...)
Date: Thu, 12 Jun 2008 09:23:19 -0700
Message-ID: <48514D77.4060007@am.sony.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>	 <200806111941.51221.rob@landley.net>  <48513F5A.6010008@am.sony.com> <1213285831.26255.152.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213285831.26255.152.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

David Woodhouse wrote:
>>... fixing
>> them in the upstream packages (or in the autoconf system itself).
>>
>> Once someone fixes the cross-compilation issues for a package, they usually
>> stay fixed, if the fixes are mainlined.
> 
> I don't think that's true, unfortunately. Autoconf makes it _easy_ to do
> the wrong thing, and people will often introduce new problems.

If autoconf is the problem (and I think it is), then that's what
should be fixed (see my original post).  At a minimum, it would be
nice if it had more built-in detection and warning of techniques
that were dangerous for cross-compilation.

While I was writing the above,

Paul Mundt wrote:
> You can
> either try to fix the packages in question, convince the package
> developers to rip out the parts that cause trouble for your environment,
> fix your own build environment to meet the needs of the packages, or
> whine about it on a mailing list. Empirically we already know which one
> of those options is going to win out. ;-)

LOL.  Well, at least Rob has put his money where his mouth is (so to
speak) with Firmware Linux.  The chance that I'll do anything but whine
about autoconf is slim indeed...  I'll shut up now!
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

