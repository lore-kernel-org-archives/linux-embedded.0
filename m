Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B90D3191C8
	for <linux-embedded@vger.kernel.org>; Tue, 10 Feb 2026 23:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770767281; cv=none; b=H+Sheu5NYyPoTIL70gALOebkSpu9nxfD7bVsAQt5hYEoSuRBvsPWReYehFDY/+wM4Jh48irYWbPrtd9Gqv6TG2wn9MaLZS2nQGa0VAqtP36BQ14rVRJnsj1cyfto8MslruFvDZT/5f2ZmELq5BdpmIrIY+Dy6FJlahUv9jtGMq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770767281; c=relaxed/simple;
	bh=qYyIddE6T3x+oAid8+fJbENlKQsgXGgSTvkOY5KvADM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcDkM8EnTGHgBlVvtb+FjTt5TCgny1gpX4hV9jGLjq6HDdZDzXE6W7jUxfipwOL3Dyob8D0FeEF0gRV4qyXcagN590uLdW1c8ZlxRm9fcN/3nRs4qVQclZW6Mtna4qGyspiv7zllgaMueDgMzMakddkgSGMvcLPYfptvXvgYq+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id pwzRvBd14ipkCpxSTvhNfk; Tue, 10 Feb 2026 23:47:53 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id pxSSvnJfbPL32pxSSve8ev; Tue, 10 Feb 2026 23:47:52 +0000
X-Authority-Analysis: v=2.4 cv=MqhS63ae c=1 sm=1 tr=0 ts=698bc3a8
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=z6gsHLkEAAAA:8 a=JjEIJjSnaUtOyzECTGYA:9
 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=56664 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vpxSP-00000001QRm-2qcH;
	Tue, 10 Feb 2026 16:47:49 -0700
From: Tim Bird <tim.bird@sony.com>
To: pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linuxtronix.de,
	senozhatsky@chromium.org
Cc: francesco@valla.it,
	geert@linux-m68k.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
Date: Tue, 10 Feb 2026 16:47:41 -0700
Message-ID: <20260210234741.3262320-1-tim.bird@sony.com>
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
X-Exim-ID: 1vpxSP-00000001QRm-2qcH
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:56664
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfCYDMKlKaxswgY7XhCL+hHLKm55PxbAczcMwPCY7v62KgytaBO2XPDZLteuE3A9jRZh2b0wwk6OiUjq/D9q2POf4EujS955H/NnpxLrm7v10Tsg3iHta
 KjvzWBLgOkewEAvAL/VL+7PuQ1Sh+eCTtYBDqeu5EsaHb80jrpzujRBKJn9/+TF5vkebkZwrIF86NC4nBg5Ov8dNxyVDBqbJPN0=

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

All timestamps reflect time from processor power-on instead of
time from the kernel's timekeeping initialization.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
V2->V3
 Default CONFIG option to 'n'
 Move more code from into early_times.h
  (reducing ifdefs in init/main.c)
 Use math64 helper routines
 Use cycles_t instead of u64 type
 Add #defines for EARLY_CYCLES_BIT and MASK
 Invert if logic in adjust_early_ts()
 (note: no change to 'depends on' in Kconfig entry)

V1->V2
 Remove calibration CONFIG vars
 Add 'depends on' to restrict arches (to handle ppc bug)
 Add early_ts_offset to avoid discontinuity
 Save cycles in ts_nsec, and convert on output
 Move conditional code to include file (early_times.h)

 include/linux/early_times.h | 85 +++++++++++++++++++++++++++++++++++++
 init/Kconfig                | 14 ++++++
 init/main.c                 |  6 +++
 kernel/printk/printk.c      | 18 +++++++-
 4 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/early_times.h

