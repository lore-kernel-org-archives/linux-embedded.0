From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Mon, 11 Aug 2008 15:40:35 -0700
Message-ID: <48A0BFE3.2060403@am.sony.com>
References: <489A1844.3090502@am.sony.com> <20080811191012.GA16553@elte.hu> <48A091B7.6050601@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48A091B7.6050601@zytor.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>

H. Peter Anvin wrote:
> Ingo Molnar wrote:
>> * Tim Bird <tim.bird@am.sony.com> wrote:
>>
>>> Add support for a built-in command line for x86 architectures. The
>>> Kconfig help gives the major rationale for this addition.
>>
>> i have actually used a local hack quite similar to this to inject boot
>> options into bzImages via randconfig - so i would find this feature
>> rather useful.
>>
>> a small observation:
>>
>>> +    /* append boot loader cmdline to builtin, unless builtin
>>> overrides it */
>>> +    if (builtin_cmdline[0] != '!') {
>>> +        strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
>>> +        strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
>>> +        strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>>> +    } else {
>>> +        strlcpy(boot_command_line, &builtin_cmdline[1],
>>> +            COMMAND_LINE_SIZE);
>>> +    }
>>
>> the default branch changes existing command lines slightly: it appends
>> a space to them. This could break scripts that rely on the precise
>> contents of /proc/cmdline output. (i have some - they are arguably dodgy)

Yeah, I wasn't too comfortable with that.

>> Best would be to make it really apparent in the code that nothing
>> changes if this config option is not set. Preferably there should be
>> no extra code at all in that case.

Agreed.

> 
> I would like to see this:
> 
> #ifdef CONFIG_BUILTIN_CMDLINE
> # ifdef CONFIG_BUILTIN_CMDLINE_OVERRIDE
>     strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> # else
>     if (boot_command_line) {
>         strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
>         strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
>     }
> # endif
> #endif

You missed copying builtin_cmdline back to boot_command_line, but
in general this looks OK to me.  If nobody objects to the ifdef
multiplicity, I'll work up a version tomorrow for review.  (Sorry,
I'm a bit swamped today.)
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
