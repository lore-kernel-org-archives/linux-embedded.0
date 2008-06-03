From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] console - Add configurable support for console charset
	translation
Date: Tue, 03 Jun 2008 09:36:22 +0100
Message-ID: <1212482182.16924.257.camel@pmac.infradead.org>
References: <48447615.5050806@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48447615.5050806@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Mon, 2008-06-02 at 15:37 -0700, Tim Bird wrote:
> With CONSOLE_TRANSLATIONS turned off, this saves about 6K
> on my kernel configured for an ARM development board (OMAP
> 5912 OSK).  In embedded products I'm familiar with,
> console translations are not needed.

I'd have been more inclined to put the #ifdef and the empty functions
into <linux/vt_kern.h>. Then you don't need to provide real stub
functions -- they can be inlined at the caller.

-- 
dwmw2

