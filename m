From: Matt Mackall <mpm@selenic.com>
Subject: Re: [PATCH 0/7] printk: add pr_<level>_once, guard print_hex_dump
Date: Mon, 06 Dec 2010 09:37:49 -0600
Message-ID: <1291649869.3065.2095.camel@calx>
References: <cover.1291611190.git.joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1291611190.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2010-12-05 at 21:44 -0800, Joe Perches wrote:
> There are many uses of printk_once(KERN_<level>.
> Add pr_<level>_once macros to avoid printk_once(KERN_<level> pr_fmt(fmt).
> Add an #ifdef CONFIG_PRINTK for print_hex_dump and static inline void
> functions for the #else cases to reduce embedded code size.
> Neaten and organize the rest of the code.

Looks fine to me. I'd missed the introduction of the pr_<level> macros
and I'm not sure if I like the idea, but this is a tidy and
well-presented cleanup and extension.

Acked-by: Matt Mackall <mpm@selenic.com>

-- 
Mathematics is the supreme nostalgia of our time.

