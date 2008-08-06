From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Wed, 06 Aug 2008 16:03:41 -0700
Message-ID: <489A2DCD.8020804@zytor.com>
References: <489A1844.3090502@am.sony.com> <20080806220445.GB10168@pengutronix.de> <489A2419.2030900@am.sony.com> <489A2A24.6010400@zytor.com> <489A2D0F.2070102@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <489A2D0F.2070102@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>

Tim Bird wrote:
> 
>> CONFIG_CMDLINE_OVERRIDE is probably more palatable to other architectures.
> 
> I'd be OK implementing it with an option, rather than a magic char.
> I was trying to avoid adding too many options, since many kernel
> developers prefer fewer options where possible.  But the magic
> char makes the code less straightforward.
> 
> If we ever move towards supporting both prefix and suffice splicing (or
> even complicated in-the-middle splicing), then the magic char is
> easier to develop into that.  But so far, I can only come up with
> reasonable cases for append and override, and I don't want to add
> superfluous handling for non-existent use cases.

I think I agree, and the override option would make it easier to make 
generic.

	-hpa
