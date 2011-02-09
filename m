From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] Remove CONFIG_PM altogether, enable power management
 all the time
Date: Wed, 9 Feb 2011 18:40:10 +0000
Message-ID: <20110209184010.GB23747@opensource.wolfsonmicro.com>
References: <4D51D341.3040209@am.sony.com>
 <20110209114137.GA10163@opensource.wolfsonmicro.com>
 <201102091807.03094.rjw@sisk.pl>
 <4D52DD81.7050401@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D52DD81.7050401@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: frank.rowand@am.sony.com
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Wed, Feb 09, 2011 at 10:31:29AM -0800, Frank Rowand wrote:

> Raphael's patch will turn on CONFIG_PM in the correct circumstances, and
> leave it off when not needed by other config options.  That means that
> the size overhead will _not_ be an issue for me because CONFIG_PM
> will not be enabled when not needed.

That's not the issue you seemed to be raising, though.  While PM is now
turned on by PM_SLEEP that'll end up getting turned on by default due to
the dependency on SUSPEND - you appeared to be raising the concern that
this could happen and surprise users.
