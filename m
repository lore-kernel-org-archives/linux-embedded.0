From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] Remove CONFIG_PM altogether, enable power management
 all the time
Date: Wed, 9 Feb 2011 15:09:42 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1102091507550.2050-100000@iolanthe.rowland.org>
References: <20110209195918.GD23747@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110209195918.GD23747@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Tim Bird <tim.bird@am.sony.com>, "Rowand, Frank" <Frank_Rowand@sonyusa.com>, Frank Rowand <frank.rowand@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Len Brown <len.brown@intel.com>, "linux-pm@lists.linux-foundation.org" <linux-pm@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On Wed, 9 Feb 2011, Mark Brown wrote:

> On Wed, Feb 09, 2011 at 11:53:52AM -0800, Tim Bird wrote:

> > I'm confused.  Do you plan to retain the option to
> > turn off PM features completely, or not?  I thought that's
> > what CONFIG_PM did today.
> 
> Raphael's patches do that in a much better way than my original patch,
> my original patch would have force CONFIG_PM on but still allowed all
> the PM features that it controls to be turned on and off individually.

Or to put it another way, if you enable any of CONFIG_PM_SUSPEND, 
CONFIG_PM_HIBERNATION, or CONFIG_PM_RUNTIME, then CONFIG_PM will 
automatically be turned on.  Otherwise it will automatically be turned 
off.

Alan Stern
