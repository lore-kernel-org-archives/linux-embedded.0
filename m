From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
 translation
Date: Mon, 02 Jun 2008 18:34:38 -0700
Message-ID: <48449FAE.70404@zytor.com>
References: <48447615.5050806@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755779AbYFCBfA@vger.kernel.org>
In-Reply-To: <48447615.5050806@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Tim Bird wrote:
> With CONSOLE_TRANSLATIONS turned off, this saves about 6K
> on my kernel configured for an ARM development board (OMAP
> 5912 OSK).  In embedded products I'm familiar with,
> console translations are not needed.

On most embedded products I'm familiar with, you wouldn't have virtual 
consoles at all...?

	-hpa
