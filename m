Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ADD361640
	for <linux-embedded@vger.kernel.org>; Mon,  9 Mar 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773084365; cv=none; b=I+9iBMtL7GuWi0o47WAn5C1Yp42kvuviw6OVFQtExmgrSL5k94Ec7pJmVukqFMizOvLcTXrcPybSAGSygPaoYFVNlWCb94lIUiFLpiWCalOuAg5Hxmi11qcpsQ/XgOJNEjd32tvfT+c7ca9y9QhOcfS2NVNOG5VL12DwQqbPXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773084365; c=relaxed/simple;
	bh=UNzRrkkwVQPEphZ6f5bXWY8BG88u+/slT51WCHl54zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ra8oGccf3j1rj9IgVcSQcGQdIktSvcZ8cxswyhIQPZKeyh5hAdfw5T5qaKPixsnVmFRNALsEbCZayX/nuQ5zVKCDZfgRelWNc5yO9t5UQl6jp8L4lzhwkm8JrdsCAxA4fJ+bvWsTgkruAyxn3zeovX6fyiSe/8N/Ndo4NYZprwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtOKOnGY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtOKOnGY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3598b2318c2so5102776a91.3
        for <linux-embedded@vger.kernel.org>; Mon, 09 Mar 2026 12:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773084362; x=1773689162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=64gAtDLGb7GgjhFMUeWLXfjqU45tD37BVPYzQhnt7uY=;
        b=VtOKOnGYJF6RFJTLKo0/VQfKaXtBIiNoLKZwGXhINBngDgJbDlW6vN0eS4zC9fHwKQ
         uMUq5S8CESz6VfCuqh5iwIfb8WyHJQrlfUyJaNASskiT8rVVz0GwgXD1uvJAu/6rcebD
         gAGESSezyf9lmYgbz4LPN92Kopekfsc6ZslXgmHdtBNeoSUaqHAZAjIjMYD9ikHy27/k
         HhEPN2yfh5Kx9y4MjCE0XTGUJBi7MypkycJEj0IwuNsVbqijVG4YwyVSgmz8kuNalUXo
         ZOM2rXN8WqDcSsvByJDhaI9OvNeOpM8nXsiXV9GiFIM64nlzXi44i2QgbwNHDxzi6clQ
         oMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773084362; x=1773689162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64gAtDLGb7GgjhFMUeWLXfjqU45tD37BVPYzQhnt7uY=;
        b=q4cJZgLWaQUEBAbTrtt+kwrEZ6baCCNwlGFNpozezQT/is8rJr27IZzZ2mGdMcl/Ju
         EYxIKwRmvCgC7QvISq8WWGRj4yZukNrWCytDns2PSamFne6ZmcBSN4vW32w89G0spjsI
         hzs6COYNQxwAC/9QRbaTLkMZeqe9+dXPQOq9BB4lKlQ4gV8kC/hVggcnj6x3yh8wIGH7
         YX6q0BJX/pIVj1hpE9HQkmcP1rWf7tbj82bTpv1QAmY0ydyCSxjcj7YCFM6q/Khkc2aE
         +pCHSIcRJss53gjAUpLa9IBH4kXtCimSVePTJjGnBaBMhjdZ0hiO6MfV0saKgt8JEA6A
         dS3A==
X-Forwarded-Encrypted: i=1; AJvYcCWLHIGV9yOIoMcHD1NTZxgFL9tluKIH7Fm0xHTVQTL8CmzEaDoWOwluJ593umUtN3MsxE/v/h4Ri8GsXeopLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7e5HbmaU/DRyVdoRDa7VrTKy+Tt0nMYSBgWYYlgsJtY63yO+d
	VXwCZ5DU5BWqVnOH7Yb8NzQ+VCSBqAVg8E0Oj0scP1gpTs5zJH/VIlo8
X-Gm-Gg: ATEYQzw1m+gtglfa78k86uihfT0pBpUnYOAPy+g9kZRTMSAJ9g56ifgn3uyj8YzSozV
	PtdLfikNQAdXN2LU4db3132g3or/wm2v3aeXA9dqGsdvlP8cGvJETXa8r3ou3AmxssbIcv0V+mT
	9ehUEjFhqOtJhIbm9UzeZPzS3ouweDVkVi5P1XzvEtdyffBgR71Y0gJu7kaZE9c5V6Hzh5QFNFx
	5LhgOQLet74JdSUj9jV6hSEEbQW3tSsI7f/e5Ta5upPAsboq25f9fJEnA5qY2LQAI0hwV2qLilS
	kQ5xrR9Miu69wpWGtx5suV1f92L67UnAiX2wiENgV93qKqkJo8CwgUBRys6/TKHRLrShWUo44Zp
	GusSrEj2Bj0YlFvlcezNv8kdUjUYs5DUrtyQlDviqaY1oaRLn8tgMHah+PqrnZwF55es13gMcWm
	khnBvspiDu09WhR8rWMefY1x7OHQwWLbctrYjjAojza/mgDnVXNXr2BjfkCUy0bD8iTX4YT8SRN
	bG0SA==
