From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86 (v2)
Date: Fri, 15 Aug 2008 16:12:07 +0200
Message-ID: <20080815141207.GF14103@elte.hu>
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

> +	  To compile command line arguments into the kernel,
> +         set this option to 'Y', then fill in the

FYI, this tab-to-space whitespace error caused this build failure in 
-tip testing:

arch/x86/Kconfig:1500: unknown option "set"
arch/x86/Kconfig:1501: unknown option "the"
arch/x86/Kconfig:1503: unknown option "Systems"
arch/x86/Kconfig:1504: unknown option "should"
arch/x86/Kconfig:1519: unknown option "In"
arch/x86/Kconfig:1520: unknown option "by"
arch/x86/Kconfig:1521: unknown option "file"

i fixed it up. This line was broken too:

> +         In most cases, the command line (whether built-in or provided

	Ingo
