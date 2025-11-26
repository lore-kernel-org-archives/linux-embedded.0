Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD763203AF
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764155630; cv=none; b=QVIWfIb/L/yqGyZUggKGSuA+9Ti8LRQBJVxD2DCBZf2gc6YnO/6FMOIIkc40KWL0f8ziYLs9CbB00Lmfou2UjR0840LYMMl+2XaAH3lO/REkT6342wNhjrcFSs5qneZj7voKS0YiK9M8TdcyiXnT1B/rNCJfypistDRWsPC/mcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764155630; c=relaxed/simple;
	bh=S8GlWCu436nhOyhnd0YbuXF+CdJTtt1rdF2/qZkfG/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awowSz+vejxdIfZGpEk4GHLJamDEdi1bcPGDIvGTiCbMbGRdX4iUOzfCJ1pXklYzIHXcunTGsrFZ/W9mEFteC1YBfAfbThKjgnbkiBOc5j6K2RBRB6Qx0j7PUMW3yUxS365rLkW3Pa677iKU4+H1kDN9OhJsrxyjTj2B+d/pOr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VhnKgoRR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VhnKgoRR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso5193455f8f.1
        for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764155624; x=1764760424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NNWyhnYZ9OnsLEWjekNWj4djMNP8Nn5HgSN7kIJrIFQ=;
        b=VhnKgoRRgTT36u5yg9X+9euK/m5X4+Q3voTmukecXi3rxZrt+qrGLbnoQPtvmbxr1k
         yMQAV/Sdr+zUgSaCTY/8KtPiSA+8kGzwp68oBXvVJeA1MGzv+BY2nCRbphyAn0O54Q6x
         Y2FICp8VHp71AKJV2RBmsEm86aHOkjcxzcrSnxaLAbaNY3d+J8gsqL4d+roIstDCvbFW
         xianht1EO00ICIIiX/Ep/AkaPsSAAhW2fBZY6hopXpH/Juv+ooJ4CuSAXum01WZcwpmG
         ulZ9c54m7M2Ukj36TFxuHlWs5RkN8g1IyHyYZsW5FM19uUAFqSuhGbCsLA3bIuKnuvcF
         VcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764155624; x=1764760424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNWyhnYZ9OnsLEWjekNWj4djMNP8Nn5HgSN7kIJrIFQ=;
        b=wLk5X8uGRR/K4CElCgGV9Utf4nmg/CJ6KUl87+3iW9EilUH58NQyr2XhUxTUYKChcD
         tjC2MCZ5x4p+4xNTs/1J/8zkAkOdkYy+AxZ8wbrzzjdCJMJMdZALxpKIWzxqJbO0dlgM
         Z7GoFSXSMn+DRVq9vynsyJqXan8w9Z2MILS15ywNqOK+9h7CoOiyATEToxF7In5Z5gVV
         g5dI9rtgSA+zCiYe8HlKzVgDlizq5q2n9LdHJPfiGbj+HoOxHrglmB4c7LM0F1J6NjZU
         zUgstQ8uR9+y+hVIkzu9JS5Nyreztgq9RfClO+scvApx8i+8Eii0CEqqY/o2t3IETmN8
         /y6w==
X-Forwarded-Encrypted: i=1; AJvYcCU9FclbYnVjVvR1jNuLcaLrpByz2zMuLDsdiRLYRFSD51Dm40m6A8lxkh/4Pl4sTWoXkjlUEGoVqpHELkZXDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYNedSZdDVlDrYHR3P/j+UjU5vyj7HMOlwP7Q4rdotBVER06f
	uMHnidzMh4gTo/fGTllBDEs/6mG0T/sbGd1AZBgqTFfsh9s6znbnzsNwQsoHjifpHvk=
X-Gm-Gg: ASbGncs21VacIPkLYiXwPR6NDDUnGL090yG2IttUjibtwr8AfUnngCTqbrfXYN79fQC
	b+1UfKiUQKr+BzLWvuWgd9IWewpDQPPgr9i4Vw2V2tiU3E7Hz/9SdlIiPPqqAcUd0cR5OgvY84I
	LjLj/gnjC8Dlawxn4UZnpDNrXk7n09Ca1eUTmsifC0Vniw2zqKGNM7g8WxjnAh4h1qTZEH3tkzi
	fzZdlBwb59oO0Qx/fNQjhZB5CWG79uFhugxOrETEWjDbT3ah0iUQOU+ontSM5xxnq8b+X4NwXr+
	YPZIZS7DmM6Qai2l6XbU378KYnxCaMgbSbhLS64hH48byQJERH7yD9Aoa27oDzU0o6XfH+RbV7L
	7Gnqfo5dmbRSlrcM6HDPRBYKAE6pliW62vCImGsfoe9rElDKUkRGCUMmbOLZvQyq9hQGWUZumdt
	C8HWa8Fco3rWaEyQ==
