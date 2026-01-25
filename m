Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619601397;
	Sun, 25 Jan 2026 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769352119; cv=pass; b=c4uWgmu5xN1nXBJUEO4YhL9uUe5Wh3YmEqaSqB81/ZrGt/Tkbbw4AvRPeDmd0UAerWrzkA1rw231qYfZ5A9qAQ5CUXx4Wp9/MMZdyTPp+Q+ftFmMqHWdTVaYbwaWkKS6ys/OSFOK80cpSALr5vnak3TSXsMLDV3JigQIlujhx9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769352119; c=relaxed/simple;
	bh=mzPHjsv6yfeyI7qkX2AZ2jzzHonni2KBRpEtxVID0wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7j1cv4qwv1UxV7DIlXhE8hDkWyxBG9cDs2rLhqwJFCQ9NIx2jY/6NE35GTs4tMof4Yd0fCH70FM5amvyL0bmKGire5LbtvJ8CCZ492/xN9IzqJj3Jg6QdGib38rkM7q1TraNVkJ7T5Sd8IvxCysNW6LxgbXHVOesGaX9MwVv74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=LBl4nQ3X; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=pimfUOn2; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="LBl4nQ3X";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="pimfUOn2"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-bwn7.prod.antispam.mailspamprotection.com; s=arckey; t=1769352117;
	 b=QOXB0Mqq4YjMNG8uhYCD0OxK6wWvl2X20YIxdlWuXt32bOp7xQ4A9TntZ++6JykpeZiw6Fi4Fu
	  KGUvS/xni5XjS46FHta0uxFCLGL+DnSN4VcyK+1NJ5h6EXdp63qImCp7CJTJces0NMGAV3xgTm
	  pk9Z+ag1kNDr3sLa1TDeu+iDVM8vMizK7WV1iDrJao3dT4Pga2qmVzd2xKYz6q01Qup3vXblkE
	  kuwXrsmsbBYCuv3HKuHJ+9ELzzJdDeCoQZ35H/wjhINuetZ5exfRaJRjkiMBKiSTPrWShXz4UP
	  1CqdUUEEYz5IdGy2X3eNhcMhS/blS4vRedzCzl0FKl8v4Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-bwn7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-bwn7.prod.antispam.mailspamprotection.com; s=arckey; t=1769352117;
	bh=mzPHjsv6yfeyI7qkX2AZ2jzzHonni2KBRpEtxVID0wE=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=kHDSE3DhGjpqeISFOsmcY2KO0xvEhLfGVrTXzm0Adav050TY3HDLs4aq0JIWDX2ewzFNVs+C2l
	  n8uBmiudbDJjfNpRPuXgofvJxQsSy+E42vl5YERzwM4Sg1ZYEtdneuUWD7oaAk+ixaQcEddu2o
	  /LqwZaif5ZmE9JPxDJV54YRz1cKAIX69DRfpIoXZ6SUk731xPp5f5XG/n5le1DBJA6DE7xeVh0
	  TTziOj8MOsE/blsaHOr9BDqEOSHYEP8hQMlD45u/yhE3UpveF2WyI8fcfbh68beUM8RB86p0id
	  VPalvqvlx4PDrbjVYH4E0ligOh/V9BM//TmPhr+6SU90yw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=Iu1exejApuVf7+7/Knoxrfr5iU83j2oYWtuUwMVcDZ0=; b=LBl4nQ3XHkqMqnjk0FFaWA+scn
	1yKIUfskSUovaSO849S+nE92MbyarReVmkAZonAFFHij2OExWqGmu1POdXX4Wt6mzqqLPEOtG7nK7
	YN6QTC6vo/S4Xhskxq9DULe8bAxLpFsEXhuHEEGtg3gNsvCvB0YXeN6hNFv4t/RXlfnM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-bwn7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vk1JE-000000047lr-3rAA;
	Sun, 25 Jan 2026 14:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=Iu1exejApuVf7+7/Knoxrfr5iU83j2oYWtuUwMVcDZ0=; b=pimfUOn295Lsals4oVy142pv2j
	fW2icEgMi8i2W3VXVeAeQrvCkXXFFVXk6pi1cGbVmpH/ojIXaQh6GAy6GUkDMyYnj7yXee3sFKM2A
	xJwpcZNiSKZdlqz84JneUmbQEUQ8fztNDki7stZ3T06orIAZJmtUpPel9SCrmkoywgSQ=;
