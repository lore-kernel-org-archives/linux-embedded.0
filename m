Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501C53BAD95
	for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422267; cv=none; b=J6c5GSOswS+xe7nEqtqWuqPRCzTG3aAbuNOw3KTb9At31B7kFTrsLeyFUWnhiesUKSMUT6HHBCVuGHNdcsLQj904Z+Qa0R/XXR4mX71SJiNh8dS2jRdzLxRkcFivbIE+xB5wvj3eEaEgr2dGeYfzxjYvNU6aFe1Jb0SL0GCA63Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422267; c=relaxed/simple;
	bh=MYdqFtDGO5Jur2DlfhQGrNDGBfzJhmaMJBUU7ueGzfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaENMCbOtjVlHMbm0mPCIjmQ4AzwFrQpsGPRqo44o/AvnlLUullim0ffYd40SHUO8S6oX5DO6d279ZT+xLKvTEW1oT8FnzewgGyH6BEwJw4voFBPGk1/3iPfO2FpWqHj9bzmbjFWZWJ7Rzp+TWxTvdwUccjN7GrbcPQuWZOeFPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ETaWY19g; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ETaWY19g"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so8062635e9.2
        for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776422258; x=1777027058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tv1i7Gd48Cnod7F4GCr1hVp16bcU9WsjF0Z3Mbm/gt4=;
        b=ETaWY19gkmjwa747KYIZogx+KjlnsrZmX1XOWAJH/X0r9wylVgTU+Jooy9MKJtCeQi
         hb0p8UFHC0AqxlSTERYuonfoEV62n0rMjO1XWAa7x2OjKr6u+sjiVDnPLj+bouY3YNXt
         NH9i6K216ouCbT7hQT8diCPywdg103mwLbpPScUR3cWk+gY6tZYXi6WqtXR8ZzkaLYvQ
         o8fgP9xyztjG1Qw3XTnZUegW3f0na1b5BWSd5dnPqUPAzYj36i1nbEF9FfsBLbChOQqd
         8ZOXQOAgmuxIxTk/0vz6V2AOTWlyR6Qt1yfYtRDkR/V/f3RWvqlHKWQdB+ZLZ6DReGn7
         QTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776422258; x=1777027058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tv1i7Gd48Cnod7F4GCr1hVp16bcU9WsjF0Z3Mbm/gt4=;
        b=LoEW7VDx9Cb4biELcygBXXLCdPGjEmnwQihftiKilGoROrC91aYmrkqoTxfnMr7jUg
         dgmrwtwtmoB59YI1iU6t8fF6GECzOhXzIHXJlPXgTq02yrx6BrfZulVxdiBGDGunofq8
         3pW6IO2LOQMgJ9+fJFfNOzxN7K8ZYZLHrh27GElFk6vvN9yUmaHCZ+xPG64D2AbxG8H4
         JEj2nR+Y+r8DoWj8McJ/Kz5c/nXiunkfi0zvhAFVSDQvNFrvO76IVG+crS2O1x49KkYl
         KA+x1LbJN0Ckte6IOkchmSfJSnAGwica2HlaKSJSpHBAIJCct/kAoJKxjHcz3fAYqD5H
         qS/w==
X-Forwarded-Encrypted: i=1; AFNElJ8lW8eQzWyCjzq/rv7gb9lyOAbqgZGk8sklcEid0S6/XXOYitIJlRAg2MTF3nGtA5dyxXBRcSZaNpKen+z4Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyroCV/vDIvKEkPvEr2kBbgUvU/6YJnMy/DOk1Ic5oh82ItETGZ
	2fQbRSqsCZL9CMqpYm5YjPIm5Gkr8tVtR5n7cabyIsvztn6uh89dtkd2CknCg1tGOtw=
