From: Matt Mackall <mpm@selenic.com>
Subject: Re: [RFC] move __devinit or __init printk constant format strings
 to __devinitconst or __initdata?
Date: Tue, 21 Jul 2009 16:48:45 -0500
Message-ID: <1248212925.10466.143.camel@calx>
References: <1248211253.31365.337.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1248211253.31365.337.camel@Joe-Laptop.home>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Perches <joe@perches.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>

On Tue, 2009-07-21 at 14:20 -0700, Joe Perches wrote:
> Is moving constant string formats to __devinitconst or __initdata
> useful for embedded environments?
> 
> As in:
> 
> #define printk_section(section, fmt, ...)				\
> ({ static const section char __fmt[] = fmt; printk(__fmt, ##__VA_ARGS__); })
> 
> #define pr_err_section(section, fmt, ...) \
> 	printk_section(section, KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
> 
> with a use of:
> 
> static int __devinit foo_probe(struct platform_device *pdev)
> {
> 	if (bar())
> 		pr_err_section(__devinitconst,
> 			       "A long error message\n");
> }
> 
> or
> 
> static int __init foo_init(struct platform_device *pdev)
> {
> 	if (bar())
> 		pr_err_section(__initdata,
> 			       "A long error message\n");
> }

Interesting notion, but not worth the trouble in my mind. I think it's
more worthwhile to look into automatic such stuff in the build somehow.

-- 
http://selenic.com : development and support for Mercurial and Linux

