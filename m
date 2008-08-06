From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Wed, 6 Aug 2008 15:22:17 -0700
Message-ID: <489A2419.2030900@am.sony.com>
References: <489A1844.3090502@am.sony.com> <20080806220445.GB10168@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080806220445.GB10168@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>

Robert Schwebel wrote:
> On Wed, Aug 06, 2008 at 02:31:48PM -0700, Tim Bird wrote:
>> Add support for a built-in command line for x86 architectures.
>> The Kconfig help gives the major rationale for this addition.
> 
> If this feature is desired on all architectures, shouldn't it go out of
> arch/?

Different arches handle their command lines differently, but
with some elbow grease (and some buy-in from the different
arch maintainers), we could try unifying the approach here.

One difficulty is that the other arches' command lines
are not currently "broken", so there's no real incentive
to change them.

The only thing novel thing I'm adding here is the addition of
the leading '!' to allow for an override.  This is needed
in some x86 cases I'm familiar with, but I've haven't seen
any cases where it would be useful for other arches.
(not to say they don't exist - I just haven't seen them.)
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
