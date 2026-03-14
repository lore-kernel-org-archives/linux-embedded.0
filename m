Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5505D1C8634
	for <linux-embedded@vger.kernel.org>; Sat, 14 Mar 2026 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497810; cv=none; b=nwp1cWAwAKJPY+GGwIJFAsDXSaFJ1PyfJNBgzKrljnesgz8YFBz1IC1R5Jg5CpMOcoF1IrKHSeut2iJ/gOWHy+a/1F4hA1l8E/R1Y/sON6XwTsMMV5g+hwlsos8CnkXyykUgCEa217tZr+Tu4QeQPqBMwEqOOK4pUaYMDQiqp0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497810; c=relaxed/simple;
	bh=LB/QhRyRry7iTGndeIemtxMtds03jvINUDqmtERpk2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uD5j1a0OF/epugtcAC+nXLzSy9B4t8LrEuPzlQT8X9fsX8S5vD8rx0BgxF097GtJnJjp1o9WtIc0c0w7WTt06sfDWA92X//5LTjTsBukIa47TlJPusAGk4W7CC36HaWM84B6wifcf9et+tZivBA00FZPTYFfxwOjIqBa8+vlCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNvAHFCr; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNvAHFCr"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a18b65515so1904967a91.1
        for <linux-embedded@vger.kernel.org>; Sat, 14 Mar 2026 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773497809; x=1774102609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiqrUcSLV54mlQ94255asbSG62CfCglfLTjsL13BKU0=;
        b=LNvAHFCrPiAnwjfhHkRpX4q/opwB4wjpw6Th9FNtt/PsTXrX7nVW354J2rrS6vZKIq
         wLm2ZA2Pnyb4je4RycPPxjrUhy9lg7j2AgyqHsNRgNYwrTTDRRFGZDkF5xoiZOgCjHJ/
         /nx84juBrMDV4qugyrfWbL/cVmx4e/K6g3cDgy3X2Q68HpVRC690Fkt4nKQFqP9Oy1nx
         bhBSHDdMLszFX502Vie2URxCOHdxRZHljxIoTT1zWWtS01fgp6QiBlD1RvvHR5MeHP2z
         WCSfqrnKDifs9obpLT31nlHkx4ISvTsykRRI/b5cTqNrw2QtU6SDv8OScHsZXn8bwfF4
         o4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773497809; x=1774102609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiqrUcSLV54mlQ94255asbSG62CfCglfLTjsL13BKU0=;
        b=X125BpQZ7J/ZHoXEq+cVX53K1tgDOO4mUnR7PjnJS74fj3WBqtpYLP0KNgVdDdkFKs
         KgKB5TqwXbNzDOAZptNVR3J9FXPz7FUcrVUPNwWEhAcU/JpXFvDFEX1OtSlvsdfmWTRA
         K/UPrTdxHQATvtbUmNXS15z19p/RZwpSFqpBbSAY4Wu5MwMr85eTsUQWmTzBSPxfQ5Ze
         OigcERb6T2iFDxCKPTw/GjnoW5tb7FuURv/YMPZIZYXM90yktGYO4YjDGkKHWyXJiEbE
         As0EJHZR0ZTcsJTC+5b7gQZfJQNAYftRzssMKHN5vURjEUnPRgGYvh4Cmo6lHrdZKu4Z
         IU7w==
X-Forwarded-Encrypted: i=1; AJvYcCUJsILpUakydNtbaE7pmOryEqDkuBrgdXIs0jeC+iwPp30wvVqJAKqUx1Susi3FQqDZhna9FLl8ro+VBSCAAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3uFkF87coPhLB1TEs23ygd93/3mIe1n2YeiRDgx3OJT1w4/v/
	5JJj6en33Xh+nDOLHwpmXKfszZeadQfM22HmgF2ptJv6c8Rqu5viaMSe
