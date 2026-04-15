Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F057317160
	for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776278465; cv=none; b=qqTA6q9HQkhiylNkI/z0OQB4zKWrbDGxkZ/QNAHT3s4nylKnHjlpC7YNFMhlRDGzkaYQ75hdoAxsTtAhL9iG7EBm0na6oSqLfkYGPnpT7ME3fsjoOpfH9d0epeppTvWu3OVmW2JWUQGsVvcKOsXbDCh8n2aGrTNAiV5dIIsHrZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776278465; c=relaxed/simple;
	bh=DsaOQyCu2mz97RmpD+TfGFOIGdiO01TcwRW29lWNDIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdCzzLKnOK2cscjSkMN3fLmICIXd/8hkte5BvowcWFkFsh7QdZS78TyNg+acElec0WZhlRASnq2a+MfdR2s1P9POuyeMCQ3STDGKZmY3z3yA7IQbHQ84pBF6tbfMnd9vfWezC5I8AIPqW88zAq/UeDM0HvD/muhvzslYRrBYJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-60fa13bde2dso2310522137.3
        for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 11:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776278462; x=1776883262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6MdfVWX2gA17FZalU+YAOzBnu9nVX7ZYgARnp7E5dg=;
        b=exnp3ieW0ZMvNpuQwcDJoA6aywi+oTdQuPJOfx4ReRuxjfMrsqydupCdZM7MZwP91R
         JnHqX64/hf6/FByhnEeW/80BoETyV/SyHswONUu+zlWpaIGPKc7hvfN4T52PgQ+aGHFu
         IaPpsKRgZovlXX9jYYuKt1FXL+tU4mAxvQQKLhyln+bHMwZa34lCCornRbjesG23rNtY
         HJwc7qLdtTqV2j++yKC/TRf3fEvh+uqSbdtsG5bnWDB/ZdLws7sfNuEs/W4V6FD9WWA/
         JQOdg6k4hobjz+jqJ2kv3UWqDqN8b7yJzKRB3QDi4d+9/E7hk534tBi7aPLmqto7mS5Q
         Z3eg==
X-Forwarded-Encrypted: i=1; AFNElJ8aMB3Eyg4suK5WGtGOpoXjvz2pNeApXu3HxLxlMFjvzR30UI5QsxPjXqHRWkDtK88qCCZG1OTlc05znn4kfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRg1OmUkwOPINmuJEAfuGhGpfKfbz8VVy8Yu+hMozsTQdorRih
	eewe9+KP8wD1CvbY3BxKlTOqcGP9aUsgdWpixc4VPJWTOpa0tUb7Afdurmqm9MnX
X-Gm-Gg: AeBDietwC9/oHb+elgCa0mBgLBZwu8ikVSXCd8pgnQX3cOXKA0Svgb9hT1vqkX+2MRP
	S1DxQh0THJHkMGHF7UQ1KfzBSfjr0u8g4VDBF7wEvQbY08mVUD4/bzhv0JyADp4WMBkB2GeZrLb
	CxcM8P+WE95X50vKyDtks/Npw/qWJCwcg8khXVld8KiaJGLzjlhw3+6gkHaVFBFwjH4lrMBcRF4
	unLbfhJiZ4vqTYHbvjY3Ev4JoLP3z1Sjf9dFKca1KTA3Dg2Z81DjpMrSOahjLRJVxAeFhLnJdgk
	k/Je+xjE0ddjQTcNYjMkmsMDCIzG+oZd+1j1wQUMMowEoAu7fOtzCz9vbFCc94UDMjDV6DKMUqV
	FZ1YQ6swVt2Arr8qYyl1uABYu6Yj9bu6a5TByTFIB6fPYAi9Jk9b208i/FrevU/F2XB6z1/flOx
	XFvHTMOxKbSdPjGPG8JUt4EidhqebBtPyd8WB2RXReV4Mwhe8vig39MY/TJu9nzkDaDjmFvf4=
