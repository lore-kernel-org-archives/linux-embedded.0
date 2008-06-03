From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Tue, 3 Jun 2008 08:00:16 +0100
Message-ID: <20080603070016.GA23429@shareable.org>
References: <48447615.5050806@am.sony.com> <48449FAE.70404@zytor.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756037AbYFCHAk@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48449FAE.70404@zytor.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

H. Peter Anvin wrote:
> Tim Bird wrote:
> >With CONSOLE_TRANSLATIONS turned off, this saves about 6K
> >on my kernel configured for an ARM development board (OMAP
> >5912 OSK).  In embedded products I'm familiar with,
> >console translations are not needed.
> 
> On most embedded products I'm familiar with, you wouldn't have virtual 
> consoles at all...?

On anything with a framebuffer, VCs are quite handy for debugging.
Saving 6k won't save the world on those devices, but each little bit
helps - especially due to no-MMU fragmentation.

-- Jamie
