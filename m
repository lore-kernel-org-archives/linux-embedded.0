Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B639C003
	for <linux-embedded@vger.kernel.org>; Fri, 10 Apr 2026 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853488; cv=none; b=pRAD6NQp4rzasooymXzadAitD63Zv4Z1cJwf8TRayon8wnuzMDHrf4TjRgiavaxMebaekojhvzeRMJ0aT+Dc1x+WankVMoLSId2oYIbO6cn46p+4A8XwLrhxmxd8dbiQlWCxeYqfkWO5adT/42Qk4CrjnTrmWpH1JYFOtzwevZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853488; c=relaxed/simple;
	bh=/GvhGrYwY6n/AMe/ScAf1VfH5EC5kICVVwtpQplHvPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQAiD0SnEVnS0yeE9W8LVT5r0YRiy5Ov5DZyVytTOedzuxpeVKt3f08ThL1GMQPYQ267wV1KGzlkvrd27ClxgFS/f8Jk7AWFRTYWGVj5qr/Gb7akM9K0oUO0GH3hQaguLB6znR0p0Iq5vnNKVtfOhVkog3URalpqFELAYU8JUiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id BGAmwV5tsObRfBIc4w3xis; Fri, 10 Apr 2026 20:38:00 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id BIbzwu7AUraqeBIbzwO7Yc; Fri, 10 Apr 2026 20:37:56 +0000
X-Authority-Analysis: v=2.4 cv=UNPdHDfy c=1 sm=1 tr=0 ts=69d95fa8
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=QeWor2tdjpy9U23wdFvjzw==:17
 a=A5OVakUREuEA:10 a=z6gsHLkEAAAA:8 a=knLdI61V-Ed532JS32oA:9
 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.44.127] (port=35352 helo=timdesk.home.local)
	by host2044.hostmonster.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <tim.bird@sony.com>)
	id 1wBIby-00000000rXL-3ukh;
	Fri, 10 Apr 2026 14:37:55 -0600
From: Tim Bird <tim.bird@sony.com>
To: pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org
Cc: francesco@valla.it,
	geert@linux-m68k.org,
	tglx@kernel.org,
	shashankbalaji02@gmail.com,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
Date: Fri, 10 Apr 2026 14:37:41 -0600
Message-ID: <20260410203741.997410-2-tim.bird@sony.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410203741.997410-1-tim.bird@sony.com>
References: <20260410203741.997410-1-tim.bird@sony.com>
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
X-Source-IP: 66.118.44.127
X-Source-L: No
X-Exim-ID: 1wBIby-00000000rXL-3ukh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk.home.local) [66.118.44.127]:35352
X-Source-Auth: tim@bird.org
X-Email-Count: 14
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfPAdOvyqHlGXUQM0tHgAgQDDSM99RSIDZwAuEnoojo/KDJ0ajEm6jW3QkOZjbVb8XyGKfSQ0S74vviGrjhvdpus0DUg6KPEv0QNP0EkwNbnIo20L7GuG
 ruFX1Df9tkxfpYdYTYKyIa6yTsHV27U65W8I+OqMivH7O8yR/Y3cENJm7UPnT+e8Nq5VdPCAPtmDULPIeo2TyqBXwTw2aONUfLw=

During early boot, printk timestamps are reported as zero before
kernel timekeeping starts (i.e. before time_init()).  This
hinders boot-time optimization efforts.  This period ranges from
17 to 1700 milliseconds on different embedded machines running Linux.

Add support for early timestamps based on processor cycle-generators
that need no kernel initialization. Use a statically-configured
frequency value for converting cycles to nanoseconds. This means
that this feature cannot be turned on in generic distro kernels.
It is intended for temporary use during kernel development and
boot-time research and optimization only.

This yields non-zero timestamps for printks from the very start
of kernel execution.  The timestamps are relative to the start of
an architecture-specific counter (e.g. tsc on x86_64 and cntvct_el0
on arm64).  Affected timestamps reflect time from cycle counter
init (usually machine power-on or virtual machine start) instead of
time from the kernel's timekeeping initialization. This results in a
discontinuity in the printk timestamp values, one time, when
kernel timekeeping starts.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
V3 -> V4
  Replace config vars with single one: CONFIG_EARLY_CYCLES_KHZ
  Replace runtime calibration with static config variable
  Remove reference to get_cycles()
  Add support for RISCV platforms
V2 -> V3
  Default CONFIG option to 'n'
  Move more code into early_times.h (reduce ifdefs in init/main.c)
  Use match64 helper routines
  Use cycles_t instead of u64 type
  Add #defines for EARLY_CYCLES_BIT and EARLY_CYCLES_MASK
  Invert if logic in adjust_early_ts()