X-Received: by 2002:a05:6102:2929:b0:612:7ddc:52f2 with SMTP id ada2fe7eead31-6127ddc742amr2608360137.12.1776278462401;
        Wed, 15 Apr 2026 11:41:02 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612ccb2498dsm1218143137.1.2026.04.15.11.41.01
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 11:41:01 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-60fa13bde2dso2310506137.3
        for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 11:41:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8KuJ8HPmkweR7Rng3krRkVcTrzBkXIk+oj3J69sT0nnjqUOoxh9M395h0+oo33jr8wq/iBJILwlXq5Jl3QNw==@vger.kernel.org
X-Received: by 2002:a05:6102:5ccb:b0:611:b9be:1199 with SMTP id
 ada2fe7eead31-611b9be29c9mr4477282137.14.1776278461253; Wed, 15 Apr 2026
 11:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <CAJGKYO7-9t=KMN4=jARMHhO7gWSSaphDuwqRha0TAhOtUdXuQQ@mail.gmail.com>
In-Reply-To: <CAJGKYO7-9t=KMN4=jARMHhO7gWSSaphDuwqRha0TAhOtUdXuQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Apr 2026 20:40:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYxHbHgeT4nnbC9s2Hn+S8FSqe3DgsJuShcRWsiGGGRg@mail.gmail.com>
X-Gm-Features: AQROBzDaYB_j5tN30lytTKVr9nieP2YK_tZuzB-wRyuRrjOKBNdyMnukVU4T5OI
Message-ID: <CAMuHMdVYxHbHgeT4nnbC9s2Hn+S8FSqe3DgsJuShcRWsiGGGRg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Tim Bird <tim.bird@sony.com>, pmladek@suse.com, 
	rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org, 
	francesco@valla.it, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Roberto,

On Wed, 15 Apr 2026 at 11:20, Roberto A. Foglietta
<roberto.foglietta@gmail.com> wrote:
> On Wed, 15 Apr 2026 at 02:19, Roberto A. Foglietta
> <roberto.foglietta@gmail.com> wrote:
> >
> > On Wed, 15 Apr 2026 at 00:38, Thomas Gleixner <tglx@kernel.org> wrote:
> > >
> > > On Fri, Apr 10 2026 at 14:37, Tim Bird wrote:
> > > > +
> > > > +#include <linux/timekeeping.h>
> > > > +#ifdef CONFIG_ARM64
> > > > +#include <asm/sysreg.h>
> > > > +#endif
> > > > +
> > > > +#ifdef CONFIG_EARLY_CYCLES_KHZ
> > > > +static inline u64 early_unsafe_cycles(void)
> > > > +{
> > > > +#if defined(CONFIG_X86_64)
> > > > +     /*
> > > > +      * This rdtsc may happen before secure TSC is initialized, and
> > > > +      * it is unordered. So please don't use this value for cryptography
> > > > +      * or after SMP is initialized.
> > > > +      */
> > > > +     return rdtsc();
> > > > +#elif defined(CONFIG_ARM64)
> > > > +     return read_sysreg(cntvct_el0);
> > > > +#elif defined(CONFIG_RISCV_TIMER)
> > > > +     u64 val;
> > > > +
> > > > +     asm volatile("rdtime %0" : "=r"(val));
> > > > +     return val;
> > > > +#else
> > > > +     return 0;
> > > > +#endif
> > > > +}
> > >
> > > No. Generic code and generic headers have no business to implement any
> > > architecture specific code and there is zero justification for
> > > architecture specific #ifdefs in generic code.
> >
> > This translates in practice in early_unsafe_cycles() various
> > instances, one for each architecture supported. Even better a macro
> > for each architecture like this example below (untested code, just for
> > exemplification):
> >
> >   ts_nsec = local_clock();
> > #ifdef CONFIG_EARLY_CYCLES_KHZ
> > #if defined(CONFIG_ARM64)
> > #include <asm/sysreg.h>
> > #define early_unsafe_cycles read_sysreg(cntvct_el0);
> > #elif defined(CONFIG_X86_64)
> > #define early_unsafe_cycles rdtsc()
> > #elif defined(CONFIG_RISCV_TIMER)
> > #define early_unsafe_cycles ({ u64 val; asm volatile("rdtime %0" :
> > "=r"(val)); val; })
> > #else
> > #define early_unsafe_cycles 0
> > #endif
> > + if (unlikely(!ts_nsec))
> > + ts_nsec = early_times_ns();
> >  #endif // CONFIG_EARLY_CYCLES_KHZ
> >   caller_id = printk_caller_id();
> >
> > While keeping architectures separate is for abstraction layer best
> > practice, in very specific cases abstraction can be a meaningless
> > concept or much less important than having a single file for a single
> > feature (the complementary way of organising stuff). Because in Linux
> > the abstraction layer approach applies for architectures, the gap
> > between aesthetic and a specific case like an early boot macros set
> > hack for debugging is to clarify the exception from the general rule
> > in the header itself.
>
> IMHO, this patch (upstreamed or not) is for a few hackers and it is
> not even a tool but a first-outlook or last-resort hack. Therefore the
> single point of change that makes sense against spreading stuff that
> is supposed to be further hacked isn't the correct approach. The
> debate can be about upstreaming this kind of changes, and IMHO this
> one still has a sense to be upstreamed among debug features.
>
> I am attaching the path for just sake of independence storage (due my
> project github repo linked before is naturally subject to arbitrary
> changes by me). It is not supposed to be applied as-is (and probably
> cannot be applied anyway) and the patch has been written by hands on a
> keyboard. Gemini was used for retrieving information (in a smart man 3
> command style) and to collect the ASM code and its fencing.
>
> So the main question is: does this v5 suggested approach bridge the
> 1-single-point-of-change practical needs with the aim of keeping the
> source three? If yes then a V6 is worth being developed to provide the
> functionality and propose the upstream (I do not bet in good at the
> first write but on resolving the contrast/debate THEN delivery).
>
> Best regards, R-

