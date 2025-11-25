Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9645038
	for <linux-embedded@vger.kernel.org>; Tue, 25 Nov 2025 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764048667; cv=none; b=W0AZTCZff43zjR24xj8hFzHtBptdd2wqMW/MwyeyFzv2YZUHI3VPD5nttO90W/j6sUxa2+SaXN4rl6lunwTGqBFewTNSQ0gCVvGtl4OyguVwp3oenVQCrsZPJ6FFWfNN4fQJtx20Zf/ZSERsB9Ki93WzUAZeQT4pT1sgnC1dDB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764048667; c=relaxed/simple;
	bh=+yYjUmnj6nEFsXSez7xReWVt5mpezVyOi41imfihGf0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=aTODQt3jl3YVAYzQWuXaWsNUfeDvk3RmM2vzkhkI7Nz9zQBzadUsjusFoldPrEYZgwsgk/UBc11OG9YmwXCy7ZUvzXL7KfTfFaVieo0epSC/RmuOqr/LpMmRDjivDKoQYAr95/7/URDd7Oea3cFoBFIAlXZC8o68Ae99gqXWuPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bird.org; spf=pass smtp.mailfrom=bird.org; dkim=pass (2048-bit key) header.d=bird.org header.i=@bird.org header.b=JuD3zOYT; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bird.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bird.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bird.org header.i=@bird.org header.b="JuD3zOYT"
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id NkarvVNdPKXDJNldfvAyVg; Tue, 25 Nov 2025 05:30:55 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id Nldev31CzFTDLNldevdaBK; Tue, 25 Nov 2025 05:30:54 +0000
X-Authority-Analysis: v=2.4 cv=VpsjA/2n c=1 sm=1 tr=0 ts=69253f0e
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=x9_XXp_OEDcA:10 a=z6gsHLkEAAAA:8
 a=SBsuaYn6f0ZY5w4ksnkA:9 a=QEXdDO2ut3YA:10 a=1pFLqwXjFGAq8ZY56IS9:22
 a=DJOYZ-_0m4U_SSI58lwB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bird.org;
	s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PZPa8DLQWAVN4cKNVyj0vBpIoZPcOa6CjTSRUUbWCJw=; b=JuD3zOYT6IxdBElutiS1SRAPMf
	WXAywwV/AFN/CVDXGMdsgbh42s6ZpLpUcSqQiV66clgb8WQBTK4OnZEACMn4VvaloEEPS/FTXawlB
	srjMKpCqZQIUUizvh4t4NmfDBxce+qcnzp/gJcNK+wHouqoe8u4ID8I1aY7D4Ul3Te5IvVySDtnWC
	MKb2UpJyuWHSbFP1kTYXYIx9rBdGhBeD9oouZuMxBy56CtxHCGBL5L3XSrVCuZOuTdqVNMmkf3DY6
	P7cj4pxD3T9Yw0TTg+Q4hBIZgJFI5RcSdFuIItv62vxNbtYHCWxZqH4dqrqtjZH9CFpsFRNi0/9RF
	bJpOFa7A==;
Received: from [66.118.46.62] (port=59340 helo=[10.0.1.61])
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <tim@bird.org>)
	id 1vNldd-00000001roD-1WuK;
	Mon, 24 Nov 2025 22:30:53 -0700
Message-ID: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
Date: Mon, 24 Nov 2025 22:30:52 -0700
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: pmladek@suse.com, Steve Rostedt <rostedt@goodmis.org>,
 john.ogness@linutronix.de, senozhatsky@chromium.org
Cc: Tim Bird <Tim.Bird@sony.com>, Andrew Morton <akpm@linux-foundation.org>,
 Francesco Valla <francesco@valla.it>, LKML <linux-kernel@vger.kernel.org>,
 Linux Embedded <linux-embedded@vger.kernel.org>
