Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45803DDCD
	for <linux-embedded@vger.kernel.org>; Fri, 13 Mar 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398709; cv=none; b=J89OTQLpH4yXXqLZm7+5kIvd6bIelgSgYrQMHqd4uTy0+/H+Pg7SI01ncK18cfAQiD9/2TX7ParSepX/bNzui1FXWieg3wZRTEWz6P2+0gtddHFNhG+mi+QM4okVbvai0EE9VuvI5KmLZoQHbiHZ0QhRBmBgZsYMRQ+JpKTTgsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398709; c=relaxed/simple;
	bh=pxNOtZmKxddzGKKhHpJ5dkZiVVW5v2rI4bT/jiMQ0kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmQHuJvYRFJRwR4d5RKpZoSwBUZ+MP/KEO0jYOnK+GAPwOVM9T4JPGlUv5oH2aMrKs+qNp2ryKkquKF89zOt6fVEPYF6EYOVw6C+QS8oqs6nuZS1NhA1bv9HHycxbei0BtuEnLA2IElM7z352e6MXbPHQ0egXsyGDUQ2ylUpS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BcM8Gx8Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BcM8Gx8Z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so6307145e9.0
        for <linux-embedded@vger.kernel.org>; Fri, 13 Mar 2026 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773398705; x=1774003505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ewPA6a4TTHZ76y4WneynkwJRBQPFI5f/sP56q/Osvs=;
        b=BcM8Gx8ZvuTzjAMueHQSjkQv0RjPCWmJEQDz+0fH3F/v73tH2OKtgJ8JBvtaNIUv5i
         FcFdBigaOzAQ7TZmxS0Dn/f7Q/d6EJXMvcDOs5iHKdj5Ge2OGeOKTFvPhahA6VSrp84W
         fCEoleXihW5KYe937273omF8wWq9j7Jb4BHnSot+aI16ZyLJd5hANhRFkL16JFwaKTfw
         74McAkkDkAU0TD8cnVVLgSolOPAxeles2ro4SE/tFHj4rV2ueTImYGs1dF+j2sfMtgpX
         IxH2DiR6442yyfdg8k4RjXzBiX/Rf4xWl7glK2EZtA3UnUngvYV7HTUa4SqTq2jHXVpy
         I7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398705; x=1774003505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ewPA6a4TTHZ76y4WneynkwJRBQPFI5f/sP56q/Osvs=;
        b=rVNV7mNh3LOrWCAPugDuLK0WfwAa4hM8DZ3yZBdxZp2I8NqrEB5nflzpQRTQjjyfgr
         70zogg7nNrpacJBhZ26bXqrixbb8dXFLxqb65iadgnNeDqMDniDKYG756/6FQIbcJ3Mf
         j9v0cEHcXDHx/4Uz5/HcUm0p0zIpm0YwVkIXGYNJfBhXwlSwviHh2Ir7mW/v7MJe1+k0
         8pbXAvFi2lDlNbqw4pXokG4llAs4xW/oRT5KIPr4UV314LqSPeGBtC3bfpl3fnGRfumx
         s/FlsIgHb0K2oadcXSdPMPUDP9lzMQlB4X7QavqFbVzA0RBWsAIcBUGr+2nC4OPmPfHl
         2K/A==
X-Forwarded-Encrypted: i=1; AJvYcCVtZnWiMLLi4lJmcmOaHQrs6EzDvqdmeozOK0ULAzXemhohRBWjld3JIj81VV2z7k4flsXKIkMWyIhELP4yGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3snVQF1020Vg8L67HwAOhQppIcp2F7tALXvWtThdUbBX9q9Qh
	hH3akT6E3PYPsA9eNF/DAafg6v6sNxcvuay7GV43nyV0uFrrTtSDlGK68y5JROiIX3luR1fc22l
	GLggs
