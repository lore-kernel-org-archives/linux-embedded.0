Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72219285050
	for <linux-embedded@vger.kernel.org>; Tue, 27 Jan 2026 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501450; cv=none; b=gPBl2FL1JcfU84TsgqwDKxgQ/L5ICjK9PTStyShf9RuT81PB761O+/NLKdTAAejfKxzo+WyQ7w54GcSRI2ebFtMsdYL19/xo+pAWRRopRV9eaP7J14yjyxSev1DnaTpBa+pbZmA8i/P30OJgx14BPE5tVGj9PswPNd+4OBM7wVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501450; c=relaxed/simple;
	bh=RTRvdF4XJUeuddMU5CWGXtgtwaukfeoD1X1dLpApVPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8XVMGtFWQM31WJpcAwcYSRUVzjL5GYITaM8zT1+jTN0Gy2ZNV+WxUfwZcoCfAsANu/qZPb+/PFt0dKebUjCB6sssI6KC1ntwu++T1TyqBh2lILhEIdOon9j5NWXtvhe4r+St787TMDV15qTEpAdIKQPdOK9gOejK7w0rYw8k0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94121102a54so3670594241.1
        for <linux-embedded@vger.kernel.org>; Tue, 27 Jan 2026 00:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769501446; x=1770106246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1C1olFiOlWbX7cUG/rTzknnglz0yYp8igQr1eQOmDQ=;
        b=XxdEl1pBmmIWai1aNwNh7bDI0saL4bbWrJ8ZQKHDTqhZaZa7/vLvcX5/7uUv2Aor0w
         o1zdUxabgH8ksnkx6nTA2TDTn1nxdtPd7ezM+Omul7GeHHCVyr0DJOJGpHdaOHLC5srA
         rNiTRMctA2QJUJHyndRpHoDcZiHpqKVItBln5X9KmwKZdnoCYkEStNyZdrfQ4ppgOo0W
         la54nNXubk7nSOAGCivAgEb7g3mNeu+M+NFIezLxVQKPql6uIfS8YCFQKJtl6biXNf2S
         5WQ6Kh/siBwl2pzMafYJ0mQSv/JUAGVj8s9NwARtWs2RHxRe6GmuCVSTGcjrMKUPqMuv
         qBYg==
X-Forwarded-Encrypted: i=1; AJvYcCVN/77bt/FTzCSNw85HpEIo1g5k1wd9C5CqBsYQ+6qTUQqrDQQ+3NKV1E6GZ1zIOKYEDZdppHVIMBRBuxvcsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzZHEhMGlhgGNzbWTWULPixTJWYH1rK9BrJ42ZYGNK0HHBUdYp
	A2qPShVSvowugHjblc/A/Hxw1TWJhsd35Ns7YHaG5YXt9BPpKq/98PWHo2/iBd9Z
X-Gm-Gg: AZuq6aKJTzujCLPpmiVjKJaQUSFqZOUuIZvTuRju6jOK2XFkNj+RRXqWhGf4mnsG5qc
	fpsyTATAVdSZ73pfFU+W3/VUtHBaeBOgcaIzXkU4eEie2foSda+ZzYZNHOhYmfwGQG/F6gnOXYg
	LJJtA90dueNg8X7XgrYendhXk62TVHiOOfJ+c0QfhFp1QdjRov94CScawlFMYH4elR6gKAxkUwh
	Y8dgFpcgYGDFRU1fTRIffhG97311YxELV9K8hsjIsS7Nouyt3Kw1xzm9X8/M9fl4qtJH3evWnfw
	sHW1KCLWlRMPAYkrvOfAgbkHieTQH1wPnfu3uQJM2T87B0HAi4nFFHyAfssfrIdPlZDHj6zuXir
	cy7ltYt0wWlB7CWLlRcrakVWA94Q6ctJjP/wbc9mQnBOig3yMrzGJbB82fysmc2Z9YBMD5TINvo
	ek+NAdGQrZt3tJRSiKftk8YN0vpvXmzjZhGgouuS7N/9EO6iAnf1wopIXzaCM=
