Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE226A1AF
	for <linux-embedded@vger.kernel.org>; Sat, 24 Jan 2026 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769283670; cv=none; b=OBV8DJL7zu8XCv1H2V7ZvKSW92dzjZqIL0qZbMHxfBtNrBnLaq0sOSRbXfyRe6mmQywti+CgE2yv5Icxwp6oWtJp2HhkayH5iO5hGpfCnCW/N57iU80AFiJrOVrivBnJmdb/M3Nef0Fg62t3wA//qjqFcGza4Heg9JhEHlU/AmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769283670; c=relaxed/simple;
	bh=bSq1ej7IMv/HHsb/J6e3KvtiL/9uUKt0VNT8hBo5El4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxUlActIObqr6G4xCXsn57mXWcnoAoqy3BMh3vgsOovT5tvBPAqKWE6iqzBLf088Xw5Wbz1YCDO7TsbsKWsySyAnI+JHVzipecrkea88jV4Bf3nMCrJW+gi3yudcLs0UVIGjwY/KEwnMhxg39+Qd3BfFiivP8Aihv/DXrKv9pc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id jdsDvcZK5SkcfjjVFvr9pv; Sat, 24 Jan 2026 19:41:01 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id jjVEvKhmDSqlVjjVFvR4Ns; Sat, 24 Jan 2026 19:41:01 +0000
X-Authority-Analysis: v=2.4 cv=I7FlRMgg c=1 sm=1 tr=0 ts=6975204d
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=vUbySO9Y5rIA:10 a=z6gsHLkEAAAA:8 a=nNEERlQMUBuLl2N2Ih0A:9
 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=35928 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vjjVC-00000002v58-1lm2;
	Sat, 24 Jan 2026 12:40:58 -0700
From: Tim Bird <tim.bird@sony.com>
To: pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linuxtronix.de,
	senozhatsky@chromium.org
Cc: francesco@valla.it,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v2] printk: fix zero-valued printk timestamps in early boot
Date: Sat, 24 Jan 2026 12:40:27 -0700
Message-ID: <20260124194027.713991-1-tim.bird@sony.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2044.hostmonster.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sony.com
X-BWhitelist: no
X-Source-IP: 66.118.46.62
X-Source-L: No
X-Exim-ID: 1vjjVC-00000002v58-1lm2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:35928
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfI/iEu76SnjlcgMj6zzNevUV1ZYF+6dHVZNFYBX72o64rNUF8WFvzN3pfDCWE+uKqkkNI7Zqw5xRkI1DIH+z5ndYWpytY6WWzRLL+dI0SK7QqCTlovOd
 V8KesXxhwByONnh8sYSaFUcjS5jdgGXNPHlHRVkiTxXqIVDy5KIW7i68z7RCsKu545kGfk7H1EQbdFtCeyDQWp6z+8D3EuTk/n0=

During early boot, printk timestamps are reported as zero before
kernel timekeeping starts (e.g. before time_init()).  This
hinders boot-time optimization efforts.  This period is about 400
milliseconds for many current desktop and embedded machines
running Linux.

Add support to save cycles during early boot, and output correct
timestamp values after timekeeping is initialized.  get_cycles()
is operational on arm64 and x86_64 from kernel start.  Add code
and variables to save calibration values used to later convert
cycle counts to time values in the early printks.  Add a config
to control the feature.

This yields non-zero timestamps for printks from the very start
of kernel execution.  The timestamps are relative to the start of
the architecture-specified counter used in get_cycles
(e.g. the TSC on x86_64 and cntvct_el0 on arm64).

All timestamps reflect time from power-on instead of time from
the kernel's timekeeping initialization.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
V1 -> V2
  Remove calibration CONFIG vars
  Add 'depends on' to restrict arches (to handle ppc bug)
  Add early_ts_offset to avoid discontinuity
  Save cycles in ts_nsec, and convert on output
  Move conditional code to include file (early_times.h)
---
 include/linux/early_times.h | 48 +++++++++++++++++++++++++++++++++++++
 init/Kconfig                | 12 ++++++++++
 init/main.c                 | 26 ++++++++++++++++++++
 kernel/printk/printk.c      | 16 +++++++++++--
 4 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/early_times.h

diff --git a/include/linux/early_times.h b/include/linux/early_times.h
new file mode 100644
index 000000000000..9dc31eb442c2
--- /dev/null
+++ b/include/linux/early_times.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _KERNEL_PRINTK_EARLY_TIMES_H
+#define _KERNEL_PRINTK_EARLY_TIMES_H
+
+#include <linux/timex.h>
+
+#if defined(CONFIG_EARLY_PRINTK_TIMES)
+extern u32 early_mult, early_shift;
+extern u64 early_ts_offset;
+
+static inline u64 early_cycles(void)
+{
+	return ((u64)get_cycles() | (1ULL << 63));
+}
+
+static inline u64 adjust_early_ts(u64 ts)
+{
+	/* High bit means ts is a cycle count */
+	if (unlikely(ts & (1ULL << 63)))
+		/*
+		 * mask high bit and convert to ns
+		 * Note that early_mult may be 0, but that's OK because
+		 * we'll just multiply by 0 and return 0. This will
+		 * only occur if we're outputting a printk message
+		 * before the calibration of the early timestamp.
+		 * Any output after user space start (eg. from dmesg or
+		 * journalctl) will show correct values.
+		 */
+		return (((ts & ~(1ULL << 63)) * early_mult) >> early_shift);
+
+	/* If timestamp is already in ns, just add offset */
+	return ts + early_ts_offset;
+}
+#else
+static inline u64 early_cycles(void)
+{
+	return 0;
+}
+
+static inline u64 adjust_early_ts(u64 ts)
+{
+	return ts;
+}
+#endif /* CONFIG_EARLY_PRINTK_TIMES */
+
+#endif /* _KERNEL_PRINTK_EARLY_TIMES_H */
+
diff --git a/init/Kconfig b/init/Kconfig
index fa79feb8fe57..060a22cddd17 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -777,6 +777,18 @@ config IKHEADERS
 	  or similar programs.  If you build the headers as a module, a module called
 	  kheaders.ko is built which can be loaded on-demand to get access to headers.
 