X-Gm-Gg: ATEYQzwY2gInhWAMXPDJfnwwVmttuag6k8Zn4MyIteMMXQn2v0voWvb17fqYqzazu46
	4D0HtYqe2hX5ZcFG38KlSB/zbX38QqWmgaSfbJi1jGDcQfUe1W4K0CVBjQkIeAm6uSTLlYx45tk
	9HMFNidlibDWkPF8qs38FkrRsaikUYpanX1wBwvg0zXF93/XNL0CHtbA9rm433ddnfw1wrvDr00
	IHyzI3HbK04EyPjKq72PoP6Xl5U4fmRw4F2GWym/uA5hK50VOThY7MIthOZME615cY6txnXOSAy
	8T0SDJMS9JvyV2ZZmb8dXjvOdYtvthigcMkk//MW3/7GTc5G7lMweb3D7Wu1AljkQ/uEnjMCtNh
	hvsvs7D5ROGD7isJyVRsISizFdQFJY48j6BSxIcE8JKdOYfRbD5vWSqYm8q3oG/t8OU8k6iSuMT
	kUciH77R4jkXPhnrMxP2/5e+dqsg==
X-Received: by 2002:a05:600c:4ed0:b0:485:35ba:1d8a with SMTP id 5b1f17b1804b1-4855670e7bbmr42012575e9.27.1773398705150;
        Fri, 13 Mar 2026 03:45:05 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485563f619csm32478785e9.1.2026.03.13.03.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:45:04 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:45:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"francesco@valla.it" <francesco@valla.it>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <abPqrqgXHnDu8XWf@pathway>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>

Finally added timekeeping maintainers and John into Cc.
We should have added time since v1.

Anyway, you might see the entire history at
https://lore.kernel.org/all/39b09edb-8998-4ebd-a564-7d594434a981@bird.org/


On Fri 2026-03-13 04:52:40, Bird, Tim wrote:
> Hey Micheal,
> 
> This report is very interesting. 
> 
> Thanks very much for trying it out!
> 
> > -----Original Message-----
> > From: Michael Kelley <mhklinux@outlook.com>
> > Sent: Wednesday, March 11, 2026 9:47 AM
> > From: Tim Bird <tim.bird@sony.com> Sent: Tuesday, February 10, 2026 3:48 PM
> > >
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
> > > All timestamps reflect time from processor power-on instead of
> > > time from the kernel's timekeeping initialization.
> > 
> > I tried this patch in linux-next20260302 kernel running as a guest VM
> > on a Hyper-V host. Two things:
> > 
> > 1) In the dmesg output, I'm seeing a place where the timestamps briefly go
> > backwards -- i.e., they are not monotonically increasing. Here's a snippet,
> > where there's a smaller timestamp immediately after the tsc is detected:
> > 
> > [   27.994891] SMBIOS 3.1.0 present.
> > [   27.994893] DMI: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 09/25/2025
> > [   27.994898] DMI: Memory slots populated: 2/2
> > [   27.995202] Hypervisor detected: Microsoft Hyper-V
> > [   27.995205] Hyper-V: privilege flags low 0xae7f, high 0x3b8030, ext 0x62, hints 0xa0e24, misc 0xe0bed7b2
> > [   27.995208] Hyper-V: Nested features: 0x0
> > [   27.995209] Hyper-V: LAPIC Timer Frequency: 0xc3500
> > [   27.995210] Hyper-V: Using hypercall for remote TLB flush
> > [   27.995216] clocksource: hyperv_clocksource_tsc_page: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
> > [   27.995218] clocksource: hyperv_clocksource_msr: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
> > [   27.995220] tsc: Detected 2918.401 MHz processor
> 
> I wonder if the tsc is getting fiddled with or virtualized somewhere in here, as part of clocksource initialization.
> I believe each clocksource in the kernel maintains it's own internal offset, and maybe the offset that is
> being used ends up being slightly different from the cycle-counter offset that the early_times feature uses.
> I'm just throwing out guesses.  It's about a 4ms delta, which is pretty big.
> 
> > [   27.991060] e820: update [mem 0x00000000-0x00000fff] System RAM ==> device reserved
> > [   27.991062] e820: remove [mem 0x000a0000-0x000fffff] System RAM
> > [   27.991064] last_pfn = 0x210000 max_arch_pfn = 0x400000000
> > [   27.991065] x86/PAT: PAT support disabled because CONFIG_X86_PAT is disabled in the kernel.
> > [   27.991066] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC

I wonder how the calibration of the cycles is precise. I wonder if
the problem might be that cycles were faster right after boot than
later during the calibration.

I added the following debug output on top of this patch:

