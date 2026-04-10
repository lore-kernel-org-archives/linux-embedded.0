Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F1839A065
	for <linux-embedded@vger.kernel.org>; Fri, 10 Apr 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853479; cv=none; b=iu4kB4r+Fu2YtdXOijVOSfoLv9sX3d+ApXVakVCsfuYWM9zSgHNk1qhHfdgu2+WVhC4ykfIApLmdrQ8ZKZ/CdubYgzCQmZYM4Xs50DV9oPcjKgvMaZqqjdM37rzGtUwwOJf9X7r0RggtR5MjvDwJ/8eOzzrJTPDEf/zWcF2qm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853479; c=relaxed/simple;
	bh=2pH2D4C2ReBNDqjO+nICA4jnli8SWNP5k380AWGzTSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZ52OwTTdfgAS8ILu+WHk+HVRGUUXOZ1U017yRMtTyKkxORQh4yeUuh9PFGuY7ZVe2BhK3zVtjbDEYKA1sTfDDKK+v2R2/O9gIkQNYbQqpmgGBM+d8f5vlJCgvlr+synUk72j92eCaXnRkGOuKzIbY6dIUFbxWMudShceJUMrtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id BEuJwLVtyc7NEBIbvwrnQm; Fri, 10 Apr 2026 20:37:51 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id BIbuwVnshgdjvBIbvw7aqp; Fri, 10 Apr 2026 20:37:51 +0000
X-Authority-Analysis: v=2.4 cv=DrxW+H/+ c=1 sm=1 tr=0 ts=69d95f9f
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=QeWor2tdjpy9U23wdFvjzw==:17
 a=A5OVakUREuEA:10 a=7TIaCiHaXvAVnQQ3XKoA:9 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.44.127] (port=35352 helo=timdesk.home.local)
	by host2044.hostmonster.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <tim.bird@sony.com>)
	id 1wBIbu-00000000rXL-1tzl;
	Fri, 10 Apr 2026 14:37:50 -0600
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
Subject: [PATCH v4 0/1] printk: fix zero-valued printk timestamps
Date: Fri, 10 Apr 2026 14:37:40 -0600
Message-ID: <20260410203741.997410-1-tim.bird@sony.com>
X-Mailer: git-send-email 2.43.0
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
X-Exim-ID: 1wBIbu-00000000rXL-1tzl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk.home.local) [66.118.44.127]:35352
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfINBeNyBIYerwa/+zzVD/2q0izDGtN37yp/uSZffoaGqFoW/TBCqOPxoxyz7ZrBC04koz7fJW6yn+dh3jjZofZKzu9HrW06jXUa/QMWkzyInn6/DSJBf
 UTMQY1Y7r6mwrUrxmR5jbRWOjcZbPv/9ybqLkQm+o67ujJih0utJtzBGUeoV6xBpW15mLs84nEYyk6kyjNXScrJOOgi0Fm/0WXM=

Some kernel messages emitted before kernel timekeeping is started
have a timestamp value of zero.  However, some platforms
have a cycle counter or timer register that is initialized
before the kernel starts (either in hardware or pre-kernel
firmware), and it can be accessed to provide uncalibrated
values before any other kernel initialization.  I refer
to this period where kernel timestamps are zero as the
printk timing "blind spot".

The following patch allows developers to set a config value
CONFIG_EARLY_CYCLES_KHZ, that will be used to provide
useful timestamps on early printk messages.
This calibration value is set as a static configuration
variable, since it must be available from the very first kernel
instruction.  Since this value is machine-specific, it cannot
be used in the .config for a generic distribution kernel.
The feature is presented here as something useful for
kernel developers working on boot-time optimization
(ie, as something that can be used temporarily during boot
time research and development work, and not necessarily
a runtime option for the average user).

Different platforms have different blind spot durations.
On an x86_64 platform, due to early tsc initialization, the
blind spot may be as small at 16 milliseconds.  On a
Raspberry Pi 4 board, it is approximately 180 milliseconds.
On a RISC V BeagleV Fire board, it can be up to 1700
milliseconds (1.7 seconds).  On some platforms, the blind spot
duration is a significant percentage of the time before user-space
initialization in the kernel (greater than 20%).

This feature uses a different mechanism to gather timestamp values.
When kernel timekeeping starts, the printk timestamps change
to a new timebase based on local_clock(), and timestamp values
reset to the baseline used for kernel timekeeping. This results in a
one-time discontinuity in timestamps between early printks and later
printks. The discontinuity should be obvious to humans, but could
possibly confuse tools.

Here is before and after dmesg output for a Raspberry PI 4 board:

before:
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 7.0.0-rc3-v8+ (tbird@timdesk) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #5 SMP PREEMPT Wed Mar 11 18:30:18 MDT 2026
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.5
[    0.000000] efi: UEFI not found.
...
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 timer running at 54.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
[    0.000000] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
[    0.000161] Console: colour dummy device 80x25
[    0.000170] printk: legacy console [tty1] enabled

after:
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
[    0.000000] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
[    0.000157] Console: colour dummy device 80x25
[    0.000165] printk: legacy console [tty1] enabled


Tim Bird (1):
  printk: fix zero-valued printk timestamps in early boot

 include/linux/early_times.h | 55 +++++++++++++++++++++++++++++++++++++
 init/Kconfig                | 30 ++++++++++++++++++++
 kernel/printk/printk.c      |  3 ++
 3 files changed, 88 insertions(+)
 create mode 100644 include/linux/early_times.h

-- 
2.43.0