X-Gm-Gg: AeBDietKl4exx2nAYAoxaNZc1UM29UW2WLph8CnzrnJAQg8BGz/5bmI0EEodn3+l0ED
	Yi/V56UU37DmNw5umIiwCeJ0P8Y5DwGnej5Wr5KUXNtNOQdXsGPWaF52gRPMHlhLrp0oT2JA5VO
	E4CJxudHHrlJ83mxSVReVMG6iXX57if2fO9GR4iBVawVhHclpekTgKCYj9pL1hujB5FrCBixNa3
	TeS+Lj0IMN+/Qkv9zCNvPFzvD9WJQDcYJRbufcLPAhQiJyosmSW68VBjSBXoh8aqjkYoLWxlRPa
	9YIkpYpd1ychUdTcbfjUchMTUvKGnVBzlkTxUx7bYE+ScfEiQ0XBExvjA3k45OO8ECUE7S1R67R
	Dsx3TPZu+hJud308qjJ9vpSywkBF6kt8H9ntZdPlrpWZLiwLDUjGS78ARQ50d18dRgcSlX0hxFX
	9IhBwi+1ojNhv3S7jWDnqLSlyZH8WWPxLdsHdH
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488fb7880camr31472095e9.23.1776422258295;
        Fri, 17 Apr 2026 03:37:38 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb735d3dsm29077305e9.2.2026.04.17.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:37:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 12:37:35 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	francesco@valla.it, geert@linux-m68k.org,
	shashankbalaji02@gmail.com, linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Message-ID: <aeINb8-a83R3QDXd@pathway.suse.cz>
References: <20260410203741.997410-1-tim.bird@sony.com>
 <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzohdv6i.ffs@tglx>

Adding Brian into Cc.

On Wed 2026-04-15 00:38:29, Thomas Gleixner wrote:
> On Fri, Apr 10 2026 at 14:37, Tim Bird wrote:
> > +
> > +#include <linux/timekeeping.h>
> > +#ifdef CONFIG_ARM64
> > +#include <asm/sysreg.h>
> > +#endif
> > +
> > +#ifdef CONFIG_EARLY_CYCLES_KHZ
> > +static inline u64 early_unsafe_cycles(void)
> > +{
> > +#if defined(CONFIG_X86_64)
> > +	/*
> > +	 * This rdtsc may happen before secure TSC is initialized, and
> > +	 * it is unordered. So please don't use this value for cryptography
> > +	 * or after SMP is initialized.
> > +	 */
> > +	return rdtsc();
> > +#elif defined(CONFIG_ARM64)
> > +	return read_sysreg(cntvct_el0);
> > +#elif defined(CONFIG_RISCV_TIMER)
> > +	u64 val;
> > +
> > +	asm volatile("rdtime %0" : "=r"(val));
> > +	return val;
> > +#else
> > +	return 0;
> > +#endif
> > +}
> 
> No. Generic code and generic headers have no business to implement any
> architecture specific code and there is zero justification for
> architecture specific #ifdefs in generic code.

Yeah, this looks a bit wild.