From: Tim Bird <tim@bird.org>
Subject: [PATCH] printk: add early_counter_ns routine for printk blind spot
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2044.hostmonster.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bird.org
X-BWhitelist: no
X-Source-IP: 66.118.46.62
X-Source-L: No
X-Exim-ID: 1vNldd-00000001roD-1WuK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([10.0.1.61]) [66.118.46.62]:59340
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKoNovvgwEXf+MTcGHzgLVM2hnvG/tK+xQOEnUHCrAE90B2N58QOiAm4y1ypJEIIcmfvs21UUROBod4uWqphgaD8jNzito8EvZHKhUsJuSF5ZTa+yeXg
 vyxfd1sqCb6KLuoFMNGTQKzLYUoBDiCAYeJkiZDGvLOJsDEEFlFcGU0zKMJiVx1z+hRQ5Kty9+F/zcareJFiTLp1sghNKberINw=

From: Tim Bird <tim.bird@sony.com>

During early boot, printk timestamps are reported as zero,
which creates a blind spot in early boot timings.  This blind
spot hinders timing and optimization efforts for code that
executes before time_init(), which is when local_clock() is
initialized sufficiently to start returning non-zero timestamps.
This period is about 400 milliseconds for many current desktop
and embedded machines running Linux.

Add an early_counter_ns function that returns nanosecond
timestamps based on get_cycles().  get_cycles() is operational
on arm64 and x86_64 from kernel start.  Add some calibration
printks to allow setting configuration variables that are used
to convert cycle counts to nanoseconds (which are then used
in early printks).  Add CONFIG_EARLY_COUNTER_NS, as well as
some associated conversion variables, as new kernel config
variables.

After proper configuration, this yields non-zero timestamps for
printks from the very start of kernel execution.  The timestamps
are relative to the start of the architecture-specific counter
used in get_cycles (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
This means that the time reported reflects time-from-power-on for
most embedded products.  This is also a useful data point for
boot-time optimization work.

Note that there is a discontinuity in the timestamp sequencing
when standard clocks are finally initialized in time_init().
The printk timestamps are thus not monotonically increasing
through the entire boot.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 init/Kconfig           | 47 ++++++++++++++++++++++++++++++++++++++++++
 init/main.c            | 25 ++++++++++++++++++++++
 kernel/printk/printk.c | 15 ++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49..5352567c43ed 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -770,6 +770,53 @@ config IKHEADERS
 	  or similar programs.  If you build the headers as a module, a module called
 	  kheaders.ko is built which can be loaded on-demand to get access to headers.
 
+config EARLY_COUNTER_NS
+	bool "Use counter for early printk timestamps"
+	default y
+	depends on PRINTK
+	help
+	  Use a cycle-counter to provide printk timestamps during early
+	  boot.  This allows seeing timing information that would
+	  otherwise be displayed with 0-valued timestamps.
+
+	  In order for this to work, you need to specify values for
+	  EARLY_COUNTER_MULT and EARLY_COUNTER_SHIFT, used to convert
+	  from the cycle count to nanoseconds.
+
+config EARLY_COUNTER_MULT
+	int "Multiplier for early cycle counter"
+	depends on PRINTK && EARLY_COUNTER_NS
+	default 1
+	help
+	  This value specifies a multiplier to be used when converting
+	  cycle counts to nanoseconds.  The formula used is:
+		  ns = (cycles * mult) >> shift
+
+	  Use a multiplier that will bring the value of (cycles * mult)
+	  to near a power of two, that is greater than 1000.  The
+	  nanoseconds returned by this conversion are divided by 1000
+	  to be used as the printk timestamp counter (with resolution
+	  of microseconds).
+
+	  As an example, for a cycle-counter with a frequency of 200 Mhz,
+	  the multiplier would be: 10485760, and the shift would be 21.
+
+config EARLY_COUNTER_SHIFT
+	int "Shift value for early cycle counter"
+	range 0 63
+	depends on PRINTK && EARLY_COUNTER_NS
+	default 0
+	help
+	  This value specifies a shift value to be used when converting
+	  cycle counts to nanoseconds.  The formula used is:
+		  ns = (cycles * mult) >> shift
+
+	  Use a shift that will bring the result to a value
+	  in nanoseconds.
+
+	  As an example, for a cycle-counter with a frequency of 200 Mhz,
+	  the multiplier would be: 10485760, and the shift would be 21.
+
 config LOG_BUF_SHIFT
 	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
 	range 12 25
diff --git a/init/main.c b/init/main.c
index 07a3116811c5..587aaaad22d1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -105,6 +105,8 @@
 #include <linux/ptdump.h>
 #include <linux/time_namespace.h>
 #include <net/net_namespace.h>
+#include <linux/timex.h>
+#include <linux/sched/clock.h>
 
 #include <asm/io.h>
 #include <asm/setup.h>
@@ -906,6 +908,8 @@ static void __init early_numa_node_init(void)
 #endif
 }
 
