From: Joe Perches <joe@perches.com>
Subject: [RFC] move __devinit or __init printk constant format strings to
 __devinitconst or __initdata?
Date: Tue, 21 Jul 2009 14:20:53 -0700
Message-ID: <1248211253.31365.337.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756011AbZGUVU5@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, Matt Mackall <mpm@selenic.com>, Tim Bird <tim.bird@am.sony.com>

Is moving constant string formats to __devinitconst or __initdata
useful for embedded environments?

As in:

#define printk_section(section, fmt, ...)				\
({ static const section char __fmt[] = fmt; printk(__fmt, ##__VA_ARGS__); })

#define pr_err_section(section, fmt, ...) \
	printk_section(section, KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)

with a use of:

static int __devinit foo_probe(struct platform_device *pdev)
{
	if (bar())
		pr_err_section(__devinitconst,
			       "A long error message\n");
}

or

static int __init foo_init(struct platform_device *pdev)
{
	if (bar())
		pr_err_section(__initdata,
			       "A long error message\n");
}

