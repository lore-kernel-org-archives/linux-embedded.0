From: Matt Mackall <mpm@selenic.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
	translation
Date: Tue, 03 Jun 2008 16:30:41 -0500
Message-ID: <1212528641.3953.70.camel@calx>
References: <48447615.5050806@am.sony.com>
	 <200806031618.06523.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806031618.06523.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: linux-tiny@selenic.com, linux-embedded <linux-embedded@vger.kernel.org>


On Tue, 2008-06-03 at 16:18 -0500, Rob Landley wrote:
> On Monday 02 June 2008 17:37:09 Tim Bird wrote:
> > With CONSOLE_TRANSLATIONS turned off, this saves about 6K
> > on my kernel configured for an ARM development board (OMAP
> > 5912 OSK).  In embedded products I'm familiar with,
> > console translations are not needed.
> >
> > This was taken from the Linux-tiny project and updated slightly
> > for 2.6.25.
> 
> Er, what _is_ the relationship between linux-tiny and linux-embedded lists 
> now?
> 
> I've been on linux-tiny for years, but it's been mostly dead since Matt moved 
> on (not one message in the whole of may, 4 the month before that), and this 
> seems the more logical place to discuss kernel patches that might actually 
> want to go upstream someday anyway.

Linux-embedded is the place to be, folks. It's intended to be the
catch-all list for embedded kernel work. When traffic there picks up a
bit more, I'll start bouncing linux-tiny mail.

-- 
Mathematics is the supreme nostalgia of our time.