X-Received: by 2002:a05:6102:c4e:b0:5f5:3244:207 with SMTP id ada2fe7eead31-5f72376abf1mr624808137.20.1769501446180;
        Tue, 27 Jan 2026 00:10:46 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d40ff80sm2321872137.6.2026.01.27.00.10.43
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 00:10:44 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f5729f159so3265949241.0
        for <linux-embedded@vger.kernel.org>; Tue, 27 Jan 2026 00:10:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxZL40u0kh8GEiT2sekoek1glnOzWig0brFiLiDqPqh8liOimWDvkQXWqQc4Cx9lNJW+mpcUxpHpv3zZ3KIg==@vger.kernel.org
X-Received: by 2002:a05:6102:370b:b0:5ef:a9fb:f1f3 with SMTP id
 ada2fe7eead31-5f72362dbf8mr603892137.11.1769501443560; Tue, 27 Jan 2026
 00:10:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260124194027.713991-1-tim.bird@sony.com> <CAMuHMdV9XQiBx1QBDoaqJB+CwNp0EQbeJuFpe=yCqfAe1inXWA@mail.gmail.com>
 <MW5PR13MB5632CEFB9AB7AFDA7334307BFD93A@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB5632CEFB9AB7AFDA7334307BFD93A@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 09:10:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBb3y=2jYv8PzWact=KOhZGn4DFBP7XpxhdjAmDcDeBg@mail.gmail.com>
X-Gm-Features: AZwV_QgcV7Khr3DqVpkronnUKVtZj_WQIR_UhSgJCWOQjk3dnOmircHG2ZPxeQc
Message-ID: <CAMuHMdWBb3y=2jYv8PzWact=KOhZGn4DFBP7XpxhdjAmDcDeBg@mail.gmail.com>
Subject: Re: [PATCH v2] printk: fix zero-valued printk timestamps in early boot
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linuxtronix.de" <john.ogness@linuxtronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tim,