X-Gm-Gg: ATEYQzwn17MFtib3TB3sl2F8kPeLDu1+vAUyheR4NhM3hzQBbfmWgYDtHYELpAw0eCP
	mIzBlOSG2vCeHi38LA8FStMJUZIH45q6qw7nOKFbXJFdJYvRArXlIi4oblkYH2N8tVUxpe9+fTo
	h0jtc9D81YNblarszN9AuSDfK/OmMVXXN2b7accc6lvSrGqe4Yo8hrhkj7KqlnVChZVK4L/HRWs
	pm3BpNmYQlQt7D0pYpAYr8EVJ+yxvm2lHGd6zh7ZSOJBbQ8blabZ7Wwu0+77lQDQXGnITB6kfUR
	ah8QzUjnkatHv7J3g2p9t60PqwOsVzud1xtH21njMQr6ckvoifoJIBGE9V62+ZT3A8z3zQ7ZdZM
	/lTbVnBPXTBxSKYxGbTEeXdP4tQQvDQyjEFQx3XxSnsCvzZTn6gGhzAqzFxzQpJeaIY/kzlLfZn
	XeU7Esytisj15vckha2WmKlKpq4fQXTja36vSsPisOFnB2T+c47eArKt5cSNngVxoXS/db460i8
	PkzrbXk/jmPn8sf
X-Received: by 2002:a17:902:d481:b0:2b0:4579:af2 with SMTP id d9443c01a7336-2b0457911b2mr19453565ad.29.1773497808473;
        Sat, 14 Mar 2026 07:16:48 -0700 (PDT)