X-Received: by 2002:a17:90a:da8d:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-359be3475c1mr11437081a91.22.1773084361997;
        Mon, 09 Mar 2026 12:26:01 -0700 (PDT)
Received: from fedora (p4582043-ipxg23101hodogaya.kanagawa.ocn.ne.jp. [153.205.170.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e5774bsm175204785ad.11.2026.03.09.12.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:26:01 -0700 (PDT)
Date: Tue, 10 Mar 2026 04:25:33 +0900
From: Shashank Balaji <shashankbalaji02@gmail.com>
To: Tim Bird <tim.bird@sony.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linuxtronix.de,
	senozhatsky@chromium.org, francesco@valla.it, geert@linux-m68k.org,
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <aa8erTKI1K7eO1LI@fedora>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210234741.3262320-1-tim.bird@sony.com>

Hi again,

On Tue, Feb 10, 2026 at 04:47:41PM -0700, Tim Bird wrote:
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
> All timestamps reflect time from processor power-on instead of
> time from the kernel's timekeeping initialization.
> 
> Signed-off-by: Tim Bird <tim.bird@sony.com>

So if a console is read before the cycles -> timestamp conversion can
happen, then they'll see 0. But reading from userspace will give the
right timestamps.

Based on the previous discussions, to address this possible confusion,
if changing the timestamp format, like adding '?', is a no-go because
of concerns of breaking existing monitoring tools, what about appending
something to the printk string after the timestamp? Hmm, no, that'll
affect grep'ability _and_ may break monitoring tools. Or what about a
pr_warn() early in boot to warn about the possible timestamp difference?

At the very least the possibility of this difference should be
documented in the Kconfig description.

Continuing below...

> ---
> V2->V3
>  Default CONFIG option to 'n'
>  Move more code from into early_times.h
>   (reducing ifdefs in init/main.c)
>  Use math64 helper routines
>  Use cycles_t instead of u64 type
>  Add #defines for EARLY_CYCLES_BIT and MASK
>  Invert if logic in adjust_early_ts()
>  (note: no change to 'depends on' in Kconfig entry)
> 
> V1->V2
>  Remove calibration CONFIG vars
>  Add 'depends on' to restrict arches (to handle ppc bug)
>  Add early_ts_offset to avoid discontinuity
>  Save cycles in ts_nsec, and convert on output
>  Move conditional code to include file (early_times.h)
> 
>  include/linux/early_times.h | 85 +++++++++++++++++++++++++++++++++++++
>  init/Kconfig                | 14 ++++++
>  init/main.c                 |  6 +++
>  kernel/printk/printk.c      | 18 +++++++-
>  4 files changed, 121 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/early_times.h
> 
> diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> new file mode 100644
> index 000000000000..05388dcb8573
> --- /dev/null
> +++ b/include/linux/early_times.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _KERNEL_PRINTK_EARLY_TIMES_H
> +#define _KERNEL_PRINTK_EARLY_TIMES_H
> +
> +#include <linux/timex.h>
> +#include <linux/clocksource.h>
> +
> +/* use high bit of a u64 to indicate cycles instead of a timestamp */
> +#define EARLY_CYCLES_BIT	BIT_ULL(63)
> +#define EARLY_CYCLES_MASK	~(BIT_ULL(63))
> +
> +#if defined(CONFIG_EARLY_PRINTK_TIMES)
> +extern cycles_t start_cycles;
> +extern u64 start_ns;
> +extern u32 early_mult, early_shift;
> +extern u64 early_ts_offset;
> +
> +static inline void early_times_start_calibration(void)
> +{
> +	start_cycles = get_cycles();
> +	start_ns = local_clock();
> +}
> +
> +static inline void early_times_finish_calibration(void)
> +{
> +	cycles_t end_cycles;
> +	u64 end_ns;
> +
> +	/* set calibration data for early_printk_times */
> +	end_cycles = get_cycles();
> +	end_ns = local_clock();
> +	clocks_calc_mult_shift(&early_mult, &early_shift,
> +		mul_u64_u64_div_u64(end_cycles - start_cycles,
> +			NSEC_PER_SEC, end_ns - start_ns),
> +		NSEC_PER_SEC, 100);
> +	early_ts_offset = mul_u64_u32_shr(start_cycles, early_mult, early_shift) - start_ns;
> +
> +	pr_debug("Early printk times: mult=%u, shift=%u, offset=%llu ns\n",
> +		early_mult, early_shift, early_ts_offset);
> +}
> +
> +static inline u64 early_cycles(void)
> +{
> +	return (get_cycles() | EARLY_CYCLES_BIT);
> +}
> +
> +/*
> + * adjust_early_ts detects whether ts in is cycles or nanoseconds
> + * and converts it or adjusts it, taking into account the offset
> + * from cycle-counter start.
> + *
> + * Note that early_mult may be 0, but that's OK because
> + * we'll just multiply by 0 and return 0. This will
> + * only occur if we're outputting a printk message
> + * before the calibration of the early timestamp.
> + * Any output after user space start (eg. from dmesg or
> + * journalctl) will show correct values.
> + */
> +static inline u64 adjust_early_ts(u64 ts)
> +{
> +	if (likely(!(ts & EARLY_CYCLES_BIT)))
> +		/* if timestamp is not in cycles, just add offset */
> +		return ts + early_ts_offset;
> +
> +	/* mask high bit and convert to nanoseconds */
> +	return mul_u64_u32_shr(ts & EARLY_CYCLES_MASK, early_mult, early_shift);
> +}
> +
> +#else
> +# define early_times_start_calibration() do { } while (0)
> +# define early_times_finish_calibration() do { } while (0)
> +
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
> +#endiV
> diff --git a/init/Kconfig b/init/Kconfig
> index fa79feb8fe57..a928c1efb09d 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -777,6 +777,20 @@ config IKHEADERS
>  	  or similar programs.  If you build the headers as a module, a module called
>  	  kheaders.ko is built which can be loaded on-demand to get access to headers.
>  
> +config EARLY_PRINTK_TIMES
> +	bool "Show non-zero printk timestamps early in boot"
> +	default n
> +	depends on PRINTK
> +	depends on ARM64 || X86_64
> +	help
> +	  Use a cycle-counter to provide printk timestamps during
> +	  early boot.  This allows seeing timestamps for printks that
> +	  would otherwise show as 0.  Note that this will shift the
> +	  printk timestamps to be relative to processor power on, instead
> +	  of relative to the start of kernel timekeeping.  This should be
> +	  closer to machine power on, giving a better indication of
> +	  overall boot time.
> +
>  config LOG_BUF_SHIFT
>  	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
>  	range 12 25
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..d5774aec1aff 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -104,6 +104,7 @@
>  #include <linux/pidfs.h>
>  #include <linux/ptdump.h>
>  #include <linux/time_namespace.h>
> +#include <linux/early_times.h>
>  #include <net/net_namespace.h>
>  
>  #include <asm/io.h>
> @@ -1118,6 +1119,9 @@ void start_kernel(void)
>  	timekeeping_init();
>  	time_init();
>  
> +	/* This must be after timekeeping is initialized */
> +	early_times_start_calibration();
> +
>  	/* This must be after timekeeping is initialized */
>  	random_init();
>  
> @@ -1600,6 +1604,8 @@ static int __ref kernel_init(void *unused)
>  
>  	do_sysctl_args();
>  
> +	early_times_finish_calibration();
> +
>  	if (ramdisk_execute_command) {
>  		ret = run_init_process(ramdisk_execute_command);
>  		if (!ret)
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 1d765ad242b8..5afd31c3345c 100644
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
> @@ -75,6 +76,13 @@ EXPORT_SYMBOL(ignore_console_lock_warning);
>  
>  EXPORT_TRACEPOINT_SYMBOL_GPL(console);
>  
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +cycles_t start_cycles;
> +u64 start_ns;
> +u32 early_mult, early_shift;
> +u64 early_ts_offset;
> +#endif
> +
>  /*
>   * Low level drivers may need that to know if they can schedule in
>   * their unblank() callback or not. So let's export it.
> @@ -639,7 +647,7 @@ static void append_char(char **pp, char *e, char c)
>  static ssize_t info_print_ext_header(char *buf, size_t size,
>  				     struct printk_info *info)
>  {
> -	u64 ts_usec = info->ts_nsec;
> +	u64 ts_usec = adjust_early_ts(info->ts_nsec);

printk_get_next_message() calls info_print_ext_header() for an extended
console (/dev/kmsg and netcon_ext use this), whereas for
non-extended consoles, record_print_text() -> info_print_prefix() ->
print_time() is called. So, this adjustment should be made in
print_time() too, otherwise non-extended console users are gonna be
spooked with insane timestamps. This may explain the non-zero early
timestamps Petr saw in his serial console output [1].

An accessor can be implemented for (struct printk_info).ts_nsec, say
get_timestamp(), which can be called from both the places.

[1] https://lore.kernel.org/all/aYDPn2EJgJIWGDhM@pathway/

Thanks,
Shashank