V1 -> V2
  Remove calibration CONFIG vars
  Add 'depends on' to restrict arches (to handle ppc bug)
  Add early_ts_offset to avoid discontinuity
  Save cycles in ts_nsec, and convert on output
  Move conditional code to include file (early_times.h>
---
 include/linux/early_times.h | 55 +++++++++++++++++++++++++++++++++++++
 init/Kconfig                | 30 ++++++++++++++++++++
 kernel/printk/printk.c      |  3 ++
 3 files changed, 88 insertions(+)
 create mode 100644 include/linux/early_times.h

diff --git a/include/linux/early_times.h b/include/linux/early_times.h
new file mode 100644
index 000000000000..82bacfd0e26b
--- /dev/null
+++ b/include/linux/early_times.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _EARLY_TIMES_H
+#define _EARLY_TIMES_H
+
+#include <linux/timekeeping.h>
+#ifdef CONFIG_ARM64
+#include <asm/sysreg.h>
+#endif
+
+#ifdef CONFIG_EARLY_CYCLES_KHZ
+static inline u64 early_unsafe_cycles(void)
+{
+#if defined(CONFIG_X86_64)
+	/*
+	 * This rdtsc may happen before secure TSC is initialized, and
+	 * it is unordered. So please don't use this value for cryptography
+	 * or after SMP is initialized.
+	 */
+	return rdtsc();
+#elif defined(CONFIG_ARM64)
+	return read_sysreg(cntvct_el0);
+#elif defined(CONFIG_RISCV_TIMER)
+	u64 val;
+
+	asm volatile("rdtime %0" : "=r"(val));
+	return val;
+#else
+	return 0;
+#endif
+}
+
+#define NS_PER_KHZ	1000000UL
+
+/* returns a nanosecond value based on early cycles */
+static inline u64 early_times_ns(void)
+{
+	if (CONFIG_EARLY_CYCLES_KHZ)
+		/*
+		 * Note: the multiply must precede the division to avoid
+		 * truncation and loss of resolution
+		 * Don't use fancier MULT/SHIFT math here.  Since this is
+		 * static, the compiler can optimize the math operations.
+		 */
+		return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
+	return 0;
+}
+#else
+static inline u64 early_times_ns(void)
+{
+	return 0;
+}
+#endif
+
+#endif /* _EARLY_TIMES_H */
diff --git a/init/Kconfig b/init/Kconfig
index 7484cd703bc1..40c3123c2c27 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -792,6 +792,36 @@ config IKHEADERS
 	  or similar programs.  If you build the headers as a module, a module called
 	  kheaders.ko is built which can be loaded on-demand to get access to headers.
 
+config EARLY_CYCLES_KHZ
+	int "Frequency of the early times cycle counter, in KHz"
+	default 0
+	depends on PRINTK
+	depends on ARM64 || X86_64 || RISCV_TIMER
+	help
+	  Specifies the frequency value (in KHz) of the cycle counter
+	  used for early times information.
+
+	  Set this to provide timing information for printks in early boot
+	  (before the start of kernel timekeeping), that would otherwise
+	  show as 0.
+
+	  To calculate the value for your system, boot your system, and
+	  use the value expressed on the tsc or cntvct_el0 calibration line
+	  in your kernel message log:
+	  ex x86_64: tsc: Refined TSC clocksource calibration: 2095.057 MHz
+          In that case, use the value 2095057.
+	  ex arm64: arch_timer: cp15 timer running at 54.00MHz (phys).
+	  In that case, use the value of 54000.
+
+	  Note that this causes the kernel to show, for some early printks,
+	  times that are relative to processor power on, instead of
+	  relative to the start of kernel timekeeping.  When kernel
+	  timekeeping starts, the timestamps values reset, causing
+	  a discontinuity in the timestamp values.  If you see
+	  non-monotonic printk timestamps, please don't freak out.
+
+	  Set to 0 to disable this feature.
+
 config LOG_BUF_SHIFT
 	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
 	range 12 25
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0323149548f6..ddeab81f04ef 100644
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
@@ -2294,6 +2295,8 @@ int vprintk_store(int facility, int level,
 	 * timestamp with respect to the caller.
 	 */
 	ts_nsec = local_clock();
+	if (unlikely(!ts_nsec))
+		ts_nsec = early_times_ns();
 
 	caller_id = printk_caller_id();
 
-- 
2.43.0

