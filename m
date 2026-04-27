Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4103B2FC8
	for <linux-embedded@vger.kernel.org>; Mon, 27 Apr 2026 23:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777332812; cv=pass; b=QpQnGVZ5vgJ8MNZ+b+/EBvc0MBquaE/z3cLagnms5Ip69ytFND9JmQDQD8/EILRE+FkGv1O+/bLFTayNQvtkUQ6hWTLuTMURnETewRr3k5B+65GayLTZhK1tcF60dEWrGPZuGgv+bXIRT1l16jqD+IVeysihVsXSCTntLTBwPH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777332812; c=relaxed/simple;
	bh=TL8rur10xE/eTLcb9F/APQq5IMT4souLOS/jcA6z4+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpoermpYbodRvxM/wCccFQIk0ehpNto/5gxbm6fxeaTAF4htktX/FRM3uQsNcCk+4mr7osIS2iACMzJLvsUxTHOoEKa99MPz97SVsrganlOpAUyh3IQHLVIjUjHDoBguYs2IDvtq/fXvSp2FLTTv3W2ZN/eecTLywCw7J+vdbSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=0DjEul3h; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="0DjEul3h"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4303eb92930so1232553fac.3
        for <linux-embedded@vger.kernel.org>; Mon, 27 Apr 2026 16:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777332810; cv=none;
        d=google.com; s=arc-20240605;
        b=Uxnm531E8LGASFIvhp8rqFYYBd1I5Gpyf+8kIgfO0kbB+YOSRl3fECruKzlW3WeZ08
         NEAPzNpCK+JtlYih6SwBW9YHK03XY7+Kc5KWwnEDbC9GntX5+cm5zMB6mFjjL8NheSpB
         NR2e3h01iGU/6//w8PA0upDSt4HfDqppew7GkPDbwZ8+5eWNuboQxzsnqeuM/4Sftvi4
         ok0vsuYhT2U4qfu4+3temkzP9KPE/37JkLQ6iOuwo09//6ukLhElM9zBUp0HHV2wMhyn
         nYaWGagJa74Nr/sSQT5EfWsw3TgZxDj5Za0wGNhtXFmj/QdFqfHtopGmCOv3/WG+z96H
         oAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T8Ue48N/ikLUgk+lsJaGvUu4Ik5qgoKH8OKvnp4XlCo=;
        fh=BNQUK7V3TrEEOgKquzC1UE0AQvemQog2kzsBg8gSJ/Q=;
        b=bGIM65NHriIz1dK5FsvAEjyP1PTA9oHNiRBfsScYg9pD76h0dd0Xug1gTh44N22m7q
         5L9aDavykJkTe1X35HORyGJc/h6MfjVwyKT4hJaQD6PFI0v92VGaSRWQ1hq64rG0RR4e
         NLDIBPYO3FSXbpJT79PwpR9gp7dcSBatjtnca1ejBaYI6JtIQ7RoCkNMklO0zpzEb9Nu
         GvgwNbhpgNb3IhV1xJKEH9iO/EGuthITvAnvAPz4VTT7oe15YkMGYxw17k+jFQ7XFjtm
         5gQpu//hqvY0EPnTcUzD2N6CtYQ4n3Sab/Z8pBiABNfJAU2oUzHUbpcV2mUB6zerv2Fs
         qsTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1777332810; x=1777937610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T8Ue48N/ikLUgk+lsJaGvUu4Ik5qgoKH8OKvnp4XlCo=;
        b=0DjEul3h1x8PmCFjMRftC3Qo1yRpEsNkUgGechICr9tRm+EEyrk+0Zk/qo/48W2T8n
         PT54dCN9uF1tvEuP5lYEXzb3IVna3NMAJoxEK9hmdicKy/LbijjcjLGS61Rd6q2BgYWL
         4dG4dv4jCba4P7wIG8hNhoea6l4GttlYQU/lfd9VSi37WFZkx5UpqdvzGBvovnMTL4AF
         F2ey08lBllkWZiCdinm0C43QuyJmLJ+pZ9VQjwjdtoZcSvvWsQvSZKx/qeaL/AX5nhs+
         rBsNBgzNMkt5fusywdCceXpnEluo9h0HukpD81IJhw8zcJ3kphKmwdx6sHIcRSssK2Pk
         IQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777332810; x=1777937610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8Ue48N/ikLUgk+lsJaGvUu4Ik5qgoKH8OKvnp4XlCo=;
        b=Tbz6FhCx1mBMnABJZUWe3n5WRlwQmh31v7iD3+lK9lG2IO7DZcf4A2CCONpFcC1au+
         rnTbhjAoAccuXC9QP6j6dhX1JSEaF9iooaYXA5tzoaE2hONyVJhE+lHO1viYNQ2EjEei
         zt7XnAyhULw7fu3gkfwrNdzdDLoKxdEVwl5Lz4qQ71vo1TnLKCxJ2pTVd85D1NC35cHD
         Ovpf//5ItN1OoLeEDhUURg47973MEUGxq9LRRcmbpAAR2hQiOmvVSmKdZ1M1ALnfFX0F
         xN661ELzzaLWag9bF+R4V8HUwhgoMJSZDLf6XeT5fOuibYBGeE+vWOuK6JNh7sRC/7UA
         ZDwA==