diff --git a/include/linux/early_times.h b/include/linux/early_times.h
index 05388dcb8573..cdb467345bcc 100644
--- a/include/linux/early_times.h
+++ b/include/linux/early_times.h
@@ -20,6 +20,7 @@ static inline void early_times_start_calibration(void)
 {
 	start_cycles = get_cycles();
 	start_ns = local_clock();
+	pr_info("Early printk times: started callibration: %llu ns\n", start_ns);
 }
 
 static inline void early_times_finish_calibration(void)
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 774ffb1fa5ac..836cb03aaa6d 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2308,6 +2308,8 @@ int vprintk_store(int facility, int level,
 	ts_nsec = local_clock();
 	if (!ts_nsec)
 		ts_nsec = early_cycles();
+	else
+		pr_info_once("local_clock() returned non-zero timestamp: %llu nsec\n", ts_nsec);
 
 	caller_id = printk_caller_id();
 

And it produced in my kvm:

Let's say that start of the cycle counter is

Start of stage A

[    8.684438] Linux version 7.0.0-rc2-default+ (pmladek@pathway) (gcc (SUSE Linux) 15.2.1 20260202, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.45.0.20251103-2) #571 SMP PREEMPT_DYNAMIC Fri Mar 13 10:23:54 CET 2026
[    8.684442] Command line: BOOT_IMAGE=/boot/vmlinuz-7.0.0-rc2-default+ root=/dev/vda2 resume=/dev/disk/by-uuid/369c7453-3d16-409d-88b2-5de027891a12 mitigations=auto nosplash earlycon=uart8250,io,0x3f8,115200 console=ttyS0,115200 console=tty0 ignore_loglevel log_buf_len=1M crashkernel=512M,high crashkernel=72M,low
[...]
[    8.696633] earlycon: uart8250 at I/O port 0x3f8 (options '115200')
[    8.696639] printk: legacy bootconsole [uart8250] enabled
[    8.731303] printk: debug: ignoring loglevel setting.
[    8.732349] NX (Execute Disable) protection: active
[    8.733447] APIC: Static calls initialized
[    8.734667] SMBIOS 2.8 present.
[    8.735358] DMI: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-2-g4f253b9b-prebuilt.qemu.org 04/01/2014
[    8.737285] DMI: Memory slots populated: 1/1
[    8.738380] Hypervisor detected: KVM
[    8.739151] last_pfn = 0x7ffdc max_arch_pfn = 0x400000000
[    8.740254] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    8.732971] printk: local_clock() returned non-zero timestamp: 3486 nsec

End of stage A

This is the point where printk() started storing the values from
local_clock() instead of cycles.

Start of stage B

[    8.732971] kvm-clock: using sched offset of 252367014082295 cycles
[    8.735471] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    8.738880] tsc: Detected 3293.776 MHz processor
[    8.740474] e820: update [mem 0x00000000-0x00000fff] System RAM ==> device reserved
[...]
[    8.932671] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    8.934047] Early printk times: started callibration: 201079507 ns

End of stage B

This is where we started calibration of early cycles.

Start of stage C

[    8.935571] Console: colour dummy device 80x25
[...]
[    9.289673] thermal_sys: Registered thermal governor 'fair_share'
[    9.290077] thermal_sys: Registered thermal governor 'bang_bang'
[    9.292290] thermal_sys: Registered thermal governor 'step_wise'
[    9.293530] thermal_sys: Registered thermal governor 'user_space'
[    9.294856] cpuidle: using governor ladder
[    9.296302] cpuidle: using governor menu

Here the thermal governors are registered. I guess that they might
reduce speed of some HW.

[...]
[   11.974147] clk: Disabling unused clocks

Some unused clocks are disabled. I wonder if this might affect
counting the cycles.

[   12.330852] Freeing unused kernel image (rodata/data gap) memory: 1500K
[   12.351191] Early printk times: mult=19634245, shift=26, offset=8732967929 ns

End of stage C

Here is the end on calibration.

Now, if the frequence of the cycles was:

   + was higher in the stage A when only cycles were stored
   + was lower in stage C when it was calibrated against local_clock()

Then it might result in higher (calibrated) timestamps in stage A
and step back in stage B.

Or something like this. It is possible that even local_clock() does
not have a stable frequence during the early boot.

Idea: A solution might be to start calibration when printk()
      gets first non-zero time from local_clock.

      Something like:

