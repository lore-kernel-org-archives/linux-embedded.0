From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86 (v2)
Date: Fri, 15 Aug 2008 16:03:00 +0200
Message-ID: <20080815140300.GC14103@elte.hu>
References: <489A1844.3090502@am.sony.com> <20080811191012.GA16553@elte.hu> <48A091B7.6050601@zytor.com> <48A1EA04.7090102@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48A1EA04.7090102@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>


* Tim Bird <tim.bird@am.sony.com> wrote:

> Allow x86 to support a built-in kernel command line.  The built-in 
> command line can override the one provided by the boot loader, for 
> those cases where the boot loader is broken or it is difficult to 
> change the command line in the the boot loader.
> 
> Signed-off-by: Tim Bird <tim.bird@am.sony.com>

applied to tip/x86/commandline for v2.6.28 merging - thanks Tim!

	Ingo
