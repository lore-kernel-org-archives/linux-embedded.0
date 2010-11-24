From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH 08/16 v4] pramfs: headers
Date: Wed, 24 Nov 2010 17:06:58 +0900
Message-ID: <20101124080658.GC2212@linux-sh.org>
References: <4CE79C2F.5090001@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CE79C2F.5090001@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>

On Sat, Nov 20, 2010 at 11:00:15AM +0100, Marco Stornelli wrote:
> +/*
> + * Debug code
> + */
> +#define pram_dbg(s, args...)	pr_debug("PRAMFS: "s, ## args)
> +#define pram_err(s, args...)	pr_err("PRAMFS: "s, ## args)
> +#define pram_warn(s, args...)	pr_warning("PRAMFS: "s, ## args)
> +#define pram_info(s, args...)	pr_info("PRAMFS: "s, ## args)
> +
Please kill off all of this and just use KBUILD_MODNAME centrally.

> +#ifdef CONFIG_PRAMFS_WRITE_PROTECT
> +extern void pram_writeable(void *vaddr, unsigned long size, int rw);
> +
> +#define wrprotect(addr, size) pram_writeable(addr, size, 0)
> +
> +#else
> +
> +#define wrprotect(addr, size) do {} while (0)
> +
> +#endif /* CONFIG PRAMFS_WRITE_PROTECT */
> +
Perhaps this should be pram_wrprotect()? Does this really benefit from
being a config option instead of a mount option? Will this handle
multiple mounts with some write protected and others not?

> +#ifdef CONFIG_PRAMFS_WRITE_PROTECT
> +static inline void pram_memunlock_range(void *p, unsigned long len)
> +{
> +#ifndef CONFIG_X86
> +	local_irq_disable();
> +#endif
> +	preempt_disable();
> +	pram_writeable(p, len, 1);
> +}
> +
This needs some explaining, or killing. While the latter is preferable,
we can also work with the former.
