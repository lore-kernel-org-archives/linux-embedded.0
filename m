From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] Remove CONFIG_PM altogether, enable power management
 all the time
Date: Wed, 9 Feb 2011 19:25:06 +0000
Message-ID: <20110209192506.GC23747@opensource.wolfsonmicro.com>
References: <4D51D341.3040209@am.sony.com>
 <20110209114137.GA10163@opensource.wolfsonmicro.com>
 <201102091807.03094.rjw@sisk.pl>
 <4D52DD81.7050401@am.sony.com>
 <20110209184010.GB23747@opensource.wolfsonmicro.com>
 <4D52E441.2000805@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D52E441.2000805@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: frank.rowand@am.sony.com, Frank Rowand <frank.rowand@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Wed, Feb 09, 2011 at 11:00:17AM -0800, Frank Rowand wrote:

> and my understanding of this proposal was a goal to remove the ability
> to have CONFIG_PM disabled, which results in increased memory usage
> for some configurations.

Not really, the goal was to simplify the PM config options to ones that
are actually useful and cut down on the number of silly combinations
that the randconfigs turn up.  CONFIG_PM is there mostly for historical
reasons, it doesn't really mean much by itself except as a gate to other
options.

This comes from the fact that the options exposed and the use of them
doesn't really reflect the kernel power management infrastructure any
more.  The PM options at Kconfig level are really SUSPEND, HIBERNATION
and PM_RUNTIME but for historical reasons the idoms are all based on the
root PM option.  This gets fiddly and confusing as you move over build
coverage.