X-Forwarded-Encrypted: i=1; AFNElJ893zqciqjiNGc9HDF62GMKR4HD9jDb2LA5/4AwLWNBJ6m3EryvPmfOFSftWrl5KfxgHWGmkHUlOtqX0nrvqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAsU2xUUqh8zmTlx5WWghQdJLvKzFooQxu5v9JmStwwoKb44S+
	pyKXAAJPvRXNIUxPpKmZyCneKrlPv3cPxEdskyge92sIcNP/BFMlw+XDWe2UA7YmzONyQM9Hu7K
	rm0kWkrnf/6sxdQU6qHXB+fORVyo4r1LZ37PTEaeqBFb9HrgNBNaikxzRww==
X-Gm-Gg: AeBDietY34RIAu8wMHJf2xjkUY4aEoTqzXznPXe1rDaIHYOgTnUC0RTI3SYF78JFFFN
	8qdyyWR0RDRta0GpKLI7Qj/CQAPtnt6rK5l5Awq3esw/BpPOIr5NuEgS3JjeN3bGMm8RSFpbWec
	9djLGbpt6miiLpGIiXKYW5xE9V2h/bkw4zKGfVkMIcEDDHVPuR2hC6Yh+Re0aoTvap0bgRiPVsg
	Cg2Hff26TvmzEwSbSK/tbzxnIJV3Rq5Ipp/zkZaJdEYlDEYxGutiUA11dVcAxAEyHWLFM/gw1dx
	Kb2M0LdvPSKmFvdV3fFmJCwTNbP9HmYJIa5sX2lB2L7Akxl/MY0VK0eoDnh/comrOuJ3axnw1ul
	E8VvSNZqT5X6ZFap5+j82j/Q5WPhJHAWnKhzD0uYOni3FV1L46A==
X-Received: by 2002:a05:6820:f0b:b0:694:8b08:b916 with SMTP id
 006d021491bc7-6965cb3a419mr370264eaf.35.1777332810017; Mon, 27 Apr 2026
 16:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
In-Reply-To: <20260410203741.997410-2-tim.bird@sony.com>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 28 Apr 2026 00:33:18 +0100
X-Gm-Features: AVHnY4IC4ukvpwsybvJYIcGdRsrKaCtmr0REJgXNf962WEFw-ERec8SKnI_0oiE
Message-ID: <CALqELGz3qJ=KtDmBHMRP4NMSmmeZGKxk6SpTCQGcvGru5Dn0SA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Tim Bird <tim.bird@sony.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de, 
	senozhatsky@chromium.org, francesco@valla.it, geert@linux-m68k.org, 
	tglx@kernel.org, shashankbalaji02@gmail.com, linux-embedded@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tim,

