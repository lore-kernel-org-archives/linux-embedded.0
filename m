From: Joe Perches <joe@perches.com>
Subject: Re: [RFC] move __devinit or __init printk constant format strings
 to __devinitconst or __initdata?
Date: Tue, 21 Jul 2009 14:56:43 -0700
Message-ID: <1248213403.31365.343.camel@Joe-Laptop.home>
References: <1248211253.31365.337.camel@Joe-Laptop.home>
	 <1248212925.10466.143.camel@calx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756283AbZGUV5J@vger.kernel.org>
In-Reply-To: <1248212925.10466.143.camel@calx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>

On Tue, 2009-07-21 at 16:48 -0500, Matt Mackall wrote:
> On Tue, 2009-07-21 at 14:20 -0700, Joe Perches wrote:
> > Is moving constant string formats to __devinitconst or __initdata
> > useful for embedded environments?
> > As in:
> > #define printk_section(section, fmt, ...)				\
> > ({ static const section char __fmt[] = fmt; printk(__fmt, ##__VA_ARGS__); })
> > #define pr_err_section(section, fmt, ...) \
> > 	printk_section(section, KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
> > with a use of:
> > static int __devinit foo_probe(struct platform_device *pdev)
> > {
> > 	if (bar())
> > 		pr_err_section(__devinitconst,
> > 			       "A long error message\n");
> > }

> Interesting notion, but not worth the trouble in my mind. I think it's
> more worthwhile to look into automatic such stuff in the build somehow.

I think it's not possible today to get gcc to mark
the format strings without source modification.

It's pretty easy to script a source conversion.
