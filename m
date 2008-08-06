From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] bootup: Add built-in kernel command line for x86
Date: Wed, 6 Aug 2008 15:31:03 -0700
Message-ID: <489A2627.40908@am.sony.com>
References: <489A1844.3090502@am.sony.com> <1218060873.7576.2.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1218060873.7576.2.camel@calx>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>

Matt Mackall wrote:
> On Wed, 2008-08-06 at 14:31 -0700, Tim Bird wrote:
>> The default behavior is to append the boot loader string
>> to this one.  However, there is a mechanism (leading '!')
>> to force the built-in string to override the boot loader
>> string.
> 
> Nice solution.
> 
> Where is this relative to early boot option checking?

parse_early_param() is right AFTER this in the x86 setup_arch()
function (in arch/x86/kernel/setup.c).  All the other command-line
handling I could find is after this in init/main.c:start_kernel().

There is some stuff earlier in the setup_arch() routine about
boot_params, but that looks like it's related to the old(?)
binary data points you can jam into the kernel image.  (That is,
it doesn't look like it's related to the command line handling).
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