+config EARLY_PRINTK_TIMES
+	bool "Show non-zero printk timestamps early in boot"
+	default y
+	depends on PRINTK
+	depends on ARM64 || X86_64
+	help
+	  Use a cycle-counter to provide printk timestamps during
+	  early boot.  This allows seeing timestamps for printks that
+	  would otherwise show as 0.  Note that this will shift the
+	  printk timestamps to be relative to machine power on, instead
+	  of relative to the start of kernel timekeeping.
+
 config LOG_BUF_SHIFT
 	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
 	range 12 25
diff --git a/init/main.c b/init/main.c
index b84818ad9685..cc1af26933f7 100644
--- a/init/main.c
+++ b/init/main.c
@@ -104,6 +104,9 @@
 #include <linux/pidfs.h>
 #include <linux/ptdump.h>
 #include <linux/time_namespace.h>
+#include <linux/timex.h>
+#include <linux/sched/clock.h>
+#include <linux/early_times.h>
 #include <net/net_namespace.h>
 
 #include <asm/io.h>
@@ -160,6 +163,10 @@ static size_t initargs_offs;
 # define initargs_offs 0
 #endif
 
+#ifdef CONFIG_EARLY_PRINTK_TIMES
+static u64 start_cycles, start_ns;
+#endif
+
 static char *execute_command;
 static char *ramdisk_execute_command = "/init";
 
@@ -1118,6 +1125,11 @@ void start_kernel(void)
 	timekeeping_init();
 	time_init();
 
+#ifdef CONFIG_EARLY_PRINTK_TIMES
+	start_cycles = get_cycles();
+	start_ns = local_clock();
+#endif
+
 	/* This must be after timekeeping is initialized */
 	random_init();
 
@@ -1600,6 +1612,20 @@ static int __ref kernel_init(void *unused)
 
 	do_sysctl_args();
 
+#ifdef CONFIG_EARLY_PRINTK_TIMES
+	u64 end_cycles, end_ns;
+
+	/* set calibration data for early_printk_times */
+	end_cycles = get_cycles();
+	end_ns = local_clock();
+	clocks_calc_mult_shift(&early_mult, &early_shift,
+		((end_cycles - start_cycles) * NSEC_PER_SEC)/(end_ns - start_ns),
+		NSEC_PER_SEC, 50);
+	early_ts_offset = ((start_cycles * early_mult) >> early_shift) - start_ns;
+	pr_debug("Early printk times: mult=%u, shift=%u, offset=%llu ns\n",
+		early_mult, early_shift, early_ts_offset);
+#endif
+
 	if (ramdisk_execute_command) {
 		ret = run_init_process(ramdisk_execute_command);
 		if (!ret)
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1d765ad242b8..f17877337735 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -46,6 +46,7 @@
 #include <linux/ctype.h>
 #include <linux/uio.h>
 #include <linux/sched/clock.h>
+#include <linux/early_times.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
@@ -75,6 +76,11 @@ EXPORT_SYMBOL(ignore_console_lock_warning);
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(console);
 
+#ifdef CONFIG_EARLY_PRINTK_TIMES
+u32 early_mult, early_shift;
+u64 early_ts_offset;
+#endif
+
 /*
  * Low level drivers may need that to know if they can schedule in
  * their unblank() callback or not. So let's export it.
@@ -639,7 +645,7 @@ static void append_char(char **pp, char *e, char c)
 static ssize_t info_print_ext_header(char *buf, size_t size,
 				     struct printk_info *info)
 {
-	u64 ts_usec = info->ts_nsec;
+	u64 ts_usec = adjust_early_ts(info->ts_nsec);
 	char caller[20];
 #ifdef CONFIG_PRINTK_CALLER
 	u32 id = info->caller_id;
@@ -1352,7 +1358,11 @@ static size_t print_syslog(unsigned int level, char *buf)
 
 static size_t print_time(u64 ts, char *buf)
 {
-	unsigned long rem_nsec = do_div(ts, 1000000000);
+	unsigned long rem_nsec;
+
+	ts = adjust_early_ts(ts);
+
+	rem_nsec = do_div(ts, 1000000000);
 
 	return sprintf(buf, "[%5lu.%06lu]",
 		       (unsigned long)ts, rem_nsec / 1000);
@@ -2242,6 +2252,8 @@ int vprintk_store(int facility, int level,
 	 * timestamp with respect to the caller.
 	 */
 	ts_nsec = local_clock();
+	if (!ts_nsec)
+		ts_nsec = early_cycles();
 
 	caller_id = printk_caller_id();
 
-- 
2.43.0

