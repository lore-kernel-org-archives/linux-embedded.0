From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Thu, 7 Aug 2008 00:04:45 +0200
Message-ID: <20080806220445.GB10168@pengutronix.de>
References: <489A1844.3090502@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754288AbYHFWFE@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <489A1844.3090502@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>

On Wed, Aug 06, 2008 at 02:31:48PM -0700, Tim Bird wrote:
> Add support for a built-in command line for x86 architectures.
> The Kconfig help gives the major rationale for this addition.

If this feature is desired on all architectures, shouldn't it go out of
arch/?

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