Received: from fedora (p4582043-ipxg23101hodogaya.kanagawa.ocn.ne.jp. [153.205.170.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8098f7sm51644335ad.62.2026.03.14.07.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 07:16:48 -0700 (PDT)
Date: Sat, 14 Mar 2026 23:16:20 +0900
From: Shashank Balaji <shashankbalaji02@gmail.com>
To: Petr Mladek <pmladek@suse.com>, "Bird, Tim" <Tim.Bird@sony.com>
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
Message-ID: <abVttIDVZ4y2BZAU@fedora>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <abPqrqgXHnDu8XWf@pathway>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abPqrqgXHnDu8XWf@pathway>

Hi Tim, Petr,

On Fri, Mar 13, 2026 at 11:45:02AM +0100, Petr Mladek wrote:
> Finally added timekeeping maintainers and John into Cc.
> We should have added time since v1.
> 
> Anyway, you might see the entire history at
> https://lore.kernel.org/all/39b09edb-8998-4ebd-a564-7d594434a981@bird.org/
> 
> 
> On Fri 2026-03-13 04:52:40, Bird, Tim wrote:
> > Hey Micheal,
> > 
> > This report is very interesting. 
> > 
> > Thanks very much for trying it out!
> > 
> > > -----Original Message-----
> > > From: Michael Kelley <mhklinux@outlook.com>
> > > Sent: Wednesday, March 11, 2026 9:47 AM
> > > From: Tim Bird <tim.bird@sony.com> Sent: Tuesday, February 10, 2026 3:48 PM
> > > >
> > > > During early boot, printk timestamps are reported as zero before
> > > > kernel timekeeping starts (e.g. before time_init()).  This
> > > > hinders boot-time optimization efforts.  This period is about 400
> > > > milliseconds for many current desktop and embedded machines
> > > > running Linux.
> > > >
> > > > Add support to save cycles during early boot, and output correct
> > > > timestamp values after timekeeping is initialized.  get_cycles()
> > > > is operational on arm64 and x86_64 from kernel start.  Add code
> > > > and variables to save calibration values used to later convert
> > > > cycle counts to time values in the early printks.  Add a config
> > > > to control the feature.
> > > >
> > > > This yields non-zero timestamps for printks from the very start
> > > > of kernel execution.  The timestamps are relative to the start of
> > > > the architecture-specified counter used in get_cycles
> > > > (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> > > >
> > > > All timestamps reflect time from processor power-on instead of
> > > > time from the kernel's timekeeping initialization.
> > > 
> > > I tried this patch in linux-next20260302 kernel running as a guest VM
> > > on a Hyper-V host. Two things:
> > > 
> > > 1) In the dmesg output, I'm seeing a place where the timestamps briefly go
> > > backwards -- i.e., they are not monotonically increasing. Here's a snippet,
> > > where there's a smaller timestamp immediately after the tsc is detected:
> > > 
> > > [   27.994891] SMBIOS 3.1.0 present.
> > > [   27.994893] DMI: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 09/25/2025
> > > [   27.994898] DMI: Memory slots populated: 2/2
> > > [   27.995202] Hypervisor detected: Microsoft Hyper-V
> > > [   27.995205] Hyper-V: privilege flags low 0xae7f, high 0x3b8030, ext 0x62, hints 0xa0e24, misc 0xe0bed7b2
> > > [   27.995208] Hyper-V: Nested features: 0x0
> > > [   27.995209] Hyper-V: LAPIC Timer Frequency: 0xc3500
> > > [   27.995210] Hyper-V: Using hypercall for remote TLB flush
> > > [   27.995216] clocksource: hyperv_clocksource_tsc_page: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
> > > [   27.995218] clocksource: hyperv_clocksource_msr: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
> > > [   27.995220] tsc: Detected 2918.401 MHz processor
> > 
> > I wonder if the tsc is getting fiddled with or virtualized somewhere in here, as part of clocksource initialization.
> > I believe each clocksource in the kernel maintains it's own internal offset, and maybe the offset that is
> > being used ends up being slightly different from the cycle-counter offset that the early_times feature uses.
> > I'm just throwing out guesses.  It's about a 4ms delta, which is pretty big.
> > 
> > > [   27.991060] e820: update [mem 0x00000000-0x00000fff] System RAM ==> device reserved
> > > [   27.991062] e820: remove [mem 0x000a0000-0x000fffff] System RAM
> > > [   27.991064] last_pfn = 0x210000 max_arch_pfn = 0x400000000
> > > [   27.991065] x86/PAT: PAT support disabled because CONFIG_X86_PAT is disabled in the kernel.
> > > [   27.991066] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC
> 
> I wonder how the calibration of the cycles is precise. I wonder if
> the problem might be that cycles were faster right after boot than
> later during the calibration.
> 
> I added the following debug output on top of this patch:
> 
> diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> index 05388dcb8573..cdb467345bcc 100644
> --- a/include/linux/early_times.h
> +++ b/include/linux/early_times.h
> @@ -20,6 +20,7 @@ static inline void early_times_start_calibration(void)
>  {
>  	start_cycles = get_cycles();
>  	start_ns = local_clock();
> +	pr_info("Early printk times: started callibration: %llu ns\n", start_ns);
>  }
>  
>  static inline void early_times_finish_calibration(void)
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 774ffb1fa5ac..836cb03aaa6d 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2308,6 +2308,8 @@ int vprintk_store(int facility, int level,
>  	ts_nsec = local_clock();
>  	if (!ts_nsec)
>  		ts_nsec = early_cycles();
> +	else
> +		pr_info_once("local_clock() returned non-zero timestamp: %llu nsec\n", ts_nsec);
>  
>  	caller_id = printk_caller_id();
>  
> 
> And it produced in my kvm:
> 
> Let's say that start of the cycle counter is
> 
> Start of stage A
> 
> [    8.684438] Linux version 7.0.0-rc2-default+ (pmladek@pathway) (gcc (SUSE Linux) 15.2.1 20260202, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.45.0.20251103-2) #571 SMP PREEMPT_DYNAMIC Fri Mar 13 10:23:54 CET 2026
> [    8.684442] Command line: BOOT_IMAGE=/boot/vmlinuz-7.0.0-rc2-default+ root=/dev/vda2 resume=/dev/disk/by-uuid/369c7453-3d16-409d-88b2-5de027891a12 mitigations=auto nosplash earlycon=uart8250,io,0x3f8,115200 console=ttyS0,115200 console=tty0 ignore_loglevel log_buf_len=1M crashkernel=512M,high crashkernel=72M,low
> [...]
> [    8.696633] earlycon: uart8250 at I/O port 0x3f8 (options '115200')
> [    8.696639] printk: legacy bootconsole [uart8250] enabled
> [    8.731303] printk: debug: ignoring loglevel setting.
> [    8.732349] NX (Execute Disable) protection: active
> [    8.733447] APIC: Static calls initialized
> [    8.734667] SMBIOS 2.8 present.
> [    8.735358] DMI: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-2-g4f253b9b-prebuilt.qemu.org 04/01/2014
> [    8.737285] DMI: Memory slots populated: 1/1
> [    8.738380] Hypervisor detected: KVM
> [    8.739151] last_pfn = 0x7ffdc max_arch_pfn = 0x400000000
> [    8.740254] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    8.732971] printk: local_clock() returned non-zero timestamp: 3486 nsec
> 
> End of stage A
> 
> This is the point where printk() started storing the values from
> local_clock() instead of cycles.
> 
> Start of stage B
> 
> [    8.732971] kvm-clock: using sched offset of 252367014082295 cycles
> [    8.735471] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    8.738880] tsc: Detected 3293.776 MHz processor
> [    8.740474] e820: update [mem 0x00000000-0x00000fff] System RAM ==> device reserved
> [...]
> [    8.932671] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    8.934047] Early printk times: started callibration: 201079507 ns
> 
> End of stage B
> 
> This is where we started calibration of early cycles.
> 
> Start of stage C
> 
> [    8.935571] Console: colour dummy device 80x25
> [...]
> [    9.289673] thermal_sys: Registered thermal governor 'fair_share'
> [    9.290077] thermal_sys: Registered thermal governor 'bang_bang'
> [    9.292290] thermal_sys: Registered thermal governor 'step_wise'
> [    9.293530] thermal_sys: Registered thermal governor 'user_space'
> [    9.294856] cpuidle: using governor ladder
> [    9.296302] cpuidle: using governor menu
> 
> Here the thermal governors are registered. I guess that they might
> reduce speed of some HW.
> 
> [...]
> [   11.974147] clk: Disabling unused clocks
> 
> Some unused clocks are disabled. I wonder if this might affect
> counting the cycles.
> 
> [   12.330852] Freeing unused kernel image (rodata/data gap) memory: 1500K
> [   12.351191] Early printk times: mult=19634245, shift=26, offset=8732967929 ns
> 
> End of stage C
> 
> Here is the end on calibration.
> 
> Now, if the frequence of the cycles was:
> 
>    + was higher in the stage A when only cycles were stored
>    + was lower in stage C when it was calibrated against local_clock()
> 
> Then it might result in higher (calibrated) timestamps in stage A
> and step back in stage B.
> 
> Or something like this. It is possible that even local_clock() does
> not have a stable frequence during the early boot.
> 
> Idea: A solution might be to start calibration when printk()
>       gets first non-zero time from local_clock.
> 
>       Something like:
> 
> diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> index 05388dcb8573..09d278996184 100644
> --- a/include/linux/early_times.h
> +++ b/include/linux/early_times.h
> @@ -16,10 +16,13 @@ extern u64 start_ns;
>  extern u32 early_mult, early_shift;
>  extern u64 early_ts_offset;
>  
> -static inline void early_times_start_calibration(void)
> +static inline void early_times_may_start_calibration(u64 ts_ns)
>  {
> +	if (start_ns)
> +		return;
> +
> +	start_ns = ts_ns;
>  	start_cycles = get_cycles();
> -	start_ns = local_clock();
>  }
>  
>  static inline void early_times_finish_calibration(void)
> diff --git a/init/main.c b/init/main.c
> index 27835270dfb5..a333b0da69cf 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1123,9 +1123,6 @@ void start_kernel(void)
>  	timekeeping_init();
>  	time_init();
>  
> -	/* This must be after timekeeping is initialized */
> -	early_times_start_calibration();
> -
>  	/* This must be after timekeeping is initialized */
>  	random_init();
>  
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 774ffb1fa5ac..19330b6b4eb2 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2306,7 +2306,9 @@ int vprintk_store(int facility, int level,
>  	 * timestamp with respect to the caller.
>  	 */
>  	ts_nsec = local_clock();
> -	if (!ts_nsec)
> +	if (ts_nsec)
> +		early_times_may_start_calibration(ts_nsec);
> +	else
>  		ts_nsec = early_cycles();
>  
>  	caller_id = printk_caller_id();
> 
> 
> > > 
> > > 2) A Linux VM running in the Azure cloud is also running on Hyper-V. Such a
> > > VM typically uses cloud-init to set everything up at boot time, and cloud-init
> > > is outputting lines to the serial console with a timestamp that looks like the
> > > printk() timestamp, but apparently is not adjusted for the early timestamping
> > > that this patch adds. Again, I haven't debugged what's going on -- I'm not
> > > immediately sure of the mechanism that cloud-init uses to do output to the
> > > serial console. The use of the Hyper-V synthetic clock source might the cause
> > > of the problem here as well. Here's an output snippet from the serial console:
> > > 
> > > [   20.330414] systemd[1]: Condition check resulted in OpenVSwitch configuration for cleanup being skipped.
> > > [   20.332911] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
> > > [   20.333257] pstore: Registered efi_pstore as persistent store backend
> > > [   20.334360] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
> > > [   20.338319] systemd[1]: Starting Load Kernel Modules...
> > > [   20.341094] systemd[1]: Starting Remount Root and Kernel File Systems...
> > > [   20.350993] systemd[1]: Starting udev Coldplug all Devices...
> > > [   20.356255] systemd[1]: Starting Uncomplicated firewall...
> > > [   20.361536] systemd[1]: Started Journal Service.
> > > [   20.386902] EXT4-fs (sda1): re-mounted c02dce0c-0c40-4e6e-88af-c5a0987b0adb r/w.
> > > [   22.532033] /dev/sr0: Can't lookup blockdev
> > > [    7.955973] cloud-init[783]: Cloud-init v. 24.3.1-0ubuntu0~20.04.1 running 'init-local' at Wed, 11 Mar 2026 15:27:06 +0000. Up 7.48
> > > seconds.
> > > [    9.933120] cloud-init[822]: Cloud-init v. 24.3.1-0ubuntu0~20.04.1 running 'init' at Wed, 11 Mar 2026 15:27:08 +0000. Up 9.82 seconds.
> > > [    9.935483] cloud-init[822]: ci-info: ++++++++++++++++++++++++++++++++++++++Net device
> > > info+++++++++++++++++++++++++++++++++++++++
> > > [    9.937726] cloud-init[822]: ci-info: +--------+------+-----------------------------+---------------+--------+-------------------+
> > > [    9.939905] cloud-init[822]: ci-info: | Device |  Up  |           Address           |      Mask     | Scope  |     Hw-Address    |
> > > [    9.942059] cloud-init[822]: ci-info: +--------+------+-----------------------------+---------------+--------+-------------------+
> 
> This is more complicated. I wonder if the timestamps from cloud-init()
> are somehow synchronized with local_clock().
> 
> We might need to synchronize local_clock() with the cycles as well.
> But there is the chicken&egg problem. We need:
> 
>     + to know the offset caused by cycles when local_clock() gets initialized.
>     + local_clock() running for some time to calibrate cycles.
>