diff --git a/include/linux/early_times.h b/include/linux/early_times.h
index 05388dcb8573..09d278996184 100644
--- a/include/linux/early_times.h
+++ b/include/linux/early_times.h
@@ -16,10 +16,13 @@ extern u64 start_ns;
 extern u32 early_mult, early_shift;
 extern u64 early_ts_offset;
 
-static inline void early_times_start_calibration(void)
+static inline void early_times_may_start_calibration(u64 ts_ns)
 {
+	if (start_ns)
+		return;
+
+	start_ns = ts_ns;
 	start_cycles = get_cycles();
-	start_ns = local_clock();
 }
 
 static inline void early_times_finish_calibration(void)
diff --git a/init/main.c b/init/main.c
index 27835270dfb5..a333b0da69cf 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1123,9 +1123,6 @@ void start_kernel(void)
 	timekeeping_init();
 	time_init();
 
-	/* This must be after timekeeping is initialized */
-	early_times_start_calibration();
-
 	/* This must be after timekeeping is initialized */
 	random_init();
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 774ffb1fa5ac..19330b6b4eb2 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2306,7 +2306,9 @@ int vprintk_store(int facility, int level,
 	 * timestamp with respect to the caller.
 	 */
 	ts_nsec = local_clock();
-	if (!ts_nsec)
+	if (ts_nsec)
+		early_times_may_start_calibration(ts_nsec);
+	else
 		ts_nsec = early_cycles();
 
 	caller_id = printk_caller_id();


> > 
> > 2) A Linux VM running in the Azure cloud is also running on Hyper-V. Such a
> > VM typically uses cloud-init to set everything up at boot time, and cloud-init
> > is outputting lines to the serial console with a timestamp that looks like the
> > printk() timestamp, but apparently is not adjusted for the early timestamping
> > that this patch adds. Again, I haven't debugged what's going on -- I'm not
> > immediately sure of the mechanism that cloud-init uses to do output to the
> > serial console. The use of the Hyper-V synthetic clock source might the cause
> > of the problem here as well. Here's an output snippet from the serial console:
> > 
> > [   20.330414] systemd[1]: Condition check resulted in OpenVSwitch configuration for cleanup being skipped.
> > [   20.332911] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
> > [   20.333257] pstore: Registered efi_pstore as persistent store backend
> > [   20.334360] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
> > [   20.338319] systemd[1]: Starting Load Kernel Modules...
> > [   20.341094] systemd[1]: Starting Remount Root and Kernel File Systems...
> > [   20.350993] systemd[1]: Starting udev Coldplug all Devices...
> > [   20.356255] systemd[1]: Starting Uncomplicated firewall...
> > [   20.361536] systemd[1]: Started Journal Service.
> > [   20.386902] EXT4-fs (sda1): re-mounted c02dce0c-0c40-4e6e-88af-c5a0987b0adb r/w.
> > [   22.532033] /dev/sr0: Can't lookup blockdev
> > [    7.955973] cloud-init[783]: Cloud-init v. 24.3.1-0ubuntu0~20.04.1 running 'init-local' at Wed, 11 Mar 2026 15:27:06 +0000. Up 7.48
> > seconds.
> > [    9.933120] cloud-init[822]: Cloud-init v. 24.3.1-0ubuntu0~20.04.1 running 'init' at Wed, 11 Mar 2026 15:27:08 +0000. Up 9.82 seconds.
> > [    9.935483] cloud-init[822]: ci-info: ++++++++++++++++++++++++++++++++++++++Net device
> > info+++++++++++++++++++++++++++++++++++++++
> > [    9.937726] cloud-init[822]: ci-info: +--------+------+-----------------------------+---------------+--------+-------------------+
> > [    9.939905] cloud-init[822]: ci-info: | Device |  Up  |           Address           |      Mask     | Scope  |     Hw-Address    |
> > [    9.942059] cloud-init[822]: ci-info: +--------+------+-----------------------------+---------------+--------+-------------------+

This is more complicated. I wonder if the timestamps from cloud-init()
are somehow synchronized with local_clock().

We might need to synchronize local_clock() with the cycles as well.
But there is the chicken&egg problem. We need:

    + to know the offset caused by cycles when local_clock() gets initialized.
    + local_clock() running for some time to calibrate cycles.

Hmm, I see that time-management people are not in Cc. We should have
added them since v1.

I add them now. Better late than never.

Best Regards,
Petr