Thanks for your patch!

> --- /dev/null
> +++ kernel/printk/early_times.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _EARLY_TIMES_H
> +#define _EARLY_TIMES_H
> +
> +#include <linux/timekeeping.h>
> +
> +/*
> + * Fencing isn't optional here, otherwise unreliable values displaying
> + */
> +#if defined(CONFIG_ARM64)
> +             #include <asm/sysreg.h>
> +             #define __early_raw_cycles ({ u64 val; \
> +                 asm volatile("isb; mrs %0, cntvct_el0" : "=r"(val)); val; })
> +#elif defined(CONFIG_X86_64)
> +             #define __early_raw_cycles ({ u64 val; \
> +                 asm volatile("lfence; rdtsc; shl $32, %%rdx; or %%rdx, %%rax" \
> +                     : "=a"(val) : : "rdx"); val; })
> +#elif defined(CONFIG_RISCV_TIMER)
> +             #define __early_raw_cycles ({ u64 val; \
> +                 asm volatile("fence; rdtime %0" : "=r"(val)); val; })
> +#else

All of these should be handled in arch/*/include/asm/early_times.h...

> +             #define __early_raw_cycles 0

... while this should be in include/asm-generic/early_times.h.

> +#endif
> +
> +#endif /* _EARLY_TIMES_H */

> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2294,6 +2295,8 @@ int vprintk_store(int facility, int level,
>        * timestamp with respect to the caller.
>        */
>       ts_nsec = local_clock();
>
> +#if CONFIG_EARLY_BOOT_TIMINGS
> +#include "early_times.h"
> +             /*
> +              * Very few developers are using this feature and they're expecting to deal
> +              * with it as a single point of change hack to be further customised by them.
> +              * The right shift by 2^10 is a raw extimation to provide 6-figure within the
> +              * first second when the kernel internal cycle/nS calibration isn't ready yet.
> +              */
> +             if (unlikely(!ts_nsec))
> +                     ts_nsec = __early_raw_cycles >> 10;

As there can be lots of variation in the granularity of early timers,
I think the shift should be moved in the arch-specific __early_raw_cycles,
so it is only done when useful.


> +#endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
