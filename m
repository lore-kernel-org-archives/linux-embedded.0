Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E995F32E750
	for <linux-embedded@vger.kernel.org>; Mon, 26 Jan 2026 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422377; cv=none; b=XfihCXnFtrEMuCVvBBpOHwZct+MlwaLU2kcSf/PBPnHLIwfg9V5NCYdq6XzTEYHR7pciDFFnUK00DFj2rYrv/fc2xiZUPM8dG52uqWWu2SoJIEvvLCyRh8gFakWMeuktz5enkA/bnzH8GPbnHmoWl1ohhbz9p22NKQVQ3SLPLRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422377; c=relaxed/simple;
	bh=TKT/GUkn91MV2awvA4sVrsoOh/heag+pau5NVcbf4aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBO4zh4lJIeHBkE6/Vqkp3vZYsbhqEPmAZERzdsCbt4Lcxy+waznk684VQYs1ytqAQqqUr+E2UMlprpmz6JzAmMa+NT8A+8ucSK3bXcIfRTdWhE92BJ6/bq7OeZMxj6BxtebrAqcwGTQbSAuqnM6Yv9rd8nD4e19hcIp/VCpREg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56646a34c18so863592e0c.0
        for <linux-embedded@vger.kernel.org>; Mon, 26 Jan 2026 02:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422374; x=1770027174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcLgf3vOdq0vDxiYew/wXzr98eaSLYjmIJUXxii+0t0=;
        b=XnHmnq7UG0Z/E0d7ocUnILSz6HJpYPd5ZHexOFPKwe1JjI2pKbcYdqq6nNw7/jxLjG
         yKph7nXX/SsfQAjBZ3wk5O0JPG99gol/SVRd63dE2GD5uug0zzMcxQmbMhjItuP2YEj6
         g+VanZQZ+WvRTyW3SniVq7KbqGz58QxX+HyotUXzCIS+u9p5Db4uVNE9oY0iAFOJ1kaG
         98dVWOatnq7nxRAuTj/i60VIlfS4LfjX3V0zfebj9v/5Ri5uaOgKo6gqvA7b0tGFi95x
         jQSPoXRAZ4yNwoSTAEpQzoMbDVsfR9PvcASQtdjFAB8KCggT9joVboUZ9FZ0Mvwkr/vH
         2lsg==
X-Forwarded-Encrypted: i=1; AJvYcCVl25iZmCduOvcX3q1DpNnTUFRPPwfk81sb0PnpjzpYvgj1fYhRGRmCXEoVt5RuCEc/NELDKuEOj9odwtviUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL4U+zIybrXU9QpcMzmoQz6vfxi1oiwCPZ9RHFPzWh5/3d11wq
	SXna03l1aACXKvzeH0ZsN/wd93WS94yqyrSHFBBbQqP5MtpuyrmYLvQhc4/l263d
X-Gm-Gg: AZuq6aLOjvX530cLKfj4n5WB39foP7FC7BcRBRDrLKkWZMQlbOdF79171CLsMLFrOkb
	QRSrH6KqldeG6o/WVzUAwMgECoZ5k+bs75FJji5QVyqeb0K/fB+trgO/siYQ4/MB5JSvic5LUqc
	XiMvVz9J6qJBlwOKppzJJs5R6VoWdhlFAGgg39LWECHDoGkqCPBgtmz+g0M941/BvP37De1UqLI
	5t9jiy1BH/NskRwJu0HAS46oh2IwkzC1o2EMR70UbXVJj4mAzoa+rcMp1QpvEGmErXERPGhSKRF
	dfvrtCHBlozn+TTHtPBs3ffJdP4m50jHDEp1JyzAGiZkXhuDgvLHuVsrj0Kd+EJLToxKGKa1d1K
	CuUTdNv0mTRIofWPBDSULabd5PKQO6ss5RVE2+on5ynNl4GtF9bX6TH+v40USUQghDBj8Lxgcjq
	IusBnooqsEkAEyU3tAUl38ACq36PdZt5JmImXFRF3hPhF7PL+y
X-Received: by 2002:a05:6122:489b:b0:55b:d85:507a with SMTP id 71dfb90a1353d-5665c980b0bmr1117205e0c.7.1769422374392;
        Mon, 26 Jan 2026 02:12:54 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb58645sm1722833e0c.12.2026.01.26.02.12.53
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:12:53 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93f5774571eso1099061241.1
        for <linux-embedded@vger.kernel.org>; Mon, 26 Jan 2026 02:12:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdlQ0sPVomBsSd2Bwq2m7YmHF7Jae2FvjQcLT8x6RukE8F+c9dmq+YGyshFcaXp/Ied2QJ3AjkZoC38ApVrg==@vger.kernel.org
X-Received: by 2002:a05:6102:161f:b0:5f1:55c9:11a2 with SMTP id
 ada2fe7eead31-5f5765af7fbmr924837137.43.1769422373354; Mon, 26 Jan 2026
 02:12:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org> <20260124194027.713991-1-tim.bird@sony.com>