X-Google-Smtp-Source: AGHT+IGKDhGFzZ6Byl0uSF1s8jkIpHX3HA6e165X69dPSHGUHzvYAbv5VGOdpKWDQO4sBkphVW39eg==
X-Received: by 2002:a05:6000:186a:b0:429:c0f1:fd38 with SMTP id ffacd0b85a97d-42e0f35a948mr7068529f8f.59.1764155624111;
        Wed, 26 Nov 2025 03:13:44 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8a29sm40525088f8f.30.2025.11.26.03.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 03:13:43 -0800 (PST)
Date: Wed, 26 Nov 2025 12:13:41 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tim Bird <tim@bird.org>
Cc: Steve Rostedt <rostedt@goodmis.org>, john.ogness@linutronix.de,
	senozhatsky@chromium.org, Tim Bird <Tim.Bird@sony.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Francesco Valla <francesco@valla.it>,
	LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Re: [PATCH] printk: add early_counter_ns routine for printk blind
 spot
Message-ID: <aSbg5b-lAJiXdif-@pathway.suse.cz>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>

Adding some people from the time subsystem into Cc.
Please, keep them in the loop in the eventual next version of the
patch.

For the new people, please note the discussion has already started,
see
https://lore.kernel.org/r/39b09edb-8998-4ebd-a564-7d594434a981@bird.org

Best Regards,
Petr

