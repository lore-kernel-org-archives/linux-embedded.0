From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Mon, 11 Aug 2008 12:23:35 -0700
Message-ID: <48A091B7.6050601@zytor.com>
References: <489A1844.3090502@am.sony.com> <20080811191012.GA16553@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756676AbYHKTYZ@vger.kernel.org>
In-Reply-To: <20080811191012.GA16553@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ingo Molnar <mingo@elte.hu>
Cc: Tim Bird <tim.bird@am.sony.com>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>

Ingo Molnar wrote:
> * Tim Bird <tim.bird@am.sony.com> wrote:
> 
>> Add support for a built-in command line for x86 architectures. The 
>> Kconfig help gives the major rationale for this addition.
> 
> i have actually used a local hack quite similar to this to inject boot 
> options into bzImages via randconfig - so i would find this feature 
> rather useful.
> 
> a small observation:
> 
>> +	/* append boot loader cmdline to builtin, unless builtin overrides it */
>> +	if (builtin_cmdline[0] != '!') {
>> +		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
>> +		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
>> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>> +	} else {
>> +		strlcpy(boot_command_line, &builtin_cmdline[1],
>> +			COMMAND_LINE_SIZE);
>> +	}
> 
> the default branch changes existing command lines slightly: it appends a 
> space to them. This could break scripts that rely on the precise 
> contents of /proc/cmdline output. (i have some - they are arguably 
> dodgy)
> 
> Best would be to make it really apparent in the code that nothing 
> changes if this config option is not set. Preferably there should be no 
> extra code at all in that case.
> 

I would like to see this:

#ifdef CONFIG_BUILTIN_CMDLINE
# ifdef CONFIG_BUILTIN_CMDLINE_OVERRIDE
	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
# else
	if (boot_command_line) {
		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
	}
# endif
#endif

	-hpa

		
