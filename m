Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0D28E0F;
	Wed, 26 Nov 2025 02:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764123866; cv=pass; b=Nug7Ul/4Eu/BMbf9LqOvegZMTTd4WJ5QiyKJC/tPbx6T4+NgzyRF56nvMxMMtrIDGv0UyojRPMHCPk4BRzKgrBqh6fK5VSuBDwGBPZAI4+cr0ONRu2aWm8XDGDJKXFJCQ5kRnU+0MJQQahJZMChHzH+Py/B2B9VMGhYYhQ0Uhso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764123866; c=relaxed/simple;
	bh=x+KhN09hImtwWDjzDfa1bG6kYamw8/6E2KGdH6hULxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGRH1EbdJ1yreLhpOI/Db9kMy42HbdSAGjq3JQAuXwqQh58hTobO5wOBMvdUa0gJ+AfnmHryZMhZZ8Ar1k/XfB4FSkcIXwRUrToZObNY7mqLxoMiqnnmP2lxp1HFQIpU5yblup8dPVYTju9K6ciaZKYbbyykEm/LE3/bvKfxVjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=IaJv+LRY; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=XXEDXNsw; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="IaJv+LRY";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="XXEDXNsw"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-9d2x.prod.antispam.mailspamprotection.com; s=arckey; t=1764123863;
	 b=oZb8ChIZWb9gwM0iPEnx9cPsGCxJ0bOp6o7nJjJN5CZ52HvvPYax2UDoLbMMUmcL6r8f1soPxg
	  r0lwuXwQOThyK8PoBhtCd3FEa9KbJ+UXTfdcekEhFusSUxk7NzuK6EG6MmXlsFdsfY72iO3GMU
	  /G5Dk2IDRB/fnUoOh6iQQTIrWLOhyl5yQNiR5QSHbNXbnS+nC4vL13sM+YzPFrBTzlBBQkUVsL
	  RrJmq2TmnhAvyZlAWeoKOGpSQq4tZEQZSxThvabkROtF+uIa/TN4Q+Rc5swGdLa9vwRZP5F1kU
	  +ia+aexQuF+xUMDBi7zUv/sAECXOOBNSUbdpor1qAYhT+Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-9d2x.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-9d2x.prod.antispam.mailspamprotection.com; s=arckey; t=1764123863;
	bh=x+KhN09hImtwWDjzDfa1bG6kYamw8/6E2KGdH6hULxA=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=hJMaBRRIoesFk8SRv9VSj1fDIaaHTGZN2YLIs2Po/vZtxeLpZxKO3lUdDSytfVtlC57rIA5AKv
	  Y3j+hLnOiZzxiC8nMuln2NvXSUv4i+92WV2aQgsp5E6UsBhyjiftpbyV89DqJOTaD5jAAvqv3k
	  CCG+lC+bsiE2W71EIEoLnJX69h8Xj6At37kXaIAl1LUFb9nxfuu7uWVwvsCpIwFiuTotAdKYr4
	  lZmhAGP2mLD0cK1j5l8Dt9qnU/pgbWc0kIrDwFjfP4zRd8lubqOQDhkp6/v7YbOqn5jzUHI1qR
	  PqJsORJ/ANh4aOSIZGvRgOKqiAhntYvmKDM6xQhrT3m34g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=u8tG11G73a7tlmYTWvXeMlC1Gtcn2tQ8TV8pJaNXtrU=; b=IaJv+LRYq3vTtIsu+oP/71Urw8
	zzf2MI9oRVqY5IBxnlagkU+0OJlO3b7msCHrZFG4PLOEuDV5G46Y6B/u/1QLBfbIzmUumou+nPHgF
	kLGlJwblpVLNTcJJ+KB6fpJQeaS131TtBZs6AVU8upl8g9DeVUUNLAmCeYSDVQ8VZJCY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-6b6v.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vNsms-0000000Bx5F-1lQe;
	Tue, 25 Nov 2025 13:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=u8tG11G73a7tlmYTWvXeMlC1Gtcn2tQ8TV8pJaNXtrU=; b=XXEDXNsw1H4LTE35Pp8dhfacSx
	zqOb8UgDgvWW2TdUpPEiyw0trofmOH8Us2JgRD5K64IizEXcL1r+oPSPzCOqrrGgu6RSxzJ7Myt1P
	4/B/H8VCh3duLVL0dAcJsyAV7CmYKjK78DO+KSMJamEL8s9ivhTRc6WN0oRKu48rgJSo=;
Received: from [82.59.186.57] (port=62570 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vNsmf-00000000KVQ-3Zid;
	Tue, 25 Nov 2025 13:08:41 +0000
Date: Tue, 25 Nov 2025 14:08:40 +0100
From: Francesco Valla <francesco@valla.it>
To: Tim Bird <tim@bird.org>
Cc: pmladek@suse.com, Steve Rostedt <rostedt@goodmis.org>,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	Tim Bird <Tim.Bird@sony.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Re: [PATCH] printk: add early_counter_ns routine for printk blind
 spot
Message-ID: <aSWqWD1BQ-m-Zy9C@bywater>
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 60623e88ba694b0b51ff7bb19ae39e19
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vNsms-0000000Bx5F-1lQe-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-9d2x.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Tim,

I tested this on my i.MX93 FRDM (arm64) board and after a bit of
fiddling with the MULT/SHIFT values I got it working. It can be a very
valuable addition.

Some comments follow.

On Mon, Nov 24, 2025 at 10:30:52PM -0700, Tim Bird wrote:
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

This is... not going to work, IMO, and might lead to breakages in
userspace tools (are printk timings a userspace API?).

I actually have a counter-proposal: the time obtained through cycle
evaluation is used as an offset to be added to the printk time after
time_init() is called. A (working, but maybe sub-optimal) patch to
obtain this is attached at the end.

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

If I got this correclty:

	EARLY_COUNTER_MULT = (10^9 / freq) << EARLY_COUNTER_SHIFT

where EARLY_COUNTER_SHIFT can be chosen at will, provided it is big
enough to survice the ns->us conversion but small enough not to overflow
the u64 container. 

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

I don't get the need to have these here - should they be an help for the
integrator to calibrate and choose EARLY_COUNTER_MULT and
EARLY_COUNTER_SHIFT? The ns values printed here have some meaning only if
these two parameters are already set correctly in the first place -
what's the foreseen calibration procedure?

Moreover, if they are only required for calibration, maybe pr_debugi()
would be a better choice?

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
> 
> 

Best regards,

Francesco

---

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 522dd24cd534..b4108f215c5e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2216,11 +2216,26 @@ static inline u64 early_counter_ns(void)
 	return ((u64)get_cycles() * CONFIG_EARLY_COUNTER_MULT)
 		>> CONFIG_EARLY_COUNTER_SHIFT;
 }
+
+static u64 early_counter_ns_offset(void)
+{
+	static u64 early_counter_ns_start = 0;
+
+	if (!early_counter_ns_start)
+		early_counter_ns_start = early_counter_ns();
+
+	return early_counter_ns_start;
+}
 #else
 static inline u64 early_counter_ns(void)
 {
 	return 0;
 }
+
+static inline u64 early_counter_ns_offset(void)
+{
+	return 0;
+}
 #endif
 
 __printf(4, 0)
@@ -2254,6 +2269,8 @@ int vprintk_store(int facility, int level,
 	ts_nsec = local_clock();
 	if (!ts_nsec)
 		ts_nsec = early_counter_ns();
+	else
+		ts_nsec += early_counter_ns_offset();
 
 	caller_id = printk_caller_id();

