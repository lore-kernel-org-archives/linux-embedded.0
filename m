From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] Remove CONFIG_PM altogether, enable power management
 all the time
Date: Wed, 9 Feb 2011 11:41:38 +0000
Message-ID: <20110209114137.GA10163@opensource.wolfsonmicro.com>
References: <4D51D341.3040209@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D51D341.3040209@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frank.rowand@am.sony.com>
Cc: Ingo Molnar <mingo@elte.hu>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linus Torvalds <torvalds@linux-foundation.org>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Tue, Feb 08, 2011 at 03:35:29PM -0800, Frank Rowand wrote:

> For 2.6.38-rc4, x86_64, CONFIG_NR_CPUS=4:

> size vmlinux
>    text     data       bss       dec      hex  filename
> 
> 6553910  3555020   9994240  20103170  132c002  vmlinux    with    CONFIG_PM
> 6512652  3553116   9994240  20060008  1321768  vmlinux    without CONFIG_PM
> 
>   41258     1904         0     43162                      delta

> That is big enough for me to care.

Hrm, that's pretty surprising.  It'd be interesting to know how much of
that is due to the PM core itself and how much of that is from drivers.
For the drivers CONFIG_PM isn't really the option they should be using
in the first place - they mostly want some combination of PM_SLEEP and
PM_RUNTIME for the specific functionality.  I'm running some checks now.

>  > CONFIG_PM_SLEEP=y

Raphael's patch will make this a user visible option in place of raw
CONFIG_PM by default so you'd be able to turn that off.