On Fri, 10 Apr 2026 at 21:41, Tim Bird <tim.bird@sony.com> wrote:
>
> During early boot, printk timestamps are reported as zero before
> kernel timekeeping starts (i.e. before time_init()).  This
> hinders boot-time optimization efforts.  This period ranges from
> 17 to 1700 milliseconds on different embedded machines running Linux.
>
> Add support for early timestamps based on processor cycle-generators
> that need no kernel initialization. Use a statically-configured
> frequency value for converting cycles to nanoseconds. This means
> that this feature cannot be turned on in generic distro kernels.
> It is intended for temporary use during kernel development and
> boot-time research and optimization only.
>
> This yields non-zero timestamps for printks from the very start
> of kernel execution.  The timestamps are relative to the start of
> an architecture-specific counter (e.g. tsc on x86_64 and cntvct_el0
> on arm64).  Affected timestamps reflect time from cycle counter
> init (usually machine power-on or virtual machine start) instead of
> time from the kernel's timekeeping initialization. This results in a
> discontinuity in the printk timestamp values, one time, when
> kernel timekeeping starts.
>
> Signed-off-by: Tim Bird <tim.bird@sony.com>
> ---

The limitation of this series is that while it narrows the window
where delays may be hiding, it doesn't remove the window completely.
For example, there may be a delay prior to the first printk (perhaps
unlikely). It would instead be useful to understand how much time has
passed since execution was handed over to the kernel.

Also, in my view, the goal of this work is really to identify
regressions in boot time, though this can be achieved via other means.
Replacing zero timestamps in printk messages with real timestamps is
only necessary to make it easier to bisect where those delays are
hiding, i.e. between two printk messages. But that benefit it limited
given how small the window is. (And if a regression is spotted,
someone would likely add debug to find it anyway).

Given the risks identified by others with this series and the above, I
thought I'd suggest an alternative approach.

Perhaps we can rely on a prior boot stage (e.g. U-Boot) to capture a
timestamp (perhaps cntvct on arm) immediately prior to kernel
handover, this could be stored in the device tree and it could include
architecture information on where that timestamp came from. During
boot, once timekeeping is initialised, the architecture specific
timekeeping initialisation code can print relevant timestamp values to
the console, alongside the data captured in the device tree.

Userspace tools (systemd-analyze) or log parsing tools, can then make
sense of the values. The time between kernel handover and the end of
timekeeping initalisation printk can be calculated. You could also
subtract the earliest non-zero printk timestamp from this figure to
measure the time between kernel handover and first non-zero timestamp.

Besides logging values from hardware registers to the console, this
approach pushes out all the maths to userspace or log parsing tools.
It also doesn't impact existing printk timestamps and can be
structured to not introduce new get_cycles types of functions.

If this type of approach is taken, it may be worth investigating other
initiatives in this area, for example [1], [2], [3] which may be
relevant.

[1] https://static.sched.com/hosted_files/osseu2025/a2/EOSS_2025_Unified%20Boot%20Time%20log%20based%20measurement.pdf
[2] https://issues.chromium.org/issues/40986147
[3] https://github.com/FirmwareHandoff/firmware_handoff

Thanks,

Andrew Murray