On Mon, 26 Jan 2026 at 18:11, Bird, Tim <Tim.Bird@sony.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Sat, 24 Jan 2026 at 20:41, Tim Bird <tim.bird@sony.com> wrote:
> > > During early boot, printk timestamps are reported as zero before
> > > kernel timekeeping starts (e.g. before time_init()).  This
> > > hinders boot-time optimization efforts.  This period is about 400
> > > milliseconds for many current desktop and embedded machines
> > > running Linux.
> > >
> > > Add support to save cycles during early boot, and output correct
> > > timestamp values after timekeeping is initialized.  get_cycles()
> > > is operational on arm64 and x86_64 from kernel start.  Add code
> > > and variables to save calibration values used to later convert
> > > cycle counts to time values in the early printks.  Add a config
> > > to control the feature.
> > >
> > > This yields non-zero timestamps for printks from the very start
> > > of kernel execution.  The timestamps are relative to the start of
> > > the architecture-specified counter used in get_cycles
> > > (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> > >
> > > All timestamps reflect time from power-on instead of time from
> > > the kernel's timekeeping initialization.
> > >
> > > Signed-off-by: Tim Bird <tim.bird@sony.com>
> > > ---
> > > V1 -> V2
> > >   Remove calibration CONFIG vars
> > >   Add 'depends on' to restrict arches (to handle ppc bug)
> > >   Add early_ts_offset to avoid discontinuity
> > >   Save cycles in ts_nsec, and convert on output
> > >   Move conditional code to include file (early_times.h)
> >
> > Thanks for the update!
> >
> > > --- /dev/null
> > > +++ b/include/linux/early_times.h
> > > @@ -0,0 +1,48 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +
> > > +#ifndef _KERNEL_PRINTK_EARLY_TIMES_H
> > > +#define _KERNEL_PRINTK_EARLY_TIMES_H
> > > +
> > > +#include <linux/timex.h>
> > > +
> > > +#if defined(CONFIG_EARLY_PRINTK_TIMES)
> > > +extern u32 early_mult, early_shift;
> > > +extern u64 early_ts_offset;
> > > +
> > > +static inline u64 early_cycles(void)
> > > +{
> > > +       return ((u64)get_cycles() | (1ULL << 63));
> >
> > No need to cast to u64, as the second operand of the OR is u64 anyway.
> > BIT_ULL(63)
> >
> > I think it would be good to have a #define for this at the top.
>
> I'll look at this.  Is BIT_ULL(63) preferred over (1ULL << 63)?

When you refer to the bit value, yes: BIT() for unsigned long, BIT_ULL()
for unsigned long long; recently we got BIT_U{8,16,32,64}(), too).

> Do you think something like "HIGH_BIT63" would be good enough?

I'd name it for what it means, not what it does, e.g. EARLY_TS_FLAG?

> > > +}
> > > +
> > > +static inline u64 adjust_early_ts(u64 ts)
> > > +{
> > > +       /* High bit means ts is a cycle count */
> > > +       if (unlikely(ts & (1ULL << 63)))
> > > +               /*
> > > +                * mask high bit and convert to ns
> > > +                * Note that early_mult may be 0, but that's OK because
> > > +                * we'll just multiply by 0 and return 0. This will
> > > +                * only occur if we're outputting a printk message
> > > +                * before the calibration of the early timestamp.
> > > +                * Any output after user space start (eg. from dmesg or
> > > +                * journalctl) will show correct values.
> > > +                */
> > > +               return (((ts & ~(1ULL << 63)) * early_mult) >> early_shift);
> >
> > Please use the mul_u64_u32_shr() helper.
> OK.  I did not know about that.
>
> I can check, but do you know offhand if timestamps from local_clock() on 32-bit systems are
> always 64-bit nanoseconds?  I assume so looking at the printk code and
> making some assumptions.  (But that's dangerous.)

I am not 100% sure, but I think they are.  Note that on systems
without high-resolution timers, they may increment in large steps,
e.g. by 10000000 if HZ=100.

> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -777,6 +777,18 @@ config IKHEADERS
> > >           or similar programs.  If you build the headers as a module, a module called
> > >           kheaders.ko is built which can be loaded on-demand to get access to headers.
> > >
> > > +config EARLY_PRINTK_TIMES
> > > +       bool "Show non-zero printk timestamps early in boot"
> > > +       default y
> > > +       depends on PRINTK
> > > +       depends on ARM64 || X86_64
> >
> > So for now this is limited to (a few) 64-bit platforms...
>
> Yes, but it really shouldn't be.  I got spooked when 0-day told me that the code
> wouldn't link on powerpc, so I restricted it to just machines I was actually testing.
> But this should work on some ARM32 and most x8632 platforms.  Actually, it should
> work on anything that has a cycle-counter from kernel start (some RISC machine
> might qualify as well).  However, I've seen a few cases where some platforms require
> kernel initialization of their cycle-counter, and I wanted to play it safe.
>
> If such platforms are well-behaved and return 0 before they are initialized, it should
> still be safe to turn this on - it just won't have any effect.

At least on m68k, get_cycles() always returns zero ;-)

> I plan to do some more investigation of the powerpc error.  It was
> powerpc-linux-ld: init/main.o: in function `kernel_init':
> main.c:(.ref.text+0x144): undefined reference to `__udivdi3'
>
> from the definition of clocks_calc_mult_shift(), which seems to indicate a bug
> in the powerpc code.  In the long run, I should try to track down that bug rather than
> exclude a bunch of other (likely-working) arches.  But I was playing it conservative for now.

An undefined reference to __udivdi3 means you are using a 64-by-32
division, for which you should always use the helpers from
<linux/math64.h>.  Even on 64-bit, the helpers may generate better code.

> > > --- a/init/main.c
> > > +++ b/init/main.c

> > > +
> > > +       /* set calibration data for early_printk_times */
> > > +       end_cycles = get_cycles();
> > > +       end_ns = local_clock();
> > > +       clocks_calc_mult_shift(&early_mult, &early_shift,
> > > +               ((end_cycles - start_cycles) * NSEC_PER_SEC)/(end_ns - start_ns),
> > > +               NSEC_PER_SEC, 50);
> >
> > mul_u64_u64_div_u64() is probably the best helper that is available
> > (there is no mul_ulong_u32_div_u64()).
>
> What would the mul_u64_u64_div_u64 do if cycles_t is u32?
> Should it sill all work, just not optimized?

It should still work.
arch/x86/include/asm/div64.h uses divq, so it is up to Intel or AMD.
Everything else uses lib/math/div64.c.
If need, you can add an optimized version for e.g. arm64, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
