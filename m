From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon, 7 Feb 2011 19:30:26 +0000
Message-ID: <20110207193026.GT10564@opensource.wolfsonmicro.com>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201102072014.04259.rjw@sisk.pl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201102072014.04259.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Mon, Feb 07, 2011 at 08:14:03PM +0100, Rafael J. Wysocki wrote:
> On Monday, February 07, 2011, Mark Brown wrote:

> >  config PM_DEBUG
> >  	bool "Power Management Debug Support"

> I think it would be better to simply rename CONFIG_PM_OPS into CONFIG_PM.

That still leaves the IA64 emulator to worry about but I'm not
fundamentally opposed to that, it achieves a similar effect.  The main
thing I'm looking for here is to cut down on the configuration options
we have to maintain.

> However, there's a number of things that I'm afraid wouldn't build correctly
> if none of CONFIG_PM_SLEEP and CONFIG_PM_RUNTIME were set in that case.

Actually CONFIG_PM_OPS probably also wants to be on independantly of
those two sometimes for .poweroff() which I'd expect to run even if we
can't suspend.
