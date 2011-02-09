From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] Remove CONFIG_PM altogether, enable power management
 all the time
Date: Wed, 9 Feb 2011 11:53:52 -0800
Message-ID: <4D52F0D0.9020609@am.sony.com>
References: <4D51D341.3040209@am.sony.com> <20110209114137.GA10163@opensource.wolfsonmicro.com> <201102091807.03094.rjw@sisk.pl> <4D52DD81.7050401@am.sony.com> <20110209184010.GB23747@opensource.wolfsonmicro.com> <4D52E441.2000805@am.sony.com> <20110209192506.GC23747@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110209192506.GC23747@opensource.wolfsonmicro.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "Rowand, Frank" <Frank_Rowand@sonyusa.com>, Frank Rowand <frank.rowand@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, "linux-pm@lists.linux-foundation.org" <linux-pm@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On 02/09/2011 11:25 AM, Mark Brown wrote:
> On Wed, Feb 09, 2011 at 11:00:17AM -0800, Frank Rowand wrote:
> 
>> and my understanding of this proposal was a goal to remove the ability
>> to have CONFIG_PM disabled, which results in increased memory usage
>> for some configurations.
> 
> Not really, the goal was to simplify the PM config options to ones that
> are actually useful and cut down on the number of silly combinations
> that the randconfigs turn up.  CONFIG_PM is there mostly for historical
> reasons, it doesn't really mean much by itself except as a gate to other
> options.

I'm confused.  Do you plan to retain the option to
turn off PM features completely, or not?  I thought that's
what CONFIG_PM did today.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Network Entertainment
=============================
