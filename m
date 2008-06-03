From: Matt Mackall <mpm@selenic.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
	translation
Date: Tue, 03 Jun 2008 10:46:04 -0500
Message-ID: <1212507964.3953.67.camel@calx>
References: <48447615.5050806@am.sony.com>  <48449FAE.70404@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48449FAE.70404@zytor.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>


On Mon, 2008-06-02 at 18:34 -0700, H. Peter Anvin wrote:
> Tim Bird wrote:
> > With CONSOLE_TRANSLATIONS turned off, this saves about 6K
> > on my kernel configured for an ARM development board (OMAP
> > 5912 OSK).  In embedded products I'm familiar with,
> > console translations are not needed.
> 
> On most embedded products I'm familiar with, you wouldn't have virtual 
> consoles at all...?

Actually, lots have frame buffers these days.

-- 
Mathematics is the supreme nostalgia of our time.

