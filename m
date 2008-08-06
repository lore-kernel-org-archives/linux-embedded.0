From: Matt Mackall <mpm@selenic.com>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Wed, 06 Aug 2008 17:52:13 -0500
Message-ID: <1218063133.7576.16.camel@calx>
References: <489A1844.3090502@am.sony.com>
	 <20080806220445.GB10168@pengutronix.de> <489A2419.2030900@am.sony.com>
	 <489A2A24.6010400@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <489A2A24.6010400@zytor.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Tim Bird <tim.bird@am.sony.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>


On Wed, 2008-08-06 at 15:48 -0700, H. Peter Anvin wrote:
> Tim Bird wrote:
> > 
> > One difficulty is that the other arches' command lines
> > are not currently "broken", so there's no real incentive
> > to change them.
> > 
> > The only thing novel thing I'm adding here is the addition of
> > the leading '!' to allow for an override.  This is needed
> > in some x86 cases I'm familiar with, but I've haven't seen
> > any cases where it would be useful for other arches.
> > (not to say they don't exist - I just haven't seen them.)
> > 
> 
> Note that it could just as easily be done with a CONFIG_CMDLINE_OVERRIDE 
> option, since the initial reason for a magic character was to be able to 
> provide both prefix and suffix splicing.

You're right, I had forgotten about the suffix splicing and my brain is
a bit foggy on what motivated it.

> CONFIG_CMDLINE_OVERRIDE is probably more palatable to other architectures.

Yes, though I doubt we're in danger of introducing any real backwards
compatibility issues with the magic '!' at the beginning.

-- 
Mathematics is the supreme nostalgia of our time.