Received: from [79.52.39.254] (port=62062 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vk1J3-00000000FN4-0JuK;
	Sun, 25 Jan 2026 14:41:37 +0000
Date: Sun, 25 Jan 2026 15:41:35 +0100
From: Francesco Valla <francesco@valla.it>
To: Tim Bird <tim.bird@sony.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linuxtronix.de,
	senozhatsky@chromium.org, linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <aXYrn8QFCSZ5Q8CB@bywater>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260124194027.713991-1-tim.bird@sony.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124194027.713991-1-tim.bird@sony.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 216d15e25b9f52598815fe8e19377f9f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vk1JE-000000047lr-3rAA-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-bwn7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Tim,

I tested this both on X86_64 QEMU and on a i.MX93 (ARM64) and can
confirm it is working as expected. Auto-calc of calibration data is far
better than the configuration parameters in v1.

It is slightly confusing to see a time value printed to serial output
and another one inside kmsg, but that's a human thing and should not
confuse any tool.

Some notes follow.

On Sat, Jan 24, 2026 at 12:40:27PM -0700, Tim Bird wrote:
> During early boot, printk timestamps are reported as zero before
> kernel timekeeping starts (e.g. before time_init()).  This
> hinders boot-time optimization efforts.  This period is about 400
> milliseconds for many current desktop and embedded machines
> running Linux.
> 
> Add support to save cycles during early boot, and output correct
> timestamp values after timekeeping is initialized.  get_cycles()
> is operational on arm64 and x86_64 from kernel start.  Add code
> and variables to save calibration values used to later convert
> cycle counts to time values in the early printks.  Add a config
> to control the feature.
> 
> This yields non-zero timestamps for printks from the very start
> of kernel execution.  The timestamps are relative to the start of
> the architecture-specified counter used in get_cycles
> (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> 
> All timestamps reflect time from power-on instead of time from
> the kernel's timekeeping initialization.
> 
> Signed-off-by: Tim Bird <tim.bird@sony.com>
> ---
> V1 -> V2
>   Remove calibration CONFIG vars
>   Add 'depends on' to restrict arches (to handle ppc bug)
>   Add early_ts_offset to avoid discontinuity
>   Save cycles in ts_nsec, and convert on output
>   Move conditional code to include file (early_times.h)
> ---
>  include/linux/early_times.h | 48 +++++++++++++++++++++++++++++++++++++
>  init/Kconfig                | 12 ++++++++++
>  init/main.c                 | 26 ++++++++++++++++++++
>  kernel/printk/printk.c      | 16 +++++++++++--
>  4 files changed, 100 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/early_times.h
> 
> diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> new file mode 100644
> index 000000000000..9dc31eb442c2
> --- /dev/null
> +++ b/include/linux/early_times.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _KERNEL_PRINTK_EARLY_TIMES_H
> +#define _KERNEL_PRINTK_EARLY_TIMES_H
> +
> +#include <linux/timex.h>
> +
> +#if defined(CONFIG_EARLY_PRINTK_TIMES)
> +extern u32 early_mult, early_shift;
> +extern u64 early_ts_offset;
> +
> +static inline u64 early_cycles(void)
> +{
> +	return ((u64)get_cycles() | (1ULL << 63));
> +}
> +
> +static inline u64 adjust_early_ts(u64 ts)
> +{
> +	/* High bit means ts is a cycle count */
> +	if (unlikely(ts & (1ULL << 63)))
> +		/*
> +		 * mask high bit and convert to ns
> +		 * Note that early_mult may be 0, but that's OK because
> +		 * we'll just multiply by 0 and return 0. This will
> +		 * only occur if we're outputting a printk message
> +		 * before the calibration of the early timestamp.
> +		 * Any output after user space start (eg. from dmesg or
> +		 * journalctl) will show correct values.
> +		 */
> +		return (((ts & ~(1ULL << 63)) * early_mult) >> early_shift);
> +
> +	/* If timestamp is already in ns, just add offset */
> +	return ts + early_ts_offset;
> +}
> +#else
> +static inline u64 early_cycles(void)
> +{
> +	return 0;
> +}
> +
> +static inline u64 adjust_early_ts(u64 ts)
> +{
> +	return ts;
> +}
> +#endif /* CONFIG_EARLY_PRINTK_TIMES */
> +
> +#endif /* _KERNEL_PRINTK_EARLY_TIMES_H */
> +
> diff --git a/init/Kconfig b/init/Kconfig
> index fa79feb8fe57..060a22cddd17 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -777,6 +777,18 @@ config IKHEADERS
>  	  or similar programs.  If you build the headers as a module, a module called
>  	  kheaders.ko is built which can be loaded on-demand to get access to headers.
>  
> +config EARLY_PRINTK_TIMES
> +	bool "Show non-zero printk timestamps early in boot"
> +	default y

Considering that this might have a significant impact on monitoring
mechanisms already in place (that e.g. expect a specific dmesg print to
have a maximum associated time value), please consider a N default here.

> +	depends on PRINTK
> +	depends on ARM64 || X86_64
> +	help
> +	  Use a cycle-counter to provide printk timestamps during
> +	  early boot.  This allows seeing timestamps for printks that
> +	  would otherwise show as 0.  Note that this will shift the
> +	  printk timestamps to be relative to machine power on, instead
> +	  of relative to the start of kernel timekeeping.
> +

To be precise, the timestamps will be relative to processor power on;
the machine might have some other processors that run before the Linux
one (this is the case for example of i.MX9 or AM62 SoCs) and will be
unaccounted for even by this mechanism.

>  config LOG_BUF_SHIFT
>  	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
>  	range 12 25
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..cc1af26933f7 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -104,6 +104,9 @@
>  #include <linux/pidfs.h>
>  #include <linux/ptdump.h>
>  #include <linux/time_namespace.h>
> +#include <linux/timex.h>
> +#include <linux/sched/clock.h>
> +#include <linux/early_times.h>
>  #include <net/net_namespace.h>
>  
>  #include <asm/io.h>
> @@ -160,6 +163,10 @@ static size_t initargs_offs;
>  # define initargs_offs 0
>  #endif
>  
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +static u64 start_cycles, start_ns;
> +#endif
> +
>  static char *execute_command;
>  static char *ramdisk_execute_command = "/init";
>  
> @@ -1118,6 +1125,11 @@ void start_kernel(void)
>  	timekeeping_init();
>  	time_init();
>  
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +	start_cycles = get_cycles();
> +	start_ns = local_clock();
> +#endif
> +

I was wondering it it wouldn't make more sense to move this logic to its
own file, and have a plain call e.g. to early_times_init() here
(continue...)

>  	/* This must be after timekeeping is initialized */
>  	random_init();
>  
> @@ -1600,6 +1612,20 @@ static int __ref kernel_init(void *unused)
>  
>  	do_sysctl_args();
>  
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +	u64 end_cycles, end_ns;
> +
> +	/* set calibration data for early_printk_times */
> +	end_cycles = get_cycles();
> +	end_ns = local_clock();
> +	clocks_calc_mult_shift(&early_mult, &early_shift,
> +		((end_cycles - start_cycles) * NSEC_PER_SEC)/(end_ns - start_ns),
> +		NSEC_PER_SEC, 50);
> +	early_ts_offset = ((start_cycles * early_mult) >> early_shift) - start_ns;
> +	pr_debug("Early printk times: mult=%u, shift=%u, offset=%llu ns\n",
> +		early_mult, early_shift, early_ts_offset);
> +#endif
> +

(...continue) and to early_times_calc() or something like that here.

In this way, all related variables (i.e.: start_cycles, start_ns from
this file, but also early_mult, early_shift, and early_ts_offset from
kernel/printk/printk.c) can be confined to their own file and not add
noise here.

>  	if (ramdisk_execute_command) {
>  		ret = run_init_process(ramdisk_execute_command);
>  		if (!ret)
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 1d765ad242b8..f17877337735 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -46,6 +46,7 @@
>  #include <linux/ctype.h>
>  #include <linux/uio.h>
>  #include <linux/sched/clock.h>
> +#include <linux/early_times.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/panic.h>
> @@ -75,6 +76,11 @@ EXPORT_SYMBOL(ignore_console_lock_warning);
>  
>  EXPORT_TRACEPOINT_SYMBOL_GPL(console);
>  
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +u32 early_mult, early_shift;
> +u64 early_ts_offset;
> +#endif
> +
>  /*
>   * Low level drivers may need that to know if they can schedule in
>   * their unblank() callback or not. So let's export it.
> @@ -639,7 +645,7 @@ static void append_char(char **pp, char *e, char c)
>  static ssize_t info_print_ext_header(char *buf, size_t size,
>  				     struct printk_info *info)
>  {
> -	u64 ts_usec = info->ts_nsec;
> +	u64 ts_usec = adjust_early_ts(info->ts_nsec);
>  	char caller[20];
>  #ifdef CONFIG_PRINTK_CALLER
>  	u32 id = info->caller_id;
> @@ -1352,7 +1358,11 @@ static size_t print_syslog(unsigned int level, char *buf)
>  
>  static size_t print_time(u64 ts, char *buf)
>  {
> -	unsigned long rem_nsec = do_div(ts, 1000000000);
> +	unsigned long rem_nsec;
> +
> +	ts = adjust_early_ts(ts);
> +
> +	rem_nsec = do_div(ts, 1000000000);
>  
>  	return sprintf(buf, "[%5lu.%06lu]",
>  		       (unsigned long)ts, rem_nsec / 1000);
> @@ -2242,6 +2252,8 @@ int vprintk_store(int facility, int level,
>  	 * timestamp with respect to the caller.
>  	 */
>  	ts_nsec = local_clock();
> +	if (!ts_nsec)
> +		ts_nsec = early_cycles();
>  
>  	caller_id = printk_caller_id();
>  
> -- 
> 2.43.0
>

Regards,
Francesco