Based on the discussions thus far, I see three problems currently:

1. Three phases of timestamps on consoles printing synchronously is awkward
2. Possible userspace breakage:

    I don't know how big of a concern this is, but if the timestamps were to not start at zero, any
    tools expecting them to, would be shocked. printk timestamp comparison with CLOCK_BOOTTIME
    wouldn't work anymore.

3. Counter frequency constancy requirement:

    For the early time calibration to be accurate, the counter frequency should be constant from
    processor power on to the end of the calibration. We don't know what the firmware or the bootloader
    may do in-between. If the counter frequency depends on cpu frequency or is just unstable, then we
    should err on the side of caution and bail out of early times. On the other hand, if constant counter
    frequency is architecturally guaranteed or if the cpu advertises so, then we should be good. Like,
    x86 has one only if boot_cpu_has(X86_FEATURE_CONSTANT_TSC), rest are dubious.

Idea: Making the early timestamps start at 0 would partially address these problems:

1. No awkward three phases of timestamps:

    The only difference would be that serial would have a number of timestamps exactly at 0, while userspace
    wouldn't. The early time calibration data would only be used for userspace to convert the counter values
    to timestamps with a zero origin.

2. Userspace breakage:

    CLOCK_BOOTTIME's origin is timekeeping init. So relative to that, the origin of early timestamps would be
    closer, but still different.

Making the early timestamps start at 0 would also lower counter frequency constancy requirement. Now the constancy
requirement would only be between the period of kernel start to calibration end, a phase in which the kernel is
in full control. Maybe even if !boot_cpu_has(X86_FEATURE_CONSTANT_TSC), the calibration data would be fine to use?
This is debatable.

A disadvantage of this method is that visibility into per-kernel duration is lost. But that can be made up for by
adding something like:

    pr_info("Pre-kernel duration: %llu ms\n", pre_kernel_time);

But this information should be taken with a grain of salt if constant counter frequency is not guaranteed.

Another point, since constancy of counter frequency is being relied upon anyway, conversion of counter value to
timestamp can be done later once counter frequency calibration is complete, instead of doing our own calibration. 
An arch hook like arch_counter_freq() could be provided from which we can get this info. On x86, it would be wired
up to tsc_khz. If arch_counter_freq() returns 0, that means constant frequency is not guaranteed, so we'd bail
out of the counter value to timestamp conversion.

Thanks,
Shashank
