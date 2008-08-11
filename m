From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Mon, 11 Aug 2008 21:10:12 +0200
Message-ID: <20080811191012.GA16553@elte.hu>
References: <489A1844.3090502@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <489A1844.3090502@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>


* Tim Bird <tim.bird@am.sony.com> wrote:

> Add support for a built-in command line for x86 architectures. The 
> Kconfig help gives the major rationale for this addition.

i have actually used a local hack quite similar to this to inject boot 
options into bzImages via randconfig - so i would find this feature 
rather useful.

a small observation:

> +	/* append boot loader cmdline to builtin, unless builtin overrides it */
> +	if (builtin_cmdline[0] != '!') {
> +		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
> +		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> +	} else {
> +		strlcpy(boot_command_line, &builtin_cmdline[1],
> +			COMMAND_LINE_SIZE);
> +	}

the default branch changes existing command lines slightly: it appends a 
space to them. This could break scripts that rely on the precise 
contents of /proc/cmdline output. (i have some - they are arguably 
dodgy)

Best would be to make it really apparent in the code that nothing 
changes if this config option is not set. Preferably there should be no 
extra code at all in that case.

	Ingo