On Mon 2025-11-24 22:30:52, Tim Bird wrote:
> From: Tim Bird <tim.bird@sony.com>
> 
> During early boot, printk timestamps are reported as zero,
> which creates a blind spot in early boot timings.  This blind
> spot hinders timing and optimization efforts for code that
> executes before time_init(), which is when local_clock() is
> initialized sufficiently to start returning non-zero timestamps.
> This period is about 400 milliseconds for many current desktop
> and embedded machines running Linux.
> 
> Add an early_counter_ns function that returns nanosecond
> timestamps based on get_cycles().  get_cycles() is operational
> on arm64 and x86_64 from kernel start.  Add some calibration
> printks to allow setting configuration variables that are used
> to convert cycle counts to nanoseconds (which are then used
> in early printks).  Add CONFIG_EARLY_COUNTER_NS, as well as
> some associated conversion variables, as new kernel config
> variables.
> 
> After proper configuration, this yields non-zero timestamps for
> printks from the very start of kernel execution.  The timestamps
> are relative to the start of the architecture-specific counter
> used in get_cycles (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> This means that the time reported reflects time-from-power-on for
> most embedded products.  This is also a useful data point for
> boot-time optimization work.
> 
> Note that there is a discontinuity in the timestamp sequencing
> when standard clocks are finally initialized in time_init().
> The printk timestamps are thus not monotonically increasing
> through the entire boot.
> 
> Signed-off-by: Tim Bird <tim.bird@sony.com>
> ---
>  init/Kconfig           | 47 ++++++++++++++++++++++++++++++++++++++++++
>  init/main.c            | 25 ++++++++++++++++++++++
>  kernel/printk/printk.c | 15 ++++++++++++++
>  3 files changed, 87 insertions(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index cab3ad28ca49..5352567c43ed 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -770,6 +770,53 @@ config IKHEADERS
>  	  or similar programs.  If you build the headers as a module, a module called
>  	  kheaders.ko is built which can be loaded on-demand to get access to headers.
>  
> +config EARLY_COUNTER_NS
> +	bool "Use counter for early printk timestamps"
> +	default y
> +	depends on PRINTK
> +	help
> +	  Use a cycle-counter to provide printk timestamps during early
> +	  boot.  This allows seeing timing information that would
> +	  otherwise be displayed with 0-valued timestamps.
> +
> +	  In order for this to work, you need to specify values for
> +	  EARLY_COUNTER_MULT and EARLY_COUNTER_SHIFT, used to convert
> +	  from the cycle count to nanoseconds.
> +
> +config EARLY_COUNTER_MULT
> +	int "Multiplier for early cycle counter"
> +	depends on PRINTK && EARLY_COUNTER_NS
> +	default 1
> +	help
> +	  This value specifies a multiplier to be used when converting
> +	  cycle counts to nanoseconds.  The formula used is:
> +		  ns = (cycles * mult) >> shift
> +
> +	  Use a multiplier that will bring the value of (cycles * mult)
> +	  to near a power of two, that is greater than 1000.  The
> +	  nanoseconds returned by this conversion are divided by 1000
> +	  to be used as the printk timestamp counter (with resolution
> +	  of microseconds).
> +
> +	  As an example, for a cycle-counter with a frequency of 200 Mhz,
> +	  the multiplier would be: 10485760, and the shift would be 21.
> +
> +config EARLY_COUNTER_SHIFT
> +	int "Shift value for early cycle counter"
> +	range 0 63
> +	depends on PRINTK && EARLY_COUNTER_NS
> +	default 0
> +	help
> +	  This value specifies a shift value to be used when converting
> +	  cycle counts to nanoseconds.  The formula used is:
> +		  ns = (cycles * mult) >> shift
> +
> +	  Use a shift that will bring the result to a value
> +	  in nanoseconds.
> +
> +	  As an example, for a cycle-counter with a frequency of 200 Mhz,
> +	  the multiplier would be: 10485760, and the shift would be 21.
> +
>  config LOG_BUF_SHIFT
>  	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
>  	range 12 25
> diff --git a/init/main.c b/init/main.c
> index 07a3116811c5..587aaaad22d1 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -105,6 +105,8 @@
>  #include <linux/ptdump.h>
>  #include <linux/time_namespace.h>
>  #include <net/net_namespace.h>
> +#include <linux/timex.h>
> +#include <linux/sched/clock.h>
>  
>  #include <asm/io.h>
>  #include <asm/setup.h>
> @@ -906,6 +908,8 @@ static void __init early_numa_node_init(void)
>  #endif
>  }
>  
> +static u64 start_cycles, start_ns;
> +
>  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
>  void start_kernel(void)
>  {
> @@ -1023,6 +1027,10 @@ void start_kernel(void)
>  	timekeeping_init();
>  	time_init();
>  
> +	/* used to calibrate early_counter_ns */
> +	start_cycles = get_cycles();
> +	start_ns = local_clock();
> +
>  	/* This must be after timekeeping is initialized */
>  	random_init();
>  
> @@ -1474,6 +1482,8 @@ void __weak free_initmem(void)
>  static int __ref kernel_init(void *unused)
>  {
>  	int ret;
> +	u64 end_cycles, end_ns;
> +	u32 early_mult, early_shift;
>  
>  	/*
>  	 * Wait until kthreadd is all set-up.
> @@ -1505,6 +1515,21 @@ static int __ref kernel_init(void *unused)
>  
>  	do_sysctl_args();
>  
> +	/* show calibration data for early_counter_ns */
> +	end_cycles = get_cycles();
> +	end_ns = local_clock();
> +	clocks_calc_mult_shift(&early_mult, &early_shift,
> +		((end_cycles - start_cycles) * NSEC_PER_SEC)/(end_ns - start_ns),
> +		NSEC_PER_SEC, 50);
> +
> +#ifdef CONFIG_EARLY_COUNTER_NS
> +	pr_info("Early Counter: start_cycles=%llu, end_cycles=%llu, cycles=%llu\n",
> +		start_cycles, end_cycles, (end_cycles - start_cycles));
> +	pr_info("Early Counter: start_ns=%llu, end_ns=%llu, ns=%llu\n",
> +		start_ns, end_ns, (end_ns - start_ns));
> +	pr_info("Early Counter: MULT=%u, SHIFT=%u\n", early_mult, early_shift);
> +#endif
> +
>  	if (ramdisk_execute_command) {
>  		ret = run_init_process(ramdisk_execute_command);
>  		if (!ret)
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 5aee9ffb16b9..522dd24cd534 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2210,6 +2210,19 @@ static u16 printk_sprint(char *text, u16 size, int facility,
>  	return text_len;
>  }
>  
> +#ifdef CONFIG_EARLY_COUNTER_NS
> +static inline u64 early_counter_ns(void)
> +{
> +	return ((u64)get_cycles() * CONFIG_EARLY_COUNTER_MULT)
> +		>> CONFIG_EARLY_COUNTER_SHIFT;
> +}
> +#else
> +static inline u64 early_counter_ns(void)
> +{
> +	return 0;
> +}
> +#endif
> +
>  __printf(4, 0)
>  int vprintk_store(int facility, int level,
>  		  const struct dev_printk_info *dev_info,
> @@ -2239,6 +2252,8 @@ int vprintk_store(int facility, int level,
>  	 * timestamp with respect to the caller.
>  	 */
>  	ts_nsec = local_clock();
> +	if (!ts_nsec)
> +		ts_nsec = early_counter_ns();
>  
>  	caller_id = printk_caller_id();
>  
> -- 
> 2.43.0
