From: Matt Mackall <mpm@selenic.com>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Wed, 06 Aug 2008 17:48:51 -0500
Message-ID: <1218062931.7576.12.camel@calx>
References: <489A1844.3090502@am.sony.com> <1218060873.7576.2.camel@calx>
	 <489A2627.40908@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <489A2627.40908@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>


On Wed, 2008-08-06 at 15:31 -0700, Tim Bird wrote:
> Matt Mackall wrote:
> > On Wed, 2008-08-06 at 14:31 -0700, Tim Bird wrote:
> >> The default behavior is to append the boot loader string
> >> to this one.  However, there is a mechanism (leading '!')
> >> to force the built-in string to override the boot loader
> >> string.
> > 
> > Nice solution.
> > 
> > Where is this relative to early boot option checking?
> 
> parse_early_param() is right AFTER this in the x86 setup_arch()
> function (in arch/x86/kernel/setup.c).  All the other command-line
> handling I could find is after this in init/main.c:start_kernel().

Ok, there are a couple weird outliers outside of that still, but that
should make most people satisfied.

-- 
Mathematics is the supreme nostalgia of our time.
