From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Wed, 9 Feb 2011 01:48:22 +0900
Message-ID: <20110208164822.GA7426@linux-sh.org>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com> <201102072300.03986.rjw@sisk.pl> <20110207222350.GA24804@core.coreip.homeip.net> <201102080005.40448.rjw@sisk.pl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201102080005.40448.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Tue, Feb 08, 2011 at 12:05:40AM +0100, Rafael J. Wysocki wrote:
> On Monday, February 07, 2011, Dmitry Torokhov wrote:
> > More of an observation for your (b) justification. I'd probably force
> > CONFIG_PM to always 'y'w while we weeding references to it from
> > drivers...
> 
> We simply can't force CONFIG_PM to 'y', because some platforms want it to be 'n'.
> 
> OTOH, if CONFIG_PM = CONFIG_PM_SLEEP||CONFIG_PM_RUNTIME, we can just leave the
> #ifdefs as they are and simply avoid adding new ones, or use CONFIG_PM for all
> PM callbacks.
> 
For sh at least turning on CONFIG_PM without PM_SLEEP or PM_RUNTIME is
largely pointless, so the bulk of the defconfigs have it turned off. The
few platforms that do use CONFIG_PM for something also have more
comprehensive support implemented. The few times we do have it enabled
without one of the others supported is simply for build coverage, mostly
due to sharing drivers (whatever isn't already triggered through
rand/allyes/modconfigs).

I would expect that this is a common scenario for the bulk of the
defconfigs that reflect PM being a platform-specific vs architecture-wide
property regardless of architecture, however.
