From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Wed, 06 Aug 2008 15:48:04 -0700
Message-ID: <489A2A24.6010400@zytor.com>
References: <489A1844.3090502@am.sony.com> <20080806220445.GB10168@pengutronix.de> <489A2419.2030900@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <489A2419.2030900@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>

Tim Bird wrote:
> 
> One difficulty is that the other arches' command lines
> are not currently "broken", so there's no real incentive
> to change them.
> 
> The only thing novel thing I'm adding here is the addition of
> the leading '!' to allow for an override.  This is needed
> in some x86 cases I'm familiar with, but I've haven't seen
> any cases where it would be useful for other arches.
> (not to say they don't exist - I just haven't seen them.)
> 

Note that it could just as easily be done with a CONFIG_CMDLINE_OVERRIDE 
option, since the initial reason for a magic character was to be able to 
provide both prefix and suffix splicing.

CONFIG_CMDLINE_OVERRIDE is probably more palatable to other architectures.

	-hpa