> V3 -> V4
>   Replace config vars with single one: CONFIG_EARLY_CYCLES_KHZ
>   Replace runtime calibration with static config variable
>   Remove reference to get_cycles()
>   Add support for RISCV platforms
> V2 -> V3
>   Default CONFIG option to 'n'
>   Move more code into early_times.h (reduce ifdefs in init/main.c)
>   Use match64 helper routines
>   Use cycles_t instead of u64 type
>   Add #defines for EARLY_CYCLES_BIT and EARLY_CYCLES_MASK
>   Invert if logic in adjust_early_ts()
> V1 -> V2
>   Remove calibration CONFIG vars
>   Add 'depends on' to restrict arches (to handle ppc bug)
>   Add early_ts_offset to avoid discontinuity
>   Save cycles in ts_nsec, and convert on output
>   Move conditional code to include file (early_times.h>
> ---
>  include/linux/early_times.h | 55 +++++++++++++++++++++++++++++++++++++
>  init/Kconfig                | 30 ++++++++++++++++++++
>  kernel/printk/printk.c      |  3 ++
>  3 files changed, 88 insertions(+)
>  create mode 100644 include/linux/early_times.h
>
> diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> new file mode 100644
> index 000000000000..82bacfd0e26b
> --- /dev/null
> +++ b/include/linux/early_times.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _EARLY_TIMES_H
> +#define _EARLY_TIMES_H
> +
> +#include <linux/timekeeping.h>
> +#ifdef CONFIG_ARM64
> +#include <asm/sysreg.h>
> +#endif
> +
> +#ifdef CONFIG_EARLY_CYCLES_KHZ
> +static inline u64 early_unsafe_cycles(void)
> +{
> +#if defined(CONFIG_X86_64)
> +       /*
> +        * This rdtsc may happen before secure TSC is initialized, and
> +        * it is unordered. So please don't use this value for cryptography
> +        * or after SMP is initialized.
> +        */
> +       return rdtsc();
> +#elif defined(CONFIG_ARM64)
> +       return read_sysreg(cntvct_el0);
> +#elif defined(CONFIG_RISCV_TIMER)
> +       u64 val;
> +
> +       asm volatile("rdtime %0" : "=r"(val));
> +       return val;
> +#else
> +       return 0;
> +#endif
> +}
> +
> +#define NS_PER_KHZ     1000000UL
> +
> +/* returns a nanosecond value based on early cycles */
> +static inline u64 early_times_ns(void)
> +{
> +       if (CONFIG_EARLY_CYCLES_KHZ)
> +               /*
> +                * Note: the multiply must precede the division to avoid
> +                * truncation and loss of resolution
> +                * Don't use fancier MULT/SHIFT math here.  Since this is
> +                * static, the compiler can optimize the math operations.
> +                */
> +               return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
> +       return 0;
> +}
> +#else
> +static inline u64 early_times_ns(void)
> +{
> +       return 0;
> +}
> +#endif
> +
> +#endif /* _EARLY_TIMES_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index 7484cd703bc1..40c3123c2c27 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -792,6 +792,36 @@ config IKHEADERS
>           or similar programs.  If you build the headers as a module, a module called
>           kheaders.ko is built which can be loaded on-demand to get access to headers.
>
> +config EARLY_CYCLES_KHZ
> +       int "Frequency of the early times cycle counter, in KHz"
> +       default 0
> +       depends on PRINTK
> +       depends on ARM64 || X86_64 || RISCV_TIMER
> +       help
> +         Specifies the frequency value (in KHz) of the cycle counter
> +         used for early times information.
> +
> +         Set this to provide timing information for printks in early boot
> +         (before the start of kernel timekeeping), that would otherwise
> +         show as 0.
> +
> +         To calculate the value for your system, boot your system, and
> +         use the value expressed on the tsc or cntvct_el0 calibration line
> +         in your kernel message log:
> +         ex x86_64: tsc: Refined TSC clocksource calibration: 2095.057 MHz
> +          In that case, use the value 2095057.
> +         ex arm64: arch_timer: cp15 timer running at 54.00MHz (phys).
> +         In that case, use the value of 54000.
> +
> +         Note that this causes the kernel to show, for some early printks,
> +         times that are relative to processor power on, instead of
> +         relative to the start of kernel timekeeping.  When kernel
> +         timekeeping starts, the timestamps values reset, causing
> +         a discontinuity in the timestamp values.  If you see
> +         non-monotonic printk timestamps, please don't freak out.
> +
> +         Set to 0 to disable this feature.
> +
>  config LOG_BUF_SHIFT
>         int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
>         range 12 25
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 0323149548f6..ddeab81f04ef 100644
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
> @@ -2294,6 +2295,8 @@ int vprintk_store(int facility, int level,
>          * timestamp with respect to the caller.
>          */
>         ts_nsec = local_clock();
> +       if (unlikely(!ts_nsec))
> +               ts_nsec = early_times_ns();
>
>         caller_id = printk_caller_id();
>
> --
> 2.43.0
>
>