diff --git a/include/linux/early_times.h b/include/linux/early_times.h
new file mode 100644
index 000000000000..05388dcb8573
--- /dev/null
+++ b/include/linux/early_times.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _KERNEL_PRINTK_EARLY_TIMES_H
+#define _KERNEL_PRINTK_EARLY_TIMES_H
+
+#include <linux/timex.h>
+#include <linux/clocksource.h>
+
+/* use high bit of a u64 to indicate cycles instead of a timestamp */
+#define EARLY_CYCLES_BIT	BIT_ULL(63)
+#define EARLY_CYCLES_MASK	~(BIT_ULL(63))
+
+#if defined(CONFIG_EARLY_PRINTK_TIMES)
+extern cycles_t start_cycles;
+extern u64 start_ns;
+extern u32 early_mult, early_shift;
+extern u64 early_ts_offset;
+
+static inline void early_times_start_calibration(void)
+{
+	start_cycles = get_cycles();
+	start_ns = local_clock();
+}
+
+static inline void early_times_finish_calibration(void)
+{
+	cycles_t end_cycles;
+	u64 end_ns;
+
+	/* set calibration data for early_printk_times */
+	end_cycles = get_cycles();
+	end_ns = local_clock();
+	clocks_calc_mult_shift(&early_mult, &early_shift,
+		mul_u64_u64_div_u64(end_cycles - start_cycles,
+			NSEC_PER_SEC, end_ns - start_ns),
+		NSEC_PER_SEC, 100);
+	early_ts_offset = mul_u64_u32_shr(start_cycles, early_mult, early_shift) - start_ns;
+
+	pr_debug("Early printk times: mult=%u, shift=%u, offset=%llu ns\n",
+		early_mult, early_shift, early_ts_offset);
+}
+
+static inline u64 early_cycles(void)
+{
+	return (get_cycles() | EARLY_CYCLES_BIT);
+}
+
+/*
+ * adjust_early_ts detects whether ts in is cycles or nanoseconds
+ * and converts it or adjusts it, taking into account the offset
+ * from cycle-counter start.
+ *
+ * Note that early_mult may be 0, but that's OK because
+ * we'll just multiply by 0 and return 0. This will
+ * only occur if we're outputting a printk message
+ * before the calibration of the early timestamp.
+ * Any output after user space start (eg. from dmesg or
+ * journalctl) will show correct values.
+ */
+static inline u64 adjust_early_ts(u64 ts)
+{
+	if (likely(!(ts & EARLY_CYCLES_BIT)))
+		/* if timestamp is not in cycles, just add offset */
+		return ts + early_ts_offset;
+
+	/* mask high bit and convert to nanoseconds */
+	return mul_u64_u32_shr(ts & EARLY_CYCLES_MASK, early_mult, early_shift);
+}
+
+#else
+# define early_times_start_calibration() do { } while (0)
+# define early_times_finish_calibration() do { } while (0)
+
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
diff --git a/init/Kconfig b/init/Kconfig
index fa79feb8fe57..a928c1efb09d 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -777,6 +777,20 @@ config IKHEADERS
 	  or similar programs.  If you build the headers as a module, a module called
 	  kheaders.ko is built which can be loaded on-demand to get access to headers.
 
+config EARLY_PRINTK_TIMES
+	bool "Show non-zero printk timestamps early in boot"
+	default n
+	depends on PRINTK
+	depends on ARM64 || X86_64
+	help
+	  Use a cycle-counter to provide printk timestamps during
+	  early boot.  This allows seeing timestamps for printks that
+	  would otherwise show as 0.  Note that this will shift the
+	  printk timestamps to be relative to processor power on, instead
+	  of relative to the start of kernel timekeeping.  This should be
+	  closer to machine power on, giving a better indication of
+	  overall boot time.
+
 config LOG_BUF_SHIFT
 	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
 	range 12 25
diff --git a/init/main.c b/init/main.c
index b84818ad9685..d5774aec1aff 100644
--- a/init/main.c
+++ b/init/main.c
@@ -104,6 +104,7 @@
 #include <linux/pidfs.h>
 #include <linux/ptdump.h>
 #include <linux/time_namespace.h>
+#include <linux/early_times.h>
 #include <net/net_namespace.h>
 
 #include <asm/io.h>
@@ -1118,6 +1119,9 @@ void start_kernel(void)
 	timekeeping_init();
 	time_init();
 
+	/* This must be after timekeeping is initialized */
+	early_times_start_calibration();
+
 	/* This must be after timekeeping is initialized */
 	random_init();
 
@@ -1600,6 +1604,8 @@ static int __ref kernel_init(void *unused)
 
 	do_sysctl_args();
 
+	early_times_finish_calibration();
+
 	if (ramdisk_execute_command) {
 		ret = run_init_process(ramdisk_execute_command);
 		if (!ret)
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1d765ad242b8..5afd31c3345c 100644
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
@@ -75,6 +76,13 @@ EXPORT_SYMBOL(ignore_console_lock_warning);
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(console);
 
+#ifdef CONFIG_EARLY_PRINTK_TIMES
+cycles_t start_cycles;
+u64 start_ns;
+u32 early_mult, early_shift;
+u64 early_ts_offset;
+#endif
+
 /*
  * Low level drivers may need that to know if they can schedule in
  * their unblank() callback or not. So let's export it.
@@ -639,7 +647,7 @@ static void append_char(char **pp, char *e, char c)
 static ssize_t info_print_ext_header(char *buf, size_t size,
 				     struct printk_info *info)
 {
-	u64 ts_usec = info->ts_nsec;
+	u64 ts_usec = adjust_early_ts(info->ts_nsec);
 	char caller[20];
 #ifdef CONFIG_PRINTK_CALLER
 	u32 id = info->caller_id;
@@ -1352,7 +1360,11 @@ static size_t print_syslog(unsigned int level, char *buf)
 
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
@@ -2242,6 +2254,8 @@ int vprintk_store(int facility, int level,
 	 * timestamp with respect to the caller.
 	 */
 	ts_nsec = local_clock();
+	if (!ts_nsec)
+		ts_nsec = early_cycles();
 
 	caller_id = printk_caller_id();
 
-- 
2.43.0