+static u64 start_cycles, start_ns;
+
 asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
 void start_kernel(void)
 {
@@ -1023,6 +1027,10 @@ void start_kernel(void)
 	timekeeping_init();
 	time_init();
 
+	/* used to calibrate early_counter_ns */
+	start_cycles = get_cycles();
+	start_ns = local_clock();
+
 	/* This must be after timekeeping is initialized */
 	random_init();
 
@@ -1474,6 +1482,8 @@ void __weak free_initmem(void)
 static int __ref kernel_init(void *unused)
 {
 	int ret;
+	u64 end_cycles, end_ns;
+	u32 early_mult, early_shift;
 
 	/*
 	 * Wait until kthreadd is all set-up.
@@ -1505,6 +1515,21 @@ static int __ref kernel_init(void *unused)
 
 	do_sysctl_args();
 
+	/* show calibration data for early_counter_ns */
+	end_cycles = get_cycles();
+	end_ns = local_clock();
+	clocks_calc_mult_shift(&early_mult, &early_shift,
+		((end_cycles - start_cycles) * NSEC_PER_SEC)/(end_ns - start_ns),
+		NSEC_PER_SEC, 50);
+
+#ifdef CONFIG_EARLY_COUNTER_NS
+	pr_info("Early Counter: start_cycles=%llu, end_cycles=%llu, cycles=%llu\n",
+		start_cycles, end_cycles, (end_cycles - start_cycles));
+	pr_info("Early Counter: start_ns=%llu, end_ns=%llu, ns=%llu\n",
+		start_ns, end_ns, (end_ns - start_ns));
+	pr_info("Early Counter: MULT=%u, SHIFT=%u\n", early_mult, early_shift);
+#endif
+
 	if (ramdisk_execute_command) {
 		ret = run_init_process(ramdisk_execute_command);
 		if (!ret)
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5aee9ffb16b9..522dd24cd534 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2210,6 +2210,19 @@ static u16 printk_sprint(char *text, u16 size, int facility,
 	return text_len;
 }
 
+#ifdef CONFIG_EARLY_COUNTER_NS
+static inline u64 early_counter_ns(void)
+{
+	return ((u64)get_cycles() * CONFIG_EARLY_COUNTER_MULT)
+		>> CONFIG_EARLY_COUNTER_SHIFT;
+}
+#else
+static inline u64 early_counter_ns(void)
+{
+	return 0;
+}
+#endif
+
 __printf(4, 0)
 int vprintk_store(int facility, int level,
 		  const struct dev_printk_info *dev_info,
@@ -2239,6 +2252,8 @@ int vprintk_store(int facility, int level,
 	 * timestamp with respect to the caller.
 	 */
 	ts_nsec = local_clock();
+	if (!ts_nsec)
+		ts_nsec = early_counter_ns();
 
 	caller_id = printk_caller_id();
 
-- 
2.43.0