> > +/* returns a nanosecond value based on early cycles */
> > +static inline u64 early_times_ns(void)
> > +{
> > +	if (CONFIG_EARLY_CYCLES_KHZ)
> > +		/*
> > +		 * Note: the multiply must precede the division to avoid
> > +		 * truncation and loss of resolution
> > +		 * Don't use fancier MULT/SHIFT math here.  Since this is
> > +		 * static, the compiler can optimize the math operations.
> > +		 */
> > +		return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
> 
> This code will result in a division by zero warning from any reasonable
> compiler because this is evaluated _before_ it is eliminated.
> 
> > @@ -2294,6 +2295,8 @@ int vprintk_store(int facility, int level,
> >  	 * timestamp with respect to the caller.
> >  	 */
> >  	ts_nsec = local_clock();
> > +	if (unlikely(!ts_nsec))
> > +		ts_nsec = early_times_ns();
> 
> I explained to you how this wants to be implemented to be useful and you
> declared that you are unwilling to put the effort in.
> 
> My NAK for this disgusting and tasteless hack still applies.
> 
> Either you are willing to work with the community and the relevant
> maintainers or you can keep your hackery maintained out of tree for
> those who care about it and are willing to ignore the fallout. 

The discussion went wild and is full of emotions.

Let me summarize my understanding:

There are people who try to optimize boot times. Tim is one
of them. He used an out-of-tree patch for many years. He decided
to share it to make the life easier for others.

Tim's original approach was trivial [Tim1]. IMHO, he used a cycle counter
with a stable frequency and hardcoded the computation to timestamps.
It opened discussion how to integrate it better:

   1. Avoid hard coded value in Kconfig by some calibration [Tim2][Tim3]
      One hardcoded value is back in [Tim4] for simplicity.

   2. Avoid jump in the timestamps when timekeeping is allowed.
      It was partly removed in [v2][v3] by already "calibrated"
      timestamps read by userspace (syslog, /dev/kmsg). Again,
      this approach was removed in v4 for simplicity.

  Pros of v4:

      + very simple
      + gives some reasonably looking timestamps
      + might be good enough for the purpose

  Cons of v4:

      + hacky, does not compile in some case, ...
      + hardcoded value in config
      + jump in timestamps when timekeeping is initialized


Now, we have alternative approach by Thomas [Thomas1] which allows
to initialize time keeping on x86 ASAP:

   Pros:

      + clean and well integrated with timekeeping
      + no hard coded values in Kconfig
      + no jump in timestamps

   Cons:

      + need non-trivial changes for each supported architecture
      + no timestamps for the very early code (30ms on the measured x86_64)


My view:

Thomas' approach is great because it is clean integration, ...
but:

   1. I am not sure if the complexity is worth it. There are only few
      people (Tim's tip is 50) who are interested into the early
      boot times and all are developers.

   2. It does not cover the very early boot. And Brian mentioned
      a real life problem found in this area, see
      https://lore.kernel.org/all/acxx9Bt0N3nhtLgN@redhat.com/

      Steven mentioned getting the very early timestamps from
      the firmware, see
      https://lore.kernel.org/all/20260401111244.5057a89c@gandalf.local.home/
      But I am not sure how complicated it is. And if it
      does not need any special HW or so.


Tim's approach is interesting because of the simplicity
and might be good enough for the few (50) users.

I think that there are basically two problems with Tim's approach:

   1. It needs a reasonable API to get a cycle counter with
      a stable frequency.

      My understanding is that get_cycles() might be good enough.
      The only problem is that it the stability is not guaranteed
      and it is not calibrated.

      Would it help to rename it to get_bogo_cycles() ?


   2. The early timestamps provided by the bogo cycles
      are not synchronized with timestamps from
      the proper time keeping.

      Would it help to print a disclaimer, similar to,
      for example, trace_printk() first use?
      Something like:

[    0.002912] **********************************************************
[    0.002917] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
[    0.002921] **
[    0.002935] ** Using BOGO early timestamps
[    0.002939] **
[    0.002943] ** They are not properly calibrated and might use a source
[    0.002949] ** with an unstable frequency.
[    0.002953] **
[    0.002957] ** They are not comparable with timestamps after
[    0.002961] ** the timekeeping is initialized.
[    0.002966] **
[    0.002968] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
[    0.002971] *******************************************************
[    0.002975] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.002998] Linux version 7.0.0-rc6-v8+ (tbird@timdesk) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #20 SMP PREEMPT Fri Apr 10 11:57:48 MDT 2026
[    0.003002] KASLR enabled
[    0.003338] random: crng init done
[    0.003866] Machine model: Raspberry Pi 4 Model B Rev 1.5
[    0.004495] efi: UEFI not found.
...
[    0.183552] Root IRQ handler: gic_handle_irq
[    0.183561] GIC: Using split EOI/Deactivate mode
[    0.183699] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.183958] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
[    0.183952] arch_timer: cp15 timer running at 54.00MHz (phys).
[    0.183957] **********************************************************
[    0.183962] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
[    0.183967] **
[    0.183971] ** End of BOGO early timestamps
[    0.183976] **
[    0.183982] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
[    0.183989] **********************************************************
[    0.000000] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
[    0.000157] Console: colour dummy device 80x25
[    0.000165] printk: legacy console [tty1] enabled

My view is that it would be nice to make the life easier
for the 50 developers who do very useful work.

But we do not need to create and maintain any complicated
code for this. If the bogo cycles are good enough.
If they already have some users and have to stay anyway.
If we make it clear that the early timestamps are bogus...

IMHO, the main risk is that it won't be used just by the 50 developers
but it will get misused and open some can of worms. I think that
the risk might be acceptable but...

What do you think, please?
Am I too naive in this case?

[Tim1] https://lore.kernel.org/all/39b09edb-8998-4ebd-a564-7d594434a981@bird.org/
[Tim2] https://lore.kernel.org/all/20260124194027.713991-1-tim.bird@sony.com/
[Tim3] https://lore.kernel.org/all/20260210234741.3262320-1-tim.bird@sony.com/
[Tim4] https://lore.kernel.org/all/20260410203741.997410-1-tim.bird@sony.com/

[Thomas1] https://lore.kernel.org/all/87fr5ib6ks.ffs@tglx/

Best Regards,
Petr