In-Reply-To: <20260124194027.713991-1-tim.bird@sony.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 11:12:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9XQiBx1QBDoaqJB+CwNp0EQbeJuFpe=yCqfAe1inXWA@mail.gmail.com>
X-Gm-Features: AZwV_Qjb-MueEqYwYCh3kqa1UP7LrTuwYDQAD3ceqowKg_tFLwMCpO7v4JpMu6Y
Message-ID: <CAMuHMdV9XQiBx1QBDoaqJB+CwNp0EQbeJuFpe=yCqfAe1inXWA@mail.gmail.com>
Subject: Re: [PATCH v2] printk: fix zero-valued printk timestamps in early boot
To: Tim Bird <tim.bird@sony.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linuxtronix.de, 
	senozhatsky@chromium.org, francesco@valla.it, linux-embedded@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tim,

On Sat, 24 Jan 2026 at 20:41, Tim Bird <tim.bird@sony.com> wrote:
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

Thanks for the update!

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
> +       return ((u64)get_cycles() | (1ULL << 63));

No need to cast to u64, as the second operand of the OR is u64 anyway.
BIT_ULL(63)

I think it would be good to have a #define for this at the top.

> +}
> +
> +static inline u64 adjust_early_ts(u64 ts)
> +{
> +       /* High bit means ts is a cycle count */
> +       if (unlikely(ts & (1ULL << 63)))
> +               /*
> +                * mask high bit and convert to ns
> +                * Note that early_mult may be 0, but that's OK because
> +                * we'll just multiply by 0 and return 0. This will
> +                * only occur if we're outputting a printk message
> +                * before the calibration of the early timestamp.
> +                * Any output after user space start (eg. from dmesg or
> +                * journalctl) will show correct values.
> +                */
> +               return (((ts & ~(1ULL << 63)) * early_mult) >> early_shift);

Please use the mul_u64_u32_shr() helper.

Please wrap this block in curly braces.
Alternatively, you can invert the logic:

    if (likely(!(ts & DEFINITION_FOR_1ULL_LSH63)))
            return ts + early_ts_offset;

> +
> +       /* If timestamp is already in ns, just add offset */
> +       return ts + early_ts_offset;
> +}
> +#else
> +static inline u64 early_cycles(void)
> +{
> +       return 0;
> +}
> +
> +static inline u64 adjust_early_ts(u64 ts)
> +{
> +       return ts;
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
>           or similar programs.  If you build the headers as a module, a module called
>           kheaders.ko is built which can be loaded on-demand to get access to headers.
>
> +config EARLY_PRINTK_TIMES
> +       bool "Show non-zero printk timestamps early in boot"
> +       default y
> +       depends on PRINTK
> +       depends on ARM64 || X86_64

So for now this is limited to (a few) 64-bit platforms...

> +       help
> +         Use a cycle-counter to provide printk timestamps during
> +         early boot.  This allows seeing timestamps for printks that
> +         would otherwise show as 0.  Note that this will shift the
> +         printk timestamps to be relative to machine power on, instead
> +         of relative to the start of kernel timekeeping.
> +
>  config LOG_BUF_SHIFT
>         int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
>         range 12 25
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..cc1af26933f7 100644
> --- a/init/main.c
> +++ b/init/main.c

> @@ -160,6 +163,10 @@ static size_t initargs_offs;
>  # define initargs_offs 0
>  #endif
>
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +static u64 start_cycles, start_ns;

cycles_t start_cycles;

(cycles_t is unsigned long, i.e. either 32- or 64-bit).

> +#endif
> +
>  static char *execute_command;
>  static char *ramdisk_execute_command = "/init";
>
> @@ -1118,6 +1125,11 @@ void start_kernel(void)
>         timekeeping_init();
>         time_init();
>
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +       start_cycles = get_cycles();
> +       start_ns = local_clock();
> +#endif
> +
>         /* This must be after timekeeping is initialized */
>         random_init();
>
> @@ -1600,6 +1612,20 @@ static int __ref kernel_init(void *unused)
>
>         do_sysctl_args();
>
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +       u64 end_cycles, end_ns;

cycles_t end_cycles;

> +
> +       /* set calibration data for early_printk_times */
> +       end_cycles = get_cycles();
> +       end_ns = local_clock();
> +       clocks_calc_mult_shift(&early_mult, &early_shift,
> +               ((end_cycles - start_cycles) * NSEC_PER_SEC)/(end_ns - start_ns),
> +               NSEC_PER_SEC, 50);

mul_u64_u64_div_u64() is probably the best helper that is available
(there is no mul_ulong_u32_div_u64()).

> +       early_ts_offset = ((start_cycles * early_mult) >> early_shift) - start_ns;
> +       pr_debug("Early printk times: mult=%u, shift=%u, offset=%llu ns\n",
> +               early_mult, early_shift, early_ts_offset);
> +#endif
> +
>         if (ramdisk_execute_command) {
>                 ret = run_init_process(ramdisk_execute_command);
>                 if (!ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
