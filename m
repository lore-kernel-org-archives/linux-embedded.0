Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761C2054EE
	for <linux-embedded@vger.kernel.org>; Tue,  4 Feb 2025 20:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700659; cv=none; b=Pu2uSBRjP/0Ni+cMI5ZRB7eEV4W+030+1jw3J6qhm1pp/53p54WWfiFWZeEZRQ75Gi6ZK033OTa6ZKrTChy4FRa4lPsH1AkZV4Bx+z6V54ymAT2foOMAtZmQmIGpNj/hm5InCNpUp6yNGlcbSUe1cuMQ1rI8hB2xbuj1vwo6FZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700659; c=relaxed/simple;
	bh=hDMUVQE00AAEjXXrrXdp7su487eDb6heNgweOBJLsjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBhpRT0HyAjqMwB76lmT7GpvEbheVQmyqYkJsrKBFJh9TjusSGOC0Ki+sL5+OwhKCB2WakuKhz4gFdd89HBuFKzt9Dd0DlEYizt1wb6qcjYvaaikk4KoG5neZpPgEWcRsNash1VjLIi9MhEz/zfz/NOtv9LLMVQW5eChYUqAKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ao1JiHq1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ao1JiHq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738700646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7zVnlnS2Acyj5l2nLAN07ec+Cu5Bfo9pw/sW8oD+As=;
	b=Ao1JiHq1gMFGQgnUPiKZ9X74ZlN4/hbssczj9+ioGkbHpUWEhoK0rVYXrryl3Ur+IPcMMF
	XNs8JBonINBU/wYoZ3YvHjV4JYjoS1tiU32tJkqnv6WQJH7gwfprAa7M/GbVj0IHDTDN0Y
	4raR5iru/MRmgB27icax34OC9DnHKPI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-88j6-kwWN8WFctyqcK5C2Q-1; Tue, 04 Feb 2025 15:24:02 -0500
X-MC-Unique: 88j6-kwWN8WFctyqcK5C2Q-1
X-Mimecast-MFC-AGG-ID: 88j6-kwWN8WFctyqcK5C2Q
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467bbc77b05so119257661cf.0
        for <linux-embedded@vger.kernel.org>; Tue, 04 Feb 2025 12:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738700641; x=1739305441;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7zVnlnS2Acyj5l2nLAN07ec+Cu5Bfo9pw/sW8oD+As=;
        b=uB/yqPj6DxOEjWmKA+pKjXRW7+mCw4QQ+CaGcKEce6ym7IEFP6Jvv9rryyc/Av3/g/
         afs+y1bgQUqrq25hLHWHSB/KLIc/Uod3rT/G3qzV8O7YORAmULoyTfWPpkhBUWJBhYEL
         WOJw3C73h/QNSSKdv8DVsO3S2LOagfUzMeM8vE3SOi/bOlG5AkJ2L7ZmJLmMFEpUmwbN
         +GAtLKKjcRj1wUG7GzZlWwQ684GDgJb+QIMRVZ20VqCiZOAkLjs+ROnjJytxc17TtScp
         8o2HYoQ63Auvei3fI6mdyrXm64oodlQ6p3SPWrFflMJYOw0CSAtTJhhjfbd755tFocpa
         Cyhw==
X-Gm-Message-State: AOJu0YzA026UVjTuguqzK/LAgNJwIlFrDDaM3IgsvfjJtJdQ0rGBetov
	091W/wekT423NY0lsEt7d20+93vGnuXQx+Z9+6fScuepV1myTUlYNOtmoFHuA/DrLV0WCV77xP/
	vLOVKrAU3E0LfMQdDKhT4w5NSJqRq55V39xTtdKBbmttE8SxdUFvbJvYFdJJjQRtAJX/Dk76q
X-Gm-Gg: ASbGncss4hDnxRGJtxGUoqcTYY6xNpUYFV8bdUWCh1e0U93hsLrJZLjLsUZITUADex5
	kZHp4+7mbNBRKdfAQR0XmK3EGtTFVWXyyaALf/3I3+fwxKThbx59r2Sb+nPF4QZdI4oP1N4Xe0N
	ASAPA2A/FJnVhjsHFuQ7mTU0hTh9R+dGWvfKvFk8fezD+TcXwzv8PajPdjy3uXE4Fo4xaItKFz5
	wytWfXj565EvNSxH6vj6Ul/uwb5UR2nyjZxldfMBRDqXqyd1piMXWrmNwASkLH8aflycEie9Acp
	7qjNZ5wxwuTOA2Fx1Dhuys5dsvDcPgY=
X-Received: by 2002:a05:622a:4245:b0:467:6c95:19e5 with SMTP id d75a77b69052e-47028196e23mr681811cf.8.1738700641009;
        Tue, 04 Feb 2025 12:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOAfCZGf1AV2nBswOA1atKV5e5eRmuR9E+0wCT3wHh48dmPYGozyNc6znczis/TqqXgZuz6A==
X-Received: by 2002:a05:622a:4245:b0:467:6c95:19e5 with SMTP id d75a77b69052e-47028196e23mr679741cf.8.1738700638929;
        Tue, 04 Feb 2025 12:23:58 -0800 (PST)
Received: from x13s (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf18a67dsm62646531cf.72.2025.02.04.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 12:23:56 -0800 (PST)
Date: Tue, 4 Feb 2025 15:23:54 -0500
From: Brian Masney <bmasney@redhat.com>
To: Francesco Valla <valla.francesco@gmail.com>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: Re: [boot-time] [SCRIPT v4] analyze-initcall-debug.py
Message-ID: <Z6J3WpeJKIKENC81@x13s>
References: <4927911.OV4Wx5bFTl@fedora.fritz.box>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ABq91/YDHTD7iOmD"
Content-Disposition: inline
In-Reply-To: <4927911.OV4Wx5bFTl@fedora.fritz.box>
User-Agent: Mutt/2.2.13 (2024-03-09)


--ABq91/YDHTD7iOmD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2025 at 06:15:53PM +0100, Francesco Valla wrote:
> Hello,
> 
> this is the fourth version of the analyze-initcall-debug.py script, which can
> be used to analyze the kernel output when booting with initcall_debug
> to extract some human-readable data from it.
> 
> This version brings a complete bootchart of the kernel-side portion of the
> boot sequence, showing both the initcalls and the probes.

Hi Francesco,

This is a useful script and I have a few suggestions:

- Report on the probe deferrals, and group them by name. For example,
  this is one of the probe deferrals on my Thinkpad x13s laptop
  with a Qualcomm SoC:

    probe of 3210000.soundwire returned -517 after 3 usecs

  As a hack, I can group them together with this one liner:

    x13s:~$ grep 517 dmesg.txt  | grep returned | \
              awk -F"probe of " '{print $2}' | awk '{print $1" "$5}' | sort \
              awk '{a[$1]+=$2} END {for (i in a) print i, a[i]}' | sort
    15000000.iommu 750
    18200000.rsc:regulators-2 61
    1c00000.pcie 13458
    1c10000.pcie 18266
    1c20000.pcie 250
    3200000.rxmacro 51
    3210000.soundwire 18
    3220000.txmacro 105
    ...

  and add the following to the end to get the overall time:

    | awk '{sum += $2} END {print sum}'

  493,730 usec in this example.

  Note I attached the dmesg for my system since it's a pretty extreme
  example since we have pinctrl drivers set to modules instead of built
  in on Fedora.

  I CCed Saravana since he mentioned at the boot SIG meeting last week
  that this may not be an accurate way to measure probe deferrals. Take
  a look at the output of 'grep 33c0000.pinctrl' against the
  dmesg I attached, and see the timestamps are the range
  2.190008 - 13.358063.

- Run pylint against the code and fix up some of the warnings that are
  reported.

- Add commas to some of the output. For example, change:

    Top 10 initcall durations:
     * apm_driver_init -> 804412us
     * panel_edp_init -> 205809us

  to:

    Top 10 probe durations:
     * gprsvc:service:2:1 -> 5288,273us
     * 1c10000.pcie -> 1,091,920us

- Map the return values to their pretty name. For example, change:

    Failed initcalls/probes:
     * kvm_arm_init -> ret = -19
     * test_kstrtox_init -> ret = -22

  to:

     * kvm_arm_init -> ret = -ENODEV (-19)
     * test_kstrtox_init -> ret = -EINVAL (-22)

Brian

--ABq91/YDHTD7iOmD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.txt"

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b0]
[    0.000000] Linux version 6.13.1-300.vanilla.fc41.aarch64 (mockbuild@e33a9e20464b4b1795fee0776cf41066) (gcc (GCC) 14.2.1 20250110 (Red Hat 14.2.1-7), GNU ld version 2.43.1-5.fc41) #1 SMP PREEMPT_DYNAMIC Sat Feb  1 18:05:31 UTC 2025
[    0.000000] KASLR enabled
[    0.000000] Machine model: Lenovo ThinkPad X13s
[    0.000000] efi: EFI v2.7 by Lenovo
[    0.000000] efi: RTPROP=0xffe89398 ACPI 2.0=0xffffd000 MEMATTR=0xfb125418 ESRT=0xfcaf5918 SMBIOS=0xffed1000 MOKvar=0xff71f000 INITRD=0xef96d618 RNG=0xffffbf18 MEMRESERVE=0xef96da18 
[    0.000000] random: crng init done
[    0.000000] esrt: Reserving ESRT space from 0x00000000fcaf5918 to 0x00000000fcaf59a0.
[    0.000000] Reserved memory: created CMA memory pool at 0x0000000c78000000, size 128 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000c78000000..0x0000000c7fffffff (131072 KiB) map reusable linux,cma
[    0.000000] OF: reserved mem: 0x0000000080000000..0x000000008085ffff (8576 KiB) nomap non-reusable reserved-region@80000000
[    0.000000] OF: reserved mem: 0x0000000080860000..0x000000008087ffff (128 KiB) nomap non-reusable cmd-db-region@80860000
[    0.000000] OF: reserved mem: 0x0000000080880000..0x00000000808fffff (512 KiB) nomap non-reusable reserved-region@80880000
[    0.000000] OF: reserved mem: 0x0000000080900000..0x0000000080afffff (2048 KiB) nomap non-reusable smem-region@80900000
[    0.000000] OF: reserved mem: 0x0000000080b00000..0x0000000080bfffff (1024 KiB) nomap non-reusable reserved-region@80b00000
[    0.000000] OF: reserved mem: 0x0000000083b00000..0x00000000851fffff (23552 KiB) nomap non-reusable reserved-region@83b00000
[    0.000000] OF: reserved mem: 0x0000000085b00000..0x00000000866fffff (12288 KiB) nomap non-reusable reserved-region@85b00000
[    0.000000] OF: reserved mem: 0x0000000086c00000..0x0000000088bfffff (32768 KiB) nomap non-reusable adsp-region@86c00000
[    0.000000] OF: reserved mem: 0x000000008a100000..0x000000008befffff (30720 KiB) nomap non-reusable cdsp0-region@8a100000
[    0.000000] OF: reserved mem: 0x000000008c600000..0x000000008e3fffff (30720 KiB) nomap non-reusable cdsp1-region@8c600000
[    0.000000] OF: reserved mem: 0x00000000aeb00000..0x00000000c50fffff (366592 KiB) nomap non-reusable reserved-region@aeb00000
[    0.000000] OF: reserved mem: 0x000000008bf00000..0x000000008bf01fff (8 KiB) nomap non-reusable gpu-mem@8bf00000
[    0.000000] NUMA: Faking a node at [mem 0x0000000080600000-0x0000000c7fffffff]
[    0.000000] NODE_DATA(0) allocated [mem 0xc73e47700-0xc73e5e43f]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080600000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x0000000c7fffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080600000-0x00000000806fffff]
[    0.000000]   node   0: [mem 0x0000000080880000-0x00000000808affff]
[    0.000000]   node   0: [mem 0x00000000808c0000-0x00000000808effff]
[    0.000000]   node   0: [mem 0x0000000080c00000-0x00000000826fffff]
[    0.000000]   node   0: [mem 0x000000008e400000-0x000000009f5cffff]
[    0.000000]   node   0: [mem 0x000000009f5f7000-0x000000009f5fffff]
[    0.000000]   node   0: [mem 0x000000009f600000-0x00000000ae9fffff]
[    0.000000]   node   0: [mem 0x00000000aea00000-0x00000000bfffffff]
[    0.000000]   node   0: [mem 0x00000000c6200000-0x00000000c85fffff]
[    0.000000]   node   0: [mem 0x00000000c8600000-0x00000000ff36dfff]
[    0.000000]   node   0: [mem 0x00000000ff36e000-0x00000000fff21fff]
[    0.000000]   node   0: [mem 0x00000000fff22000-0x00000003ffffffff]
[    0.000000]   node   0: [mem 0x0000000800000000-0x0000000c7fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080600000-0x0000000c7fffffff]
[    0.000000] On node 0, zone DMA: 1536 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 384 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 16 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 784 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 48384 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 39 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 25088 pages in unavailable ranges
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] psci: OSI mode supported.
[    0.000000] psci: [Firmware Bug]: failed to set PC mode: -3
[    0.000000] percpu: Embedded 56 pages/cpu s104408 r8192 d116776 u229376
[    0.000000] pcpu-alloc: s104408 r8192 d116776 u229376 alloc=56*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: SYS_ID_AA64ISAR1_EL1[31:28]: already set to 0
[    0.000000] CPU features: SYS_ID_AA64ISAR1_EL1[27:24]: forced to 0
[    0.000000] CPU features: SYS_ID_AA64ISAR1_EL1[11:8]: already set to 0
[    0.000000] CPU features: SYS_ID_AA64ISAR1_EL1[7:4]: forced to 0
[    0.000000] CPU features: SYS_ID_AA64ISAR2_EL1[15:12]: already set to 0
[    0.000000] CPU features: SYS_ID_AA64ISAR2_EL1[11:8]: already set to 0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: SSBS not fully self-synchronizing
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: BOOT_IMAGE=(hd0,gpt2)/vmlinuz-6.13.1-300.vanilla.fc41.aarch64 root=UUID=66ed970b-b91a-483e-9b82-b10fdfc12ea7 ro rootflags=subvol=root console=tty0 arm64.nopauth clk_ignore_unused pd_ignore_unused initcall_debug log_buf_len=8M
[    0.000000] Unknown kernel command line parameters "BOOT_IMAGE=(hd0,gpt2)/vmlinuz-6.13.1-300.vanilla.fc41.aarch64", will be passed to user space.
[    0.000000] printk: log buffer data + meta data: 8388608 + 29360128 = 37748736 bytes
[    0.000000] printk: early log buf free: 256104(97%)
[    0.000000] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8312377
[    0.000000] Policy zone: Normal
[    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: mapped [mem 0x00000000f7125000-0x00000000fb125000] (64MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] ftrace: allocating 64691 entries in 253 pages
[    0.000000] ftrace: allocated 253 pages with 7 groups
[    0.000000] Dynamic Preempt: voluntary
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=4096 to nr_cpu_ids=8.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: 960 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: GICD_CTRL.DS=0, SCR_EL3.FIQ=1
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000017a60000
[    0.000000] ITS [mem 0x17a40000-0x17a5ffff]
[    0.000000] ITS@0x0000000017a40000: allocated 8192 Devices @1002b0000 (indirect, esz 8, psz 64K, shr 1)
[    0.000000] ITS@0x0000000017a40000: allocated 32768 Interrupt Collections @1002c0000 (flat, esz 2, psz 64K, shr 1)
[    0.000000] GICv3: using LPI property table @0x00000001002d0000
[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x00000001002e0000
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000000] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.000205] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.000261] calling  con_init+0x0/0x260 @ 0
[    0.000293] Console: colour dummy device 80x25
[    0.000298] printk: legacy console [tty0] enabled
[    0.000549] initcall con_init+0x0/0x260 returned 0 after 0 usecs
[    0.000553] calling  hvc_console_init+0x0/0x48 @ 0
[    0.000558] initcall hvc_console_init+0x0/0x48 returned 0 after 0 usecs
[    0.000561] calling  univ8250_console_init+0x0/0x58 @ 0
[    0.000573] initcall univ8250_console_init+0x0/0x58 returned 0 after 0 usecs
[    0.000576] calling  omap8250_console_fixup+0x0/0xd0 @ 0
[    0.000582] initcall omap8250_console_fixup+0x0/0xd0 returned 0 after 0 usecs
[    0.000585] calling  mvebu_uart_console_init+0x0/0x38 @ 0
[    0.000590] initcall mvebu_uart_console_init+0x0/0x38 returned 0 after 0 usecs
[    0.000593] calling  kgdboc_earlycon_late_init+0x0/0x50 @ 0
[    0.000598] initcall kgdboc_earlycon_late_init+0x0/0x50 returned 0 after 0 usecs
[    0.000635] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=19200)
[    0.000643] pid_max: default: 32768 minimum: 301
[    0.000712] LSM: initializing lsm=lockdown,capability,yama,selinux,bpf,landlock,ipe,ima,evm
[    0.000768] Yama: becoming mindful.
[    0.000782] SELinux:  Initializing.
[    0.001462] LSM support for eBPF active
[    0.001518] landlock: Up and running.
[    0.001670] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.001708] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.003129] calling  trace_init_flags_sys_enter+0x0/0x30 @ 1
[    0.003144] initcall trace_init_flags_sys_enter+0x0/0x30 returned 0 after 0 usecs
[    0.003150] calling  trace_init_flags_sys_exit+0x0/0x30 @ 1
[    0.003155] initcall trace_init_flags_sys_exit+0x0/0x30 returned 0 after 0 usecs
[    0.003160] calling  cpu_suspend_init+0x0/0x88 @ 1
[    0.003166] initcall cpu_suspend_init+0x0/0x88 returned 0 after 0 usecs
[    0.003169] calling  prevent_bootmem_remove_init+0x0/0x60 @ 1
[    0.003174] initcall prevent_bootmem_remove_init+0x0/0x60 returned 0 after 0 usecs
[    0.003178] calling  asids_init+0x0/0xf0 @ 1
[    0.003187] initcall asids_init+0x0/0xf0 returned 0 after 0 usecs
[    0.003191] calling  hyperv_init+0x0/0x150 @ 1
[    0.003196] initcall hyperv_init+0x0/0x150 returned 0 after 0 usecs
[    0.003201] calling  spawn_ksoftirqd+0x0/0x88 @ 1
[    0.003233] initcall spawn_ksoftirqd+0x0/0x88 returned 0 after 0 usecs
[    0.003239] calling  init_signal_sysctls+0x0/0x50 @ 1
[    0.003249] initcall init_signal_sysctls+0x0/0x50 returned 0 after 0 usecs
[    0.003254] calling  init_umh_sysctls+0x0/0x50 @ 1
[    0.003262] initcall init_umh_sysctls+0x0/0x50 returned 0 after 0 usecs
[    0.003267] calling  migration_init+0x0/0x38 @ 1
[    0.003274] initcall migration_init+0x0/0x38 returned 0 after 0 usecs
[    0.003279] calling  printk_set_kthreads_ready+0x0/0x68 @ 1
[    0.003284] initcall printk_set_kthreads_ready+0x0/0x68 returned 0 after 0 usecs
[    0.003288] calling  srcu_bootup_announce+0x0/0xa8 @ 1
[    0.003291] rcu: Hierarchical SRCU implementation.
[    0.003299] rcu: 	Max phase no-delay instances is 400.
[    0.003302] initcall srcu_bootup_announce+0x0/0xa8 returned 0 after 0 usecs
[    0.003306] calling  rcu_spawn_gp_kthread+0x0/0x2a8 @ 1
[    0.003371] initcall rcu_spawn_gp_kthread+0x0/0x2a8 returned 0 after 0 usecs
[    0.003377] calling  check_cpu_stall_init+0x0/0x48 @ 1
[    0.003381] initcall check_cpu_stall_init+0x0/0x48 returned 0 after 0 usecs
[    0.003385] calling  rcu_sysrq_init+0x0/0x50 @ 1
[    0.003388] initcall rcu_sysrq_init+0x0/0x50 returned 0 after 0 usecs
[    0.003392] calling  tmigr_init+0x0/0x190 @ 1
[    0.003399] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    0.003413] initcall tmigr_init+0x0/0x190 returned 0 after 0 usecs
[    0.003418] calling  insert_crashkernel_resources+0x0/0x78 @ 1
[    0.003423] initcall insert_crashkernel_resources+0x0/0x78 returned 0 after 0 usecs
[    0.003428] calling  cpu_stop_init+0x0/0xf8 @ 1
[    0.003458] initcall cpu_stop_init+0x0/0xf8 returned 0 after 0 usecs
[    0.003464] calling  init_kprobes+0x0/0x120 @ 1
[    0.003655] initcall init_kprobes+0x0/0x120 returned 0 after 0 usecs
[    0.003660] calling  init_trace_printk+0x0/0x28 @ 1
[    0.003666] initcall init_trace_printk+0x0/0x28 returned 0 after 0 usecs
[    0.003672] calling  event_trace_enable_again+0x0/0x40 @ 1
[    0.003677] initcall event_trace_enable_again+0x0/0x40 returned 0 after 0 usecs
[    0.003680] calling  irq_work_init_threads+0x0/0x10 @ 1
[    0.003683] initcall irq_work_init_threads+0x0/0x10 returned 0 after 0 usecs
[    0.003687] calling  jump_label_init_module+0x0/0x38 @ 1
[    0.003692] initcall jump_label_init_module+0x0/0x38 returned 0 after 0 usecs
[    0.003695] calling  init_zero_pfn+0x0/0x38 @ 1
[    0.003701] initcall init_zero_pfn+0x0/0x38 returned 0 after 0 usecs
[    0.003706] calling  init_fs_inode_sysctls+0x0/0x50 @ 1
[    0.003714] initcall init_fs_inode_sysctls+0x0/0x50 returned 0 after 0 usecs
[    0.003718] calling  init_fs_locks_sysctls+0x0/0x50 @ 1
[    0.003723] initcall init_fs_locks_sysctls+0x0/0x50 returned 0 after 0 usecs
[    0.003727] calling  init_fs_sysctls+0x0/0x50 @ 1
[    0.003733] initcall init_fs_sysctls+0x0/0x50 returned 0 after 0 usecs
[    0.003737] calling  init_security_keys_sysctls+0x0/0x50 @ 1
[    0.003747] initcall init_security_keys_sysctls+0x0/0x50 returned 0 after 0 usecs
[    0.003753] calling  dynamic_debug_init+0x0/0x288 @ 1
[    0.003885] initcall dynamic_debug_init+0x0/0x288 returned 0 after 0 usecs
[    0.003891] calling  its_fsl_mc_msi_init+0x0/0xc0 @ 1
[    0.003956] fsl-mc MSI: msi-controller@17a40000 domain created
[    0.003981] initcall its_fsl_mc_msi_init+0x0/0xc0 returned 0 after 0 usecs
[    0.003986] calling  cci_init+0x0/0x40 @ 1
[    0.004130] initcall cci_init+0x0/0x40 returned -19 after 1000 usecs
[    0.004137] calling  renesas_soc_init+0x0/0x370 @ 1
[    0.004146] initcall renesas_soc_init+0x0/0x370 returned -19 after 0 usecs
[    0.004152] calling  tegra_init_fuse+0x0/0x1e0 @ 1
[    0.004468] initcall tegra_init_fuse+0x0/0x1e0 returned 0 after 0 usecs
[    0.004474] calling  tegra_flowctrl_init+0x0/0x108 @ 1
[    0.004482] initcall tegra_flowctrl_init+0x0/0x108 returned 0 after 0 usecs
[    0.004487] calling  tegra_pmc_early_init+0x0/0x288 @ 1
[    0.004754] initcall tegra_pmc_early_init+0x0/0x288 returned 0 after 0 usecs
[    0.004759] calling  tegra186_ari_init+0x0/0x90 @ 1
[    0.004765] initcall tegra186_ari_init+0x0/0x90 returned 0 after 0 usecs
[    0.004773] calling  rcar_sysc_pd_init+0x0/0x2a8 @ 1
[    0.004837] initcall rcar_sysc_pd_init+0x0/0x2a8 returned -19 after 0 usecs
[    0.004843] calling  efi_memreserve_root_init+0x0/0x50 @ 1
[    0.004850] initcall efi_memreserve_root_init+0x0/0x50 returned 0 after 0 usecs
[    0.004855] calling  arm_enable_runtime_services+0x0/0x1f8 @ 1
[    0.004868] Remapping and enabling EFI services.
[    0.005028] initcall arm_enable_runtime_services+0x0/0x1f8 returned 0 after 0 usecs
[    0.005035] calling  efi_earlycon_remap_fb+0x0/0x90 @ 1
[    0.005039] initcall efi_earlycon_remap_fb+0x0/0x90 returned 0 after 0 usecs
[    0.005044] calling  dummy_timer_register+0x0/0x50 @ 1
[    0.005053] initcall dummy_timer_register+0x0/0x50 returned 0 after 0 usecs
[    0.006148] smp: Bringing up secondary CPUs ...
[    0.006676] Detected PIPT I-cache on CPU1
[    0.006720] GICv3: CPU1: found redistributor 100 region 0:0x0000000017a80000
[    0.006730] GICv3: CPU1: using allocated LPI pending table @0x00000001002f0000
[    0.006756] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b0]
[    0.007364] Detected PIPT I-cache on CPU2
[    0.007401] GICv3: CPU2: found redistributor 200 region 0:0x0000000017aa0000
[    0.007411] GICv3: CPU2: using allocated LPI pending table @0x0000000100300000
[    0.007434] CPU2: Booted secondary processor 0x0000000200 [0x410fd4b0]
[    0.008034] Detected PIPT I-cache on CPU3
[    0.008070] GICv3: CPU3: found redistributor 300 region 0:0x0000000017ac0000
[    0.008080] GICv3: CPU3: using allocated LPI pending table @0x0000000100310000
[    0.008101] CPU3: Booted secondary processor 0x0000000300 [0x410fd4b0]
[    0.014584] Detected PIPT I-cache on CPU4
[    0.014629] GICv3: CPU4: found redistributor 400 region 0:0x0000000017ae0000
[    0.014642] GICv3: CPU4: using allocated LPI pending table @0x0000000100320000
[    0.014667] CPU4: Booted secondary processor 0x0000000400 [0x410fd4c0]
[    0.017646] Detected PIPT I-cache on CPU5
[    0.017696] GICv3: CPU5: found redistributor 500 region 0:0x0000000017b00000
[    0.017707] GICv3: CPU5: using allocated LPI pending table @0x0000000100330000
[    0.017733] CPU5: Booted secondary processor 0x0000000500 [0x410fd4c0]
[    0.020680] Detected PIPT I-cache on CPU6
[    0.020725] GICv3: CPU6: found redistributor 600 region 0:0x0000000017b20000
[    0.020738] GICv3: CPU6: using allocated LPI pending table @0x0000000100340000
[    0.020764] CPU6: Booted secondary processor 0x0000000600 [0x410fd4c0]
[    0.021771] Detected PIPT I-cache on CPU7
[    0.021818] GICv3: CPU7: found redistributor 700 region 0:0x0000000017b40000
[    0.021831] GICv3: CPU7: using allocated LPI pending table @0x0000000100350000
[    0.021858] CPU7: Booted secondary processor 0x0000000700 [0x410fd4c0]
[    0.021978] smp: Brought up 1 node, 8 CPUs
[    0.022043] SMP: Total of 8 processors activated.
[    0.022047] CPU: All CPU(s) started at EL1
[    0.022055] CPU features: detected: 32-bit EL0 Support
[    0.022059] CPU features: detected: Data cache clean to the PoU not required for I/D coherence
[    0.022064] CPU features: detected: Common not Private translations
[    0.022068] CPU features: detected: CRC32 instructions
[    0.022072] CPU features: detected: Data cache clean to Point of Persistence
[    0.022078] CPU features: detected: RCpc load-acquire (LDAPR)
[    0.022082] CPU features: detected: LSE atomic instructions
[    0.022086] CPU features: detected: Privileged Access Never
[    0.022090] CPU features: detected: RAS Extension Support
[    0.022094] CPU features: detected: Speculative Store Bypassing Safe (SSBS)
[    0.022166] alternatives: applying system-wide alternatives
[    0.024928] CPU features: detected: Hardware dirty bit management on CPU0-7
[    0.025123] Memory: 31925208K/33249508K available (20928K kernel code, 5404K rwdata, 17416K rodata, 13120K init, 10298K bss, 1180748K reserved, 131072K cma-reserved)
[    0.025589] devtmpfs: initialized
[    0.034975] calling  bpf_jit_charge_init+0x0/0x60 @ 1
[    0.034985] initcall bpf_jit_charge_init+0x0/0x60 returned 0 after 0 usecs
[    0.034990] calling  ipc_ns_init+0x0/0x58 @ 1
[    0.034999] initcall ipc_ns_init+0x0/0x58 returned 0 after 0 usecs
[    0.035004] calling  init_mmap_min_addr+0x0/0x38 @ 1
[    0.035010] initcall init_mmap_min_addr+0x0/0x38 returned 0 after 0 usecs
[    0.035016] calling  pci_realloc_setup_params+0x0/0x78 @ 1
[    0.035024] initcall pci_realloc_setup_params+0x0/0x78 returned 0 after 0 usecs
[    0.035029] calling  tegra194_cbb_init+0x0/0x38 @ 1
[    0.035047] initcall tegra194_cbb_init+0x0/0x38 returned 0 after 0 usecs
[    0.035054] calling  tegra234_cbb_init+0x0/0x38 @ 1
[    0.035063] initcall tegra234_cbb_init+0x0/0x38 returned 0 after 0 usecs
[    0.035068] calling  inet_frag_wq_init+0x0/0x68 @ 1
[    0.035130] initcall inet_frag_wq_init+0x0/0x68 returned 0 after 0 usecs
[    0.035170] calling  fpsimd_init+0x0/0xb8 @ 1
[    0.035177] initcall fpsimd_init+0x0/0xb8 returned 0 after 0 usecs
[    0.035181] calling  tagged_addr_init+0x0/0x50 @ 1
[    0.035189] initcall tagged_addr_init+0x0/0x50 returned 0 after 0 usecs
[    0.035194] calling  init_amu_fie+0x0/0x78 @ 1
[    0.035200] initcall init_amu_fie+0x0/0x78 returned 0 after 0 usecs
[    0.035205] calling  arm64_efi_rt_init+0x0/0xb0 @ 1
[    0.035217] initcall arm64_efi_rt_init+0x0/0xb0 returned 0 after 0 usecs
[    0.035220] calling  armv8_deprecated_init+0x0/0x198 @ 1
[    0.035241] initcall armv8_deprecated_init+0x0/0x198 returned 0 after 0 usecs
[    0.035246] calling  map_entry_trampoline+0x0/0x128 @ 1
[    0.035257] initcall map_entry_trampoline+0x0/0x128 returned 0 after 0 usecs
[    0.035261] calling  alloc_frozen_cpus+0x0/0x50 @ 1
[    0.035265] initcall alloc_frozen_cpus+0x0/0x50 returned 0 after 0 usecs
[    0.035270] calling  cpu_hotplug_pm_sync_init+0x0/0x40 @ 1
[    0.035276] initcall cpu_hotplug_pm_sync_init+0x0/0x40 returned 0 after 0 usecs
[    0.035280] calling  wq_sysfs_init+0x0/0x48 @ 1
[    0.035312] initcall wq_sysfs_init+0x0/0x48 returned 0 after 0 usecs
[    0.035318] calling  ksysfs_init+0x0/0xc8 @ 1
[    0.035333] initcall ksysfs_init+0x0/0xc8 returned 0 after 0 usecs
[    0.035338] calling  schedutil_gov_init+0x0/0x38 @ 1
[    0.035344] initcall schedutil_gov_init+0x0/0x38 returned 0 after 0 usecs
[    0.035349] calling  pm_init+0x0/0xa0 @ 1
[    0.035377] initcall pm_init+0x0/0xa0 returned 0 after 0 usecs
[    0.035380] calling  pm_disk_init+0x0/0x40 @ 1
[    0.035387] initcall pm_disk_init+0x0/0x40 returned 0 after 0 usecs
[    0.035390] calling  swsusp_header_init+0x0/0x50 @ 1
[    0.035394] initcall swsusp_header_init+0x0/0x50 returned 0 after 0 usecs
[    0.035397] calling  rcu_set_runtime_mode+0x0/0x40 @ 1
[    0.035401] initcall rcu_set_runtime_mode+0x0/0x40 returned 0 after 0 usecs
[    0.035404] calling  init_jiffies_clocksource+0x0/0x40 @ 1
[    0.035409] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.035418] initcall init_jiffies_clocksource+0x0/0x40 returned 0 after 0 usecs
[    0.035422] calling  futex_init+0x0/0x160 @ 1
[    0.035436] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.035445] initcall futex_init+0x0/0x160 returned 0 after 0 usecs
[    0.035450] calling  cgroup_wq_init+0x0/0x50 @ 1
[    0.035458] initcall cgroup_wq_init+0x0/0x50 returned 0 after 0 usecs
[    0.035462] calling  cgroup1_wq_init+0x0/0x50 @ 1
[    0.035469] initcall cgroup1_wq_init+0x0/0x50 returned 0 after 0 usecs
[    0.035474] calling  ftrace_mod_cmd_init+0x0/0x28 @ 1
[    0.035481] initcall ftrace_mod_cmd_init+0x0/0x28 returned 0 after 0 usecs
[    0.035486] calling  init_wakeup_tracer+0x0/0x48 @ 1
[    0.035496] initcall init_wakeup_tracer+0x0/0x48 returned 0 after 0 usecs
[    0.035502] calling  init_graph_trace+0x0/0x88 @ 1
[    0.035510] initcall init_graph_trace+0x0/0x88 returned 0 after 0 usecs
[    0.035513] calling  trace_events_eprobe_init_early+0x0/0x48 @ 1
[    0.035518] initcall trace_events_eprobe_init_early+0x0/0x48 returned 0 after 0 usecs
[    0.035521] calling  trace_events_synth_init_early+0x0/0x48 @ 1
[    0.035525] initcall trace_events_synth_init_early+0x0/0x48 returned 0 after 0 usecs
[    0.035528] calling  init_kprobe_trace_early+0x0/0x48 @ 1
[    0.035531] initcall init_kprobe_trace_early+0x0/0x48 returned 0 after 0 usecs
[    0.035534] calling  cpu_pm_init+0x0/0x40 @ 1
[    0.035541] initcall cpu_pm_init+0x0/0x40 returned 0 after 0 usecs
[    0.035545] calling  bpf_offload_init+0x0/0x40 @ 1
[    0.035550] initcall bpf_offload_init+0x0/0x40 returned 0 after 0 usecs
[    0.035553] calling  cgroup_bpf_wq_init+0x0/0x58 @ 1
[    0.035562] initcall cgroup_bpf_wq_init+0x0/0x58 returned 0 after 0 usecs
[    0.035565] calling  memory_failure_init+0x0/0x118 @ 1
[    0.035573] initcall memory_failure_init+0x0/0x118 returned 0 after 0 usecs
[    0.035576] calling  cma_init_reserved_areas+0x0/0x80 @ 1
[    0.036607] initcall cma_init_reserved_areas+0x0/0x80 returned 0 after 1000 usecs
[    0.036613] calling  execmem_late_init+0x0/0x30 @ 1
[    0.036617] 2G module region forced by RANDOMIZE_MODULE_REGION_FULL
[    0.036622] 0 pages in range for non-PLT usage
[    0.036624] 507408 pages in range for PLT usage
[    0.036627] initcall execmem_late_init+0x0/0x30 returned 0 after 0 usecs
[    0.036633] calling  fsnotify_init+0x0/0xb8 @ 1
[    0.036654] initcall fsnotify_init+0x0/0xb8 returned 0 after 0 usecs
[    0.036658] calling  filelock_init+0x0/0x1a8 @ 1
[    0.036676] initcall filelock_init+0x0/0x1a8 returned 0 after 0 usecs
[    0.036681] calling  init_script_binfmt+0x0/0x40 @ 1
[    0.036686] initcall init_script_binfmt+0x0/0x40 returned 0 after 0 usecs
[    0.036690] calling  init_elf_binfmt+0x0/0x40 @ 1
[    0.036694] initcall init_elf_binfmt+0x0/0x40 returned 0 after 0 usecs
[    0.036698] calling  init_compat_elf_binfmt+0x0/0x40 @ 1
[    0.036702] initcall init_compat_elf_binfmt+0x0/0x40 returned 0 after 0 usecs
[    0.036706] calling  configfs_init+0x0/0x110 @ 1
[    0.036719] initcall configfs_init+0x0/0x110 returned 0 after 0 usecs
[    0.036724] calling  debugfs_init+0x0/0xa8 @ 1
[    0.036732] initcall debugfs_init+0x0/0xa8 returned 0 after 0 usecs
[    0.036737] calling  tracefs_init+0x0/0xe8 @ 1
[    0.036747] initcall tracefs_init+0x0/0xe8 returned 0 after 0 usecs
[    0.036752] calling  securityfs_init+0x0/0xa8 @ 1
[    0.036784] initcall securityfs_init+0x0/0xa8 returned 0 after 0 usecs
[    0.036787] calling  lockdown_secfs_init+0x0/0x50 @ 1
[    0.036793] initcall lockdown_secfs_init+0x0/0x50 returned 0 after 0 usecs
[    0.036797] calling  register_xor_blocks+0x0/0x68 @ 1
[    0.036802] initcall register_xor_blocks+0x0/0x68 returned 0 after 0 usecs
[    0.036806] calling  cci_platform_init+0x0/0x38 @ 1
[    0.036821] initcall cci_platform_init+0x0/0x38 returned 0 after 0 usecs
[    0.036825] calling  pinctrl_init+0x0/0xd0 @ 1
[    0.036829] pinctrl core: initialized pinctrl subsystem
[    0.036861] initcall pinctrl_init+0x0/0xd0 returned 0 after 0 usecs
[    0.036865] calling  rzg2l_pinctrl_init+0x0/0x38 @ 1
[    0.036876] initcall rzg2l_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.036881] calling  rzv2m_pinctrl_init+0x0/0x38 @ 1
[    0.036890] initcall rzv2m_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.036894] calling  gpiolib_dev_init+0x0/0x160 @ 1
[    0.036915] initcall gpiolib_dev_init+0x0/0x160 returned 0 after 0 usecs
[    0.036919] calling  hi3559av100_crg_init+0x0/0x38 @ 1
[    0.036928] initcall hi3559av100_crg_init+0x0/0x38 returned 0 after 0 usecs
[    0.036931] calling  hi3660_clk_init+0x0/0x38 @ 1
[    0.036940] initcall hi3660_clk_init+0x0/0x38 returned 0 after 0 usecs
[    0.036943] calling  hi3670_clk_init+0x0/0x38 @ 1
[    0.036951] initcall hi3670_clk_init+0x0/0x38 returned 0 after 0 usecs
[    0.036954] calling  gcc_msm8916_init+0x0/0x38 @ 1
[    0.036962] initcall gcc_msm8916_init+0x0/0x38 returned 0 after 0 usecs
[    0.036972] calling  gcc_msm8996_init+0x0/0x38 @ 1
[    0.036980] initcall gcc_msm8996_init+0x0/0x38 returned 0 after 0 usecs
[    0.036984] calling  gcc_msm8998_init+0x0/0x38 @ 1
[    0.036992] initcall gcc_msm8998_init+0x0/0x38 returned 0 after 0 usecs
[    0.036995] calling  clk_rpmh_init+0x0/0x38 @ 1
[    0.037003] initcall clk_rpmh_init+0x0/0x38 returned 0 after 0 usecs
[    0.037007] calling  gcc_sc7180_init+0x0/0x38 @ 1
[    0.037014] initcall gcc_sc7180_init+0x0/0x38 returned 0 after 0 usecs
[    0.037017] calling  fsl_guts_init+0x0/0x378 @ 1
[    0.037642] initcall fsl_guts_init+0x0/0x378 returned 0 after 0 usecs
[    0.037648] calling  cmd_db_device_init+0x0/0x38 @ 1
[    0.037659] initcall cmd_db_device_init+0x0/0x38 returned 0 after 0 usecs
[    0.037664] calling  rpmh_driver_init+0x0/0x38 @ 1
[    0.037673] initcall rpmh_driver_init+0x0/0x38 returned 0 after 0 usecs
[    0.037678] calling  rpmhpd_init+0x0/0x38 @ 1
[    0.037690] initcall rpmhpd_init+0x0/0x38 returned 0 after 0 usecs
[    0.037695] calling  genpd_bus_init+0x0/0x38 @ 1
[    0.037708] initcall genpd_bus_init+0x0/0x38 returned 0 after 0 usecs
[    0.037714] calling  virtio_init+0x0/0x48 @ 1
[    0.037726] initcall virtio_init+0x0/0x48 returned 0 after 0 usecs
[    0.037731] calling  regulator_init+0x0/0xe0 @ 1
[    0.037790] initcall regulator_init+0x0/0xe0 returned 0 after 0 usecs
[    0.037796] calling  iommu_init+0x0/0x58 @ 1
[    0.037804] initcall iommu_init+0x0/0x58 returned 0 after 0 usecs
[    0.037808] calling  component_debug_init+0x0/0x48 @ 1
[    0.037816] initcall component_debug_init+0x0/0x48 returned 0 after 0 usecs
[    0.037820] calling  soc_bus_register+0x0/0x58 @ 1
[    0.037833] initcall soc_bus_register+0x0/0x58 returned 0 after 0 usecs
[    0.037838] calling  register_cpufreq_notifier+0x0/0xd0 @ 1
[    0.037843] initcall register_cpufreq_notifier+0x0/0xd0 returned 0 after 0 usecs
[    0.037848] calling  opp_debug_init+0x0/0x48 @ 1
[    0.037854] initcall opp_debug_init+0x0/0x48 returned 0 after 0 usecs
[    0.037858] calling  cpufreq_core_init+0x0/0x118 @ 1
[    0.037866] initcall cpufreq_core_init+0x0/0x118 returned 0 after 0 usecs
[    0.037870] calling  cpufreq_gov_performance_init+0x0/0x38 @ 1
[    0.037874] initcall cpufreq_gov_performance_init+0x0/0x38 returned 0 after 0 usecs
[    0.037878] calling  cpufreq_gov_powersave_init+0x0/0x38 @ 1
[    0.037882] initcall cpufreq_gov_powersave_init+0x0/0x38 returned 0 after 0 usecs
[    0.037886] calling  cpufreq_gov_userspace_init+0x0/0x38 @ 1
[    0.037889] initcall cpufreq_gov_userspace_init+0x0/0x38 returned 0 after 0 usecs
[    0.037893] calling  CPU_FREQ_GOV_ONDEMAND_init+0x0/0x38 @ 1
[    0.037897] initcall CPU_FREQ_GOV_ONDEMAND_init+0x0/0x38 returned 0 after 0 usecs
[    0.037900] calling  CPU_FREQ_GOV_CONSERVATIVE_init+0x0/0x38 @ 1
[    0.037904] initcall CPU_FREQ_GOV_CONSERVATIVE_init+0x0/0x38 returned 0 after 0 usecs
[    0.037908] calling  cpufreq_dt_platdev_init+0x0/0x148 @ 1
[    0.037924] probe of reg-dummy returned 0 after 0 usecs
[    0.037925] initcall cpufreq_dt_platdev_init+0x0/0x148 returned -19 after 0 usecs
[    0.037930] calling  cpuidle_init+0x0/0x40 @ 1
[    0.037939] initcall cpuidle_init+0x0/0x40 returned 0 after 0 usecs
[    0.037943] calling  psci_idle_init_domains+0x0/0x38 @ 1
[    0.037953] initcall psci_idle_init_domains+0x0/0x38 returned 0 after 0 usecs
[    0.037957] calling  arm_dmi_init+0x0/0x30 @ 1
[    0.038016] SMBIOS 3.3 present.
[    0.038025] DMI: LENOVO 21BX0016US/21BX0016US, BIOS N3HET88W (1.60 ) 03/14/2024
[    0.038063] DMI: Memory slots populated: 1/1
[    0.038068] initcall arm_dmi_init+0x0/0x30 returned 0 after 1000 usecs
[    0.038073] calling  arch_timer_evtstrm_register+0x0/0x70 @ 1
[    0.038185] initcall arch_timer_evtstrm_register+0x0/0x70 returned 0 after 0 usecs
[    0.038191] calling  hi3660_mbox_init+0x0/0x38 @ 1
[    0.038203] initcall hi3660_mbox_init+0x0/0x38 returned 0 after 0 usecs
[    0.038207] calling  hi6220_mbox_init+0x0/0x38 @ 1
[    0.038215] initcall hi6220_mbox_init+0x0/0x38 returned 0 after 0 usecs
[    0.038218] calling  tegra_hsp_init+0x0/0x38 @ 1
[    0.038229] initcall tegra_hsp_init+0x0/0x38 returned 0 after 0 usecs
[    0.038233] calling  sock_init+0x0/0x118 @ 1
[    0.039327] initcall sock_init+0x0/0x118 returned 0 after 1000 usecs
[    0.039336] calling  net_inuse_init+0x0/0x48 @ 1
[    0.039343] initcall net_inuse_init+0x0/0x48 returned 0 after 0 usecs
[    0.039347] calling  sock_struct_check+0x0/0x18 @ 1
[    0.039351] initcall sock_struct_check+0x0/0x18 returned 0 after 0 usecs
[    0.039354] calling  init_default_flow_dissectors+0x0/0x78 @ 1
[    0.039360] initcall init_default_flow_dissectors+0x0/0x78 returned 0 after 0 usecs
[    0.039364] calling  netlink_proto_init+0x0/0x1c8 @ 1
[    0.039390] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.039415] initcall netlink_proto_init+0x0/0x1c8 returned 0 after 0 usecs
[    0.039420] calling  genl_init+0x0/0x68 @ 1
[    0.039431] initcall genl_init+0x0/0x68 returned 0 after 0 usecs
[    0.039435] calling  trace_boot_init+0x0/0x100 @ 1
[    0.039440] initcall trace_boot_init+0x0/0x100 returned 0 after 0 usecs
[    0.039488] calling  debug_monitors_init+0x0/0x50 @ 1
[    0.039579] initcall debug_monitors_init+0x0/0x50 returned 0 after 0 usecs
[    0.039587] calling  pi_init+0x0/0x70 @ 1
[    0.039605] initcall pi_init+0x0/0x70 returned 0 after 0 usecs
[    0.039608] calling  irq_sysfs_init+0x0/0x128 @ 1
[    0.039696] initcall irq_sysfs_init+0x0/0x128 returned 0 after 0 usecs
[    0.039699] calling  dma_atomic_pool_init+0x0/0x160 @ 1
[    0.040352] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.040776] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.041191] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.041208] initcall dma_atomic_pool_init+0x0/0x160 returned 0 after 2000 usecs
[    0.041215] calling  audit_init+0x0/0x1c8 @ 1
[    0.041237] audit: initializing netlink subsys (disabled)
[    0.041340] initcall audit_init+0x0/0x1c8 returned 0 after 0 usecs
[    0.041347] audit: type=2000 audit(0.038:1): state=initialized audit_enabled=0 res=1
[    0.041347] calling  bdi_class_init+0x0/0x60 @ 1
[    0.041363] initcall bdi_class_init+0x0/0x60 returned 0 after 0 usecs
[    0.041368] calling  mm_sysfs_init+0x0/0x50 @ 1
[    0.041374] initcall mm_sysfs_init+0x0/0x50 returned 0 after 0 usecs
[    0.041378] calling  init_per_zone_wmark_min+0x0/0x48 @ 1
[    0.041393] initcall init_per_zone_wmark_min+0x0/0x48 returned 0 after 0 usecs
[    0.041398] calling  irqc_init+0x0/0x38 @ 1
[    0.041413] initcall irqc_init+0x0/0x38 returned 0 after 0 usecs
[    0.041417] calling  fsl_mc_bus_driver_init+0x0/0xe0 @ 1
[    0.041450] initcall fsl_mc_bus_driver_init+0x0/0xe0 returned 0 after 0 usecs
[    0.041454] calling  rockchip_pinctrl_drv_register+0x0/0x40 @ 1
[    0.041464] initcall rockchip_pinctrl_drv_register+0x0/0x40 returned 0 after 0 usecs
[    0.041468] calling  sh_pfc_init+0x0/0x38 @ 1
[    0.041478] initcall sh_pfc_init+0x0/0x38 returned 0 after 0 usecs
[    0.041482] calling  acpi_gpio_setup_params+0x0/0xa0 @ 1
[    0.041489] initcall acpi_gpio_setup_params+0x0/0xa0 returned 0 after 0 usecs
[    0.041493] calling  rockchip_gpio_init+0x0/0x38 @ 1
[    0.041503] initcall rockchip_gpio_init+0x0/0x38 returned 0 after 0 usecs
[    0.041508] calling  pcibus_class_init+0x0/0x38 @ 1
[    0.041518] initcall pcibus_class_init+0x0/0x38 returned 0 after 0 usecs
[    0.041523] calling  pci_driver_init+0x0/0x50 @ 1
[    0.041547] initcall pci_driver_init+0x0/0x50 returned 0 after 0 usecs
[    0.041552] calling  backlight_class_init+0x0/0x88 @ 1
[    0.041561] initcall backlight_class_init+0x0/0x88 returned 0 after 0 usecs
[    0.041564] calling  amba_init+0x0/0x38 @ 1
[    0.041575] initcall amba_init+0x0/0x38 returned 0 after 0 usecs
[    0.041580] calling  rockchip_grf_init+0x0/0x198 @ 1
[    0.041903] initcall rockchip_grf_init+0x0/0x198 returned -19 after 0 usecs
[    0.041910] calling  rockchip_pm_domain_drv_register+0x0/0x40 @ 1
[    0.041922] initcall rockchip_pm_domain_drv_register+0x0/0x40 returned 0 after 0 usecs
[    0.041929] calling  tty_class_init+0x0/0x38 @ 1
[    0.041934] initcall tty_class_init+0x0/0x38 returned 0 after 0 usecs
[    0.041937] calling  vtconsole_class_init+0x0/0x120 @ 1
[    0.041970] initcall vtconsole_class_init+0x0/0x120 returned 0 after 0 usecs
[    0.041973] calling  serdev_init+0x0/0x48 @ 1
[    0.041988] initcall serdev_init+0x0/0x48 returned 0 after 0 usecs
[    0.041992] calling  iommu_dev_init+0x0/0x38 @ 1
[    0.041999] initcall iommu_dev_init+0x0/0x38 returned 0 after 0 usecs
[    0.042012] calling  host1x_context_device_bus_init+0x0/0x60 @ 1
[    0.042023] initcall host1x_context_device_bus_init+0x0/0x60 returned 0 after 0 usecs
[    0.042028] calling  mipi_dsi_bus_init+0x0/0x38 @ 1
[    0.042039] initcall mipi_dsi_bus_init+0x0/0x38 returned 0 after 0 usecs
[    0.042043] calling  devlink_class_init+0x0/0x70 @ 1
[    0.042050] initcall devlink_class_init+0x0/0x70 returned 0 after 0 usecs
[    0.042055] calling  software_node_init+0x0/0x58 @ 1
[    0.042062] initcall software_node_init+0x0/0x58 returned 0 after 0 usecs
[    0.042066] calling  wakeup_sources_debugfs_init+0x0/0x50 @ 1
[    0.042075] initcall wakeup_sources_debugfs_init+0x0/0x50 returned 0 after 0 usecs
[    0.042080] calling  wakeup_sources_sysfs_init+0x0/0x48 @ 1
[    0.042087] initcall wakeup_sources_sysfs_init+0x0/0x48 returned 0 after 0 usecs
[    0.042093] calling  regmap_initcall+0x0/0x30 @ 1
[    0.042107] initcall regmap_initcall+0x0/0x30 returned 0 after 0 usecs
[    0.042112] calling  sram_init+0x0/0x38 @ 1
[    0.042124] initcall sram_init+0x0/0x38 returned 0 after 0 usecs
[    0.042129] calling  syscon_init+0x0/0x38 @ 1
[    0.042140] initcall syscon_init+0x0/0x38 returned 0 after 0 usecs
[    0.042145] calling  spi_init+0x0/0x110 @ 1
[    0.042161] initcall spi_init+0x0/0x110 returned 0 after 0 usecs
[    0.042166] calling  spmi_init+0x0/0x48 @ 1
[    0.042178] initcall spmi_init+0x0/0x48 returned 0 after 0 usecs
[    0.042183] calling  i2c_init+0x0/0x118 @ 1
[    0.042203] initcall i2c_init+0x0/0x118 returned 0 after 0 usecs
[    0.042206] calling  thermal_init+0x0/0x160 @ 1
[    0.042235] thermal_sys: Registered thermal governor 'fair_share'
[    0.042237] thermal_sys: Registered thermal governor 'step_wise'
[    0.042244] thermal_sys: Registered thermal governor 'user_space'
[    0.042254] initcall thermal_init+0x0/0x160 returned 0 after 0 usecs
[    0.042260] calling  init_menu+0x0/0x38 @ 1
[    0.042283] cpuidle: using governor menu
[    0.042287] initcall init_menu+0x0/0x38 returned 0 after 0 usecs
[    0.042291] calling  pcc_init+0x0/0xd8 @ 1
[    0.042295] initcall pcc_init+0x0/0xd8 returned -19 after 0 usecs
[    0.042298] calling  cdx_bus_init+0x0/0x60 @ 1
[    0.042318] initcall cdx_bus_init+0x0/0x60 returned 0 after 0 usecs
[    0.042322] calling  kobject_uevent_init+0x0/0x28 @ 1
[    0.042334] initcall kobject_uevent_init+0x0/0x28 returned 0 after 0 usecs
[    0.042378] calling  reserve_memblock_reserved_regions+0x0/0x178 @ 1
[    0.042395] initcall reserve_memblock_reserved_regions+0x0/0x178 returned 0 after 0 usecs
[    0.042400] calling  aarch32_alloc_vdso_pages+0x0/0x40 @ 1
[    0.042408] initcall aarch32_alloc_vdso_pages+0x0/0x40 returned 0 after 0 usecs
[    0.042413] calling  vdso_init+0x0/0xf8 @ 1
[    0.042418] initcall vdso_init+0x0/0xf8 returned 0 after 0 usecs
[    0.042423] calling  arch_hw_breakpoint_init+0x0/0x108 @ 1
[    0.042427] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.042523] initcall arch_hw_breakpoint_init+0x0/0x108 returned 0 after 0 usecs
[    0.042528] calling  adjust_protection_map+0x0/0x40 @ 1
[    0.042532] initcall adjust_protection_map+0x0/0x40 returned 0 after 0 usecs
[    0.042536] calling  asids_update_limit+0x0/0xf0 @ 1
[    0.042544] ASID allocator initialised with 32768 entries
[    0.042548] initcall asids_update_limit+0x0/0xf0 returned 0 after 0 usecs
[    0.042552] calling  hugetlbpage_init+0x0/0x50 @ 1
[    0.042562] initcall hugetlbpage_init+0x0/0x50 returned 0 after 0 usecs
[    0.042567] calling  kcmp_cookies_init+0x0/0xa8 @ 1
[    0.042572] initcall kcmp_cookies_init+0x0/0xa8 returned 0 after 0 usecs
[    0.042576] calling  cryptomgr_init+0x0/0x38 @ 1
[    0.042582] initcall cryptomgr_init+0x0/0x38 returned 0 after 0 usecs
[    0.042586] calling  imx8mm_pinctrl_init+0x0/0x38 @ 1
[    0.042599] initcall imx8mm_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042603] calling  imx8mn_pinctrl_init+0x0/0x38 @ 1
[    0.042610] initcall imx8mn_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042614] calling  imx8mp_pinctrl_init+0x0/0x38 @ 1
[    0.042622] initcall imx8mp_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042627] calling  imx8mq_pinctrl_init+0x0/0x38 @ 1
[    0.042634] initcall imx8mq_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042638] calling  imx8qm_pinctrl_init+0x0/0x38 @ 1
[    0.042645] initcall imx8qm_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042649] calling  imx8qxp_pinctrl_init+0x0/0x38 @ 1
[    0.042657] initcall imx8qxp_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042662] calling  imx8dxl_pinctrl_init+0x0/0x38 @ 1
[    0.042669] initcall imx8dxl_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042674] calling  imx8ulp_pinctrl_init+0x0/0x38 @ 1
[    0.042681] initcall imx8ulp_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042685] calling  imx91_pinctrl_init+0x0/0x38 @ 1
[    0.042694] initcall imx91_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042698] calling  imx93_pinctrl_init+0x0/0x38 @ 1
[    0.042706] initcall imx93_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042710] calling  sc7180_pinctrl_init+0x0/0x38 @ 1
[    0.042721] initcall sc7180_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042725] calling  tegra124_pinctrl_init+0x0/0x38 @ 1
[    0.042735] initcall tegra124_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042739] calling  tegra210_pinctrl_init+0x0/0x38 @ 1
[    0.042748] initcall tegra210_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042753] calling  tegra194_pinctrl_init+0x0/0x38 @ 1
[    0.042762] initcall tegra194_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042767] calling  tegra234_pinctrl_init+0x0/0x38 @ 1
[    0.042776] initcall tegra234_pinctrl_init+0x0/0x38 returned 0 after 0 usecs
[    0.042780] calling  mpc8xxx_init+0x0/0x38 @ 1
[    0.042790] initcall mpc8xxx_init+0x0/0x38 returned 0 after 0 usecs
[    0.042794] calling  acpi_pci_init+0x0/0x80 @ 1
[    0.042800] initcall acpi_pci_init+0x0/0x80 returned 0 after 0 usecs
[    0.042805] calling  tegra_clocks_apply_init_table+0x0/0x48 @ 1
[    0.042811] initcall tegra_clocks_apply_init_table+0x0/0x48 returned 0 after 0 usecs
[    0.042815] calling  dma_channel_table_init+0x0/0x1f0 @ 1
[    0.042828] initcall dma_channel_table_init+0x0/0x1f0 returned 0 after 0 usecs
[    0.042833] calling  dma_bus_init+0x0/0x1c0 @ 1
[    0.042878] initcall dma_bus_init+0x0/0x1c0 returned 0 after 0 usecs
[    0.042884] calling  qcom_spm_init+0x0/0x38 @ 1
[    0.042896] initcall qcom_spm_init+0x0/0x38 returned 0 after 0 usecs
[    0.042900] calling  sunxi_mbus_init+0x0/0x58 @ 1
[    0.042909] initcall sunxi_mbus_init+0x0/0x58 returned 0 after 0 usecs
[    0.042914] calling  zynqmp_reset_init+0x0/0x38 @ 1
[    0.042923] initcall zynqmp_reset_init+0x0/0x38 returned 0 after 0 usecs
[    0.042926] calling  serial_base_init+0x0/0xb0 @ 1
[    0.042950] initcall serial_base_init+0x0/0xb0 returned 0 after 0 usecs
[    0.042955] calling  pl011_init+0x0/0x70 @ 1
[    0.042959] Serial: AMBA PL011 UART driver
[    0.042971] initcall pl011_init+0x0/0x70 returned 0 after 0 usecs
[    0.042974] calling  mvebu_uart_init+0x0/0x98 @ 1
[    0.042998] initcall mvebu_uart_init+0x0/0x98 returned 0 after 0 usecs
[    0.043002] calling  cdns_uart_init+0x0/0x38 @ 1
[    0.043018] initcall cdns_uart_init+0x0/0x38 returned 0 after 1000 usecs
[    0.043022] calling  iommu_dma_init+0x0/0x48 @ 1
[    0.043043] initcall iommu_dma_init+0x0/0x48 returned 0 after 0 usecs
[    0.043048] calling  dsa_loop_bdinfo_init+0x0/0x38 @ 1
[    0.043055] initcall dsa_loop_bdinfo_init+0x0/0x38 returned 0 after 0 usecs
[    0.043061] calling  dmi_id_init+0x0/0x110 @ 1
[    0.043118] initcall dmi_id_init+0x0/0x110 returned 0 after 0 usecs
[    0.043124] calling  tegra_mc_init+0x0/0x38 @ 1
[    0.043138] initcall tegra_mc_init+0x0/0x38 returned 0 after 0 usecs
[    0.043143] calling  of_platform_default_populate_init+0x0/0x120 @ 1
[    0.043306] probe of 80860000.cmd-db-region returned 0 after 0 usecs
[    0.044397] CPUidle PSCI: Initialized CPU PM domain topology using OSI mode
[    0.044422] probe of psci returned 0 after 0 usecs
[    0.049295] /soc@0/phy@88eb000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae90000
[    0.049312] /soc@0/phy@88eb000: Fixed dependency cycle(s) with /soc@0/usb@a6f8800/usb@a600000
[    0.049447] /soc@0/phy@8903000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae98000
[    0.049459] /soc@0/phy@8903000: Fixed dependency cycle(s) with /soc@0/usb@a8f8800/usb@a800000
[    0.049617] /soc@0/usb@a6f8800/usb@a600000: Fixed dependency cycle(s) with /soc@0/phy@88eb000
[    0.049749] /soc@0/usb@a8f8800/usb@a800000: Fixed dependency cycle(s) with /soc@0/phy@8903000
[    0.049772] /soc@0/cci@ac4c000/i2c-bus@1/camera@10: Fixed dependency cycle(s) with /soc@0/camss@ac5a000
[    0.049795] /soc@0/camss@ac5a000: Fixed dependency cycle(s) with /soc@0/cci@ac4c000/i2c-bus@1/camera@10
[    0.049868] /soc@0/display-subsystem@ae00000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.049931] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000
[    0.049979] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae98000
[    0.050027] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae90000
[    0.050058] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000
[    0.050084] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.050217] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/display-controller@ae01000
[    0.050232] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/phy@88eb000
[    0.050263] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.050291] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000
[    0.050421] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/display-controller@ae01000
[    0.050436] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/phy@8903000
[    0.050467] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.050494] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000
[    0.050506] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel
[    0.050631] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/display-controller@ae01000
[    0.050680] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/phy@aec5a00
[    0.050719] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000
[    0.050767] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.051002] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000
[    0.051065] /soc@0/phy@aec5a00: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.051074] /soc@0/clock-controller@af00000: Fixed dependency cycle(s) with /soc@0/phy@aec5a00
[    0.051104] /soc@0/clock-controller@af00000: Fixed dependency cycle(s) with /soc@0/phy@8903000
[    0.051133] /soc@0/clock-controller@af00000: Fixed dependency cycle(s) with /soc@0/phy@88eb000
[    0.051195] /soc@0/interrupt-controller@17a00000: Fixed dependency cycle(s) with /soc@0/interrupt-controller@17a00000
[    0.054359] /soc@0/phy@88eb000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae90000
[    0.054374] /soc@0/phy@88eb000: Fixed dependency cycle(s) with /soc@0/usb@a6f8800/usb@a600000
[    0.054635] /soc@0/phy@8903000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae98000
[    0.054648] /soc@0/phy@8903000: Fixed dependency cycle(s) with /soc@0/usb@a8f8800/usb@a800000
[    0.055342] /soc@0/usb@a6f8800/usb@a600000: Fixed dependency cycle(s) with /soc@0/phy@88eb000
[    0.055619] /soc@0/usb@a8f8800/usb@a800000: Fixed dependency cycle(s) with /soc@0/phy@8903000
[    0.055717] /soc@0/cci@ac4c000/i2c-bus@1/camera@10: Fixed dependency cycle(s) with /soc@0/camss@ac5a000
[    0.055892] /soc@0/cci@ac4c000/i2c-bus@1/camera@10: Fixed dependency cycle(s) with /soc@0/camss@ac5a000
[    0.055926] /soc@0/camss@ac5a000: Fixed dependency cycle(s) with /soc@0/cci@ac4c000/i2c-bus@1/camera@10
[    0.056241] /soc@0/display-subsystem@ae00000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.056363] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000
[    0.056432] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae98000
[    0.056500] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae90000
[    0.056527] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000
[    0.056556] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.056765] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/display-controller@ae01000
[    0.056781] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/phy@88eb000
[    0.056830] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.056858] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000
[    0.057065] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/display-controller@ae01000
[    0.057081] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/phy@8903000
[    0.057137] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.057166] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000
[    0.057211] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel
[    0.057397] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/display-controller@ae01000
[    0.057452] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/phy@aec5a00
[    0.057493] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000
[    0.057546] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.057887] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000
[    0.058016] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/phy@aec5a00
[    0.058109] /soc@0/phy@aec5a00: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.058220] /soc@0/phy@aec5a00: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.058288] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.058339] /soc@0/display-subsystem@ae00000/displayport-controller@ae98000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.058374] /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.058403] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.058450] /soc@0/display-subsystem@ae00000: Fixed dependency cycle(s) with /soc@0/clock-controller@af00000
[    0.058459] /soc@0/clock-controller@af00000: Fixed dependency cycle(s) with /soc@0/phy@aec5a00
[    0.058509] /soc@0/clock-controller@af00000: Fixed dependency cycle(s) with /soc@0/phy@8903000
[    0.058560] /soc@0/clock-controller@af00000: Fixed dependency cycle(s) with /soc@0/phy@88eb000
[    0.060010] probe of 18200000.rsc:clock-controller returned 0 after 0 usecs
[    0.062592] probe of 18200000.rsc:power-controller returned 0 after 2000 usecs
[    0.062642] /soc@0/rsc@18200000/regulators-0: Fixed dependency cycle(s) with /soc@0/rsc@18200000/regulators-0/smps11
[    0.062657] /soc@0/rsc@18200000/regulators-0: Fixed dependency cycle(s) with /soc@0/rsc@18200000/regulators-0/smps12
[    0.062720] /soc@0/rsc@18200000/regulators-1: Fixed dependency cycle(s) with /soc@0/rsc@18200000/regulators-0/smps11
[    0.062731] /soc@0/rsc@18200000/regulators-1: Fixed dependency cycle(s) with /soc@0/rsc@18200000/regulators-1/bob
[    0.062740] /soc@0/rsc@18200000/regulators-1: Fixed dependency cycle(s) with /soc@0/rsc@18200000/regulators-1/smps1
[    0.062839] probe of 18200000.rsc returned 0 after 3000 usecs
[    0.063981] /pmic-glink/connector@0: Fixed dependency cycle(s) with /soc@0/phy@88eb000
[    0.064201] /pmic-glink/connector@0: Fixed dependency cycle(s) with /soc@0/usb@a6f8800/usb@a600000
[    0.064483] /pmic-glink/connector@1: Fixed dependency cycle(s) with /soc@0/phy@8903000
[    0.064776] /pmic-glink/connector@1: Fixed dependency cycle(s) with /soc@0/usb@a8f8800/usb@a800000
[    0.065468] /pmic-glink/connector@0: Fixed dependency cycle(s) with /usb0-sbu-mux
[    0.065787] /usb0-sbu-mux: Fixed dependency cycle(s) with /pmic-glink/connector@0
[    0.065896] /pmic-glink/connector@1: Fixed dependency cycle(s) with /usb1-sbu-mux
[    0.066347] /usb1-sbu-mux: Fixed dependency cycle(s) with /pmic-glink/connector@1
[    0.066533] initcall of_platform_default_populate_init+0x0/0x120 returned 0 after 23000 usecs
[    0.066599] calling  register_mte_tcf_preferred_sysctl+0x0/0xf0 @ 1
[    0.066608] initcall register_mte_tcf_preferred_sysctl+0x0/0xf0 returned 0 after 0 usecs
[    0.066614] calling  uid_cache_init+0x0/0x108 @ 1
[    0.066631] initcall uid_cache_init+0x0/0x108 returned 0 after 0 usecs
[    0.066636] calling  param_sysfs_init+0x0/0x78 @ 1
[    0.066645] initcall param_sysfs_init+0x0/0x78 returned 0 after 0 usecs
[    0.066650] calling  user_namespace_sysctl_init+0x0/0xf8 @ 1
[    0.066672] initcall user_namespace_sysctl_init+0x0/0xf8 returned 0 after 0 usecs
[    0.066678] calling  proc_schedstat_init+0x0/0x58 @ 1
[    0.066689] initcall proc_schedstat_init+0x0/0x58 returned 0 after 0 usecs
[    0.066694] calling  pm_sysrq_init+0x0/0x40 @ 1
[    0.066727] initcall pm_sysrq_init+0x0/0x40 returned 0 after 0 usecs
[    0.066732] calling  create_proc_profile+0x0/0x80 @ 1
[    0.066738] initcall create_proc_profile+0x0/0x80 returned 0 after 0 usecs
[    0.066742] calling  crash_save_vmcoreinfo_init+0x0/0x640 @ 1
[    0.066788] initcall crash_save_vmcoreinfo_init+0x0/0x640 returned 0 after 0 usecs
[    0.066793] calling  crash_notes_memory_init+0x0/0x60 @ 1
[    0.066800] initcall crash_notes_memory_init+0x0/0x60 returned 0 after 0 usecs
[    0.066804] calling  cgroup_sysfs_init+0x0/0x40 @ 1
[    0.066813] initcall cgroup_sysfs_init+0x0/0x40 returned 0 after 0 usecs
[    0.066817] calling  user_namespaces_init+0x0/0x98 @ 1
[    0.066826] initcall user_namespaces_init+0x0/0x98 returned 0 after 0 usecs
[    0.066831] calling  trace_eval_init+0x0/0x98 @ 1
[    0.066853] initcall trace_eval_init+0x0/0x98 returned 0 after 0 usecs
[    0.066859] calling  send_signal_irq_work_init+0x0/0xb8 @ 1
[    0.066862] initcall send_signal_irq_work_init+0x0/0xb8 returned 0 after 0 usecs
[    0.066865] calling  dev_map_init+0x0/0x38 @ 1
[    0.066870] initcall dev_map_init+0x0/0x38 returned 0 after 0 usecs
[    0.066874] calling  netns_bpf_init+0x0/0x38 @ 1
[    0.066879] initcall netns_bpf_init+0x0/0x38 returned 0 after 0 usecs
[    0.066882] calling  btf_vmlinux_init+0x0/0x90 @ 1
[    0.066889] initcall btf_vmlinux_init+0x0/0x90 returned 0 after 0 usecs
[    0.066893] calling  oom_init+0x0/0x78 @ 1
[    0.066993] initcall oom_init+0x0/0x78 returned 0 after 0 usecs
[    0.066998] calling  init_user_buckets+0x0/0x58 @ 1
[    0.067096] initcall init_user_buckets+0x0/0x58 returned 0 after 0 usecs
[    0.067100] calling  default_bdi_init+0x0/0x50 @ 1
[    0.067177] initcall default_bdi_init+0x0/0x50 returned 0 after 1000 usecs
[    0.067182] calling  cgwb_init+0x0/0x50 @ 1
[    0.067191] initcall cgwb_init+0x0/0x50 returned 0 after 0 usecs
[    0.067196] calling  percpu_enable_async+0x0/0x28 @ 1
[    0.067202] initcall percpu_enable_async+0x0/0x28 returned 0 after 0 usecs
[    0.067206] calling  kcompactd_init+0x0/0xf0 @ 1
[    0.067249] initcall kcompactd_init+0x0/0xf0 returned 0 after 0 usecs
[    0.067255] calling  init_user_reserve+0x0/0x40 @ 1
[    0.067261] initcall init_user_reserve+0x0/0x40 returned 0 after 0 usecs
[    0.067266] calling  init_admin_reserve+0x0/0x38 @ 1
[    0.067270] initcall init_admin_reserve+0x0/0x38 returned 0 after 0 usecs
[    0.067274] calling  init_reserve_notifier+0x0/0x50 @ 1
[    0.067279] initcall init_reserve_notifier+0x0/0x50 returned 0 after 0 usecs
[    0.067283] calling  swap_init_sysfs+0x0/0x90 @ 1
[    0.067294] initcall swap_init_sysfs+0x0/0x90 returned 0 after 0 usecs
[    0.067299] calling  swapfile_init+0x0/0xf0 @ 1
[    0.067305] initcall swapfile_init+0x0/0xf0 returned 0 after 0 usecs
[    0.067310] calling  hugetlb_init+0x0/0x640 @ 1
[    0.067323] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.067329] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
[    0.067333] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
[    0.067337] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
[    0.067341] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.067344] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.067348] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
[    0.067351] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.067407] initcall hugetlb_init+0x0/0x640 returned 0 after 0 usecs
[    0.067414] calling  ksm_init+0x0/0x220 @ 1
[    0.067495] initcall ksm_init+0x0/0x220 returned 0 after 0 usecs
[    0.067501] calling  memory_tier_init+0x0/0x108 @ 1
[    0.067523] initcall memory_tier_init+0x0/0x108 returned 0 after 0 usecs
[    0.067526] calling  numa_init_sysfs+0x0/0x90 @ 1
[    0.067531] initcall numa_init_sysfs+0x0/0x90 returned 0 after 0 usecs
[    0.067534] calling  hugepage_init+0x0/0x2a0 @ 1
[    0.067707] initcall hugepage_init+0x0/0x2a0 returned 0 after 0 usecs
[    0.067711] calling  memcg1_init+0x0/0x128 @ 1
[    0.067714] initcall memcg1_init+0x0/0x128 returned 0 after 0 usecs
[    0.067717] calling  mem_cgroup_init+0x0/0x170 @ 1
[    0.067721] initcall mem_cgroup_init+0x0/0x170 returned 0 after 0 usecs
[    0.067724] calling  mem_cgroup_swap_init+0x0/0x90 @ 1
[    0.067739] initcall mem_cgroup_swap_init+0x0/0x90 returned 0 after 0 usecs
[    0.067742] calling  cma_sysfs_init+0x0/0x1c0 @ 1
[    0.067752] initcall cma_sysfs_init+0x0/0x1c0 returned 0 after 0 usecs
[    0.067755] calling  page_idle_init+0x0/0x60 @ 1
[    0.067760] initcall page_idle_init+0x0/0x60 returned 0 after 0 usecs
[    0.067764] calling  damon_init+0x0/0xb0 @ 1
[    0.067773] initcall damon_init+0x0/0xb0 returned 0 after 0 usecs
[    0.067777] calling  damon_va_initcall+0x0/0xa0 @ 1
[    0.067782] initcall damon_va_initcall+0x0/0xa0 returned 0 after 0 usecs
[    0.067785] calling  damon_pa_initcall+0x0/0x78 @ 1
[    0.067789] initcall damon_pa_initcall+0x0/0x78 returned 0 after 0 usecs
[    0.067792] calling  damon_sysfs_init+0x0/0x148 @ 1
[    0.067802] initcall damon_sysfs_init+0x0/0x148 returned 0 after 0 usecs
[    0.067805] calling  init_msg_buckets+0x0/0x58 @ 1
[    0.067900] initcall init_msg_buckets+0x0/0x58 returned 0 after 0 usecs
[    0.067905] calling  sel_ib_pkey_init+0x0/0xb0 @ 1
[    0.067911] initcall sel_ib_pkey_init+0x0/0xb0 returned 0 after 0 usecs
[    0.067914] calling  fips_init+0x0/0x50 @ 1
[    0.067921] initcall fips_init+0x0/0x50 returned 0 after 0 usecs
[    0.067925] calling  seqiv_module_init+0x0/0x38 @ 1
[    0.067930] initcall seqiv_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.067934] calling  dh_init+0x0/0x78 @ 1
[    0.067942] initcall dh_init+0x0/0x78 returned 0 after 0 usecs
[    0.067946] calling  rsa_init+0x0/0x90 @ 1
[    0.067952] initcall rsa_init+0x0/0x90 returned 0 after 0 usecs
[    0.067955] calling  ecdsa_init+0x0/0xf0 @ 1
[    0.067964] initcall ecdsa_init+0x0/0xf0 returned 0 after 0 usecs
[    0.067968] calling  crypto_cmac_module_init+0x0/0x38 @ 1
[    0.067973] initcall crypto_cmac_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.067977] calling  hmac_module_init+0x0/0x38 @ 1
[    0.067981] initcall hmac_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.067985] calling  crypto_null_mod_init+0x0/0x98 @ 1
[    0.067993] initcall crypto_null_mod_init+0x0/0x98 returned 0 after 0 usecs
[    0.067997] calling  md5_mod_init+0x0/0x38 @ 1
[    0.068001] initcall md5_mod_init+0x0/0x38 returned 0 after 0 usecs
[    0.068005] calling  sha1_generic_mod_init+0x0/0x38 @ 1
[    0.068009] initcall sha1_generic_mod_init+0x0/0x38 returned 0 after 0 usecs
[    0.068013] calling  sha256_generic_mod_init+0x0/0x38 @ 1
[    0.068018] initcall sha256_generic_mod_init+0x0/0x38 returned 0 after 0 usecs
[    0.068022] calling  sha512_generic_mod_init+0x0/0x38 @ 1
[    0.068027] initcall sha512_generic_mod_init+0x0/0x38 returned 0 after 0 usecs
[    0.068031] calling  sha3_generic_mod_init+0x0/0x40 @ 1
[    0.068038] initcall sha3_generic_mod_init+0x0/0x40 returned 0 after 0 usecs
[    0.068042] calling  blake2b_mod_init+0x0/0x40 @ 1
[    0.068050] initcall blake2b_mod_init+0x0/0x40 returned 0 after 0 usecs
[    0.068054] calling  crypto_ecb_module_init+0x0/0x38 @ 1
[    0.068058] initcall crypto_ecb_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.068062] calling  crypto_cbc_module_init+0x0/0x38 @ 1
[    0.068066] initcall crypto_cbc_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.068070] calling  crypto_cts_module_init+0x0/0x38 @ 1
[    0.068073] initcall crypto_cts_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.068077] calling  xts_module_init+0x0/0x38 @ 1
[    0.068081] initcall xts_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.068085] calling  crypto_ctr_module_init+0x0/0x38 @ 1
[    0.068089] initcall crypto_ctr_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.068093] calling  crypto_gcm_module_init+0x0/0x88 @ 1
[    0.068098] initcall crypto_gcm_module_init+0x0/0x88 returned 0 after 0 usecs
[    0.068102] calling  crypto_ccm_module_init+0x0/0x38 @ 1
[    0.068107] initcall crypto_ccm_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.068111] calling  cryptd_init+0x0/0x178 @ 1
[    0.068161] cryptd: max_cpu_qlen set to 1000
[    0.068167] initcall cryptd_init+0x0/0x178 returned 0 after 1000 usecs
[    0.068172] calling  aes_init+0x0/0x38 @ 1
[    0.068178] initcall aes_init+0x0/0x38 returned 0 after 0 usecs
[    0.068182] calling  deflate_mod_init+0x0/0x68 @ 1
[    0.068189] initcall deflate_mod_init+0x0/0x68 returned 0 after 0 usecs
[    0.068193] calling  crc32c_mod_init+0x0/0x50 @ 1
[    0.068198] initcall crc32c_mod_init+0x0/0x50 returned 0 after 0 usecs
[    0.068202] calling  crct10dif_mod_init+0x0/0x38 @ 1
[    0.068207] initcall crct10dif_mod_init+0x0/0x38 returned 0 after 0 usecs
[    0.068211] calling  crypto_authenc_module_init+0x0/0x38 @ 1
[    0.068216] initcall crypto_authenc_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.068220] calling  crypto_authenc_esn_module_init+0x0/0x38 @ 1
[    0.068224] initcall crypto_authenc_esn_module_init+0x0/0x38 returned 0 after 0 usecs
[    0.068228] calling  lzo_mod_init+0x0/0x68 @ 1
[    0.068234] initcall lzo_mod_init+0x0/0x68 returned 0 after 0 usecs
[    0.068239] calling  lzorle_mod_init+0x0/0x68 @ 1
[    0.068245] initcall lzorle_mod_init+0x0/0x68 returned 0 after 0 usecs
[    0.068249] calling  xxhash_mod_init+0x0/0x38 @ 1
[    0.068255] initcall xxhash_mod_init+0x0/0x38 returned 0 after 0 usecs
[    0.068259] calling  crypto842_mod_init+0x0/0x60 @ 1
[    0.068265] initcall crypto842_mod_init+0x0/0x60 returned 0 after 0 usecs
[    0.068269] calling  drbg_init+0x0/0x148 @ 1
[    0.068302] initcall drbg_init+0x0/0x148 returned 0 after 0 usecs
[    0.068306] calling  ghash_mod_init+0x0/0x38 @ 1
[    0.068313] initcall ghash_mod_init+0x0/0x38 returned 0 after 0 usecs
[    0.068317] calling  ecdh_init+0x0/0xa0 @ 1
[    0.068327] initcall ecdh_init+0x0/0xa0 returned 0 after 0 usecs
[    0.068331] calling  init_bio+0x0/0x128 @ 1
[    0.068405] initcall init_bio+0x0/0x128 returned 0 after 0 usecs
[    0.068411] calling  blk_ioc_init+0x0/0x98 @ 1
[    0.068422] initcall blk_ioc_init+0x0/0x98 returned 0 after 0 usecs
[    0.068426] calling  blk_mq_init+0x0/0x1c0 @ 1
[    0.068432] initcall blk_mq_init+0x0/0x1c0 returned 0 after 0 usecs
[    0.068436] calling  genhd_device_init+0x0/0x80 @ 1
[    0.068489] initcall genhd_device_init+0x0/0x80 returned 0 after 0 usecs
[    0.068494] calling  blkcg_punt_bio_init+0x0/0x50 @ 1
[    0.068551] initcall blkcg_punt_bio_init+0x0/0x50 returned 0 after 0 usecs
[    0.068557] calling  bio_crypt_ctx_init+0x0/0x150 @ 1
[    0.068581] initcall bio_crypt_ctx_init+0x0/0x150 returned 0 after 0 usecs
[    0.068586] calling  blk_crypto_sysfs_init+0x0/0xd0 @ 1
[    0.068591] initcall blk_crypto_sysfs_init+0x0/0xd0 returned 0 after 0 usecs
[    0.068596] calling  io_wq_init+0x0/0x60 @ 1
[    0.068601] initcall io_wq_init+0x0/0x60 returned 0 after 0 usecs
[    0.068606] calling  raid6_select_algo+0x0/0x168 @ 1
[    0.068619] raid6: skipped pq benchmark and selected neonx8
[    0.068624] raid6: using neon recovery algorithm
[    0.068631] initcall raid6_select_algo+0x0/0x168 returned 0 after 0 usecs
[    0.068636] calling  sg_pool_init+0x0/0x138 @ 1
[    0.068670] initcall sg_pool_init+0x0/0x138 returned 0 after 0 usecs
[    0.068675] calling  irq_poll_setup+0x0/0xe0 @ 1
[    0.068681] initcall irq_poll_setup+0x0/0xe0 returned 0 after 0 usecs
[    0.068686] calling  gpiolib_debugfs_init+0x0/0x50 @ 1
[    0.068695] initcall gpiolib_debugfs_init+0x0/0x50 returned 0 after 0 usecs
[    0.068700] calling  pca953x_init+0x0/0x38 @ 1
[    0.068714] initcall pca953x_init+0x0/0x38 returned 0 after 0 usecs
[    0.068719] calling  stmpe_gpio_init+0x0/0x38 @ 1
[    0.068747] initcall stmpe_gpio_init+0x0/0x38 returned 0 after 0 usecs
[    0.068752] calling  pwm_init+0x0/0x80 @ 1
[    0.068766] initcall pwm_init+0x0/0x80 returned 0 after 0 usecs
[    0.068772] calling  leds_init+0x0/0x68 @ 1
[    0.068785] initcall leds_init+0x0/0x68 returned 0 after 0 usecs
[    0.068790] calling  pci_slot_init+0x0/0x70 @ 1
[    0.068799] initcall pci_slot_init+0x0/0x70 returned 0 after 0 usecs
[    0.068803] calling  xgene_pcie_msi_init+0x0/0x38 @ 1
[    0.068840] initcall xgene_pcie_msi_init+0x0/0x38 returned 0 after 0 usecs
[    0.068846] calling  fbmem_init+0x0/0x78 @ 1
[    0.068869] fbcon: Taking over console
[    0.068887] initcall fbmem_init+0x0/0x78 returned 0 after 0 usecs
[    0.068890] calling  scan_for_dmi_ipmi+0x0/0x60 @ 1
[    0.068894] initcall scan_for_dmi_ipmi+0x0/0x60 returned 0 after 0 usecs
[    0.068897] calling  acpi_init+0x0/0x178 @ 1
[    0.068900] ACPI: Interpreter disabled.
[    0.068901] initcall acpi_init+0x0/0x178 returned -19 after 0 usecs
[    0.068904] calling  hmat_init+0x0/0x3a0 @ 1
[    0.068909] initcall hmat_init+0x0/0x3a0 returned 0 after 0 usecs
[    0.068913] calling  pnp_init+0x0/0x38 @ 1
[    0.068934] initcall pnp_init+0x0/0x38 returned 0 after 0 usecs
[    0.068940] calling  hi6220_stub_clk_init+0x0/0x38 @ 1
[    0.068975] initcall hi6220_stub_clk_init+0x0/0x38 returned 0 after 0 usecs
[    0.068979] calling  hi3660_stub_clk_init+0x0/0x38 @ 1
[    0.069007] initcall hi3660_stub_clk_init+0x0/0x38 returned 0 after 0 usecs
[    0.069010] calling  gcc_x1e80100_init+0x0/0x38 @ 1
[    0.069042] initcall gcc_x1e80100_init+0x0/0x38 returned 0 after 0 usecs
[    0.069045] calling  gcc_sc7280_init+0x0/0x38 @ 1
[    0.069075] initcall gcc_sc7280_init+0x0/0x38 returned 0 after 0 usecs
[    0.069079] calling  gcc_sc8280xp_init+0x0/0x38 @ 1
[    0.075665] probe of 100000.clock-controller returned 0 after 7000 usecs
[    0.075696] initcall gcc_sc8280xp_init+0x0/0x38 returned 0 after 7000 usecs
[    0.075703] calling  gcc_sm8150_init+0x0/0x38 @ 1
[    0.075737] initcall gcc_sm8150_init+0x0/0x38 returned 0 after 0 usecs
[    0.075742] calling  rzg2l_cpg_init+0x0/0x40 @ 1
[    0.075805] initcall rzg2l_cpg_init+0x0/0x40 returned -19 after 0 usecs
[    0.075809] calling  rzv2h_cpg_init+0x0/0x40 @ 1
[    0.075848] initcall rzv2h_cpg_init+0x0/0x40 returned -19 after 0 usecs
[    0.075852] calling  cpg_mssr_init+0x0/0x40 @ 1
[    0.075890] initcall cpg_mssr_init+0x0/0x40 returned -19 after 0 usecs
[    0.075894] calling  k3_chipinfo_init+0x0/0x38 @ 1
[    0.075927] initcall k3_chipinfo_init+0x0/0x38 returned 0 after 0 usecs
[    0.075933] calling  regulator_fixed_voltage_init+0x0/0x38 @ 1
[    0.075985] initcall regulator_fixed_voltage_init+0x0/0x38 returned 0 after 0 usecs
[    0.075991] calling  gpio_regulator_init+0x0/0x38 @ 1
[    0.076019] initcall gpio_regulator_init+0x0/0x38 returned 0 after 0 usecs
[    0.076023] calling  misc_init+0x0/0xd8 @ 1
[    0.076035] initcall misc_init+0x0/0xd8 returned 0 after 0 usecs
[    0.076039] calling  tpm_init+0x0/0xf8 @ 1
[    0.076095] probe of regulator-edp-3p3 returned -517 after 0 usecs
[    0.076104] initcall tpm_init+0x0/0xf8 returned 0 after 0 usecs
[    0.076109] probe of regulator-edp-bl returned -517 after 0 usecs
[    0.076110] calling  iommu_subsys_init+0x0/0x1c0 @ 1
[    0.076116] iommu: Default domain type: Translated
[    0.076119] probe of regulator-misc-3p3 returned -517 after 0 usecs
[    0.076121] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.076126] probe of regulator-nvme returned -517 after 0 usecs
[    0.076131] initcall iommu_subsys_init+0x0/0x1c0 returned 0 after 0 usecs
[    0.076136] calling  cn_init+0x0/0x128 @ 1
[    0.076153] initcall cn_init+0x0/0x128 returned 0 after 0 usecs
[    0.076158] calling  register_cpu_capacity_sysctl+0x0/0x58 @ 1
[    0.076175] probe of regulator-wlan returned -517 after 0 usecs
[    0.076196] probe of regulator-wwan returned -517 after 1000 usecs
[    0.076295] probe of regulator-vph-pwr returned 0 after 1000 usecs
[    0.077266] initcall register_cpu_capacity_sysctl+0x0/0x58 returned 0 after 2000 usecs
[    0.077272] calling  stmpe_init+0x0/0x38 @ 1
[    0.077289] initcall stmpe_init+0x0/0x38 returned 0 after 0 usecs
[    0.077294] calling  stmpe_init+0x0/0x38 @ 1
[    0.077307] initcall stmpe_init+0x0/0x38 returned 0 after 0 usecs
[    0.077312] calling  bd718xx_i2c_init+0x0/0x38 @ 1
[    0.077322] initcall bd718xx_i2c_init+0x0/0x38 returned 0 after 0 usecs
[    0.077327] calling  dax_core_init+0x0/0x138 @ 1
[    0.077380] initcall dax_core_init+0x0/0x138 returned 0 after 0 usecs
[    0.077386] calling  dma_buf_init+0x0/0xc8 @ 1
[    0.077407] initcall dma_buf_init+0x0/0xc8 returned 0 after 0 usecs
[    0.077413] calling  dma_heap_init+0x0/0xb8 @ 1
[    0.077421] initcall dma_heap_init+0x0/0xb8 returned 0 after 0 usecs
[    0.077424] calling  init_scsi+0x0/0xb0 @ 1
[    0.077484] SCSI subsystem initialized
[    0.077489] initcall init_scsi+0x0/0xb0 returned 0 after 0 usecs
[    0.077494] calling  ata_init+0x0/0x1b8 @ 1
[    0.077555] libata version 3.00 loaded.
[    0.077557] initcall ata_init+0x0/0x1b8 returned 0 after 0 usecs
[    0.077564] calling  phy_init+0x0/0xd0 @ 1
[    0.077594] initcall phy_init+0x0/0xd0 returned 0 after 0 usecs
[    0.077599] calling  usb_common_init+0x0/0x48 @ 1
[    0.077611] initcall usb_common_init+0x0/0x48 returned 0 after 0 usecs
[    0.077616] calling  usb_init+0x0/0x198 @ 1
[    0.077646] usbcore: registered new interface driver usbfs
[    0.077661] usbcore: registered new interface driver hub
[    0.077673] usbcore: registered new device driver usb
[    0.077678] initcall usb_init+0x0/0x198 returned 0 after 0 usecs
[    0.077683] calling  usb_roles_init+0x0/0x38 @ 1
[    0.077691] initcall usb_roles_init+0x0/0x38 returned 0 after 0 usecs
[    0.077697] calling  serio_init+0x0/0x58 @ 1
[    0.077710] initcall serio_init+0x0/0x58 returned 0 after 0 usecs
[    0.077715] calling  input_init+0x0/0x128 @ 1
[    0.077728] initcall input_init+0x0/0x128 returned 0 after 0 usecs
[    0.077733] calling  rtc_init+0x0/0x50 @ 1
[    0.077738] initcall rtc_init+0x0/0x50 returned 0 after 0 usecs
[    0.077741] calling  dw_i2c_init_driver+0x0/0x38 @ 1
[    0.077788] initcall dw_i2c_init_driver+0x0/0x38 returned 0 after 0 usecs
[    0.077792] calling  rc_core_init+0x0/0xb8 @ 1
[    0.077802] initcall rc_core_init+0x0/0xb8 returned 0 after 0 usecs
[    0.077805] calling  pps_init+0x0/0xd8 @ 1
[    0.077810] pps_core: LinuxPPS API ver. 1 registered
[    0.077814] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.077818] initcall pps_init+0x0/0xd8 returned 0 after 0 usecs
[    0.077821] calling  ptp_init+0x0/0xb8 @ 1
[    0.077827] PTP clock support registered
[    0.077830] initcall ptp_init+0x0/0xb8 returned 0 after 0 usecs
[    0.077833] calling  power_supply_class_init+0x0/0x38 @ 1
[    0.077845] initcall power_supply_class_init+0x0/0x38 returned 0 after 0 usecs
[    0.077848] calling  hwmon_init+0x0/0x58 @ 1
[    0.077853] initcall hwmon_init+0x0/0x58 returned 0 after 0 usecs
[    0.077857] calling  md_init+0x0/0x190 @ 1
[    0.077950] initcall md_init+0x0/0x190 returned 0 after 0 usecs
[    0.077955] calling  edac_init+0x0/0xa0 @ 1
[    0.077959] EDAC MC: Ver: 3.0.0
[    0.078037] initcall edac_init+0x0/0xa0 returned 0 after 0 usecs
[    0.078041] calling  dmi_init+0x0/0x130 @ 1
[    0.078055] initcall dmi_init+0x0/0x130 returned 0 after 0 usecs
[    0.078059] calling  scmi_bus_init+0x0/0x68 @ 1
[    0.078071] scmi_core: SCMI protocol bus registered
[    0.078076] initcall scmi_bus_init+0x0/0x68 returned 0 after 0 usecs
[    0.078080] calling  efisubsys_init+0x0/0x468 @ 1
[    0.078089] initcall efisubsys_init+0x0/0x468 returned 0 after 0 usecs
[    0.078094] calling  psci_hibernate_init+0x0/0x58 @ 1
[    0.078099] initcall psci_hibernate_init+0x0/0x58 returned 0 after 0 usecs
[    0.078103] calling  qcom_scm_init+0x0/0x40 @ 1
[    0.078120] probe of firmware:scm returned -517 after 0 usecs
[    0.078188] initcall qcom_scm_init+0x0/0x40 returned 0 after 0 usecs
[    0.078194] calling  qcom_qseecom_init+0x0/0x38 @ 1
[    0.078225] initcall qcom_qseecom_init+0x0/0x38 returned 0 after 1000 usecs
[    0.078231] calling  sh_cmt_init+0x0/0x38 @ 1
[    0.078308] initcall sh_cmt_init+0x0/0x38 returned 0 after 0 usecs
[    0.078314] calling  sh_tmu_init+0x0/0x38 @ 1
[    0.078344] initcall sh_tmu_init+0x0/0x38 returned 0 after 0 usecs
[    0.078350] calling  zynqmp_ipi_init+0x0/0x38 @ 1
[    0.078384] initcall zynqmp_ipi_init+0x0/0x38 returned 0 after 0 usecs
[    0.078388] calling  remoteproc_init+0x0/0xa0 @ 1
[    0.078407] initcall remoteproc_init+0x0/0xa0 returned 0 after 0 usecs
[    0.078412] calling  devfreq_init+0x0/0x110 @ 1
[    0.078465] initcall devfreq_init+0x0/0x110 returned 0 after 0 usecs
[    0.078470] calling  devfreq_event_init+0x0/0x80 @ 1
[    0.078477] initcall devfreq_event_init+0x0/0x80 returned 0 after 0 usecs
[    0.078481] calling  arm_pmu_hp_init+0x0/0x78 @ 1
[    0.078487] initcall arm_pmu_hp_init+0x0/0x78 returned 0 after 0 usecs
[    0.078491] calling  arm_pmu_acpi_init+0x0/0xa0 @ 1
[    0.078495] initcall arm_pmu_acpi_init+0x0/0xa0 returned 0 after 0 usecs
[    0.078499] calling  ras_init+0x0/0x30 @ 1
[    0.078508] initcall ras_init+0x0/0x30 returned 0 after 0 usecs
[    0.078512] calling  nvmem_init+0x0/0x68 @ 1
[    0.078534] initcall nvmem_init+0x0/0x68 returned 0 after 0 usecs
[    0.078538] calling  hte_subsys_dbgfs_init+0x0/0x48 @ 1
[    0.078545] initcall hte_subsys_dbgfs_init+0x0/0x48 returned 0 after 0 usecs
[    0.078550] calling  dpll_init+0x0/0x38 @ 1
[    0.078570] initcall dpll_init+0x0/0x38 returned 0 after 0 usecs
[    0.078575] calling  proto_init+0x0/0x38 @ 1
[    0.078581] initcall proto_init+0x0/0x38 returned 0 after 0 usecs
[    0.078585] calling  net_dev_init+0x0/0x428 @ 1
[    0.078729] initcall net_dev_init+0x0/0x428 returned 0 after 0 usecs
[    0.078735] calling  neigh_init+0x0/0x40 @ 1
[    0.078741] initcall neigh_init+0x0/0x40 returned 0 after 0 usecs
[    0.078745] calling  fib_notifier_init+0x0/0x38 @ 1
[    0.078754] initcall fib_notifier_init+0x0/0x38 returned 0 after 0 usecs
[    0.078758] calling  netdev_genl_init+0x0/0x68 @ 1
[    0.078775] initcall netdev_genl_init+0x0/0x68 returned 0 after 0 usecs
[    0.078779] calling  page_pool_user_init+0x0/0x38 @ 1
[    0.078784] initcall page_pool_user_init+0x0/0x38 returned 0 after 0 usecs
[    0.078788] calling  fib_rules_init+0x0/0x98 @ 1
[    0.078794] initcall fib_rules_init+0x0/0x98 returned 0 after 0 usecs
[    0.078798] calling  init_cgroup_netprio+0x0/0x38 @ 1
[    0.078804] initcall init_cgroup_netprio+0x0/0x38 returned 0 after 0 usecs
[    0.078808] calling  bpf_lwt_init+0x0/0x38 @ 1
[    0.078812] initcall bpf_lwt_init+0x0/0x38 returned 0 after 0 usecs
[    0.078817] calling  pktsched_init+0x0/0xb8 @ 1
[    0.078825] initcall pktsched_init+0x0/0xb8 returned 0 after 0 usecs
[    0.078830] calling  tc_filter_init+0x0/0x98 @ 1
[    0.078841] initcall tc_filter_init+0x0/0x98 returned 0 after 0 usecs
[    0.078845] calling  tc_action_init+0x0/0x40 @ 1
[    0.078849] initcall tc_action_init+0x0/0x40 returned 0 after 0 usecs
[    0.078854] calling  ethnl_init+0x0/0x90 @ 1
[    0.078901] initcall ethnl_init+0x0/0x90 returned 0 after 0 usecs
[    0.078905] calling  nexthop_init+0x0/0x60 @ 1
[    0.078915] initcall nexthop_init+0x0/0x60 returned 0 after 0 usecs
[    0.078920] calling  cipso_v4_init+0x0/0xb8 @ 1
[    0.078929] initcall cipso_v4_init+0x0/0xb8 returned 0 after 0 usecs
[    0.078934] calling  devlink_init+0x0/0x98 @ 1
[    0.078989] initcall devlink_init+0x0/0x98 returned 0 after 0 usecs
[    0.078992] calling  netlbl_init+0x0/0x98 @ 1
[    0.078995] NetLabel: Initializing
[    0.079000] NetLabel:  domain hash size = 128
[    0.079003] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.079031] NetLabel:  unlabeled traffic allowed by default
[    0.079034] initcall netlbl_init+0x0/0x98 returned 0 after 0 usecs
[    0.079038] calling  ncsi_init_netlink+0x0/0x38 @ 1
[    0.079045] initcall ncsi_init_netlink+0x0/0x38 returned 0 after 0 usecs
[    0.079048] calling  mctp_init+0x0/0xa8 @ 1
[    0.079051] mctp: management component transport protocol core
[    0.079055] NET: Registered PF_MCTP protocol family
[    0.079070] initcall mctp_init+0x0/0xa8 returned 0 after 0 usecs
[    0.079073] calling  shaper_init+0x0/0x30 @ 1
[    0.079080] initcall shaper_init+0x0/0x30 returned 0 after 0 usecs
[    0.079084] calling  vsprintf_init_hashval+0x0/0x95cc @ 1
[    0.079090] initcall vsprintf_init_hashval+0x0/0x95cc returned 0 after 0 usecs
[    0.079094] calling  init_32bit_el0_mask+0x0/0x80 @ 1
[    0.079100] initcall init_32bit_el0_mask+0x0/0x80 returned 0 after 0 usecs
[    0.079105] calling  _imx_scu_gpio_init+0x0/0x38 @ 1
[    0.079146] initcall _imx_scu_gpio_init+0x0/0x38 returned 0 after 0 usecs
[    0.079151] calling  vga_arb_device_init+0x0/0xc0 @ 1
[    0.079233] vgaarb: loaded
[    0.079237] initcall vga_arb_device_init+0x0/0xc0 returned 0 after 1000 usecs
[    0.079244] calling  watchdog_init+0x0/0x100 @ 1
[    0.079289] initcall watchdog_init+0x0/0x100 returned 0 after 0 usecs
[    0.079293] calling  imx_scu_driver_init+0x0/0x38 @ 1
[    0.079327] initcall imx_scu_driver_init+0x0/0x38 returned 0 after 0 usecs
[    0.079371] calling  create_debug_debugfs_entry+0x0/0x48 @ 1
[    0.079381] initcall create_debug_debugfs_entry+0x0/0x48 returned 0 after 0 usecs
[    0.079385] calling  iomem_init_inode+0x0/0xc8 @ 1
[    0.079409] initcall iomem_init_inode+0x0/0xc8 returned 0 after 0 usecs
[    0.079414] calling  em_debug_init+0x0/0x48 @ 1
[    0.079423] initcall em_debug_init+0x0/0x48 returned 0 after 0 usecs
[    0.079426] calling  clocksource_done_booting+0x0/0x78 @ 1
[    0.079469] clocksource: Switched to clocksource arch_sys_counter
[    0.079474] initcall clocksource_done_booting+0x0/0x78 returned 0 after 12 usecs
[    0.079478] calling  tracer_init_tracefs+0x0/0x118 @ 1
[    0.079525] initcall tracer_init_tracefs+0x0/0x118 returned 0 after 40 usecs
[    0.079532] calling  init_trace_printk_function_export+0x0/0x48 @ 1
[    0.079541] initcall init_trace_printk_function_export+0x0/0x48 returned 0 after 3 usecs
[    0.079547] calling  init_graph_tracefs+0x0/0x48 @ 1
[    0.079553] initcall init_graph_tracefs+0x0/0x48 returned 0 after 2 usecs
[    0.079555] calling  trace_events_synth_init+0x0/0x68 @ 1
[    0.079562] initcall trace_events_synth_init+0x0/0x68 returned 0 after 2 usecs
[    0.079565] calling  bpf_event_init+0x0/0x30 @ 1
[    0.079570] initcall bpf_event_init+0x0/0x30 returned 0 after 2 usecs
[    0.079573] calling  init_kprobe_trace+0x0/0x1a8 @ 1
[    0.095505] initcall init_kprobe_trace+0x0/0x1a8 returned 0 after 15929 usecs
[    0.095509] calling  init_dynamic_event+0x0/0x48 @ 1
[    0.095518] initcall init_dynamic_event+0x0/0x48 returned 0 after 5 usecs
[    0.095521] calling  init_uprobe_trace+0x0/0x88 @ 1
[    0.095537] initcall init_uprobe_trace+0x0/0x88 returned 0 after 13 usecs
[    0.095541] calling  bpf_init+0x0/0x80 @ 1
[    0.095548] initcall bpf_init+0x0/0x80 returned 0 after 4 usecs
[    0.095552] calling  btf_module_init+0x0/0x40 @ 1
[    0.095556] initcall btf_module_init+0x0/0x40 returned 0 after 0 usecs
[    0.095559] calling  secretmem_init+0x0/0x70 @ 1
[    0.095578] initcall secretmem_init+0x0/0x70 returned 0 after 15 usecs
[    0.095582] calling  init_fs_stat_sysctls+0x0/0x60 @ 1
[    0.095591] initcall init_fs_stat_sysctls+0x0/0x60 returned 0 after 5 usecs
[    0.095594] calling  init_fs_exec_sysctls+0x0/0x50 @ 1
[    0.095599] initcall init_fs_exec_sysctls+0x0/0x50 returned 0 after 1 usecs
[    0.095603] calling  init_pipe_fs+0x0/0x90 @ 1
[    0.095616] initcall init_pipe_fs+0x0/0x90 returned 0 after 9 usecs
[    0.095619] calling  init_fs_namei_sysctls+0x0/0x50 @ 1
[    0.095625] initcall init_fs_namei_sysctls+0x0/0x50 returned 0 after 2 usecs
[    0.095629] calling  init_fs_dcache_sysctls+0x0/0x50 @ 1
[    0.095633] initcall init_fs_dcache_sysctls+0x0/0x50 returned 0 after 1 usecs
[    0.095637] calling  init_fs_namespace_sysctls+0x0/0x50 @ 1
[    0.095642] initcall init_fs_namespace_sysctls+0x0/0x50 returned 0 after 1 usecs
[    0.095646] calling  cgroup_writeback_init+0x0/0x50 @ 1
[    0.095654] initcall cgroup_writeback_init+0x0/0x50 returned 0 after 4 usecs
[    0.095658] calling  inotify_user_setup+0x0/0x130 @ 1
[    0.095672] initcall inotify_user_setup+0x0/0x130 returned 0 after 10 usecs
[    0.095677] calling  eventpoll_init+0x0/0x160 @ 1
[    0.095706] initcall eventpoll_init+0x0/0x160 returned 0 after 25 usecs
[    0.095710] calling  anon_inode_init+0x0/0x88 @ 1
[    0.095729] initcall anon_inode_init+0x0/0x88 returned 0 after 14 usecs
[    0.095733] calling  init_dax_wait_table+0x0/0x78 @ 1
[    0.095755] initcall init_dax_wait_table+0x0/0x78 returned 0 after 17 usecs
[    0.095759] calling  proc_locks_init+0x0/0x58 @ 1
[    0.095765] initcall proc_locks_init+0x0/0x58 returned 0 after 1 usecs
[    0.095769] calling  backing_aio_init+0x0/0xa0 @ 1
[    0.095777] initcall backing_aio_init+0x0/0xa0 returned 0 after 4 usecs
[    0.095782] calling  init_fs_coredump_sysctls+0x0/0x50 @ 1
[    0.095790] initcall init_fs_coredump_sysctls+0x0/0x50 returned 0 after 4 usecs
[    0.095795] calling  iomap_buffered_init+0x0/0x40 @ 1
[    0.095828] initcall iomap_buffered_init+0x0/0x40 returned 0 after 28 usecs
[    0.095833] calling  iomap_dio_init+0x0/0x48 @ 1
[    0.095843] initcall iomap_dio_init+0x0/0x48 returned 0 after 6 usecs
[    0.095847] calling  dquot_init+0x0/0x1a0 @ 1
[    0.095851] VFS: Disk quotas dquot_6.6.0
[    0.095865] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.095870] initcall dquot_init+0x0/0x1a0 returned 0 after 19 usecs
[    0.095875] calling  quota_init+0x0/0x48 @ 1
[    0.095890] initcall quota_init+0x0/0x48 returned 0 after 10 usecs
[    0.095895] calling  proc_cmdline_init+0x0/0x70 @ 1
[    0.095901] initcall proc_cmdline_init+0x0/0x70 returned 0 after 1 usecs
[    0.095905] calling  proc_consoles_init+0x0/0x50 @ 1
[    0.095911] initcall proc_consoles_init+0x0/0x50 returned 0 after 1 usecs
[    0.095915] calling  proc_cpuinfo_init+0x0/0x48 @ 1
[    0.095920] initcall proc_cpuinfo_init+0x0/0x48 returned 0 after 1 usecs
[    0.095925] calling  proc_devices_init+0x0/0x60 @ 1
[    0.095929] initcall proc_devices_init+0x0/0x60 returned 0 after 0 usecs
[    0.095934] calling  proc_interrupts_init+0x0/0x50 @ 1
[    0.095941] initcall proc_interrupts_init+0x0/0x50 returned 0 after 2 usecs
[    0.095945] calling  proc_loadavg_init+0x0/0x60 @ 1
[    0.095950] initcall proc_loadavg_init+0x0/0x60 returned 0 after 0 usecs
[    0.095954] calling  proc_meminfo_init+0x0/0x60 @ 1
[    0.095959] initcall proc_meminfo_init+0x0/0x60 returned 0 after 0 usecs
[    0.095963] calling  proc_stat_init+0x0/0x48 @ 1
[    0.095968] initcall proc_stat_init+0x0/0x48 returned 0 after 0 usecs
[    0.095973] calling  proc_uptime_init+0x0/0x60 @ 1
[    0.095978] initcall proc_uptime_init+0x0/0x60 returned 0 after 1 usecs
[    0.095983] calling  proc_version_init+0x0/0x60 @ 1
[    0.095988] initcall proc_version_init+0x0/0x60 returned 0 after 0 usecs
[    0.095992] calling  proc_softirqs_init+0x0/0x60 @ 1
[    0.095997] initcall proc_softirqs_init+0x0/0x60 returned 0 after 0 usecs
[    0.096001] calling  proc_kcore_init+0x0/0xd8 @ 1
[    0.096016] initcall proc_kcore_init+0x0/0xd8 returned 0 after 10 usecs
[    0.096021] calling  vmcore_init+0x0/0x1c0 @ 1
[    0.096026] initcall vmcore_init+0x0/0x1c0 returned 0 after 0 usecs
[    0.096031] calling  proc_kmsg_init+0x0/0x48 @ 1
[    0.096036] initcall proc_kmsg_init+0x0/0x48 returned 0 after 1 usecs
[    0.096041] calling  proc_page_init+0x0/0x88 @ 1
[    0.096046] initcall proc_page_init+0x0/0x88 returned 0 after 1 usecs
[    0.096051] calling  proc_boot_config_init+0x0/0xb8 @ 1
[    0.096058] initcall proc_boot_config_init+0x0/0xb8 returned 0 after 2 usecs
[    0.096063] calling  init_ramfs_fs+0x0/0x38 @ 1
[    0.096070] initcall init_ramfs_fs+0x0/0x38 returned 0 after 2 usecs
[    0.096075] calling  init_hugetlbfs_fs+0x0/0x220 @ 1
[    0.096113] initcall init_hugetlbfs_fs+0x0/0x220 returned 0 after 33 usecs
[    0.096119] calling  tomoyo_initerface_init+0x0/0x170 @ 1
[    0.096123] initcall tomoyo_initerface_init+0x0/0x170 returned 0 after 1 usecs
[    0.096127] calling  ipe_init_securityfs+0x0/0x168 @ 1
[    0.096144] initcall ipe_init_securityfs+0x0/0x168 returned 0 after 14 usecs
[    0.096148] calling  dynamic_debug_init_control+0x0/0xa8 @ 1
[    0.096161] initcall dynamic_debug_init_control+0x0/0xa8 returned 0 after 7 usecs
[    0.096166] calling  acpi_event_init+0x0/0x60 @ 1
[    0.096171] initcall acpi_event_init+0x0/0x60 returned 0 after 0 usecs
[    0.096174] calling  acpi_init_fpdt+0x0/0x110 @ 1
[    0.096179] initcall acpi_init_fpdt+0x0/0x110 returned 0 after 1 usecs
[    0.096182] calling  pnp_system_init+0x0/0x38 @ 1
[    0.096198] initcall pnp_system_init+0x0/0x38 returned 0 after 10 usecs
[    0.096203] calling  pnpacpi_init+0x0/0xa8 @ 1
[    0.096208] pnp: PnP ACPI: disabled
[    0.096212] initcall pnpacpi_init+0x0/0xa8 returned 0 after 4 usecs
[    0.096216] calling  chr_dev_init+0x0/0x108 @ 1
[    0.099120] initcall chr_dev_init+0x0/0x108 returned 0 after 2900 usecs
[    0.099135] calling  hwrng_modinit+0x0/0x110 @ 1
[    0.099189] initcall hwrng_modinit+0x0/0x110 returned 0 after 46 usecs
[    0.099197] calling  firmware_class_init+0x0/0x100 @ 1
[    0.099213] initcall firmware_class_init+0x0/0x100 returned 0 after 9 usecs
[    0.099221] calling  efi_mokvar_sysfs_init+0x0/0x1f0 @ 1
[    0.099261] initcall efi_mokvar_sysfs_init+0x0/0x1f0 returned 0 after 32 usecs
[    0.099268] calling  powercap_init+0x0/0x48 @ 1
[    0.099322] initcall powercap_init+0x0/0x48 returned 0 after 49 usecs
[    0.099328] calling  sysctl_core_init+0x0/0x60 @ 1
[    0.099369] initcall sysctl_core_init+0x0/0x60 returned 0 after 35 usecs
[    0.099376] calling  eth_offload_init+0x0/0x38 @ 1
[    0.099383] initcall eth_offload_init+0x0/0x38 returned 0 after 1 usecs
[    0.099389] calling  ipv4_offload_init+0x0/0xc8 @ 1
[    0.099398] initcall ipv4_offload_init+0x0/0xc8 returned 0 after 2 usecs
[    0.099405] calling  inet_init+0x0/0x300 @ 1
[    0.099472] NET: Registered PF_INET protocol family
[    0.099688] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.134818] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.134999] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.135161] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.135758] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.137029] TCP: Hash tables configured (established 262144 bind 65536)
[    0.137225] MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
[    0.137412] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.138205] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.138834] initcall inet_init+0x0/0x300 returned 0 after 39422 usecs
[    0.138852] calling  af_unix_init+0x0/0x160 @ 1
[    0.138876] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.138897] initcall af_unix_init+0x0/0x160 returned 0 after 35 usecs
[    0.138906] calling  ipv6_offload_init+0x0/0xd0 @ 1
[    0.138915] initcall ipv6_offload_init+0x0/0xd0 returned 0 after 3 usecs
[    0.138920] calling  vlan_offload_init+0x0/0x50 @ 1
[    0.138925] initcall vlan_offload_init+0x0/0x50 returned 0 after 0 usecs
[    0.138930] calling  xsk_init+0x0/0xa8 @ 1
[    0.138936] NET: Registered PF_XDP protocol family
[    0.138944] initcall xsk_init+0x0/0xa8 returned 0 after 9 usecs
[    0.138949] calling  pci_apply_final_quirks+0x0/0x170 @ 1
[    0.138963] PCI: CLS 0 bytes, default 64
[    0.138968] initcall pci_apply_final_quirks+0x0/0x170 returned 0 after 10 usecs
[    0.138975] calling  acpi_reserve_resources+0x0/0x110 @ 1
[    0.138980] initcall acpi_reserve_resources+0x0/0x110 returned 0 after 0 usecs
[    0.138984] calling  populate_rootfs+0x0/0x70 @ 1
[    0.139000] initcall populate_rootfs+0x0/0x70 returned 0 after 9 usecs
[    0.139007] calling  nhi_init+0x0/0x68 @ 1
[    0.139068] Trying to unpack rootfs image as initramfs...
[    0.139083] initcall nhi_init+0x0/0x68 returned 0 after 71 usecs
[    0.139153] calling  register_arm64_panic_block+0x0/0x48 @ 1
[    0.139161] initcall register_arm64_panic_block+0x0/0x48 returned 0 after 1 usecs
[    0.139167] calling  cpuinfo_regs_init+0x0/0x110 @ 1
[    0.146526] initcall cpuinfo_regs_init+0x0/0x110 returned 0 after 7351 usecs
[    0.146544] calling  aarch32_el0_sysfs_init+0x0/0x78 @ 1
[    0.146554] initcall aarch32_el0_sysfs_init+0x0/0x78 returned 0 after 0 usecs
[    0.146564] calling  arch_init_uprobes+0x0/0x48 @ 1
[    0.146573] initcall arch_init_uprobes+0x0/0x48 returned 0 after 1 usecs
[    0.146580] calling  ptdump_init+0x0/0x200 @ 1
[    0.146590] initcall ptdump_init+0x0/0x200 returned 0 after 3 usecs
[    0.146598] calling  kvm_arm_init+0x0/0x258 @ 1
[    0.146606] kvm [1]: HYP mode not available
[    0.146620] initcall kvm_arm_init+0x0/0x258 returned -19 after 15 usecs
[    0.146628] calling  cpu_feature_match_SHA1_init+0x0/0x50 @ 1
[    0.146668] initcall cpu_feature_match_SHA1_init+0x0/0x50 returned 0 after 32 usecs
[    0.146678] calling  cpu_feature_match_SHA2_init+0x0/0x50 @ 1
[    0.146692] initcall cpu_feature_match_SHA2_init+0x0/0x50 returned 0 after 7 usecs
[    0.146699] calling  cpu_feature_match_AES_init+0x0/0x50 @ 1
[    0.146708] initcall cpu_feature_match_AES_init+0x0/0x50 returned 0 after 2 usecs
[    0.146715] calling  aes_mod_init+0x0/0x48 @ 1
[    0.146724] initcall aes_mod_init+0x0/0x48 returned 0 after 2 usecs
[    0.146731] calling  cpu_feature_match_AES_init+0x0/0x80 @ 1
[    0.146765] initcall cpu_feature_match_AES_init+0x0/0x80 returned 0 after 27 usecs
[    0.146772] calling  aes_init+0x0/0x70 @ 1
[    0.146794] initcall aes_init+0x0/0x70 returned 0 after 15 usecs
[    0.146801] calling  sha256_mod_init+0x0/0x88 @ 1
[    0.146822] initcall sha256_mod_init+0x0/0x88 returned 0 after 13 usecs
[    0.146829] calling  chacha_simd_mod_init+0x0/0x58 @ 1
[    0.146862] initcall chacha_simd_mod_init+0x0/0x58 returned 0 after 26 usecs
[    0.146869] calling  neon_poly1305_mod_init+0x0/0x58 @ 1
[    0.146893] initcall neon_poly1305_mod_init+0x0/0x58 returned 0 after 17 usecs
[    0.146901] calling  aes_init+0x0/0x38 @ 1
[    0.146911] initcall aes_init+0x0/0x38 returned 0 after 3 usecs
[    0.146918] calling  proc_execdomains_init+0x0/0x50 @ 1
[    0.146933] initcall proc_execdomains_init+0x0/0x50 returned 0 after 8 usecs
[    0.146940] calling  register_warn_debugfs+0x0/0x50 @ 1
[    0.146984] initcall register_warn_debugfs+0x0/0x50 returned 0 after 36 usecs
[    0.146992] calling  cpuhp_sysfs_init+0x0/0x118 @ 1
[    0.147047] initcall cpuhp_sysfs_init+0x0/0x118 returned 0 after 48 usecs
[    0.147054] calling  ioresources_init+0x0/0x88 @ 1
[    0.147065] initcall ioresources_init+0x0/0x88 returned 0 after 3 usecs
[    0.147072] calling  scx_init+0x0/0x1c0 @ 1
[    0.200695] initcall scx_init+0x0/0x1c0 returned 0 after 53613 usecs
[    0.200714] calling  psi_proc_init+0x0/0xc0 @ 1
[    0.200730] initcall psi_proc_init+0x0/0xc0 returned 0 after 7 usecs
[    0.200739] calling  snapshot_device_init+0x0/0x38 @ 1
[    0.200874] initcall snapshot_device_init+0x0/0x38 returned 0 after 130 usecs
[    0.200884] calling  irq_gc_init_ops+0x0/0x40 @ 1
[    0.200891] initcall irq_gc_init_ops+0x0/0x40 returned 0 after 1 usecs
[    0.200896] calling  irq_pm_init_ops+0x0/0x38 @ 1
[    0.200901] initcall irq_pm_init_ops+0x0/0x38 returned 0 after 0 usecs
[    0.200906] calling  module_debugfs_init+0x0/0x48 @ 1
[    0.200937] initcall module_debugfs_init+0x0/0x48 returned 0 after 19 usecs
[    0.200943] calling  proc_modules_init+0x0/0x48 @ 1
[    0.200958] initcall proc_modules_init+0x0/0x48 returned 0 after 7 usecs
[    0.200963] calling  unloaded_tainted_modules_init+0x0/0x50 @ 1
[    0.200973] initcall unloaded_tainted_modules_init+0x0/0x50 returned 0 after 4 usecs
[    0.200979] calling  timer_sysctl_init+0x0/0x48 @ 1
[    0.200992] initcall timer_sysctl_init+0x0/0x48 returned 0 after 8 usecs
[    0.200999] calling  timekeeping_init_ops+0x0/0x40 @ 1
[    0.201006] initcall timekeeping_init_ops+0x0/0x40 returned 0 after 0 usecs
[    0.201012] calling  init_clocksource_sysfs+0x0/0x50 @ 1
[    0.201115] initcall init_clocksource_sysfs+0x0/0x50 returned 0 after 97 usecs
[    0.201121] calling  init_timer_list_procfs+0x0/0x58 @ 1
[    0.201130] initcall init_timer_list_procfs+0x0/0x58 returned 0 after 3 usecs
[    0.201136] calling  alarmtimer_init+0x0/0xe0 @ 1
[    0.201229] initcall alarmtimer_init+0x0/0xe0 returned 0 after 87 usecs
[    0.201235] calling  init_posix_timers+0x0/0x98 @ 1
[    0.201263] initcall init_posix_timers+0x0/0x98 returned 0 after 21 usecs
[    0.201269] calling  clockevents_init_sysfs+0x0/0x150 @ 1
[    0.201440] initcall clockevents_init_sysfs+0x0/0x150 returned 0 after 166 usecs
[    0.201447] calling  sched_clock_syscore_init+0x0/0x40 @ 1
[    0.201454] initcall sched_clock_syscore_init+0x0/0x40 returned 0 after 0 usecs
[    0.201460] calling  kallsyms_init+0x0/0x48 @ 1
[    0.201477] initcall kallsyms_init+0x0/0x48 returned 0 after 2 usecs
[    0.201483] calling  pid_namespaces_init+0x0/0xd8 @ 1
[    0.201508] initcall pid_namespaces_init+0x0/0xd8 returned 0 after 17 usecs
[    0.201514] calling  audit_watch_init+0x0/0x60 @ 1
[    0.201525] initcall audit_watch_init+0x0/0x60 returned 0 after 4 usecs
[    0.201531] calling  audit_fsnotify_init+0x0/0x60 @ 1
[    0.201541] initcall audit_fsnotify_init+0x0/0x60 returned 0 after 3 usecs
[    0.201547] calling  audit_tree_init+0x0/0x108 @ 1
[    0.201564] initcall audit_tree_init+0x0/0x108 returned 0 after 11 usecs
[    0.201570] calling  seccomp_sysctl_init+0x0/0x50 @ 1
[    0.201585] initcall seccomp_sysctl_init+0x0/0x50 returned 0 after 8 usecs
[    0.201592] calling  utsname_sysctl_init+0x0/0x48 @ 1
[    0.201607] initcall utsname_sysctl_init+0x0/0x48 returned 0 after 9 usecs
[    0.201615] calling  init_tracepoints+0x0/0x58 @ 1
[    0.201624] initcall init_tracepoints+0x0/0x58 returned 0 after 2 usecs
[    0.201631] calling  init_lstats_procfs+0x0/0x60 @ 1
[    0.201640] initcall init_lstats_procfs+0x0/0x60 returned 0 after 2 usecs
[    0.201648] calling  stack_trace_init+0x0/0xd0 @ 1
[    0.201675] initcall stack_trace_init+0x0/0xd0 returned 0 after 24 usecs
[    0.201679] calling  init_blk_tracer+0x0/0x78 @ 1
[    0.201704] initcall init_blk_tracer+0x0/0x78 returned 0 after 21 usecs
[    0.201708] calling  register_wwnr+0x0/0x40 @ 1
[    0.201732] initcall register_wwnr+0x0/0x40 returned 0 after 18 usecs
[    0.201737] calling  register_react_printk+0x0/0x38 @ 1
[    0.201746] initcall register_react_printk+0x0/0x38 returned 0 after 4 usecs
[    0.201751] calling  register_react_panic+0x0/0x30 @ 1
[    0.201757] initcall register_react_panic+0x0/0x30 returned 0 after 0 usecs
[    0.201761] calling  perf_event_sysfs_init+0x0/0xb8 @ 1
[    0.201882] initcall perf_event_sysfs_init+0x0/0xb8 returned 0 after 115 usecs
[    0.201888] calling  system_trusted_keyring_init+0x0/0x160 @ 1
[    0.201895] Initialise system trusted keyrings
[    0.201944] initcall system_trusted_keyring_init+0x0/0x160 returned 0 after 49 usecs
[    0.201951] calling  blacklist_init+0x0/0x130 @ 1
[    0.201958] Key type blacklist registered
[    0.201971] initcall blacklist_init+0x0/0x130 returned 0 after 15 usecs
[    0.201978] calling  kswapd_init+0x0/0x90 @ 1
[    0.202038] initcall kswapd_init+0x0/0x90 returned 0 after 55 usecs
[    0.202044] calling  extfrag_debug_init+0x0/0x88 @ 1
[    0.202058] initcall extfrag_debug_init+0x0/0x88 returned 0 after 8 usecs
[    0.202064] calling  mm_compute_batch_init+0x0/0x48 @ 1
[    0.202073] initcall mm_compute_batch_init+0x0/0x48 returned 0 after 2 usecs
[    0.202079] calling  slab_proc_init+0x0/0x50 @ 1
[    0.202088] initcall slab_proc_init+0x0/0x50 returned 0 after 2 usecs
[    0.202095] calling  workingset_init+0x0/0xf0 @ 1
[    0.202102] workingset: timestamp_bits=37 max_order=23 bucket_order=0
[    0.202116] initcall workingset_init+0x0/0xf0 returned 0 after 15 usecs
[    0.202123] calling  proc_vmalloc_init+0x0/0x60 @ 1
[    0.202139] initcall proc_vmalloc_init+0x0/0x60 returned 0 after 9 usecs
[    0.202144] calling  memblock_init_debugfs+0x0/0x98 @ 1
[    0.202158] initcall memblock_init_debugfs+0x0/0x98 returned 0 after 6 usecs
[    0.202166] calling  slab_debugfs_init+0x0/0x88 @ 1
[    0.202201] initcall slab_debugfs_init+0x0/0x88 returned 0 after 28 usecs
[    0.202208] calling  procswaps_init+0x0/0x50 @ 1
[    0.202218] initcall procswaps_init+0x0/0x50 returned 0 after 2 usecs
[    0.202226] calling  init_zbud+0x0/0x48 @ 1
[    0.202231] zbud: loaded
[    0.202237] initcall init_zbud+0x0/0x48 returned 0 after 6 usecs
[    0.202241] calling  zs_init+0x0/0x78 @ 1
[    0.202254] initcall zs_init+0x0/0x78 returned 0 after 8 usecs
[    0.202258] calling  damon_reclaim_init+0x0/0x78 @ 1
[    0.202272] initcall damon_reclaim_init+0x0/0x78 returned 0 after 7 usecs
[    0.202277] calling  ptdump_debugfs_init+0x0/0x50 @ 1
[    0.202288] initcall ptdump_debugfs_init+0x0/0x50 returned 0 after 3 usecs
[    0.202294] calling  fcntl_init+0x0/0x98 @ 1
[    0.202314] initcall fcntl_init+0x0/0x98 returned 0 after 15 usecs
[    0.202319] calling  proc_filesystems_init+0x0/0x50 @ 1
[    0.202327] initcall proc_filesystems_init+0x0/0x50 returned 0 after 1 usecs
[    0.202332] calling  start_dirtytime_writeback+0x0/0x40 @ 1
[    0.202340] initcall start_dirtytime_writeback+0x0/0x40 returned 0 after 2 usecs
[    0.202345] calling  dio_init+0x0/0x98 @ 1
[    0.202356] initcall dio_init+0x0/0x98 returned 0 after 5 usecs
[    0.202362] calling  dnotify_init+0x0/0x120 @ 1
[    0.202390] initcall dnotify_init+0x0/0x120 returned 0 after 22 usecs
[    0.202396] calling  fanotify_user_setup+0x0/0x1d8 @ 1
[    0.202430] initcall fanotify_user_setup+0x0/0x1d8 returned 0 after 28 usecs
[    0.202436] calling  userfaultfd_init+0x0/0xd8 @ 1
[    0.202531] initcall userfaultfd_init+0x0/0xd8 returned 0 after 88 usecs
[    0.202537] calling  aio_setup+0x0/0x128 @ 1
[    0.202597] initcall aio_setup+0x0/0x128 returned 0 after 53 usecs
[    0.202603] calling  mbcache_init+0x0/0xa0 @ 1
[    0.202617] initcall mbcache_init+0x0/0xa0 returned 0 after 8 usecs
[    0.202623] calling  init_v2_quota_format+0x0/0x50 @ 1
[    0.202631] initcall init_v2_quota_format+0x0/0x50 returned 0 after 0 usecs
[    0.202637] calling  init_devpts_fs+0x0/0x60 @ 1
[    0.202653] initcall init_devpts_fs+0x0/0x60 returned 0 after 8 usecs
[    0.202659] calling  ext4_init_fs+0x0/0x220 @ 1
[    0.202895] initcall ext4_init_fs+0x0/0x220 returned 0 after 228 usecs
[    0.202903] calling  journal_init+0x0/0x1b0 @ 1
[    0.202977] initcall journal_init+0x0/0x1b0 returned 0 after 66 usecs
[    0.202985] calling  init_nls_cp437+0x0/0x40 @ 1
[    0.202993] initcall init_nls_cp437+0x0/0x40 returned 0 after 1 usecs
[    0.203002] calling  init_nls_ascii+0x0/0x40 @ 1
[    0.203009] initcall init_nls_ascii+0x0/0x40 returned 0 after 0 usecs
[    0.203016] calling  init_autofs_fs+0x0/0x50 @ 1
[    0.203064] initcall init_autofs_fs+0x0/0x50 returned 0 after 40 usecs
[    0.203072] calling  efivarfs_init+0x0/0x38 @ 1
[    0.203081] initcall efivarfs_init+0x0/0x38 returned 0 after 1 usecs
[    0.203088] calling  ipc_init+0x0/0x48 @ 1
[    0.203114] initcall ipc_init+0x0/0x48 returned 0 after 17 usecs
[    0.203121] calling  ipc_sysctl_init+0x0/0x58 @ 1
[    0.203152] initcall ipc_sysctl_init+0x0/0x58 returned 0 after 23 usecs
[    0.203162] calling  init_mqueue_fs+0x0/0x130 @ 1
[    0.203203] initcall init_mqueue_fs+0x0/0x130 returned 0 after 34 usecs
[    0.203211] calling  key_proc_init+0x0/0xa0 @ 1
[    0.203221] initcall key_proc_init+0x0/0xa0 returned 0 after 2 usecs
[    0.203229] calling  selinux_nf_ip_init+0x0/0x88 @ 1
[    0.203322] initcall selinux_nf_ip_init+0x0/0x88 returned 0 after 87 usecs
[    0.203326] calling  init_sel_fs+0x0/0x148 @ 1
[    0.203439] initcall init_sel_fs+0x0/0x148 returned 0 after 108 usecs
[    0.203444] calling  selnl_init+0x0/0xa0 @ 1
[    0.203485] initcall selnl_init+0x0/0xa0 returned 0 after 36 usecs
[    0.203490] calling  sel_netif_init+0x0/0x98 @ 1
[    0.203499] initcall sel_netif_init+0x0/0x98 returned 0 after 4 usecs
[    0.203504] calling  sel_netnode_init+0x0/0xb0 @ 1
[    0.203510] initcall sel_netnode_init+0x0/0xb0 returned 0 after 1 usecs
[    0.203515] calling  sel_netport_init+0x0/0xb0 @ 1
[    0.203521] initcall sel_netport_init+0x0/0xb0 returned 0 after 1 usecs
[    0.203525] calling  aurule_init+0x0/0x50 @ 1
[    0.203533] initcall aurule_init+0x0/0x50 returned 0 after 4 usecs
[    0.203538] calling  platform_keyring_init+0x0/0x50 @ 1
[    0.203548] integrity: Platform Keyring initialized
[    0.203555] initcall platform_keyring_init+0x0/0x50 returned 0 after 12 usecs
[    0.203561] calling  machine_keyring_init+0x0/0x50 @ 1
[    0.203575] integrity: Machine keyring initialized
[    0.203579] initcall machine_keyring_init+0x0/0x50 returned 0 after 13 usecs
[    0.203584] calling  bpf_crypto_skcipher_init+0x0/0x38 @ 1
[    0.203592] initcall bpf_crypto_skcipher_init+0x0/0x38 returned 0 after 1 usecs
[    0.203598] calling  crc64_rocksoft_init+0x0/0x38 @ 1
[    0.203631] initcall crc64_rocksoft_init+0x0/0x38 returned 0 after 26 usecs
[    0.203638] calling  jent_mod_init+0x0/0x110 @ 1
[    0.227956] initcall jent_mod_init+0x0/0x110 returned 0 after 24311 usecs
[    0.227964] calling  af_alg_init+0x0/0x78 @ 1
[    0.227972] NET: Registered PF_ALG protocol family
[    0.227978] initcall af_alg_init+0x0/0x78 returned 0 after 7 usecs
[    0.227984] calling  algif_hash_init+0x0/0x38 @ 1
[    0.227992] initcall algif_hash_init+0x0/0x38 returned 0 after 1 usecs
[    0.227998] calling  algif_skcipher_init+0x0/0x38 @ 1
[    0.228006] initcall algif_skcipher_init+0x0/0x38 returned 0 after 0 usecs
[    0.228011] calling  rng_init+0x0/0x38 @ 1
[    0.228018] initcall rng_init+0x0/0x38 returned 0 after 0 usecs
[    0.228024] calling  algif_aead_init+0x0/0x38 @ 1
[    0.228034] initcall algif_aead_init+0x0/0x38 returned 0 after 4 usecs
[    0.228041] calling  calibrate_xor_blocks+0x0/0x100 @ 1
[    0.228049] xor: measuring software checksum speed
[    0.228492]    8regs           :  7493 MB/sec
[    0.228936]    32regs          :  7505 MB/sec
[    0.229204]    arm64_neon      : 12464 MB/sec
[    0.229209] xor: using function: arm64_neon (12464 MB/sec)
[    0.229217] initcall calibrate_xor_blocks+0x0/0x100 returned 0 after 1169 usecs
[    0.229224] calling  asymmetric_key_init+0x0/0x38 @ 1
[    0.229232] Key type asymmetric registered
[    0.229236] initcall asymmetric_key_init+0x0/0x38 returned 0 after 6 usecs
[    0.229242] calling  x509_key_init+0x0/0x38 @ 1
[    0.229249] Asymmetric key parser 'x509' registered
[    0.229254] initcall x509_key_init+0x0/0x38 returned 0 after 6 usecs
[    0.229261] calling  crypto_kdf108_init+0x0/0x80 @ 1
[    0.338214] Freeing initrd memory: 31136K
[    0.344821] initcall crypto_kdf108_init+0x0/0x80 returned 0 after 115552 usecs
[    0.344829] calling  blkdev_init+0x0/0x40 @ 1
[    0.344862] initcall blkdev_init+0x0/0x40 returned 0 after 26 usecs
[    0.344868] calling  proc_genhd_init+0x0/0x80 @ 1
[    0.344879] initcall proc_genhd_init+0x0/0x80 returned 0 after 5 usecs
[    0.344886] calling  bsg_init+0x0/0xd0 @ 1
[    0.344910] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
[    0.344916] initcall bsg_init+0x0/0xd0 returned 0 after 24 usecs
[    0.344923] calling  throtl_init+0x0/0x60 @ 1
[    0.345002] initcall throtl_init+0x0/0x60 returned 0 after 71 usecs
[    0.345010] calling  ioprio_init+0x0/0x38 @ 1
[    0.345028] initcall ioprio_init+0x0/0x38 returned 0 after 11 usecs
[    0.345036] calling  iolatency_init+0x0/0x38 @ 1
[    0.345043] initcall iolatency_init+0x0/0x38 returned 0 after 1 usecs
[    0.345050] calling  ioc_init+0x0/0x38 @ 1
[    0.345060] initcall ioc_init+0x0/0x38 returned 0 after 5 usecs
[    0.345067] calling  deadline_init+0x0/0x38 @ 1
[    0.345075] io scheduler mq-deadline registered
[    0.345081] initcall deadline_init+0x0/0x38 returned 0 after 7 usecs
[    0.345087] calling  kyber_init+0x0/0x38 @ 1
[    0.345095] io scheduler kyber registered
[    0.345099] initcall kyber_init+0x0/0x38 returned 0 after 5 usecs
[    0.345106] calling  bfq_init+0x0/0x108 @ 1
[    0.345125] io scheduler bfq registered
[    0.345130] initcall bfq_init+0x0/0x108 returned 0 after 17 usecs
[    0.345136] calling  io_uring_init+0x0/0x118 @ 1
[    0.345187] initcall io_uring_init+0x0/0x118 returned 0 after 44 usecs
[    0.345195] calling  xor_neon_init+0x0/0x58 @ 1
[    0.345202] initcall xor_neon_init+0x0/0x58 returned 0 after 0 usecs
[    0.345210] calling  test_kstrtox_init+0x0/0xbd0 @ 1
[    0.345278] initcall test_kstrtox_init+0x0/0xbd0 returned -22 after 61 usecs
[    0.345287] calling  libaescfb_init+0x0/0x378 @ 1
[    0.345317] initcall libaescfb_init+0x0/0x378 returned 0 after 23 usecs
[    0.345325] calling  blake2s_mod_init+0x0/0x48 @ 1
[    0.346444] initcall blake2s_mod_init+0x0/0x48 returned 0 after 1112 usecs
[    0.346452] calling  chacha20poly1305_init+0x0/0x48 @ 1
[    0.346925] initcall chacha20poly1305_init+0x0/0x48 returned 0 after 465 usecs
[    0.346934] calling  btree_module_init+0x0/0x88 @ 1
[    0.346948] initcall btree_module_init+0x0/0x88 returned 0 after 6 usecs
[    0.346955] calling  crc_t10dif_mod_init+0x0/0x68 @ 1
[    0.347470] initcall crc_t10dif_mod_init+0x0/0x68 returned 0 after 507 usecs
[    0.347481] calling  libcrc32c_mod_init+0x0/0x40 @ 1
[    0.347772] initcall libcrc32c_mod_init+0x0/0x40 returned 0 after 283 usecs
[    0.347781] calling  crc64_rocksoft_mod_init+0x0/0x70 @ 1
[    0.348546] initcall crc64_rocksoft_mod_init+0x0/0x70 returned 0 after 758 usecs
[    0.348554] calling  sw842_init+0x0/0x188 @ 1
[    0.348563] initcall sw842_init+0x0/0x188 returned 0 after 0 usecs
[    0.348570] calling  sw842_init+0x0/0x180 @ 1
[    0.348577] initcall sw842_init+0x0/0x180 returned 0 after 0 usecs
[    0.348583] calling  percpu_counter_startup+0x0/0x78 @ 1
[    0.348719] initcall percpu_counter_startup+0x0/0x78 returned 0 after 128 usecs
[    0.348728] calling  audit_classes_init+0x0/0xb8 @ 1
[    0.348741] initcall audit_classes_init+0x0/0xb8 returned 0 after 6 usecs
[    0.348747] calling  test_atomics_init+0x0/0xb8 @ 1
[    0.348765] atomic64_test: passed
[    0.348770] initcall test_atomics_init+0x0/0xb8 returned 0 after 15 usecs
[    0.348777] calling  digsig_init+0x0/0x60 @ 1
[    0.348937] initcall digsig_init+0x0/0x60 returned 0 after 153 usecs
[    0.348944] calling  gic_driver_init+0x0/0x38 @ 1
[    0.349044] initcall gic_driver_init+0x0/0x38 returned 0 after 96 usecs
[    0.349049] calling  mbigen_platform_driver_init+0x0/0x38 @ 1
[    0.349095] initcall mbigen_platform_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.349099] calling  rzg2l_irqc_driver_init+0x0/0x38 @ 1
[    0.349148] initcall rzg2l_irqc_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.349153] calling  rzv2h_icu_driver_init+0x0/0x38 @ 1
[    0.349193] initcall rzv2h_icu_driver_init+0x0/0x38 returned 0 after 34 usecs
[    0.349199] calling  brcmstb_l2_driver_init+0x0/0x38 @ 1
[    0.349264] initcall brcmstb_l2_driver_init+0x0/0x38 returned 0 after 59 usecs
[    0.349270] calling  mvebu_gicp_driver_init+0x0/0x38 @ 1
[    0.349311] initcall mvebu_gicp_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.349317] calling  mvebu_icu_subset_driver_init+0x0/0x38 @ 1
[    0.349367] initcall mvebu_icu_subset_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.349373] calling  mvebu_icu_driver_init+0x0/0x40 @ 1
[    0.349416] initcall mvebu_icu_driver_init+0x0/0x40 returned 0 after 38 usecs
[    0.349422] calling  mvebu_pic_driver_init+0x0/0x38 @ 1
[    0.349469] initcall mvebu_pic_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.349474] calling  mvebu_sei_driver_init+0x0/0x38 @ 1
[    0.349517] initcall mvebu_sei_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.349522] calling  ls_scfg_msi_driver_init+0x0/0x40 @ 1
[    0.349606] initcall ls_scfg_msi_driver_init+0x0/0x40 returned 0 after 78 usecs
[    0.349611] calling  qcom_irq_combiner_probe_init+0x0/0x38 @ 1
[    0.349637] initcall qcom_irq_combiner_probe_init+0x0/0x38 returned 0 after 20 usecs
[    0.349643] calling  exiu_driver_init+0x0/0x40 @ 1
[    0.349669] initcall exiu_driver_init+0x0/0x40 returned 0 after 20 usecs
[    0.349675] calling  meson_gpio_intc_driver_init+0x0/0x38 @ 1
[    0.349716] initcall meson_gpio_intc_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.349722] calling  qcom_pdc_driver_init+0x0/0x38 @ 1
[    0.350331] probe of b220000.interrupt-controller returned 0 after 572 usecs
[    0.350350] initcall qcom_pdc_driver_init+0x0/0x38 returned 0 after 623 usecs
[    0.350357] calling  imx_irqsteer_driver_init+0x0/0x38 @ 1
[    0.350402] initcall imx_irqsteer_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.350407] calling  imx_intmux_driver_init+0x0/0x38 @ 1
[    0.350450] initcall imx_intmux_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.350455] calling  ti_sci_intr_irq_domain_driver_init+0x0/0x38 @ 1
[    0.350504] initcall ti_sci_intr_irq_domain_driver_init+0x0/0x38 returned 0 after 43 usecs
[    0.350510] calling  ti_sci_inta_irq_domain_driver_init+0x0/0x38 @ 1
[    0.350551] initcall ti_sci_inta_irq_domain_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.350557] calling  hisi_lpc_driver_init+0x0/0x38 @ 1
[    0.350609] initcall hisi_lpc_driver_init+0x0/0x38 returned 0 after 46 usecs
[    0.350616] calling  qcom_ssc_block_bus_driver_init+0x0/0x38 @ 1
[    0.350662] initcall qcom_ssc_block_bus_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.350668] calling  sun50i_de2_bus_driver_init+0x0/0x38 @ 1
[    0.350711] initcall sun50i_de2_bus_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.350716] calling  simple_pm_bus_driver_init+0x0/0x38 @ 1
[    0.351251] probe of soc@0 returned 0 after 508 usecs
[    0.351310] initcall simple_pm_bus_driver_init+0x0/0x38 returned 0 after 588 usecs
[    0.351319] calling  sysc_init+0x0/0x58 @ 1
[    0.351456] initcall sysc_init+0x0/0x58 returned 0 after 131 usecs
[    0.351461] calling  vexpress_syscfg_driver_init+0x0/0x38 @ 1
[    0.351499] initcall vexpress_syscfg_driver_init+0x0/0x38 returned 0 after 21 usecs
[    0.351505] calling  phy_core_init+0x0/0x70 @ 1
[    0.351525] initcall phy_core_init+0x0/0x70 returned 0 after 14 usecs
[    0.351531] calling  xgene_phy_driver_init+0x0/0x38 @ 1
[    0.351575] initcall xgene_phy_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.351580] calling  phy_meson_g12a_usb2_driver_init+0x0/0x38 @ 1
[    0.351634] initcall phy_meson_g12a_usb2_driver_init+0x0/0x38 returned 0 after 47 usecs
[    0.351640] calling  phy_g12a_mipi_dphy_analog_driver_init+0x0/0x38 @ 1
[    0.351683] initcall phy_g12a_mipi_dphy_analog_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.351689] calling  phy_axg_mipi_pcie_analog_driver_init+0x0/0x38 @ 1
[    0.351730] initcall phy_axg_mipi_pcie_analog_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.351737] calling  imx8_pcie_phy_driver_init+0x0/0x38 @ 1
[    0.351787] initcall imx8_pcie_phy_driver_init+0x0/0x38 returned 0 after 43 usecs
[    0.351794] calling  rockchip_pcie_driver_init+0x0/0x38 @ 1
[    0.351834] initcall rockchip_pcie_driver_init+0x0/0x38 returned 0 after 34 usecs
[    0.351840] calling  tegra_p2u_driver_init+0x0/0x38 @ 1
[    0.351888] initcall tegra_p2u_driver_init+0x0/0x38 returned 0 after 42 usecs
[    0.351894] calling  amd_gpio_driver_init+0x0/0x40 @ 1
[    0.351921] initcall amd_gpio_driver_init+0x0/0x40 returned 0 after 21 usecs
[    0.351928] calling  as3722_pinctrl_driver_init+0x0/0x38 @ 1
[    0.351974] initcall as3722_pinctrl_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.351980] calling  max77620_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352009] initcall max77620_pinctrl_driver_init+0x0/0x38 returned 0 after 22 usecs
[    0.352015] calling  scmi_pinctrl_driver_init+0x0/0x40 @ 1
[    0.352046] initcall scmi_pinctrl_driver_init+0x0/0x40 returned 0 after 24 usecs
[    0.352051] calling  pcs_driver_init+0x0/0x38 @ 1
[    0.352154] initcall pcs_driver_init+0x0/0x38 returned 0 after 97 usecs
[    0.352161] calling  zynqmp_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352211] initcall zynqmp_pinctrl_driver_init+0x0/0x38 returned 0 after 43 usecs
[    0.352216] calling  bcm2835_pinctrl_driver_init+0x0/0x40 @ 1
[    0.352272] initcall bcm2835_pinctrl_driver_init+0x0/0x40 returned 0 after 49 usecs
[    0.352278] calling  scmi_pinctrl_imx_driver_init+0x0/0x40 @ 1
[    0.352293] initcall scmi_pinctrl_imx_driver_init+0x0/0x40 returned 0 after 9 usecs
[    0.352299] calling  meson_gxbb_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352352] initcall meson_gxbb_pinctrl_driver_init+0x0/0x38 returned 0 after 46 usecs
[    0.352360] calling  meson_gxl_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352413] initcall meson_gxl_pinctrl_driver_init+0x0/0x38 returned 0 after 46 usecs
[    0.352419] calling  meson_axg_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352486] initcall meson_axg_pinctrl_driver_init+0x0/0x38 returned 0 after 62 usecs
[    0.352493] calling  meson_g12a_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352563] initcall meson_g12a_pinctrl_driver_init+0x0/0x38 returned 0 after 63 usecs
[    0.352571] calling  meson_a1_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352645] initcall meson_a1_pinctrl_driver_init+0x0/0x38 returned 0 after 67 usecs
[    0.352652] calling  meson_s4_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352708] initcall meson_s4_pinctrl_driver_init+0x0/0x38 returned 0 after 50 usecs
[    0.352716] calling  c3_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352773] initcall c3_pinctrl_driver_init+0x0/0x38 returned 0 after 50 usecs
[    0.352780] calling  t7_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352837] initcall t7_pinctrl_driver_init+0x0/0x38 returned 0 after 50 usecs
[    0.352845] calling  armada_ap806_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352897] initcall armada_ap806_pinctrl_driver_init+0x0/0x38 returned 0 after 45 usecs
[    0.352905] calling  armada_cp110_pinctrl_driver_init+0x0/0x38 @ 1
[    0.352975] initcall armada_cp110_pinctrl_driver_init+0x0/0x38 returned 0 after 64 usecs
[    0.352982] calling  armada_37xx_pinctrl_driver_init+0x0/0x40 @ 1
[    0.353054] initcall armada_37xx_pinctrl_driver_init+0x0/0x40 returned -19 after 65 usecs
[    0.353062] calling  ac5_pinctrl_driver_init+0x0/0x38 @ 1
[    0.353104] initcall ac5_pinctrl_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.353112] calling  s32g_pinctrl_driver_init+0x0/0x38 @ 1
[    0.353155] initcall s32g_pinctrl_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.353161] calling  pmic_gpio_driver_init+0x0/0x40 @ 1
[    0.353708] initcall pmic_gpio_driver_init+0x0/0x40 returned 0 after 540 usecs
[    0.353716] calling  pmic_mpp_driver_init+0x0/0x40 @ 1
[    0.353857] initcall pmic_mpp_driver_init+0x0/0x40 returned 0 after 134 usecs
[    0.353864] calling  a64_pinctrl_driver_init+0x0/0x38 @ 1
[    0.353908] initcall a64_pinctrl_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.353915] calling  sun50i_a64_r_pinctrl_driver_init+0x0/0x38 @ 1
[    0.353958] initcall sun50i_a64_r_pinctrl_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.353966] calling  a100_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354011] initcall a100_pinctrl_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.354018] calling  a100_r_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354063] initcall a100_r_pinctrl_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.354069] calling  sun8i_h3_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354112] initcall sun8i_h3_pinctrl_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.354119] calling  sun8i_h3_r_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354160] initcall sun8i_h3_r_pinctrl_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.354166] calling  d1_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354208] initcall d1_pinctrl_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.354215] calling  sun50i_h5_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354260] initcall sun50i_h5_pinctrl_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.354268] calling  h6_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354311] initcall h6_pinctrl_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.354319] calling  sun50i_h6_r_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354362] initcall sun50i_h6_r_pinctrl_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.354369] calling  h616_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354414] initcall h616_pinctrl_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.354421] calling  sun50i_h616_r_pinctrl_driver_init+0x0/0x38 @ 1
[    0.354470] initcall sun50i_h616_r_pinctrl_driver_init+0x0/0x38 returned 0 after 42 usecs
[    0.354478] calling  bgpio_driver_init+0x0/0x38 @ 1
[    0.354538] initcall bgpio_driver_init+0x0/0x38 returned 0 after 53 usecs
[    0.354545] calling  max77620_gpio_driver_init+0x0/0x38 @ 1
[    0.354573] initcall max77620_gpio_driver_init+0x0/0x38 returned 0 after 21 usecs
[    0.354580] calling  mvebu_gpio_driver_init+0x0/0x38 @ 1
[    0.354652] initcall mvebu_gpio_driver_init+0x0/0x38 returned 0 after 65 usecs
[    0.354658] calling  pl061_gpio_driver_init+0x0/0x38 @ 1
[    0.354675] initcall pl061_gpio_driver_init+0x0/0x38 returned 0 after 9 usecs
[    0.354681] calling  tegra186_gpio_driver_init+0x0/0x38 @ 1
[    0.354761] initcall tegra186_gpio_driver_init+0x0/0x38 returned 0 after 73 usecs
[    0.354769] calling  tegra_gpio_driver_init+0x0/0x38 @ 1
[    0.354827] initcall tegra_gpio_driver_init+0x0/0x38 returned 0 after 51 usecs
[    0.354834] calling  vf610_gpio_driver_init+0x0/0x38 @ 1
[    0.354890] initcall vf610_gpio_driver_init+0x0/0x38 returned 0 after 49 usecs
[    0.354897] calling  xgene_gpio_driver_init+0x0/0x38 @ 1
[    0.354942] initcall xgene_gpio_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.354949] calling  modepin_platform_driver_init+0x0/0x38 @ 1
[    0.354994] initcall modepin_platform_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.355002] calling  stmpe_pwm_driver_init+0x0/0x40 @ 1
[    0.355042] initcall stmpe_pwm_driver_init+0x0/0x40 returned -19 after 32 usecs
[    0.355049] calling  tegra_pwm_driver_init+0x0/0x38 @ 1
[    0.355106] initcall tegra_pwm_driver_init+0x0/0x38 returned 0 after 51 usecs
[    0.355114] calling  syscon_led_driver_init+0x0/0x38 @ 1
[    0.355159] initcall syscon_led_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.355165] calling  ledtrig_disk_init+0x0/0x70 @ 1
[    0.355180] initcall ledtrig_disk_init+0x0/0x70 returned 0 after 7 usecs
[    0.355187] calling  ledtrig_mtd_init+0x0/0x60 @ 1
[    0.355199] initcall ledtrig_mtd_init+0x0/0x60 returned 0 after 5 usecs
[    0.355205] calling  ledtrig_cpu_init+0x0/0x150 @ 1
[    0.355371] ledtrig-cpu: registered to indicate activity on CPUs
[    0.355377] initcall ledtrig_cpu_init+0x0/0x150 returned 0 after 165 usecs
[    0.355386] calling  ledtrig_panic_init+0x0/0x80 @ 1
[    0.355395] initcall ledtrig_panic_init+0x0/0x80 returned 0 after 2 usecs
[    0.355402] calling  pcie_portdrv_init+0x0/0x78 @ 1
[    0.355461] initcall pcie_portdrv_init+0x0/0x78 returned 0 after 52 usecs
[    0.355504] calling  pci_proc_init+0x0/0xa8 @ 1
[    0.355528] initcall pci_proc_init+0x0/0xa8 returned 0 after 16 usecs
[    0.355537] calling  pci_hotplug_init+0x0/0x18 @ 1
[    0.355545] initcall pci_hotplug_init+0x0/0x18 returned 0 after 0 usecs
[    0.355552] calling  octep_hp_init+0x0/0x40 @ 1
[    0.355569] initcall octep_hp_init+0x0/0x40 returned 0 after 8 usecs
[    0.355576] calling  pci_stub_init+0x0/0x180 @ 1
[    0.355592] initcall pci_stub_init+0x0/0x180 returned 0 after 9 usecs
[    0.355601] calling  cdns_plat_pcie_driver_init+0x0/0x38 @ 1
[    0.355657] initcall cdns_plat_pcie_driver_init+0x0/0x38 returned 0 after 48 usecs
[    0.355666] calling  j721e_pcie_driver_init+0x0/0x38 @ 1
[    0.355767] initcall j721e_pcie_driver_init+0x0/0x38 returned 0 after 92 usecs
[    0.355774] calling  advk_pcie_driver_init+0x0/0x38 @ 1
[    0.355820] initcall advk_pcie_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.355828] calling  tegra_pcie_driver_init+0x0/0x38 @ 1
[    0.355900] initcall tegra_pcie_driver_init+0x0/0x38 returned 0 after 65 usecs
[    0.355908] calling  gen_pci_driver_init+0x0/0x38 @ 1
[    0.355980] initcall gen_pci_driver_init+0x0/0x38 returned 0 after 65 usecs
[    0.355988] calling  thunder_ecam_driver_init+0x0/0x38 @ 1
[    0.356030] initcall thunder_ecam_driver_init+0x0/0x38 returned 0 after 33 usecs
[    0.356037] calling  thunder_pem_driver_init+0x0/0x38 @ 1
[    0.356079] initcall thunder_pem_driver_init+0x0/0x38 returned 0 after 34 usecs
[    0.356087] calling  xilinx_pcie_driver_init+0x0/0x38 @ 1
[    0.356130] initcall xilinx_pcie_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.356137] calling  nwl_pcie_driver_init+0x0/0x38 @ 1
[    0.356180] initcall nwl_pcie_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.356189] calling  xilinx_cpm_pcie_driver_init+0x0/0x38 @ 1
[    0.356239] initcall xilinx_cpm_pcie_driver_init+0x0/0x38 returned 0 after 42 usecs
[    0.356248] calling  xilinx_pl_dma_pcie_driver_init+0x0/0x38 @ 1
[    0.356298] initcall xilinx_pl_dma_pcie_driver_init+0x0/0x38 returned 0 after 42 usecs
[    0.356306] calling  xgene_pcie_driver_init+0x0/0x40 @ 1
[    0.356349] initcall xgene_pcie_driver_init+0x0/0x40 returned 0 after 36 usecs
[    0.356357] calling  rockchip_pcie_driver_init+0x0/0x38 @ 1
[    0.356402] initcall rockchip_pcie_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.356410] calling  brcm_pcie_driver_init+0x0/0x38 @ 1
[    0.356518] initcall brcm_pcie_driver_init+0x0/0x38 returned 0 after 100 usecs
[    0.356526] calling  apple_pcie_driver_init+0x0/0x38 @ 1
[    0.356568] initcall apple_pcie_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.356576] calling  dw_plat_pcie_driver_init+0x0/0x38 @ 1
[    0.356626] initcall dw_plat_pcie_driver_init+0x0/0x38 returned 0 after 43 usecs
[    0.356635] calling  imx_pcie_init+0x0/0x38 @ 1
[    0.356758] initcall imx_pcie_init+0x0/0x38 returned 0 after 116 usecs
[    0.356766] calling  ks_pcie_driver_init+0x0/0x38 @ 1
[    0.356829] initcall ks_pcie_driver_init+0x0/0x38 returned 0 after 54 usecs
[    0.356837] calling  ls_pcie_driver_init+0x0/0x38 @ 1
[    0.356942] initcall ls_pcie_driver_init+0x0/0x38 returned 0 after 97 usecs
[    0.356951] calling  qcom_pcie_driver_init+0x0/0x38 @ 1
[    0.357104] probe of 1c00000.pcie returned -517 after 57 usecs
[    0.357163] probe of 1c10000.pcie returned -517 after 105 usecs
[    0.357220] probe of 1c20000.pcie returned -517 after 155 usecs
[    0.357251] initcall qcom_pcie_driver_init+0x0/0x38 returned 0 after 291 usecs
[    0.357261] calling  armada8k_pcie_driver_init+0x0/0x38 @ 1
[    0.357307] initcall armada8k_pcie_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.357316] calling  rockchip_pcie_driver_init+0x0/0x38 @ 1
[    0.357375] initcall rockchip_pcie_driver_init+0x0/0x38 returned 0 after 52 usecs
[    0.357384] calling  kirin_pcie_driver_init+0x0/0x40 @ 1
[    0.357434] initcall kirin_pcie_driver_init+0x0/0x40 returned 0 after 42 usecs
[    0.357442] calling  histb_pcie_platform_driver_init+0x0/0x38 @ 1
[    0.357494] initcall histb_pcie_platform_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.357502] calling  meson_pcie_driver_init+0x0/0x38 @ 1
[    0.357553] initcall meson_pcie_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.357563] calling  tegra_pcie_dw_driver_init+0x0/0x38 @ 1
[    0.357634] initcall tegra_pcie_dw_driver_init+0x0/0x38 returned 0 after 63 usecs
[    0.357643] calling  hisi_pcie_almost_ecam_driver_init+0x0/0x38 @ 1
[    0.357696] initcall hisi_pcie_almost_ecam_driver_init+0x0/0x38 returned 0 after 43 usecs
[    0.357705] calling  mobiveil_pcie_driver_init+0x0/0x38 @ 1
[    0.357749] initcall mobiveil_pcie_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.357758] calling  ls_g4_pcie_driver_init+0x0/0x40 @ 1
[    0.357817] initcall ls_g4_pcie_driver_init+0x0/0x40 returned -19 after 51 usecs
[    0.357826] calling  mc_pcie_driver_init+0x0/0x38 @ 1
[    0.357870] initcall mc_pcie_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.357879] calling  efifb_driver_init+0x0/0x38 @ 1
[    0.357906] initcall efifb_driver_init+0x0/0x38 returned 0 after 22 usecs
[    0.357910] calling  ged_driver_init+0x0/0x38 @ 1
[    0.357939] initcall ged_driver_init+0x0/0x38 returned 0 after 23 usecs
[    0.357945] calling  acpi_ac_init+0x0/0x68 @ 1
[    0.357951] initcall acpi_ac_init+0x0/0x68 returned -19 after 1 usecs
[    0.357958] calling  acpi_button_driver_init+0x0/0x90 @ 1
[    0.357966] initcall acpi_button_driver_init+0x0/0x90 returned 0 after 2 usecs
[    0.357972] calling  acpi_fan_driver_init+0x0/0x38 @ 1
[    0.357999] initcall acpi_fan_driver_init+0x0/0x38 returned 0 after 21 usecs
[    0.358005] calling  acpi_processor_driver_init+0x0/0xe8 @ 1
[    0.358012] initcall acpi_processor_driver_init+0x0/0xe8 returned 0 after 0 usecs
[    0.358018] calling  acpi_thermal_init+0x0/0xa8 @ 1
[    0.358097] initcall acpi_thermal_init+0x0/0xa8 returned -19 after 72 usecs
[    0.358104] calling  acpi_battery_init+0x0/0x60 @ 1
[    0.358111] initcall acpi_battery_init+0x0/0x60 returned -19 after 0 usecs
[    0.358118] calling  acpi_hed_driver_init+0x0/0x40 @ 1
[    0.358124] initcall acpi_hed_driver_init+0x0/0x40 returned -19 after 0 usecs
[    0.358131] calling  bgrt_init+0x0/0xe8 @ 1
[    0.358138] initcall bgrt_init+0x0/0xe8 returned -19 after 0 usecs
[    0.358144] calling  erst_init+0x0/0x340 @ 1
[    0.358152] initcall erst_init+0x0/0x340 returned 0 after 1 usecs
[    0.358160] calling  gtdt_sbsa_gwdt_init+0x0/0x128 @ 1
[    0.358167] initcall gtdt_sbsa_gwdt_init+0x0/0x128 returned 0 after 0 usecs
[    0.358174] calling  tegra_ahb_driver_init+0x0/0x40 @ 1
[    0.358229] initcall tegra_ahb_driver_init+0x0/0x40 returned 0 after 47 usecs
[    0.358236] calling  of_fixed_factor_clk_driver_init+0x0/0x40 @ 1
[    0.358281] initcall of_fixed_factor_clk_driver_init+0x0/0x40 returned 0 after 38 usecs
[    0.358288] calling  of_fixed_clk_driver_init+0x0/0x38 @ 1
[    0.358333] initcall of_fixed_clk_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.358340] calling  gpio_clk_driver_init+0x0/0x38 @ 1
[    0.358392] initcall gpio_clk_driver_init+0x0/0x38 returned 0 after 45 usecs
[    0.358400] calling  gated_fixed_clk_driver_init+0x0/0x40 @ 1
[    0.358445] initcall gated_fixed_clk_driver_init+0x0/0x40 returned 0 after 38 usecs
[    0.358454] calling  max77686_clk_driver_init+0x0/0x38 @ 1
[    0.358494] initcall max77686_clk_driver_init+0x0/0x38 returned 0 after 33 usecs
[    0.358503] calling  plldig_clk_driver_init+0x0/0x38 @ 1
[    0.358547] initcall plldig_clk_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.358556] calling  clockgen_cpufreq_init+0x0/0xb8 @ 1
[    0.358565] initcall clockgen_cpufreq_init+0x0/0xb8 returned 0 after 1 usecs
[    0.358573] calling  scmi_clocks_driver_init+0x0/0x40 @ 1
[    0.358592] initcall scmi_clocks_driver_init+0x0/0x40 returned 0 after 14 usecs
[    0.358596] calling  si521xx_driver_init+0x0/0x40 @ 1
[    0.358610] initcall si521xx_driver_init+0x0/0x40 returned 0 after 10 usecs
[    0.358614] calling  bcm2835_clk_driver_init+0x0/0x38 @ 1
[    0.358664] initcall bcm2835_clk_driver_init+0x0/0x38 returned 0 after 45 usecs
[    0.358669] calling  bcm2835_aux_clk_driver_init+0x0/0x38 @ 1
[    0.358712] initcall bcm2835_aux_clk_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.358716] calling  raspberrypi_clk_driver_init+0x0/0x38 @ 1
[    0.358758] initcall raspberrypi_clk_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.358763] calling  imx8mm_clk_driver_init+0x0/0x38 @ 1
[    0.358805] initcall imx8mm_clk_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.358810] calling  imx8mn_clk_driver_init+0x0/0x38 @ 1
[    0.358853] initcall imx8mn_clk_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.358859] calling  imx8mp_clk_driver_init+0x0/0x38 @ 1
[    0.358899] initcall imx8mp_clk_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.358904] calling  clk_imx8mp_audiomix_driver_init+0x0/0x38 @ 1
[    0.358947] initcall clk_imx8mp_audiomix_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.358952] calling  imx8mq_clk_driver_init+0x0/0x38 @ 1
[    0.358993] initcall imx8mq_clk_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.358998] calling  imx93_clk_driver_init+0x0/0x38 @ 1
[    0.359046] initcall imx93_clk_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.359051] calling  imx8qxp_clk_driver_init+0x0/0x38 @ 1
[    0.359116] initcall imx8qxp_clk_driver_init+0x0/0x38 returned 0 after 60 usecs
[    0.359120] calling  imx8qxp_lpcg_clk_driver_init+0x0/0x38 @ 1
[    0.359184] initcall imx8qxp_lpcg_clk_driver_init+0x0/0x38 returned 0 after 59 usecs
[    0.359189] calling  imx8_acm_clk_driver_init+0x0/0x38 @ 1
[    0.359247] initcall imx8_acm_clk_driver_init+0x0/0x38 returned 0 after 53 usecs
[    0.359253] calling  imx8ulp_clk_driver_init+0x0/0x38 @ 1
[    0.359325] initcall imx8ulp_clk_driver_init+0x0/0x38 returned 0 after 67 usecs
[    0.359330] calling  ti_sci_clk_driver_init+0x0/0x38 @ 1
[    0.359375] initcall ti_sci_clk_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.359379] calling  axg_driver_init+0x0/0x38 @ 1
[    0.359421] initcall axg_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.359426] calling  axg_aoclkc_driver_init+0x0/0x38 @ 1
[    0.359475] initcall axg_aoclkc_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.359480] calling  axg_audio_driver_init+0x0/0x38 @ 1
[    0.359539] initcall axg_audio_driver_init+0x0/0x38 returned 0 after 54 usecs
[    0.359544] calling  c3_pll_driver_init+0x0/0x38 @ 1
[    0.359589] initcall c3_pll_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.359594] calling  c3_peripherals_driver_init+0x0/0x38 @ 1
[    0.359637] initcall c3_peripherals_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.359642] calling  gxbb_driver_init+0x0/0x38 @ 1
[    0.359696] initcall gxbb_driver_init+0x0/0x38 returned 0 after 49 usecs
[    0.359701] calling  gxbb_aoclkc_driver_init+0x0/0x38 @ 1
[    0.359745] initcall gxbb_aoclkc_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.359751] calling  g12a_driver_init+0x0/0x38 @ 1
[    0.359809] initcall g12a_driver_init+0x0/0x38 returned 0 after 53 usecs
[    0.359814] calling  g12a_aoclkc_driver_init+0x0/0x38 @ 1
[    0.359858] initcall g12a_aoclkc_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.359863] calling  s4_driver_init+0x0/0x38 @ 1
[    0.359907] initcall s4_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.359911] calling  s4_driver_init+0x0/0x38 @ 1
[    0.359955] initcall s4_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.359960] calling  armada_3700_xtal_clock_driver_init+0x0/0x38 @ 1
[    0.360002] initcall armada_3700_xtal_clock_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.360008] calling  armada_3700_tbg_clock_driver_init+0x0/0x38 @ 1
[    0.360052] initcall armada_3700_tbg_clock_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.360058] calling  armada_3700_periph_clock_driver_init+0x0/0x38 @ 1
[    0.360110] initcall armada_3700_periph_clock_driver_init+0x0/0x38 returned 0 after 46 usecs
[    0.360114] calling  ap806_syscon_legacy_driver_init+0x0/0x38 @ 1
[    0.360156] initcall ap806_syscon_legacy_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.360162] calling  ap806_clock_driver_init+0x0/0x40 @ 1
[    0.360211] initcall ap806_clock_driver_init+0x0/0x40 returned 0 after 43 usecs
[    0.360216] calling  ap_cpu_clock_driver_init+0x0/0x38 @ 1
[    0.360265] initcall ap_cpu_clock_driver_init+0x0/0x38 returned 0 after 43 usecs
[    0.360271] calling  cp110_syscon_legacy_driver_init+0x0/0x38 @ 1
[    0.360314] initcall cp110_syscon_legacy_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.360319] calling  cp110_clock_driver_init+0x0/0x40 @ 1
[    0.360362] initcall cp110_clock_driver_init+0x0/0x40 returned 0 after 38 usecs
[    0.360367] calling  clk_rk3399_driver_init+0x0/0x40 @ 1
[    0.360432] initcall clk_rk3399_driver_init+0x0/0x40 returned -19 after 58 usecs
[    0.360439] calling  clk_rk3568_driver_init+0x0/0x40 @ 1
[    0.360511] initcall clk_rk3568_driver_init+0x0/0x40 returned -19 after 66 usecs
[    0.360518] calling  clk_rk3576_driver_init+0x0/0x40 @ 1
[    0.360573] initcall clk_rk3576_driver_init+0x0/0x40 returned -19 after 50 usecs
[    0.360579] calling  sun50i_a64_ccu_driver_init+0x0/0x38 @ 1
[    0.360621] initcall sun50i_a64_ccu_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.360628] calling  sun50i_a100_ccu_driver_init+0x0/0x38 @ 1
[    0.360670] initcall sun50i_a100_ccu_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.360675] calling  sun50i_a100_r_ccu_driver_init+0x0/0x38 @ 1
[    0.360718] initcall sun50i_a100_r_ccu_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.360724] calling  sun50i_h6_ccu_driver_init+0x0/0x38 @ 1
[    0.360766] initcall sun50i_h6_ccu_driver_init+0x0/0x38 returned 0 after 35 usecs
[    0.360772] calling  sun50i_h6_r_ccu_driver_init+0x0/0x38 @ 1
[    0.360822] initcall sun50i_h6_r_ccu_driver_init+0x0/0x38 returned 0 after 43 usecs
[    0.360828] calling  sun50i_h616_ccu_driver_init+0x0/0x38 @ 1
[    0.360872] initcall sun50i_h616_ccu_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.360878] calling  sun8i_h3_ccu_driver_init+0x0/0x38 @ 1
[    0.360929] initcall sun8i_h3_ccu_driver_init+0x0/0x38 returned 0 after 45 usecs
[    0.360936] calling  sunxi_de2_clk_driver_init+0x0/0x38 @ 1
[    0.361026] initcall sunxi_de2_clk_driver_init+0x0/0x38 returned 0 after 84 usecs
[    0.361033] calling  sun8i_r_ccu_driver_init+0x0/0x50 @ 1
[    0.361091] initcall sun8i_r_ccu_driver_init+0x0/0x50 returned 0 after 51 usecs
[    0.361099] calling  tegra_clock_driver_init+0x0/0x38 @ 1
[    0.361170] initcall tegra_clock_driver_init+0x0/0x38 returned 0 after 65 usecs
[    0.361176] calling  tegra124_dfll_fcpu_driver_init+0x0/0x38 @ 1
[    0.361232] initcall tegra124_dfll_fcpu_driver_init+0x0/0x38 returned 0 after 49 usecs
[    0.361239] calling  vexpress_osc_driver_init+0x0/0x38 @ 1
[    0.361285] initcall vexpress_osc_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.361292] calling  zynqmp_clock_driver_init+0x0/0x38 @ 1
[    0.361344] initcall zynqmp_clock_driver_init+0x0/0x38 returned 0 after 45 usecs
[    0.361351] calling  mv_xor_driver_init+0x0/0x38 @ 1
[    0.361412] initcall mv_xor_driver_init+0x0/0x38 returned 0 after 53 usecs
[    0.361420] calling  mv_xor_v2_driver_init+0x0/0x38 @ 1
[    0.361472] initcall mv_xor_v2_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.361480] calling  tegra_dmac_driver_init+0x0/0x38 @ 1
[    0.361547] initcall tegra_dmac_driver_init+0x0/0x38 returned 0 after 60 usecs
[    0.361554] calling  bam_dma_driver_init+0x0/0x38 @ 1
[    0.361622] initcall bam_dma_driver_init+0x0/0x38 returned 0 after 61 usecs
[    0.361631] calling  fsl_bman_driver_init+0x0/0x38 @ 1
[    0.361677] initcall fsl_bman_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.361684] calling  fsl_qman_driver_init+0x0/0x38 @ 1
[    0.361727] initcall fsl_qman_driver_init+0x0/0x38 returned 0 after 36 usecs
[    0.361734] calling  bman_portal_driver_init+0x0/0xa0 @ 1
[    0.361781] initcall bman_portal_driver_init+0x0/0xa0 returned 0 after 40 usecs
[    0.361788] calling  qman_portal_driver_init+0x0/0xa0 @ 1
[    0.361833] initcall qman_portal_driver_init+0x0/0xa0 returned 0 after 38 usecs
[    0.361839] calling  rcpm_driver_init+0x0/0x38 @ 1
[    0.361885] initcall rcpm_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.361893] calling  a64fx_diag_driver_init+0x0/0x38 @ 1
[    0.361924] initcall a64fx_diag_driver_init+0x0/0x38 returned 0 after 24 usecs
[    0.361932] calling  imx8_soc_init+0x0/0xb8 @ 1
[    0.361941] initcall imx8_soc_init+0x0/0xb8 returned 0 after 2 usecs
[    0.361948] calling  meson_gx_socinfo_init+0x0/0x398 @ 1
[    0.362086] initcall meson_gx_socinfo_init+0x0/0x398 returned -19 after 130 usecs
[    0.362095] calling  geni_se_driver_init+0x0/0x40 @ 1
[    0.362193] probe of 8c0000.geniqup returned -517 after 67 usecs
[    0.362230] probe of 9c0000.geniqup returned -517 after 13 usecs
[    0.362254] probe of ac0000.geniqup returned -517 after 10 usecs
[    0.362305] initcall geni_se_driver_init+0x0/0x40 returned 0 after 203 usecs
[    0.362314] calling  gsbi_driver_init+0x0/0x38 @ 1
[    0.362366] initcall gsbi_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.362374] calling  rzv2m_pwc_driver_init+0x0/0x38 @ 1
[    0.362420] initcall rzv2m_pwc_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.362428] calling  sunxi_sram_driver_init+0x0/0x48 @ 1
[    0.362561] initcall sunxi_sram_driver_init+0x0/0x48 returned -19 after 125 usecs
[    0.362568] calling  tegra_fuse_driver_init+0x0/0x38 @ 1
[    0.362647] initcall tegra_fuse_driver_init+0x0/0x38 returned 0 after 71 usecs
[    0.362654] calling  tegra_init_soc+0x0/0x88 @ 1
[    0.362945] initcall tegra_init_soc+0x0/0x88 returned 0 after 284 usecs
[    0.362953] calling  tegra_flowctrl_driver_init+0x0/0x38 @ 1
[    0.363031] initcall tegra_flowctrl_driver_init+0x0/0x38 returned 0 after 70 usecs
[    0.363039] calling  tegra_pmc_driver_init+0x0/0x40 @ 1
[    0.363143] initcall tegra_pmc_driver_init+0x0/0x40 returned 0 after 96 usecs
[    0.363151] calling  k3_ringacc_driver_init+0x0/0x40 @ 1
[    0.363198] initcall k3_ringacc_driver_init+0x0/0x40 returned 0 after 38 usecs
[    0.363206] calling  zynqmp_pm_platform_driver_init+0x0/0x38 @ 1
[    0.363253] initcall zynqmp_pm_platform_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.363260] calling  xlnx_event_manager_driver_init+0x0/0x38 @ 1
[    0.363292] initcall xlnx_event_manager_driver_init+0x0/0x38 returned 0 after 23 usecs
[    0.363301] calling  meson_ee_pwrc_driver_init+0x0/0x38 @ 1
[    0.363392] initcall meson_ee_pwrc_driver_init+0x0/0x38 returned 0 after 83 usecs
[    0.363401] calling  meson_secure_pwrc_driver_init+0x0/0x38 @ 1
[    0.363491] initcall meson_secure_pwrc_driver_init+0x0/0x38 returned 0 after 82 usecs
[    0.363500] calling  apple_pmgr_ps_driver_init+0x0/0x38 @ 1
[    0.363548] initcall apple_pmgr_ps_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.363556] calling  scmi_perf_domain_driver_init+0x0/0x40 @ 1
[    0.363577] initcall scmi_perf_domain_driver_init+0x0/0x40 returned 0 after 14 usecs
[    0.363586] calling  scmi_power_domain_driver_init+0x0/0x40 @ 1
[    0.363600] initcall scmi_power_domain_driver_init+0x0/0x40 returned 0 after 8 usecs
[    0.363609] calling  bcm2835_power_driver_init+0x0/0x38 @ 1
[    0.363642] initcall bcm2835_power_driver_init+0x0/0x38 returned 0 after 24 usecs
[    0.363649] calling  rpi_power_driver_init+0x0/0x38 @ 1
[    0.363696] initcall rpi_power_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.363704] calling  imx_pgc_domain_driver_init+0x0/0x38 @ 1
[    0.363737] initcall imx_pgc_domain_driver_init+0x0/0x38 returned 0 after 24 usecs
[    0.363745] calling  imx_gpc_driver_init+0x0/0x40 @ 1
[    0.363819] initcall imx_gpc_driver_init+0x0/0x40 returned 0 after 67 usecs
[    0.363828] calling  imx_sc_pd_driver_init+0x0/0x38 @ 1
[    0.363880] initcall imx_sc_pd_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.363888] calling  imx8m_blk_ctrl_driver_init+0x0/0x38 @ 1
[    0.363970] initcall imx8m_blk_ctrl_driver_init+0x0/0x38 returned 0 after 73 usecs
[    0.363978] calling  imx8mp_blk_ctrl_driver_init+0x0/0x38 @ 1
[    0.364034] initcall imx8mp_blk_ctrl_driver_init+0x0/0x38 returned 0 after 47 usecs
[    0.364043] calling  imx93_blk_ctrl_driver_init+0x0/0x38 @ 1
[    0.364090] initcall imx93_blk_ctrl_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.364099] calling  ti_sci_pm_domains_driver_init+0x0/0x38 @ 1
[    0.364146] initcall ti_sci_pm_domains_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.364155] calling  zynqmp_power_domain_driver_init+0x0/0x38 @ 1
[    0.364187] initcall zynqmp_power_domain_driver_init+0x0/0x38 returned 0 after 24 usecs
[    0.364196] calling  virtio_pci_driver_init+0x0/0x40 @ 1
[    0.364215] initcall virtio_pci_driver_init+0x0/0x40 returned 0 after 11 usecs
[    0.364223] calling  scmi_drv_init+0x0/0x40 @ 1
[    0.364241] initcall scmi_drv_init+0x0/0x40 returned 0 after 9 usecs
[    0.364249] calling  fan53555_regulator_driver_init+0x0/0x38 @ 1
[    0.364266] initcall fan53555_regulator_driver_init+0x0/0x38 returned 0 after 9 usecs
[    0.364274] calling  max77620_regulator_driver_init+0x0/0x38 @ 1
[    0.364304] initcall max77620_regulator_driver_init+0x0/0x38 returned 0 after 27 usecs
[    0.364309] calling  rpmh_regulator_driver_init+0x0/0x38 @ 1
[    0.364660] initcall rpmh_regulator_driver_init+0x0/0x38 returned 0 after 347 usecs
[    0.364666] calling  pwm_regulator_driver_init+0x0/0x38 @ 1
[    0.364670] probe of 18200000.rsc:regulators-2 returned -517 after 61 usecs
[    0.364767] initcall pwm_regulator_driver_init+0x0/0x38 returned 0 after 96 usecs
[    0.364772] calling  meson_reset_aux_driver_init+0x0/0x40 @ 1
[    0.364786] initcall meson_reset_aux_driver_init+0x0/0x40 returned 0 after 9 usecs
[    0.364791] calling  imx7_reset_driver_init+0x0/0x38 @ 1
[    0.364832] vreg_s10b: Setting 1800000-1800000uV
[    0.364858] initcall imx7_reset_driver_init+0x0/0x38 returned 0 after 62 usecs
[    0.364864] calling  qcom_aoss_reset_driver_init+0x0/0x38 @ 1
[    0.364869] vreg_s1c: Setting 1880000-1900000uV
[    0.364914] initcall qcom_aoss_reset_driver_init+0x0/0x38 returned 0 after 46 usecs
[    0.364919] calling  rpi_reset_driver_init+0x0/0x38 @ 1
[    0.364968] initcall rpi_reset_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.364972] calling  scmi_reset_driver_init+0x0/0x40 @ 1
[    0.364988] initcall scmi_reset_driver_init+0x0/0x40 returned 0 after 12 usecs
[    0.364993] calling  reset_simple_driver_init+0x0/0x38 @ 1
[    0.365080] vreg_s11b: Setting 1272000-1272000uV
[    0.365147] vreg_l1c: Setting 1800000-1800000uV
[    0.365147] initcall reset_simple_driver_init+0x0/0x38 returned 0 after 149 usecs
[    0.365155] calling  n_null_init+0x0/0x40 @ 1
[    0.365161] initcall n_null_init+0x0/0x40 returned 0 after 1 usecs
[    0.365166] calling  pty_init+0x0/0x30 @ 1
[    0.365199] vreg_s12b: Setting 984000-984000uV
[    0.365287] vreg_l8c: Setting 1800000-1800000uV
[    0.365292] initcall pty_init+0x0/0x30 returned 0 after 121 usecs
[    0.365299] calling  sysrq_init+0x0/0x78 @ 1
[    0.365306] initcall sysrq_init+0x0/0x78 returned 0 after 3 usecs
[    0.365311] calling  serial8250_init+0x0/0x120 @ 1
[    0.365315] vreg_l1b: Setting 912000-912000uV
[    0.365318] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.365448] vreg_l12c: Setting 1800000-1800000uV
[    0.365457] vreg_l3b: Setting 1200000-1200000uV
[    0.365496] probe of serial8250:0 returned 0 after 16 usecs
[    0.365550] probe of serial8250:0.0 returned 0 after 9 usecs
[    0.365571] vreg_l13c: Setting 3072000-3072000uV
[    0.365582] vreg_l4b: Setting 912000-912000uV
[    0.365800] vreg_l6b: Setting 880000-880000uV
[    0.365807] vreg_bob: Setting 3008000-3960000uV
[    0.365810] probe of serial8250:0.1 returned 0 after 7 usecs
[    0.366344] probe of 18200000.rsc:regulators-0 returned 0 after 1746 usecs
[    0.366771] probe of serial8250:0.2 returned 0 after 768 usecs
[    0.366806] probe of 18200000.rsc:regulators-1 returned 0 after 2202 usecs
[    0.366891] probe of serial8250:0.3 returned 0 after 7 usecs
[    0.367011] probe of serial8250:0.4 returned 0 after 6 usecs
[    0.367124] probe of serial8250:0.5 returned 0 after 5 usecs
[    0.367235] probe of serial8250:0.6 returned 0 after 6 usecs
[    0.367344] probe of serial8250:0.7 returned 0 after 6 usecs
[    0.367454] probe of serial8250:0.8 returned 0 after 6 usecs
[    0.367565] probe of serial8250:0.9 returned 0 after 6 usecs
[    0.367674] probe of serial8250:0.10 returned 0 after 6 usecs
[    0.367784] probe of serial8250:0.11 returned 0 after 6 usecs
[    0.367887] probe of serial8250:0.12 returned 0 after 6 usecs
[    0.367996] probe of serial8250:0.13 returned 0 after 5 usecs
[    0.368101] probe of serial8250:0.14 returned 0 after 5 usecs
[    0.368212] probe of serial8250:0.15 returned 0 after 5 usecs
[    0.368321] probe of serial8250:0.16 returned 0 after 6 usecs
[    0.368426] probe of serial8250:0.17 returned 0 after 5 usecs
[    0.368540] probe of serial8250:0.18 returned 0 after 6 usecs
[    0.368651] probe of serial8250:0.19 returned 0 after 6 usecs
[    0.368759] probe of serial8250:0.20 returned 0 after 6 usecs
[    0.368869] probe of serial8250:0.21 returned 0 after 5 usecs
[    0.368977] probe of serial8250:0.22 returned 0 after 6 usecs
[    0.369083] probe of serial8250:0.23 returned 0 after 6 usecs
[    0.369193] probe of serial8250:0.24 returned 0 after 6 usecs
[    0.369299] probe of serial8250:0.25 returned 0 after 6 usecs
[    0.369407] probe of serial8250:0.26 returned 0 after 6 usecs
[    0.369529] probe of serial8250:0.27 returned 0 after 6 usecs
[    0.369639] probe of serial8250:0.28 returned 0 after 5 usecs
[    0.369746] probe of serial8250:0.29 returned 0 after 6 usecs
[    0.369857] probe of serial8250:0.30 returned 0 after 6 usecs
[    0.369968] probe of serial8250:0.31 returned 0 after 6 usecs
[    0.370096] probe of serial8250 returned 0 after 9 usecs
[    0.370105] initcall serial8250_init+0x0/0x120 returned 0 after 4788 usecs
[    0.370115] calling  bcm2835aux_serial_driver_init+0x0/0x38 @ 1
[    0.370172] initcall bcm2835aux_serial_driver_init+0x0/0x38 returned 0 after 51 usecs
[    0.370178] calling  dw8250_platform_driver_init+0x0/0x38 @ 1
[    0.370262] initcall dw8250_platform_driver_init+0x0/0x38 returned 0 after 79 usecs
[    0.370267] calling  serial8250_em_platform_driver_init+0x0/0x38 @ 1
[    0.370313] initcall serial8250_em_platform_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.370318] calling  fsl8250_platform_driver_init+0x0/0x38 @ 1
[    0.370347] initcall fsl8250_platform_driver_init+0x0/0x38 returned 0 after 24 usecs
[    0.370352] calling  of_platform_serial_driver_init+0x0/0x38 @ 1
[    0.370524] initcall of_platform_serial_driver_init+0x0/0x38 returned 0 after 167 usecs
[    0.370531] calling  omap8250_platform_driver_init+0x0/0x38 @ 1
[    0.370618] initcall omap8250_platform_driver_init+0x0/0x38 returned 0 after 82 usecs
[    0.370623] calling  serial_pci_driver_init+0x0/0x48 @ 1
[    0.370638] initcall serial_pci_driver_init+0x0/0x48 returned 0 after 9 usecs
[    0.370643] calling  pci1xxxx_pci_driver_init+0x0/0x40 @ 1
[    0.370659] initcall pci1xxxx_pci_driver_init+0x0/0x40 returned 0 after 11 usecs
[    0.370664] calling  pericom8250_pci_driver_init+0x0/0x40 @ 1
[    0.370677] initcall pericom8250_pci_driver_init+0x0/0x40 returned 0 after 8 usecs
[    0.370683] calling  tegra_uart_driver_init+0x0/0x38 @ 1
[    0.370733] initcall tegra_uart_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.370738] calling  linflex_serial_init+0x0/0x78 @ 1
[    0.370797] initcall linflex_serial_init+0x0/0x78 returned 0 after 54 usecs
[    0.370803] calling  lpuart_serial_init+0x0/0x78 @ 1
[    0.370900] initcall lpuart_serial_init+0x0/0x78 returned 0 after 91 usecs
[    0.370906] calling  imx_uart_init+0x0/0x78 @ 1
[    0.370967] initcall imx_uart_init+0x0/0x78 returned 0 after 56 usecs
[    0.370974] calling  meson_uart_platform_driver_init+0x0/0x38 @ 1
[    0.371060] initcall meson_uart_platform_driver_init+0x0/0x38 returned 0 after 81 usecs
[    0.371067] calling  msm_serial_init+0x0/0x88 @ 1
[    0.371130] msm_serial: driver initialized
[    0.371137] initcall msm_serial_init+0x0/0x88 returned 0 after 64 usecs
[    0.371142] calling  qcom_geni_serial_init+0x0/0x98 @ 1
[    0.371214] initcall qcom_geni_serial_init+0x0/0x98 returned 0 after 66 usecs
[    0.371220] calling  samsung_serial_init+0x0/0x60 @ 1
[    0.371329] initcall samsung_serial_init+0x0/0x60 returned 0 after 104 usecs
[    0.371335] calling  sci_init+0x0/0x50 @ 1
[    0.371340] SuperH (H)SCI(F) driver initialized
[    0.371472] initcall sci_init+0x0/0x50 returned 0 after 132 usecs
[    0.371478] calling  tegra_uart_init+0x0/0xf8 @ 1
[    0.371779] initcall tegra_uart_init+0x0/0xf8 returned 0 after 296 usecs
[    0.371785] calling  tegra_tcu_driver_init+0x0/0x38 @ 1
[    0.371831] initcall tegra_tcu_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.371837] calling  init_kgdboc+0x0/0xa0 @ 1
[    0.371937] probe of kgdboc returned 0 after 7 usecs
[    0.371942] initcall init_kgdboc+0x0/0xa0 returned 0 after 99 usecs
[    0.371949] calling  random_sysctls_init+0x0/0x50 @ 1
[    0.371963] initcall random_sysctls_init+0x0/0x50 returned 0 after 8 usecs
[    0.371970] calling  virtio_rng_driver_init+0x0/0x38 @ 1
[    0.371984] initcall virtio_rng_driver_init+0x0/0x38 returned 0 after 8 usecs
[    0.371990] calling  histb_rng_driver_init+0x0/0x38 @ 1
[    0.372032] initcall histb_rng_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.372039] calling  smccc_trng_driver_init+0x0/0x38 @ 1
[    0.372069] initcall smccc_trng_driver_init+0x0/0x38 returned 0 after 24 usecs
[    0.372074] calling  init_tis+0x0/0x88 @ 1
[    0.372141] initcall init_tis+0x0/0x88 returned 0 after 61 usecs
[    0.372147] calling  crb_acpi_driver_init+0x0/0x38 @ 1
[    0.372154] initcall crb_acpi_driver_init+0x0/0x38 returned -19 after 0 usecs
[    0.372159] calling  qcom_iommu_init+0x0/0x70 @ 1
[    0.372293] initcall qcom_iommu_init+0x0/0x70 returned 0 after 128 usecs
[    0.372299] calling  arm_smmu_driver_init+0x0/0x40 @ 1
[    0.372352] probe of 3da0000.iommu returned -517 after 2 usecs
[    0.372549] probe of 15000000.iommu returned 517 after 144 usecs
[    0.372577] initcall arm_smmu_driver_init+0x0/0x40 returned 0 after 271 usecs
[    0.372585] calling  arm_smmu_driver_init+0x0/0x40 @ 1
[    0.372634] initcall arm_smmu_driver_init+0x0/0x40 returned 0 after 42 usecs
[    0.372641] calling  rk_iommu_driver_init+0x0/0x38 @ 1
[    0.372696] initcall rk_iommu_driver_init+0x0/0x38 returned 0 after 48 usecs
[    0.372703] calling  sun50i_iommu_driver_init+0x0/0x40 @ 1
[    0.372772] initcall sun50i_iommu_driver_init+0x0/0x40 returned -19 after 62 usecs
[    0.372779] calling  virtio_iommu_drv_init+0x0/0x38 @ 1
[    0.372792] initcall virtio_iommu_drv_init+0x0/0x38 returned 0 after 7 usecs
[    0.372799] calling  drm_core_init+0x0/0xe0 @ 1
[    0.372848] initcall drm_core_init+0x0/0xe0 returned 0 after 42 usecs
[    0.372855] calling  drm_panic_setup_logo+0x0/0xb0 @ 1
[    0.372867] initcall drm_panic_setup_logo+0x0/0xb0 returned 0 after 1 usecs
[    0.372874] calling  simpledrm_platform_driver_init+0x0/0x38 @ 1
[    0.372925] initcall simpledrm_platform_driver_init+0x0/0x38 returned 0 after 44 usecs
[    0.372931] calling  cn_proc_init+0x0/0x68 @ 1
[    0.372940] initcall cn_proc_init+0x0/0x68 returned 0 after 2 usecs
[    0.372947] calling  topology_sysfs_init+0x0/0x50 @ 1
[    0.373075] initcall topology_sysfs_init+0x0/0x50 returned 0 after 121 usecs
[    0.373082] calling  cacheinfo_sysfs_init+0x0/0x50 @ 1
[    0.373678] initcall cacheinfo_sysfs_init+0x0/0x50 returned 0 after 589 usecs
[    0.373687] calling  devcoredump_init+0x0/0x38 @ 1
[    0.373702] initcall devcoredump_init+0x0/0x38 returned 0 after 8 usecs
[    0.373709] calling  init_kgdbts+0x0/0x48 @ 1
[    0.373716] initcall init_kgdbts+0x0/0x48 returned 0 after 1 usecs
[    0.373724] calling  pm886_i2c_driver_init+0x0/0x38 @ 1
[    0.373740] initcall pm886_i2c_driver_init+0x0/0x38 returned 0 after 9 usecs
[    0.373747] calling  bcm2835_pm_driver_init+0x0/0x38 @ 1
[    0.373812] initcall bcm2835_pm_driver_init+0x0/0x38 returned 0 after 57 usecs
[    0.373820] calling  axp20x_i2c_driver_init+0x0/0x38 @ 1
[    0.373835] initcall axp20x_i2c_driver_init+0x0/0x38 returned 0 after 8 usecs
[    0.373843] calling  max77620_driver_init+0x0/0x38 @ 1
[    0.373857] initcall max77620_driver_init+0x0/0x38 returned 0 after 7 usecs
[    0.373864] calling  max77686_i2c_driver_init+0x0/0x38 @ 1
[    0.373880] initcall max77686_i2c_driver_init+0x0/0x38 returned 0 after 8 usecs
[    0.373888] calling  vexpress_sysreg_driver_init+0x0/0x38 @ 1
[    0.373938] initcall vexpress_sysreg_driver_init+0x0/0x38 returned 0 after 41 usecs
[    0.373946] calling  as3722_i2c_driver_init+0x0/0x38 @ 1
[    0.373961] initcall as3722_i2c_driver_init+0x0/0x38 returned 0 after 7 usecs
[    0.373968] calling  hmem_init+0x0/0x50 @ 1
[    0.373982] initcall hmem_init+0x0/0x50 returned 0 after 7 usecs
[    0.373989] calling  system_heap_create+0x0/0x88 @ 1
[    0.374059] initcall system_heap_create+0x0/0x88 returned 0 after 62 usecs
[    0.374067] calling  add_default_cma_heap+0x0/0x128 @ 1
[    0.374119] initcall add_default_cma_heap+0x0/0x128 returned 0 after 44 usecs
[    0.374127] calling  udmabuf_dev_init+0x0/0xb8 @ 1
[    0.374175] initcall udmabuf_dev_init+0x0/0xb8 returned 0 after 41 usecs
[    0.374183] calling  init_sd+0x0/0x140 @ 1
[    0.374216] initcall init_sd+0x0/0x140 returned 0 after 27 usecs
[    0.374225] calling  init_sr+0x0/0x78 @ 1
[    0.374238] initcall init_sr+0x0/0x78 returned 0 after 7 usecs
[    0.374246] calling  init_sg+0x0/0x1f0 @ 1
[    0.374271] initcall init_sg+0x0/0x1f0 returned 0 after 17 usecs
[    0.374278] calling  ahci_pci_driver_init+0x0/0x40 @ 1
[    0.374294] initcall ahci_pci_driver_init+0x0/0x40 returned 0 after 9 usecs
[    0.374302] calling  piix_init+0x0/0x58 @ 1
[    0.374317] initcall piix_init+0x0/0x58 returned 0 after 8 usecs
[    0.374325] calling  tegra_qspi_driver_init+0x0/0x38 @ 1
[    0.374407] initcall tegra_qspi_driver_init+0x0/0x38 returned 0 after 73 usecs
[    0.374416] calling  amd_spi_driver_init+0x0/0x38 @ 1
[    0.374448] initcall amd_spi_driver_init+0x0/0x38 returned 0 after 25 usecs
[    0.374456] calling  spmi_pmic_arb_driver_init+0x0/0x38 @ 1
[    0.374579] spmi_pmic_arb c440000.spmi: PMIC arbiter version v5 (0x50020000)
[    0.376818] probe of c440000.spmi returned 0 after 2304 usecs
[    0.376840] initcall spmi_pmic_arb_driver_init+0x0/0x38 returned 0 after 2370 usecs
[    0.376848] calling  blackhole_netdev_init+0x0/0xa8 @ 1
[    0.376878] initcall blackhole_netdev_init+0x0/0xa8 returned 0 after 22 usecs
[    0.376887] calling  netkit_init+0x0/0x38 @ 1
[    0.376900] initcall netkit_init+0x0/0x38 returned 0 after 5 usecs
[    0.376907] calling  fixed_mdio_bus_init+0x0/0x138 @ 1
[    0.377157] initcall fixed_mdio_bus_init+0x0/0x138 returned 0 after 243 usecs
[    0.377165] calling  wwan_init+0x0/0xd8 @ 1
[    0.377186] initcall wwan_init+0x0/0xd8 returned 0 after 14 usecs
[    0.377195] calling  cdrom_init+0x0/0x30 @ 1
[    0.377212] initcall cdrom_init+0x0/0x30 returned 0 after 9 usecs
[    0.377220] calling  mon_init+0x0/0x160 @ 1
[    0.377288] initcall mon_init+0x0/0x160 returned 0 after 59 usecs
[    0.377296] calling  ehci_hcd_init+0x0/0x150 @ 1
[    0.377307] initcall ehci_hcd_init+0x0/0x150 returned 0 after 3 usecs
[    0.377315] calling  ehci_pci_init+0x0/0x88 @ 1
[    0.377333] initcall ehci_pci_init+0x0/0x88 returned 0 after 10 usecs
[    0.377340] calling  xhci_hcd_init+0x0/0x50 @ 1
[    0.377353] initcall xhci_hcd_init+0x0/0x50 returned 0 after 5 usecs
[    0.377361] calling  xhci_pci_init+0x0/0x98 @ 1
[    0.377380] initcall xhci_pci_init+0x0/0x98 returned 0 after 11 usecs
[    0.377388] calling  xhci_renesas_pci_driver_init+0x0/0x40 @ 1
[    0.377405] initcall xhci_renesas_pci_driver_init+0x0/0x40 returned 0 after 8 usecs
[    0.377413] calling  usb_serial_init+0x0/0x160 @ 1
[    0.377471] usbcore: registered new interface driver usbserial_generic
[    0.377486] usbserial: USB Serial support registered for generic
[    0.377492] initcall usb_serial_init+0x0/0x160 returned 0 after 72 usecs
[    0.377500] calling  input_leds_init+0x0/0x38 @ 1
[    0.377509] initcall input_leds_init+0x0/0x38 returned 0 after 1 usecs
[    0.377517] calling  mousedev_init+0x0/0x98 @ 1
[    0.377582] mousedev: PS/2 mouse device common for all mice
[    0.377588] initcall mousedev_init+0x0/0x98 returned 0 after 64 usecs
[    0.377597] calling  evdev_init+0x0/0x38 @ 1
[    0.377602] initcall evdev_init+0x0/0x38 returned 0 after 0 usecs
[    0.377605] calling  atkbd_init+0x0/0x50 @ 1
[    0.377625] initcall atkbd_init+0x0/0x50 returned 0 after 15 usecs
[    0.377630] calling  scmi_imx_bbm_key_driver_init+0x0/0x40 @ 1
[    0.377652] initcall scmi_imx_bbm_key_driver_init+0x0/0x40 returned 0 after 17 usecs
[    0.377657] calling  hi65xx_powerkey_driver_init+0x0/0x38 @ 1
[    0.377693] initcall hi65xx_powerkey_driver_init+0x0/0x38 returned 0 after 31 usecs
[    0.377699] calling  aml_rtc_driver_init+0x0/0x38 @ 1
[    0.377753] initcall aml_rtc_driver_init+0x0/0x38 returned 0 after 50 usecs
[    0.377757] calling  efi_rtc_driver_init+0x0/0x40 @ 1
[    0.377799] initcall efi_rtc_driver_init+0x0/0x40 returned -19 after 37 usecs
[    0.377803] calling  pl031_driver_init+0x0/0x38 @ 1
[    0.377817] initcall pl031_driver_init+0x0/0x38 returned 0 after 10 usecs
[    0.377821] calling  sun6i_rtc_driver_init+0x0/0x38 @ 1
[    0.377919] initcall sun6i_rtc_driver_init+0x0/0x38 returned 0 after 95 usecs
[    0.377924] calling  rk3x_i2c_driver_init+0x0/0x38 @ 1
[    0.378011] initcall rk3x_i2c_driver_init+0x0/0x38 returned 0 after 82 usecs
[    0.378016] calling  as3722_poweroff_driver_init+0x0/0x38 @ 1
[    0.378046] initcall as3722_poweroff_driver_init+0x0/0x38 returned 0 after 25 usecs
[    0.378051] calling  gpio_poweroff_driver_init+0x0/0x38 @ 1
[    0.378097] initcall gpio_poweroff_driver_init+0x0/0x38 returned 0 after 42 usecs
[    0.378104] calling  gpio_restart_driver_init+0x0/0x38 @ 1
[    0.378149] initcall gpio_restart_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.378154] calling  hisi_reboot_driver_init+0x0/0x38 @ 1
[    0.378199] initcall hisi_reboot_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.378205] calling  msm_restart_driver_init+0x0/0x38 @ 1
[    0.378252] initcall msm_restart_driver_init+0x0/0x38 returned 0 after 43 usecs
[    0.378257] calling  odroid_go_ultra_poweroff_init+0x0/0xf8 @ 1
[    0.378263] initcall odroid_go_ultra_poweroff_init+0x0/0xf8 returned -19 after 1 usecs
[    0.378268] calling  regulator_poweroff_driver_init+0x0/0x38 @ 1
[    0.378314] initcall regulator_poweroff_driver_init+0x0/0x38 returned 0 after 41 usecs
[    0.378319] calling  restart_poweroff_driver_init+0x0/0x38 @ 1
[    0.378365] initcall restart_poweroff_driver_init+0x0/0x38 returned 0 after 40 usecs
[    0.378370] calling  tps65086_restart_driver_init+0x0/0x38 @ 1
[    0.378399] initcall tps65086_restart_driver_init+0x0/0x38 returned 0 after 24 usecs
[    0.378403] calling  vexpress_reset_driver_init+0x0/0x38 @ 1
[    0.378470] initcall vexpress_reset_driver_init+0x0/0x38 returned 0 after 61 usecs
[    0.378476] calling  xgene_reboot_driver_init+0x0/0x38 @ 1
[    0.378520] initcall xgene_reboot_driver_init+0x0/0x38 returned 0 after 39 usecs
[    0.378525] calling  syscon_reboot_driver_init+0x0/0x38 @ 1
[    0.378568] initcall syscon_reboot_driver_init+0x0/0x38 returned 0 after 37 usecs
[    0.378573] calling  syscon_poweroff_driver_init+0x0/0x38 @ 1
[    0.378616] initcall syscon_poweroff_driver_init+0x0/0x38 returned 0 after 38 usecs
[    0.378622] calling  syscon_reboot_mode_driver_init+0x0/0x38 @ 1
[    0.378668] initcall syscon_reboot_mode_driver_init+0x0/0x38 returned 0 after 42 usecs
[    0.378674] calling  gti_wdt_driver_init+0x0/0x38 @ 1
[    0.378728] initcall gti_wdt_driver_init+0x0/0x38 returned 0 after 50 usecs
[    0.378734] calling  dm_init+0x0/0xd8 @ 1
[    0.378739] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    0.378755] device-mapper: uevent: version 1.0.3
[    0.378840] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@lists.linux.dev
[    0.378849] initcall dm_init+0x0/0xd8 returned 0 after 110 usecs
[    0.378854] calling  dm_bufio_init+0x0/0x140 @ 1
[    0.378907] initcall dm_bufio_init+0x0/0x140 returned 0 after 47 usecs
[    0.378914] calling  dm_snapshot_init+0x0/0x258 @ 1
[    0.378948] initcall dm_snapshot_init+0x0/0x258 returned 0 after 27 usecs
[    0.378953] calling  dm_mirror_init+0x0/0x90 @ 1
[    0.378962] initcall dm_mirror_init+0x0/0x90 returned 0 after 3 usecs
[    0.378967] calling  dm_dirty_log_init+0x0/0x78 @ 1
[    0.378973] initcall dm_dirty_log_init+0x0/0x78 returned 0 after 0 usecs
[    0.378978] calling  dm_zero_init+0x0/0x38 @ 1
[    0.378985] initcall dm_zero_init+0x0/0x38 returned 0 after 1 usecs
[    0.378990] calling  ghes_edac_init+0x0/0x98 @ 1
[    0.378996] initcall ghes_edac_init+0x0/0x98 returned -19 after 0 usecs
[    0.379001] calling  ti_opp_supply_driver_init+0x0/0x38 @ 1
[    0.379065] initcall ti_opp_supply_driver_init+0x0/0x38 returned 0 after 58 usecs
[    0.379071] calling  tegra_cpufreq_init+0x0/0xe8 @ 1
[    0.379081] initcall tegra_cpufreq_init+0x0/0xe8 returned -19 after 3 usecs
[    0.379087] calling  ti_cpufreq_init+0x0/0x80 @ 1
[    0.379094] initcall ti_cpufreq_init+0x0/0x80 returned 0 after 2 usecs
[    0.379100] calling  ti_cpufreq_driver_init+0x0/0x40 @ 1
[    0.379130] initcall ti_cpufreq_driver_init+0x0/0x40 returned 0 after 24 usecs
[    0.379135] calling  psci_idle_init+0x0/0xd8 @ 1
[    0.379842] probe of psci-cpuidle returned 0 after 613 usecs
[    0.379848] initcall psci_idle_init+0x0/0xd8 returned 0 after 706 usecs
[    0.379855] calling  dmi_sysfs_init+0x0/0x118 @ 1
[    0.380262] initcall dmi_sysfs_init+0x0/0x118 returned 0 after 400 usecs
[    0.380268] calling  rpi_firmware_driver_init+0x0/0x38 @ 1
[    0.380324] initcall rpi_firmware_driver_init+0x0/0x38 returned 0 after 49 usecs
[    0.380330] calling  sysfb_init+0x0/0x1c8 @ 1
[    0.381073] simple-framebuffer simple-framebuffer.0: [drm] Registered 1 planes with drm panic
[    0.381089] [drm] Initialized simpledrm 1.0.0 for simple-framebuffer.0 on minor 0
[    0.389279] Console: switching to colour frame buffer device 240x75
[    0.397533] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
[    0.398377] probe of simple-framebuffer.0 returned 0 after 17753 usecs
[    0.398387] initcall sysfb_init+0x0/0x1c8 returned 0 after 18050 usecs
[    0.398400] calling  ti_sci_driver_init+0x0/0x40 @ 1
[    0.398818] initcall ti_sci_driver_init+0x0/0x40 returned 0 after 411 usecs
[    0.398845] calling  scmi_smc_driver_init+0x0/0x38 @ 1
[    0.399111] initcall scmi_smc_driver_init+0x0/0x38 returned 0 after 245 usecs
[    0.399134] calling  scmi_mailbox_driver_init+0x0/0x38 @ 1
[    0.399303] initcall scmi_mailbox_driver_init+0x0/0x38 returned 0 after 149 usecs
[    0.399331] calling  virtio_scmi_driver_init+0x0/0x38 @ 1
[    0.399381] initcall virtio_scmi_driver_init+0x0/0x38 returned 0 after 31 usecs
[    0.399403] calling  scmi_imx_bbm_init+0x0/0x38 @ 1
[    0.399496] initcall scmi_imx_bbm_init+0x0/0x38 returned 0 after 73 usecs
[    0.399519] calling  scmi_driver_init+0x0/0x80 @ 1
[    0.399638] initcall scmi_driver_init+0x0/0x80 returned 0 after 100 usecs
[    0.399661] calling  scmi_system_power_driver_init+0x0/0x40 @ 1
[    0.399745] initcall scmi_system_power_driver_init+0x0/0x40 returned 0 after 64 usecs
[    0.399767] calling  meson_sm_driver_init+0x0/0x40 @ 1
[    0.399987] initcall meson_sm_driver_init+0x0/0x40 returned -19 after 199 usecs
[    0.400012] calling  esrt_sysfs_init+0x0/0x338 @ 1
[    0.400187] initcall esrt_sysfs_init+0x0/0x338 returned 0 after 153 usecs
[    0.400211] calling  efivars_pstore_init+0x0/0xb8 @ 1
[    0.400232] initcall efivars_pstore_init+0x0/0xb8 returned 0 after 2 usecs
[    0.400248] calling  qcom_uefisecapp_driver_init+0x0/0x40 @ 1
[    0.400306] initcall qcom_uefisecapp_driver_init+0x0/0x40 returned 0 after 34 usecs
[    0.400334] calling  smccc_devices_init+0x0/0xb8 @ 1
[    0.400357] initcall smccc_devices_init+0x0/0xb8 returned 0 after 0 usecs
[    0.400381] calling  smccc_soc_init+0x0/0x1b0 @ 1
[    0.400406] initcall smccc_soc_init+0x0/0x1b0 returned 0 after 2 usecs
[    0.400429] calling  tegra_bpmp_driver_init+0x0/0x38 @ 1
[    0.400642] initcall tegra_bpmp_driver_init+0x0/0x38 returned 0 after 188 usecs
[    0.400669] calling  zynqmp_firmware_driver_init+0x0/0x40 @ 1
[    0.400855] initcall zynqmp_firmware_driver_init+0x0/0x40 returned 0 after 161 usecs
[    0.400881] calling  meson_crypto_driver_init+0x0/0x38 @ 1
[    0.401044] initcall meson_crypto_driver_init+0x0/0x38 returned 0 after 139 usecs
[    0.401070] calling  ostm_device_driver_init+0x0/0x40 @ 1
[    0.401275] initcall ostm_device_driver_init+0x0/0x40 returned -19 after 181 usecs
[    0.401303] calling  omap_dm_timer_driver_init+0x0/0x38 @ 1
[    0.401673] initcall omap_dm_timer_driver_init+0x0/0x38 returned 0 after 345 usecs
[    0.401703] calling  tegra186_wdt_driver_init+0x0/0x38 @ 1
[    0.401891] initcall tegra186_wdt_driver_init+0x0/0x38 returned 0 after 163 usecs
[    0.401922] calling  hid_init+0x0/0x90 @ 1
[    0.402058] hid: raw HID events driver (C) Jiri Kosina
[    0.402397] initcall hid_init+0x0/0x90 returned 0 after 462 usecs
[    0.402420] calling  hid_generic_init+0x0/0x40 @ 1
[    0.402519] initcall hid_generic_init+0x0/0x40 returned 0 after 85 usecs
[    0.402535] calling  magicmouse_driver_init+0x0/0x48 @ 1
[    0.402584] initcall magicmouse_driver_init+0x0/0x48 returned 0 after 35 usecs
[    0.402599] calling  ntrig_driver_init+0x0/0x40 @ 1
[    0.402652] initcall ntrig_driver_init+0x0/0x40 returned 0 after 39 usecs
[    0.402666] calling  hid_init+0x0/0x90 @ 1
[    0.402717] usbcore: registered new interface driver usbhid
[    0.402811] usbhid: USB HID core driver
[    0.402864] initcall hid_init+0x0/0x90 returned 0 after 185 usecs
[    0.402879] calling  chromeos_of_hw_prober_driver_init+0x0/0x100 @ 1
[    0.402911] initcall chromeos_of_hw_prober_driver_init+0x0/0x100 returned -19 after 7 usecs
[    0.402935] calling  chromeos_tbmc_driver_init+0x0/0x38 @ 1
[    0.402953] initcall chromeos_tbmc_driver_init+0x0/0x38 returned -19 after 2 usecs
[    0.402970] calling  rockchip_mbox_driver_init+0x0/0x38 @ 1
[    0.403299] initcall rockchip_mbox_driver_init+0x0/0x38 returned 0 after 312 usecs
[    0.403327] calling  bcm2835_mbox_driver_init+0x0/0x38 @ 1
[    0.403520] initcall bcm2835_mbox_driver_init+0x0/0x38 returned 0 after 176 usecs
[    0.403541] calling  ti_msgmgr_driver_init+0x0/0x38 @ 1
[    0.403721] initcall ti_msgmgr_driver_init+0x0/0x38 returned 0 after 164 usecs
[    0.403741] calling  sun6i_msgbox_driver_init+0x0/0x38 @ 1
[    0.403900] initcall sun6i_msgbox_driver_init+0x0/0x38 returned 0 after 143 usecs
[    0.403919] calling  rproc_virtio_driver_init+0x0/0x38 @ 1
[    0.404027] initcall rproc_virtio_driver_init+0x0/0x38 returned 0 after 92 usecs
[    0.404046] calling  vmgenid_plaform_driver_init+0x0/0x38 @ 1
[    0.404223] initcall vmgenid_plaform_driver_init+0x0/0x38 returned 0 after 158 usecs
[    0.404244] calling  extcon_class_init+0x0/0x30 @ 1
[    0.404299] initcall extcon_class_init+0x0/0x30 returned 0 after 38 usecs
[    0.404318] calling  gpmc_driver_init+0x0/0x40 @ 1
[    0.404618] initcall gpmc_driver_init+0x0/0x40 returned 0 after 283 usecs
[    0.404640] calling  tegra186_emc_driver_init+0x0/0x38 @ 1
[    0.404838] initcall tegra186_emc_driver_init+0x0/0x38 returned 0 after 180 usecs
[    0.404860] calling  arm_ccn_init+0x0/0xe8 @ 1
[    0.405062] initcall arm_ccn_init+0x0/0xe8 returned 0 after 186 usecs
[    0.405082] calling  armv8_pmu_driver_init+0x0/0x70 @ 1
[    0.407505] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 (0,8000003f) counters available
[    0.408542] probe of pmu returned 0 after 3291 usecs
[    0.409370] initcall armv8_pmu_driver_init+0x0/0x70 returned 0 after 4272 usecs
[    0.409399] calling  hisi_l3c_pmu_module_init+0x0/0xa0 @ 1
[    0.409571] initcall hisi_l3c_pmu_module_init+0x0/0xa0 returned 0 after 153 usecs
[    0.409594] calling  hisi_hha_pmu_module_init+0x0/0xa0 @ 1
[    0.409699] initcall hisi_hha_pmu_module_init+0x0/0xa0 returned 0 after 88 usecs
[    0.409719] calling  hisi_ddrc_pmu_module_init+0x0/0xa0 @ 1
[    0.409819] initcall hisi_ddrc_pmu_module_init+0x0/0xa0 returned 0 after 82 usecs
[    0.409839] calling  hisi_sllc_pmu_module_init+0x0/0xa0 @ 1
[    0.409938] initcall hisi_sllc_pmu_module_init+0x0/0xa0 returned 0 after 82 usecs
[    0.409957] calling  hisi_pa_pmu_module_init+0x0/0xa0 @ 1
[    0.410053] initcall hisi_pa_pmu_module_init+0x0/0xa0 returned 0 after 78 usecs
[    0.410072] calling  hisi_cpa_pmu_module_init+0x0/0xa0 @ 1
[    0.410170] initcall hisi_cpa_pmu_module_init+0x0/0xa0 returned 0 after 81 usecs
[    0.410192] calling  hisi_uc_pmu_module_init+0x0/0xa8 @ 1
[    0.410290] initcall hisi_uc_pmu_module_init+0x0/0xa8 returned 0 after 80 usecs
[    0.410309] calling  register_l2_cache_pmu_driver+0x0/0x68 @ 1
[    0.410408] initcall register_l2_cache_pmu_driver+0x0/0x68 returned 0 after 79 usecs
[    0.410428] calling  register_qcom_l3_cache_pmu_driver+0x0/0x68 @ 1
[    0.410576] initcall register_qcom_l3_cache_pmu_driver+0x0/0x68 returned 0 after 130 usecs
[    0.410598] calling  xgene_pmu_driver_init+0x0/0x38 @ 1
[    0.410786] initcall xgene_pmu_driver_init+0x0/0x38 returned 0 after 169 usecs
[    0.410807] calling  m1_pmu_driver_init+0x0/0x38 @ 1
[    0.411035] initcall m1_pmu_driver_init+0x0/0x38 returned 0 after 211 usecs
[    0.411056] calling  binder_init+0x0/0xd0 @ 1
[    0.411235] initcall binder_init+0x0/0xd0 returned 0 after 162 usecs
[    0.411257] calling  icc_init+0x0/0xc0 @ 1
[    0.412291] initcall icc_init+0x0/0xc0 returned 0 after 1016 usecs
[    0.412316] calling  qcom_icc_bcm_voter_driver_init+0x0/0x40 @ 1
[    0.412670] probe of 18200000.rsc:bcm-voter returned 0 after 141 usecs
[    0.412808] initcall qcom_icc_bcm_voter_driver_init+0x0/0x40 returned 0 after 472 usecs
[    0.412838] calling  qnoc_driver_init+0x0/0x38 @ 1
[    0.413382] initcall qnoc_driver_init+0x0/0x38 returned 0 after 525 usecs
[    0.413404] calling  sock_diag_init+0x0/0x60 @ 1
[    0.413603] initcall sock_diag_init+0x0/0x60 returned 0 after 179 usecs
[    0.413630] calling  init_net_drop_monitor+0x0/0x170 @ 1
[    0.413650] drop_monitor: Initializing network drop monitor service
[    0.413991] initcall init_net_drop_monitor+0x0/0x170 returned 0 after 341 usecs
[    0.414022] calling  blackhole_init+0x0/0x38 @ 1
[    0.414045] initcall blackhole_init+0x0/0x38 returned 0 after 3 usecs
[    0.414065] calling  fq_codel_module_init+0x0/0x38 @ 1
[    0.414086] initcall fq_codel_module_init+0x0/0x38 returned 0 after 1 usecs
[    0.414107] calling  init_cgroup_cls+0x0/0x38 @ 1
[    0.414127] initcall init_cgroup_cls+0x0/0x38 returned 0 after 1 usecs
[    0.414147] calling  netlink_diag_init+0x0/0x38 @ 1
[    0.414169] initcall netlink_diag_init+0x0/0x38 returned 0 after 2 usecs
[    0.414190] calling  xt_init+0x0/0x190 @ 1
[    0.414237] initcall xt_init+0x0/0x190 returned 0 after 27 usecs
[    0.414261] calling  tcpudp_mt_init+0x0/0x38 @ 1
[    0.414286] initcall tcpudp_mt_init+0x0/0x38 returned 0 after 4 usecs
[    0.414306] calling  gre_offload_init+0x0/0x70 @ 1
[    0.414332] initcall gre_offload_init+0x0/0x70 returned 0 after 2 usecs
[    0.414355] calling  sysctl_ipv4_init+0x0/0x88 @ 1
[    0.414687] initcall sysctl_ipv4_init+0x0/0x88 returned 0 after 309 usecs
[    0.414714] calling  inet_diag_init+0x0/0xe8 @ 1
[    0.414751] initcall inet_diag_init+0x0/0xe8 returned 0 after 14 usecs
[    0.414774] calling  tcp_diag_init+0x0/0x38 @ 1
[    0.414798] initcall tcp_diag_init+0x0/0x38 returned 0 after 2 usecs
[    0.414821] calling  udp_diag_init+0x0/0x70 @ 1
[    0.414843] initcall udp_diag_init+0x0/0x70 returned 0 after 0 usecs
[    0.414866] calling  raw_diag_init+0x0/0x38 @ 1
[    0.414890] initcall raw_diag_init+0x0/0x38 returned 0 after 0 usecs
[    0.414912] calling  cubictcp_register+0x0/0x98 @ 1
[    0.414979] initcall cubictcp_register+0x0/0x98 returned 0 after 44 usecs
[    0.415005] calling  xfrm_user_init+0x0/0x60 @ 1
[    0.415029] Initializing XFRM netlink socket
[    0.415237] initcall xfrm_user_init+0x0/0x60 returned 0 after 207 usecs
[    0.415271] calling  unix_diag_init+0x0/0x38 @ 1
[    0.415296] initcall unix_diag_init+0x0/0x38 returned 0 after 1 usecs
[    0.415320] calling  inet6_init+0x0/0x3e0 @ 1
[    0.415534] NET: Registered PF_INET6 protocol family
[    0.427137] Segment Routing with IPv6
[    0.427158] RPL Segment Routing with IPv6
[    0.427217] In-situ OAM (IOAM) with IPv6
[    0.427277] initcall inet6_init+0x0/0x3e0 returned 0 after 11933 usecs
[    0.427285] calling  mip6_init+0x0/0xd8 @ 1
[    0.427288] mip6: Mobile IPv6
[    0.427302] initcall mip6_init+0x0/0xd8 returned 0 after 14 usecs
[    0.427306] calling  packet_init+0x0/0xa0 @ 1
[    0.427331] NET: Registered PF_PACKET protocol family
[    0.427348] initcall packet_init+0x0/0xa0 returned 0 after 39 usecs
[    0.427352] calling  packet_diag_init+0x0/0x38 @ 1
[    0.427356] initcall packet_diag_init+0x0/0x38 returned 0 after 0 usecs
[    0.427359] calling  strp_dev_init+0x0/0x60 @ 1
[    0.427649] initcall strp_dev_init+0x0/0x60 returned 0 after 287 usecs
[    0.427654] calling  dcbnl_init+0x0/0x58 @ 1
[    0.427659] initcall dcbnl_init+0x0/0x58 returned 0 after 2 usecs
[    0.427663] calling  mptcp_diag_init+0x0/0x38 @ 1
[    0.427667] initcall mptcp_diag_init+0x0/0x38 returned 0 after 1 usecs
[    0.427670] calling  handshake_init+0x0/0xb8 @ 1
[    0.427688] initcall handshake_init+0x0/0xb8 returned 0 after 14 usecs
[    0.427691] calling  check_mmu_enabled_at_boot+0x0/0x50 @ 1
[    0.427700] initcall check_mmu_enabled_at_boot+0x0/0x50 returned 0 after 0 usecs
[    0.427705] calling  finalize_pkvm+0x0/0xd0 @ 1
[    0.427712] initcall finalize_pkvm+0x0/0xd0 returned 0 after 1 usecs
[    0.427764] calling  kernel_do_mounts_initrd_sysctls_init+0x0/0x50 @ 1
[    0.427773] initcall kernel_do_mounts_initrd_sysctls_init+0x0/0x50 returned 0 after 3 usecs
[    0.427777] calling  kernel_panic_sysctls_init+0x0/0x50 @ 1
[    0.427786] initcall kernel_panic_sysctls_init+0x0/0x50 returned 0 after 4 usecs
[    0.427790] calling  kernel_panic_sysfs_init+0x0/0x48 @ 1
[    0.427799] initcall kernel_panic_sysfs_init+0x0/0x48 returned 0 after 4 usecs
[    0.427804] calling  kernel_exit_sysctls_init+0x0/0x50 @ 1
[    0.427810] initcall kernel_exit_sysctls_init+0x0/0x50 returned 0 after 2 usecs
[    0.427815] calling  kernel_exit_sysfs_init+0x0/0x48 @ 1
[    0.427822] initcall kernel_exit_sysfs_init+0x0/0x48 returned 0 after 2 usecs
[    0.427827] calling  param_sysfs_builtin_init+0x0/0xb0 @ 1
[    0.430962] initcall param_sysfs_builtin_init+0x0/0xb0 returned 0 after 3129 usecs
[    0.430970] calling  reboot_ksysfs_init+0x0/0xa0 @ 1
[    0.430984] initcall reboot_ksysfs_init+0x0/0xa0 returned 0 after 8 usecs
[    0.430990] calling  sched_core_sysctl_init+0x0/0x50 @ 1
[    0.430999] initcall sched_core_sysctl_init+0x0/0x50 returned 0 after 3 usecs
[    0.431004] calling  sched_fair_sysctl_init+0x0/0x50 @ 1
[    0.431012] initcall sched_fair_sysctl_init+0x0/0x50 returned 0 after 2 usecs
[    0.431017] calling  sched_rt_sysctl_init+0x0/0x50 @ 1
[    0.431024] initcall sched_rt_sysctl_init+0x0/0x50 returned 0 after 2 usecs
[    0.431030] calling  sched_dl_sysctl_init+0x0/0x50 @ 1
[    0.431036] initcall sched_dl_sysctl_init+0x0/0x50 returned 0 after 1 usecs
[    0.431041] calling  sched_init_debug+0x0/0x340 @ 1
[    0.431151] initcall sched_init_debug+0x0/0x340 returned 0 after 104 usecs
[    0.431158] calling  sched_energy_aware_sysctl_init+0x0/0x50 @ 1
[    0.431166] initcall sched_energy_aware_sysctl_init+0x0/0x50 returned 0 after 2 usecs
[    0.431171] calling  cpu_latency_qos_init+0x0/0x68 @ 1
[    0.431517] initcall cpu_latency_qos_init+0x0/0x68 returned 0 after 342 usecs
[    0.431522] calling  pm_debugfs_init+0x0/0x50 @ 1
[    0.431528] initcall pm_debugfs_init+0x0/0x50 returned 0 after 3 usecs
[    0.431531] calling  test_suspend+0x0/0xf0 @ 1
[    0.431535] initcall test_suspend+0x0/0xf0 returned 0 after 1 usecs
[    0.431537] calling  printk_late_init+0x0/0x188 @ 1
[    0.431548] initcall printk_late_init+0x0/0x188 returned 0 after 7 usecs
[    0.431551] calling  init_srcu_module_notifier+0x0/0x58 @ 1
[    0.431558] initcall init_srcu_module_notifier+0x0/0x58 returned 0 after 3 usecs
[    0.431561] calling  swiotlb_create_default_debugfs+0x0/0xb8 @ 1
[    0.431575] initcall swiotlb_create_default_debugfs+0x0/0xb8 returned 0 after 9 usecs
[    0.431579] calling  tk_debug_sleep_time_init+0x0/0x50 @ 1
[    0.431587] initcall tk_debug_sleep_time_init+0x0/0x50 returned 0 after 3 usecs
[    0.431591] calling  bpf_ksym_iter_register+0x0/0x40 @ 1
[    0.431597] initcall bpf_ksym_iter_register+0x0/0x40 returned 0 after 1 usecs
[    0.431601] calling  kernel_acct_sysctls_init+0x0/0x50 @ 1
[    0.431606] initcall kernel_acct_sysctls_init+0x0/0x50 returned 0 after 1 usecs
[    0.431611] calling  kexec_core_sysctl_init+0x0/0x50 @ 1
[    0.431619] initcall kexec_core_sysctl_init+0x0/0x50 returned 0 after 3 usecs
[    0.431623] calling  bpf_rstat_kfunc_init+0x0/0x38 @ 1
[    0.431634] initcall bpf_rstat_kfunc_init+0x0/0x38 returned 0 after 6 usecs
[    0.431638] calling  debugfs_kprobe_init+0x0/0xc0 @ 1
[    0.431652] initcall debugfs_kprobe_init+0x0/0xc0 returned 0 after 8 usecs
[    0.431657] calling  kernel_delayacct_sysctls_init+0x0/0x50 @ 1
[    0.431664] initcall kernel_delayacct_sysctls_init+0x0/0x50 returned 0 after 2 usecs
[    0.431669] calling  taskstats_init+0x0/0x60 @ 1
[    0.431680] registered taskstats version 1
[    0.431698] initcall taskstats_init+0x0/0x60 returned 0 after 24 usecs
[    0.431704] calling  ftrace_sysctl_init+0x0/0x40 @ 1
[    0.431739] initcall ftrace_sysctl_init+0x0/0x40 returned 0 after 30 usecs
[    0.431745] calling  init_hwlat_tracer+0x0/0x138 @ 1
[    0.432534] initcall init_hwlat_tracer+0x0/0x138 returned 0 after 782 usecs
[    0.432541] calling  init_osnoise_tracer+0x0/0x110 @ 1
[    0.433340] initcall init_osnoise_tracer+0x0/0x110 returned 0 after 793 usecs
[    0.433348] calling  bpf_key_sig_kfuncs_init+0x0/0x28 @ 1
[    0.433363] initcall bpf_key_sig_kfuncs_init+0x0/0x28 returned 0 after 12 usecs
[    0.433367] calling  bpf_kprobe_multi_kfuncs_init+0x0/0x30 @ 1
[    0.433375] initcall bpf_kprobe_multi_kfuncs_init+0x0/0x30 returned 0 after 5 usecs
[    0.433379] calling  bpf_global_ma_init+0x0/0x58 @ 1
[    0.433428] initcall bpf_global_ma_init+0x0/0x58 returned 0 after 46 usecs
[    0.433433] calling  bpf_syscall_sysctl_init+0x0/0x50 @ 1
[    0.433440] initcall bpf_syscall_sysctl_init+0x0/0x50 returned 0 after 3 usecs
[    0.433443] calling  unbound_reg_init+0x0/0x50 @ 1
[    0.433447] initcall unbound_reg_init+0x0/0x50 returned 0 after 0 usecs
[    0.433450] calling  kfunc_init+0x0/0x120 @ 1
[    0.433520] initcall kfunc_init+0x0/0x120 returned 0 after 66 usecs
[    0.433524] calling  bpf_map_iter_init+0x0/0x50 @ 1
[    0.433532] initcall bpf_map_iter_init+0x0/0x50 returned 0 after 3 usecs
[    0.433535] calling  init_subsystem+0x0/0x40 @ 1
[    0.433546] initcall init_subsystem+0x0/0x40 returned 0 after 4 usecs
[    0.433550] calling  task_iter_init+0x0/0x118 @ 1
[    0.433555] initcall task_iter_init+0x0/0x118 returned 0 after 1 usecs
[    0.433558] calling  bpf_prog_iter_init+0x0/0x40 @ 1
[    0.433562] initcall bpf_prog_iter_init+0x0/0x40 returned 0 after 0 usecs
[    0.433565] calling  bpf_link_iter_init+0x0/0x40 @ 1
[    0.433568] initcall bpf_link_iter_init+0x0/0x40 returned 0 after 0 usecs
[    0.433572] calling  init_trampolines+0x0/0x68 @ 1
[    0.433577] initcall init_trampolines+0x0/0x68 returned 0 after 1 usecs
[    0.433580] calling  kfunc_init+0x0/0x40 @ 1
[    0.433588] initcall kfunc_init+0x0/0x40 returned 0 after 4 usecs
[    0.433591] calling  bpf_cgroup_iter_init+0x0/0x40 @ 1
[    0.433596] initcall bpf_cgroup_iter_init+0x0/0x40 returned 0 after 1 usecs
[    0.433600] calling  cpumask_kfunc_init+0x0/0xd0 @ 1
[    0.433635] initcall cpumask_kfunc_init+0x0/0xd0 returned 0 after 31 usecs
[    0.433639] calling  crypto_kfunc_init+0x0/0xd0 @ 1
[    0.433657] initcall crypto_kfunc_init+0x0/0xd0 returned 0 after 15 usecs
[    0.433661] calling  bpf_kmem_cache_iter_init+0x0/0x40 @ 1
[    0.433665] initcall bpf_kmem_cache_iter_init+0x0/0x40 returned 0 after 0 usecs
[    0.433668] calling  load_system_certificate_list+0x0/0x50 @ 1
[    0.433672] Loading compiled-in X.509 certificates
[    0.443473] Loaded X.509 cert 'Fedora kernel signing key: aa4a8bf2c19aea7c8ab18eb543985ecbe856d6ca'
[    0.465383] Loaded X.509 cert 'Fedora IMA CA: a8a00c31663f853f9c6ff2564872e378af026b28'
[    0.465417] initcall load_system_certificate_list+0x0/0x50 returned 0 after 31745 usecs
[    0.465428] calling  init_lru_gen+0x0/0x98 @ 1
[    0.465505] initcall init_lru_gen+0x0/0x98 returned 0 after 70 usecs
[    0.465512] calling  vmstat_late_init+0x0/0x40 @ 1
[    0.465520] initcall vmstat_late_init+0x0/0x40 returned 0 after 3 usecs
[    0.465524] calling  fault_around_debugfs+0x0/0x50 @ 1
[    0.465532] initcall fault_around_debugfs+0x0/0x50 returned 0 after 3 usecs
[    0.465537] calling  slab_sysfs_init+0x0/0x120 @ 1
[    0.474210] initcall slab_sysfs_init+0x0/0x120 returned 0 after 8668 usecs
[    0.474219] calling  max_swapfiles_check+0x0/0x18 @ 1
[    0.474225] initcall max_swapfiles_check+0x0/0x18 returned 0 after 0 usecs
[    0.474230] calling  zswap_init+0x0/0x40 @ 1
[    0.474236] initcall zswap_init+0x0/0x40 returned 0 after 0 usecs
[    0.474241] calling  mempolicy_sysfs_init+0x0/0xf0 @ 1
[    0.474259] initcall mempolicy_sysfs_init+0x0/0xf0 returned 0 after 13 usecs
[    0.474265] calling  kfence_debugfs_init+0x0/0x50 @ 1
[    0.474283] initcall kfence_debugfs_init+0x0/0x50 returned 0 after 10 usecs
[    0.474288] calling  memory_tier_late_init+0x0/0xe8 @ 1
[    0.474355] Demotion targets for Node 0: null
[    0.474374] initcall memory_tier_late_init+0x0/0xe8 returned 0 after 82 usecs
[    0.474379] calling  split_huge_pages_debugfs+0x0/0x50 @ 1
[    0.474418] initcall split_huge_pages_debugfs+0x0/0x50 returned 0 after 36 usecs
[    0.474422] calling  pageowner_init+0x0/0xb8 @ 1
[    0.474426] page_owner is disabled
[    0.474439] initcall pageowner_init+0x0/0xb8 returned 0 after 13 usecs
[    0.474442] calling  check_early_ioremap_leak+0x0/0xa0 @ 1
[    0.474447] initcall check_early_ioremap_leak+0x0/0xa0 returned 0 after 1 usecs
[    0.474450] calling  set_hardened_usercopy+0x0/0x50 @ 1
[    0.474455] initcall set_hardened_usercopy+0x0/0x50 returned 1 after 0 usecs
[    0.474458] calling  mg_debugfs_init+0x0/0x50 @ 1
[    0.474492] initcall mg_debugfs_init+0x0/0x50 returned 0 after 30 usecs
[    0.474497] calling  fscrypt_init+0x0/0xf8 @ 1
[    0.474828] Key type .fscrypt registered
[    0.474867] Key type fscrypt-provisioning registered
[    0.474883] initcall fscrypt_init+0x0/0xf8 returned 0 after 382 usecs
[    0.474889] calling  fsverity_init+0x0/0x60 @ 1
[    0.474964] initcall fsverity_init+0x0/0x60 returned 0 after 71 usecs
[    0.474970] calling  init_btrfs_fs+0x0/0x188 @ 1
[    0.476104] Btrfs loaded, zoned=yes, fsverity=yes
[    0.476135] initcall init_btrfs_fs+0x0/0x188 returned 0 after 1159 usecs
[    0.476142] calling  pstore_init+0x0/0x48 @ 1
[    0.476181] initcall pstore_init+0x0/0x48 returned 0 after 33 usecs
[    0.476187] calling  bpf_fs_kfuncs_init+0x0/0x38 @ 1
[    0.476204] initcall bpf_fs_kfuncs_init+0x0/0x38 returned 0 after 11 usecs
[    0.476210] calling  init_root_keyring+0x0/0x38 @ 1
[    0.476237] initcall init_root_keyring+0x0/0x38 returned 0 after 21 usecs
[    0.476243] calling  big_key_init+0x0/0x38 @ 1
[    0.476249] Key type big_key registered
[    0.476264] initcall big_key_init+0x0/0x38 returned 0 after 16 usecs
[    0.476270] calling  init_trusted+0x0/0x148 @ 1
[    0.476295] initcall init_trusted+0x0/0x148 returned 0 after 19 usecs
[    0.476301] calling  init_encrypted+0x0/0x100 @ 1
[    0.476773] Key type encrypted registered
[    0.476789] initcall init_encrypted+0x0/0x100 returned 0 after 483 usecs
[    0.476795] calling  integrity_fs_init+0x0/0x80 @ 1
[    0.476835] initcall integrity_fs_init+0x0/0x80 returned 0 after 35 usecs
[    0.476839] calling  load_uefi_certs+0x0/0x310 @ 1
[    0.476845] initcall load_uefi_certs+0x0/0x310 returned 0 after 3 usecs
[    0.476849] calling  init_ima+0x0/0x120 @ 1
[    0.476854] ima: secureboot mode unknown, no efi
[    0.476891] ima: No TPM chip found, activating TPM-bypass!
[    0.476938] Loading compiled-in module X.509 certificates
[    0.477679] Loaded X.509 cert 'Fedora kernel signing key: aa4a8bf2c19aea7c8ab18eb543985ecbe856d6ca'
[    0.477739] ima: Allocated hash algorithm: sha256
[    0.477799] ima: No architecture policies found
[    0.477879] initcall init_ima+0x0/0x120 returned 0 after 1026 usecs
[    0.477885] calling  init_evm+0x0/0x1c8 @ 1
[    0.477889] evm: Initialising EVM extended attributes:
[    0.477906] evm: security.selinux
[    0.477918] evm: security.SMACK64 (disabled)
[    0.477931] evm: security.SMACK64EXEC (disabled)
[    0.477944] evm: security.SMACK64TRANSMUTE (disabled)
[    0.477957] evm: security.SMACK64MMAP (disabled)
[    0.477970] evm: security.apparmor (disabled)
[    0.477983] evm: security.ima
[    0.477993] evm: security.capability
[    0.478004] evm: HMAC attrs: 0x1
[    0.478107] initcall init_evm+0x0/0x1c8 returned 0 after 218 usecs
[    0.478113] calling  crypto_algapi_init+0x0/0xb8 @ 1
[    0.480043] alg: No test for 842 (842-scomp)
[    0.480068] alg: No test for 842 (842-generic)
[    0.481538] initcall crypto_algapi_init+0x0/0xb8 returned 0 after 3420 usecs
[    0.481544] calling  blk_timeout_init+0x0/0x28 @ 1
[    0.481549] initcall blk_timeout_init+0x0/0x28 returned 0 after 0 usecs
[    0.481554] calling  sed_opal_init+0x0/0xc8 @ 1
[    0.481569] initcall sed_opal_init+0x0/0xc8 returned 0 after 10 usecs
[    0.481574] calling  depot_debugfs_init+0x0/0x68 @ 1
[    0.481588] initcall depot_debugfs_init+0x0/0x68 returned 0 after 8 usecs
[    0.481593] calling  pci_resource_alignment_sysfs_init+0x0/0x40 @ 1
[    0.481604] initcall pci_resource_alignment_sysfs_init+0x0/0x40 returned 0 after 6 usecs
[    0.481609] calling  pci_sysfs_init+0x0/0xa8 @ 1
[    0.481617] initcall pci_sysfs_init+0x0/0xa8 returned 0 after 2 usecs
[    0.481622] calling  bert_init+0x0/0x300 @ 1
[    0.481627] initcall bert_init+0x0/0x300 returned 0 after 0 usecs
[    0.481631] calling  clk_debug_init+0x0/0x130 @ 1
[    0.489742] initcall clk_debug_init+0x0/0x130 returned 0 after 8105 usecs
[    0.489757] calling  genpd_debug_init+0x0/0xa0 @ 1
[    0.490307] initcall genpd_debug_init+0x0/0xa0 returned 0 after 544 usecs
[    0.490315] calling  sync_state_resume_initcall+0x0/0x30 @ 1
[    0.490322] initcall sync_state_resume_initcall+0x0/0x30 returned 0 after 1 usecs
[    0.490326] calling  deferred_probe_initcall+0x0/0xc8 @ 1
[    0.490604] probe of regulator-edp-3p3 returned -517 after 14 usecs
[    0.490767] probe of regulator-edp-bl returned -517 after 68 usecs
[    0.490853] probe of regulator-misc-3p3 returned -517 after 7 usecs
[    0.490943] probe of regulator-nvme returned -517 after 9 usecs
[    0.491029] probe of regulator-wlan returned -517 after 7 usecs
[    0.491120] probe of regulator-wwan returned -517 after 4 usecs
[    0.491120] probe of firmware:scm returned -517 after 2 usecs
[    0.491315] probe of 1c00000.pcie returned -517 after 9 usecs
[    0.491457] probe of 1c10000.pcie returned -517 after 14 usecs
[    0.491582] probe of 1c20000.pcie returned -517 after 8 usecs
[    0.491611] probe of 8c0000.geniqup returned -517 after 21 usecs
[    0.491680] probe of 9c0000.geniqup returned -517 after 7 usecs
[    0.491737] probe of ac0000.geniqup returned -517 after 6 usecs
[    0.491993] probe of 3da0000.iommu returned -517 after 1 usecs
[    0.492080] vreg_l2d: Setting 3072000-3072000uV
[    0.492142] probe of 15000000.iommu returned 517 after 50 usecs
[    0.492356] vreg_l3d: Setting 1200000-1200000uV
[    0.492369] probe of regulator-edp-3p3 returned -517 after 11 usecs
[    0.492490] probe of regulator-edp-bl returned -517 after 15 usecs
[    0.492553] vreg_l4d: Setting 1200000-1200000uV
[    0.492616] probe of regulator-misc-3p3 returned -517 after 8 usecs
[    0.492689] vreg_l6d: Setting 880000-880000uV
[    0.492733] probe of regulator-nvme returned -517 after 8 usecs
[    0.492861] vreg_l7d: Setting 3072000-3072000uV
[    0.492863] probe of regulator-wlan returned -517 after 6 usecs
[    0.492982] probe of firmware:scm returned -517 after 2 usecs
[    0.492986] probe of regulator-wwan returned -517 after 4 usecs
[    0.493017] vreg_l8d: Setting 912000-912000uV
[    0.493203] vreg_l9d: Setting 912000-912000uV
[    0.493249] probe of 1c00000.pcie returned -517 after 9 usecs
[    0.493358] vreg_l10d: Setting 912000-912000uV
[    0.493428] probe of 1c10000.pcie returned -517 after 8 usecs
[    0.493569] probe of 1c20000.pcie returned -517 after 8 usecs
[    0.493597] probe of 8c0000.geniqup returned -517 after 15 usecs
[    0.493677] probe of 9c0000.geniqup returned -517 after 9 usecs
[    0.493751] probe of ac0000.geniqup returned -517 after 9 usecs
[    0.493882] probe of 3da0000.iommu returned -517 after 2 usecs
[    0.494039] probe of 15000000.iommu returned 517 after 65 usecs
[    0.494068] initcall deferred_probe_initcall+0x0/0xc8 returned 0 after 3737 usecs
[    0.494075] calling  dm_init_init+0x0/0x3f0 @ 1
[    0.494079] initcall dm_init_init+0x0/0x3f0 returned 0 after 0 usecs
[    0.494082] calling  firmware_memmap_init+0x0/0x68 @ 1
[    0.494087] initcall firmware_memmap_init+0x0/0x68 returned 0 after 0 usecs
[    0.494090] calling  register_update_efi_random_seed+0x0/0x50 @ 1
[    0.494095] initcall register_update_efi_random_seed+0x0/0x50 returned 0 after 1 usecs
[    0.494098] calling  efi_shutdown_init+0x0/0x70 @ 1
[    0.494102] initcall efi_shutdown_init+0x0/0x70 returned -19 after 0 usecs
[    0.494105] calling  efi_earlycon_unmap_fb+0x0/0x68 @ 1
[    0.494109] initcall efi_earlycon_unmap_fb+0x0/0x68 returned 0 after 0 usecs
[    0.494113] calling  psci_debugfs_init+0x0/0x78 @ 1
[    0.494126] initcall psci_debugfs_init+0x0/0x78 returned 0 after 10 usecs
[    0.494131] calling  hid_bpf_init+0x0/0x80 @ 1
[    0.494173] initcall hid_bpf_init+0x0/0x80 returned 0 after 39 usecs
[    0.494176] calling  hid_bpf_struct_ops_init+0x0/0x38 @ 1
[    0.495585] probe of 18200000.rsc:regulators-2 returned 0 after 3597 usecs
[    0.495979] probe of regulator-edp-3p3 returned -517 after 16 usecs
[    0.495988] probe of regulator-edp-bl returned -517 after 15 usecs
[    0.496035] probe of regulator-misc-3p3 returned -517 after 13 usecs
[    0.496180] probe of firmware:scm returned -517 after 2 usecs
[    0.496492] probe of regulator-nvme returned -517 after 15 usecs
[    0.496551] probe of regulator-wwan returned -517 after 11 usecs
[    0.496624] probe of regulator-wlan returned -517 after 17 usecs
[    0.496738] probe of 1c00000.pcie returned -517 after 23 usecs
[    0.496790] probe of 1c20000.pcie returned -517 after 9 usecs
[    0.496796] probe of 8c0000.geniqup returned -517 after 19 usecs
[    0.496879] probe of 9c0000.geniqup returned -517 after 9 usecs
[    0.496952] probe of ac0000.geniqup returned -517 after 8 usecs
[    0.497082] probe of 3da0000.iommu returned -517 after 2 usecs
[    0.497226] probe of 15000000.iommu returned 517 after 50 usecs
[    0.497406] probe of 1c10000.pcie returned -517 after 5 usecs
[    0.499284] initcall hid_bpf_struct_ops_init+0x0/0x38 returned 0 after 5106 usecs
[    0.499292] calling  of_fdt_raw_init+0x0/0x98 @ 1
[    0.499319] initcall of_fdt_raw_init+0x0/0x98 returned 0 after 24 usecs
[    0.499322] calling  bpf_kfunc_init+0x0/0x118 @ 1
[    0.499356] initcall bpf_kfunc_init+0x0/0x118 returned 0 after 31 usecs
[    0.499360] calling  init_subsystem+0x0/0x40 @ 1
[    0.499371] initcall init_subsystem+0x0/0x40 returned 0 after 7 usecs
[    0.499374] calling  xdp_metadata_init+0x0/0x38 @ 1
[    0.499381] initcall xdp_metadata_init+0x0/0x38 returned 0 after 3 usecs
[    0.499384] calling  bpf_sockmap_iter_init+0x0/0x48 @ 1
[    0.499389] initcall bpf_sockmap_iter_init+0x0/0x48 returned 0 after 1 usecs
[    0.499392] calling  bpf_sk_storage_map_iter_init+0x0/0x48 @ 1
[    0.499396] initcall bpf_sk_storage_map_iter_init+0x0/0x48 returned 0 after 1 usecs
[    0.499400] calling  bpf_prog_test_run_init+0x0/0xd0 @ 1
[    0.499424] initcall bpf_prog_test_run_init+0x0/0xd0 returned 0 after 21 usecs
[    0.499429] calling  bpf_dummy_struct_ops_init+0x0/0x38 @ 1
[    0.502579] initcall bpf_dummy_struct_ops_init+0x0/0x38 returned 0 after 3146 usecs
[    0.502586] calling  tcp_congestion_default+0x0/0x40 @ 1
[    0.502591] initcall tcp_congestion_default+0x0/0x40 returned 0 after 1 usecs
[    0.502595] calling  inet_blackhole_dev_init+0x0/0x40 @ 1
[    0.502605] initcall inet_blackhole_dev_init+0x0/0x40 returned 0 after 6 usecs
[    0.502609] calling  tcp_bpf_v4_build_proto+0x0/0xd8 @ 1
[    0.502615] initcall tcp_bpf_v4_build_proto+0x0/0xd8 returned 0 after 1 usecs
[    0.502619] calling  udp_bpf_v4_build_proto+0x0/0x78 @ 1
[    0.502624] initcall udp_bpf_v4_build_proto+0x0/0x78 returned 0 after 0 usecs
[    0.502628] calling  bpf_tcp_ca_kfunc_init+0x0/0x48 @ 1
[    0.520277] initcall bpf_tcp_ca_kfunc_init+0x0/0x48 returned 0 after 17644 usecs
[    0.520290] calling  bpf_mptcp_kfunc_init+0x0/0x38 @ 1
[    0.520295] initcall bpf_mptcp_kfunc_init+0x0/0x38 returned 0 after 2 usecs
[    0.520298] calling  software_resume_initcall+0x0/0x68 @ 1
[    0.520305] initcall software_resume_initcall+0x0/0x68 returned -2 after 3 usecs
[    0.520308] calling  lockup_detector_check+0x0/0xa0 @ 1
[    0.520331] initcall lockup_detector_check+0x0/0xa0 returned 0 after 18 usecs
[    0.520335] calling  latency_fsnotify_init+0x0/0x50 @ 1
[    0.520371] initcall latency_fsnotify_init+0x0/0x50 returned 0 after 31 usecs
[    0.520376] calling  trace_eval_sync+0x0/0x38 @ 1
[    0.520395] initcall trace_eval_sync+0x0/0x38 returned 0 after 15 usecs
[    0.520400] calling  late_trace_init+0x0/0x68 @ 1
[    0.520404] initcall late_trace_init+0x0/0x68 returned 0 after 0 usecs
[    0.520410] calling  acpi_gpio_handle_deferred_request_irqs+0x0/0x90 @ 1
[    0.520418] initcall acpi_gpio_handle_deferred_request_irqs+0x0/0x90 returned 0 after 2 usecs
[    0.520421] calling  fb_logo_late_init+0x0/0x28 @ 1
[    0.520424] initcall fb_logo_late_init+0x0/0x28 returned 0 after 0 usecs
[    0.520426] calling  amba_stub_drv_init+0x0/0x50 @ 1
[    0.520471] initcall amba_stub_drv_init+0x0/0x50 returned 0 after 40 usecs
[    0.520476] calling  clk_disable_unused+0x0/0x100 @ 1
[    0.520481] clk: Not disabling unused clocks
[    0.521057] initcall clk_disable_unused+0x0/0x100 returned 0 after 576 usecs
[    0.521064] calling  imx_clk_disable_uart+0x0/0xa0 @ 1
[    0.521067] initcall imx_clk_disable_uart+0x0/0xa0 returned 0 after 0 usecs
[    0.521070] calling  genpd_power_off_unused+0x0/0xb8 @ 1
[    0.521076] PM: genpd: Not disabling unused power domains
[    0.521562] initcall genpd_power_off_unused+0x0/0xb8 returned 0 after 487 usecs
[    0.521569] calling  regulator_init_complete+0x0/0x60 @ 1
[    0.521577] initcall regulator_init_complete+0x0/0x60 returned 0 after 3 usecs
[    0.521582] calling  of_platform_sync_state_init+0x0/0x30 @ 1
[    0.522382] initcall of_platform_sync_state_init+0x0/0x30 returned 0 after 797 usecs
[    0.526751] Freeing unused kernel memory: 13120K
[    0.688336] Checked W+X mappings: passed, no W+X pages found
[    0.690048] Run /init as init process
[    0.693275]   with arguments:
[    0.693292]     /init
[    0.693296]   with environment:
[    0.693299]     HOME=/
[    0.693300]     TERM=linux
[    0.693302]     BOOT_IMAGE=(hd0,gpt2)/vmlinuz-6.13.1-300.vanilla.fc41.aarch64
[    0.701473] systemd[1]: System time before build time, advancing clock.
[    0.713323] systemd[1]: Successfully made /usr/ read-only.
[    0.715057] systemd[1]: systemd 256.11-1.fc41 running in system mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT +LIBARCHIVE)
[    0.716106] systemd[1]: Detected architecture arm64.
[    0.716628] systemd[1]: Running in initrd.
[    0.719580] systemd[1]: Hostname set to <x13s>.
[    0.826356] systemd[1]: Queued start job for default target initrd.target.
[    0.855813] systemd[1]: Expecting device dev-disk-by\x2duuid-66ed970b\x2db91a\x2d483e\x2d9b82\x2db10fdfc12ea7.device - /dev/disk/by-uuid/66ed970b-b91a-483e-9b82-b10fdfc12ea7...
[    0.858303] systemd[1]: Reached target initrd-usr-fs.target - Initrd /usr File System.
[    0.866240] systemd[1]: Reached target slices.target - Slice Units.
[    0.870231] systemd[1]: Reached target swap.target - Swaps.
[    0.872942] systemd[1]: Reached target timers.target - Timer Units.
[    0.875578] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[    0.882462] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[    0.889837] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[    0.896996] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    0.904581] systemd[1]: Reached target sockets.target - Socket Units.
[    0.918721] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[    0.925574] systemd[1]: memstrack.service - Memstrack Anylazing Service was skipped because no trigger condition checks were met.
[    0.950217] systemd[1]: Starting systemd-journald.service - Journal Service...
[    0.957876] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[    0.980018] systemd[1]: Starting systemd-vconsole-setup.service - Virtual Console Setup...
[    0.986274] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[    0.991082] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.service - Create Static Device Nodes in /dev gracefully...
[    1.005013] systemd-journald[259]: Collecting audit messages is disabled.
[    1.005008] calling  fuse_init+0x0/0x1b0 [fuse] @ 260
[    1.006076] fuse: init (API version 7.41)
[    1.007057] initcall fuse_init+0x0/0x1b0 [fuse] returned 0 after 980 usecs
[    1.008296] systemd[1]: Finished systemd-modules-load.service - Load Kernel Modules.
[    1.012654] systemd[1]: Starting systemd-sysctl.service - Apply Kernel Variables...
[    1.029979] systemd[1]: Finished systemd-tmpfiles-setup-dev-early.service - Create Static Device Nodes in /dev gracefully.
[    1.034117] systemd[1]: Starting systemd-sysusers.service - Create System Users...
[    1.039132] systemd[1]: Finished systemd-sysctl.service - Apply Kernel Variables.
[    1.045625] systemd[1]: Started systemd-journald.service - Journal Service.
[    2.071687] calling  qcom_smem_init+0x0/0xff8 [smem] @ 391
[    2.071761] probe of 80900000.smem-region returned -517 after 3 usecs
[    2.071921] initcall qcom_smem_init+0x0/0xff8 [smem] returned 0 after 215 usecs
[    2.076109] calling  qnoc_driver_init+0x0/0xff8 [qnoc_sc8280xp] @ 407
[    2.078287] probe of regulator-edp-3p3 returned -517 after 8 usecs
[    2.078336] probe of interconnect-aggre1-noc returned 0 after 2149 usecs
[    2.078582] probe of regulator-edp-bl returned -517 after 9 usecs
[    2.078710] probe of regulator-misc-3p3 returned -517 after 5 usecs
[    2.078738] probe of firmware:scm returned -517 after 2 usecs
[    2.078857] probe of regulator-nvme returned -517 after 4 usecs
[    2.078967] probe of regulator-wwan returned -517 after 6 usecs
[    2.079075] probe of regulator-wlan returned -517 after 5 usecs
[    2.079252] probe of 1c00000.pcie returned -517 after 5 usecs
[    2.079824] probe of 8c0000.geniqup returned -517 after 22 usecs
[    2.079902] probe of 9c0000.geniqup returned -517 after 7 usecs
[    2.079965] probe of ac0000.geniqup returned -517 after 7 usecs
[    2.080077] probe of 3da0000.iommu returned -517 after 2 usecs
[    2.080132] probe of 1c20000.pcie returned -517 after 5 usecs
[    2.080321] probe of 15000000.iommu returned 517 after 108 usecs
[    2.080563] probe of interconnect-aggre2-noc returned 0 after 2221 usecs
[    2.080626] probe of 1c10000.pcie returned -517 after 7 usecs
[    2.080740] probe of 80900000.smem-region returned -517 after 2 usecs
[    2.080845] probe of regulator-edp-3p3 returned -517 after 3 usecs
[    2.080954] probe of regulator-edp-bl returned -517 after 12 usecs
[    2.080981] probe of interconnect-clk-virt returned 0 after 408 usecs
[    2.081069] probe of regulator-misc-3p3 returned -517 after 5 usecs
[    2.081094] probe of firmware:scm returned -517 after 1 usecs
[    2.081206] probe of regulator-nvme returned -517 after 3 usecs
[    2.081307] probe of regulator-wwan returned -517 after 5 usecs
[    2.081408] probe of regulator-wlan returned -517 after 5 usecs
[    2.081579] probe of 1c00000.pcie returned -517 after 4 usecs
[    2.082261] probe of 8c0000.geniqup returned -517 after 21 usecs
[    2.082342] probe of 9c0000.geniqup returned -517 after 7 usecs
[    2.082407] probe of ac0000.geniqup returned -517 after 6 usecs
[    2.082715] probe of 3da0000.iommu returned -517 after 3 usecs
[    2.082863] probe of 15000000.iommu returned 517 after 67 usecs
[    2.083062] probe of 80900000.smem-region returned -517 after 1 usecs
[    2.083267] probe of 1c20000.pcie returned -517 after 11 usecs
[    2.083313] probe of 1c10000.pcie returned -517 after 2 usecs
[    2.083331] probe of regulator-edp-3p3 returned -517 after 2 usecs
[    2.083354] probe of regulator-edp-bl returned -517 after 8 usecs
[    2.097117] calling  pwm_backlight_driver_init+0x0/0xff8 [pwm_bl] @ 461
[    2.097246] probe of backlight returned -517 after 3 usecs
[    2.097281] initcall pwm_backlight_driver_init+0x0/0xff8 [pwm_bl] returned 0 after 149 usecs
[    2.099240] calling  gpio_keys_init+0x0/0xff8 [gpio_keys] @ 464
[    2.099364] probe of gpio-keys returned -517 after 7 usecs
[    2.099404] initcall gpio_keys_init+0x0/0xff8 [gpio_keys] returned 0 after 152 usecs
[    2.100288] probe of firmware:scm returned -517 after 4 usecs
[    2.100309] probe of regulator-misc-3p3 returned -517 after 18 usecs
[    2.100628] probe of regulator-nvme returned -517 after 7 usecs
[    2.100679] probe of regulator-wwan returned -517 after 11 usecs
[    2.100853] probe of regulator-wlan returned -517 after 9 usecs
[    2.101092] probe of 1c00000.pcie returned -517 after 8 usecs
[    2.101124] probe of 8c0000.geniqup returned -517 after 27 usecs
[    2.101240] probe of 9c0000.geniqup returned -517 after 12 usecs
[    2.101340] probe of ac0000.geniqup returned -517 after 11 usecs
[    2.101572] probe of 3da0000.iommu returned -517 after 4 usecs
[    2.101784] probe of 15000000.iommu returned 517 after 70 usecs
[    2.101963] probe of 80900000.smem-region returned -517 after 3 usecs
[    2.102191] probe of 1c20000.pcie returned -517 after 6 usecs
[    2.102230] probe of interconnect-config-noc returned 0 after 21240 usecs
[    2.102289] probe of interconnect-dc-noc returned 0 after 52 usecs
[    2.102728] probe of 1c10000.pcie returned -517 after 6 usecs
[    2.102930] probe of regulator-edp-3p3 returned -517 after 4 usecs
[    2.103578] probe of backlight returned -517 after 4 usecs
[    2.103728] probe of gpio-keys returned -517 after 7 usecs
[    2.103771] probe of firmware:scm returned -517 after 1 usecs
[    2.104598] probe of regulator-edp-bl returned -517 after 15 usecs
[    2.104631] probe of regulator-misc-3p3 returned -517 after 4 usecs
[    2.104656] probe of regulator-nvme returned -517 after 5 usecs
[    2.104679] probe of regulator-wwan returned -517 after 4 usecs
[    2.104701] probe of regulator-wlan returned -517 after 3 usecs
[    2.104767] probe of 1c00000.pcie returned -517 after 4 usecs
[    2.104880] probe of interconnect-gem-noc returned 0 after 2586 usecs
[    2.105072] probe of 8c0000.geniqup returned -517 after 21 usecs
[    2.105209] probe of 9c0000.geniqup returned -517 after 14 usecs
[    2.105319] probe of ac0000.geniqup returned -517 after 10 usecs
[    2.105518] probe of 3da0000.iommu returned -517 after 4 usecs
[    2.105577] probe of interconnect-lpass-ag-noc returned 0 after 687 usecs
[    2.105960] probe of interconnect-mc-virt returned 0 after 377 usecs
[    2.106035] probe of 15000000.iommu returned 517 after 137 usecs
[    2.106210] probe of 80900000.smem-region returned -517 after 2 usecs
[    2.106430] probe of 1c20000.pcie returned -517 after 5 usecs
[    2.106704] probe of 1c10000.pcie returned -517 after 5 usecs
[    2.106922] probe of regulator-edp-3p3 returned -517 after 5 usecs
[    2.107127] probe of backlight returned -517 after 2 usecs
[    2.107277] probe of gpio-keys returned -517 after 4 usecs
[    2.107615] probe of interconnect-mmss-noc returned 0 after 1648 usecs
[    2.108590] qcom_scm firmware:scm: of_icc_get_by_index: invalid path=-517
[    2.108611] probe of firmware:scm returned 517 after 1295 usecs
[    2.108879] calling  qcom_smp2p_driver_init+0x0/0xff8 [smp2p] @ 461
[    2.108960] probe of smp2p-adsp returned -517 after 2 usecs
[    2.108966] probe of smp2p-nsp0 returned -517 after 0 usecs
[    2.108970] probe of smp2p-nsp1 returned -517 after 0 usecs
[    2.109039] probe of regulator-edp-bl returned -517 after 14 usecs
[    2.109066] initcall qcom_smp2p_driver_init+0x0/0xff8 [smp2p] returned 0 after 173 usecs
[    2.109327] probe of regulator-misc-3p3 returned -517 after 10 usecs
[    2.110602] probe of 8c0000.geniqup returned -517 after 24 usecs
[    2.110662] probe of regulator-nvme returned -517 after 6 usecs
[    2.110693] probe of regulator-wwan returned -517 after 5 usecs
[    2.110716] probe of regulator-wlan returned -517 after 4 usecs
[    2.110776] probe of 1c00000.pcie returned -517 after 3 usecs
[    2.110866] probe of interconnect-nspa-noc returned 0 after 3242 usecs
[    2.111034] probe of interconnect-nspb-noc returned 0 after 160 usecs
[    2.111197] probe of 9c0000.geniqup returned -517 after 14 usecs
[    2.111328] probe of ac0000.geniqup returned -517 after 11 usecs
[    2.111538] probe of 3da0000.iommu returned -517 after 3 usecs
[    2.111732] probe of 15000000.iommu returned 517 after 59 usecs
[    2.111894] probe of 80900000.smem-region returned -517 after 2 usecs
[    2.112055] probe of interconnect-system-noc returned 0 after 995 usecs
[    2.112229] probe of 1c20000.pcie returned -517 after 6 usecs
[    2.112238] initcall qnoc_driver_init+0x0/0xff8 [qnoc_sc8280xp] returned 0 after 3345 usecs
[    2.114048] probe of backlight returned -517 after 4 usecs
[    2.114217] probe of gpio-keys returned -517 after 8 usecs
[    2.114332] qcom_scm: convention: smc arm 64
[    2.114617] probe of 1c10000.pcie returned -517 after 6 usecs
[    2.114657] probe of regulator-edp-3p3 returned -517 after 3 usecs
[    2.114751] qcom_scm firmware:scm: qseecom: found qseecom with version 0x1402000
[    2.133050] calling  typec_init+0x0/0xd8 [typec] @ 431
[    2.133138] initcall typec_init+0x0/0xd8 [typec] returned 0 after 58 usecs
[    2.133219] qcom_qseecom qcom_qseecom: setting up client for qcom.tz.uefisecapp
[    2.134488] calling  ghash_ce_mod_init+0x0/0xff8 [ghash_ce] @ 464
[    2.134511] calling  qcom_rng_driver_init+0x0/0xff8 [qcom_rng] @ 480
[    2.134657] initcall ghash_ce_mod_init+0x0/0xff8 [ghash_ce] returned 0 after 134 usecs
[    2.136247] alg: No test for stdrng (qcom-rng)
[    2.138367] probe of 10d3000.rng returned 0 after 3773 usecs
[    2.138656] initcall qcom_rng_driver_init+0x0/0xff8 [qcom_rng] returned 0 after 4132 usecs
[    2.138754] calling  pwrseq_init+0x0/0xff8 [pwrseq_core] @ 429
[    2.138802] initcall pwrseq_init+0x0/0xff8 [pwrseq_core] returned 0 after 38 usecs
[    2.138857] efivars: Registered efivars operations
[    2.138884] probe of qcom_qseecom returned 0 after 5880 usecs
[    2.139790] probe of qcom_qseecom.uefisecapp.0 returned 0 after 1393 usecs
[    2.139833] probe of firmware:scm returned 0 after 25578 usecs
[    2.140191] probe of smp2p-adsp returned -517 after 3 usecs
[    2.140335] probe of smp2p-nsp0 returned -517 after 0 usecs
[    2.140434] probe of smp2p-nsp1 returned -517 after 0 usecs
[    2.140628] probe of regulator-edp-bl returned -517 after 16 usecs
[    2.140716] probe of regulator-misc-3p3 returned -517 after 7 usecs
[    2.140816] probe of regulator-nvme returned -517 after 10 usecs
[    2.140914] probe of regulator-wwan returned -517 after 9 usecs
[    2.141014] probe of regulator-wlan returned -517 after 7 usecs
[    2.141202] probe of 1c00000.pcie returned -517 after 5 usecs
[    2.141231] probe of 8c0000.geniqup returned -517 after 21 usecs
[    2.141306] probe of 9c0000.geniqup returned -517 after 7 usecs
[    2.141364] probe of ac0000.geniqup returned -517 after 6 usecs
[    2.141485] probe of 3da0000.iommu returned -517 after 1 usecs
[    2.141587] calling  qmp_pcie_driver_init+0x0/0xff8 [phy_qcom_qmp_pcie] @ 493
[    2.142227] calling  polyval_mod_init+0x0/0xff8 [polyval_generic] @ 488
[    2.142544] initcall polyval_mod_init+0x0/0xff8 [polyval_generic] returned 0 after 307 usecs
[    2.143948] calling  osm_l3_driver_init+0x0/0xff8 [icc_osm_l3] @ 436
[    2.144196] probe of 18590000.interconnect returned 0 after 96 usecs
[    2.144243] initcall osm_l3_driver_init+0x0/0xff8 [icc_osm_l3] returned 0 after 286 usecs
[    2.144548] arm-smmu 15000000.iommu: probing hardware configuration...
[    2.144552] arm-smmu 15000000.iommu: SMMUv2 with:
[    2.144564] arm-smmu 15000000.iommu: 	stage 1 translation
[    2.144565] arm-smmu 15000000.iommu: 	coherent table walk
[    2.144568] arm-smmu 15000000.iommu: 	stream matching with 162 register groups
[    2.144576] arm-smmu 15000000.iommu: 	110 context banks (0 stage-2 only)
[    2.144588] arm-smmu 15000000.iommu: 	Limiting the stream matching groups to 128
[    2.144638] calling  rpmsg_init+0x0/0xff8 [rpmsg_core] @ 470
[    2.144679] initcall rpmsg_init+0x0/0xff8 [rpmsg_core] returned 0 after 31 usecs
[    2.144925] arm-smmu 15000000.iommu: 	Supported page sizes: 0x61311000
[    2.148603] arm-smmu 15000000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
[    2.151890] calling  pwrseq_qcom_wcn_driver_init+0x0/0xff8 [pwrseq_qcom_wcn] @ 429
[    2.152032] probe of wcn6855-pmu returned -517 after 7 usecs
[    2.152075] initcall pwrseq_qcom_wcn_driver_init+0x0/0xff8 [pwrseq_qcom_wcn] returned 0 after 174 usecs
[    2.152247] calling  gpio_sbu_mux_driver_init+0x0/0xff8 [gpio_sbu_mux] @ 431
[    2.152359] probe of usb0-sbu-mux returned -517 after 6 usecs
[    2.152367] probe of usb1-sbu-mux returned -517 after 2 usecs
[    2.152392] initcall gpio_sbu_mux_driver_init+0x0/0xff8 [gpio_sbu_mux] returned 0 after 133 usecs
[    2.152592] calling  qcom_watchdog_driver_init+0x0/0xff8 [qcom_wdt] @ 477
[    2.152799] arm-smmu 15000000.iommu: 	preserved 0 boot mappings
[    2.155111] calling  pmic_glink_init+0x0/0x88 [pmic_glink] @ 470
[    2.155252] probe of pmic-glink returned -517 after 3 usecs
[    2.155327] initcall pmic_glink_init+0x0/0x88 [pmic_glink] returned 0 after 199 usecs
[    2.155383] calling  cpu_feature_match_PMULL_init+0x0/0xff8 [polyval_ce] @ 464
[    2.155495] initcall cpu_feature_match_PMULL_init+0x0/0xff8 [polyval_ce] returned 0 after 99 usecs
[    2.157562] probe of 15000000.iommu returned 0 after 15998 usecs
[    2.157852] calling  cpu_feature_match_ASIMD_init+0x0/0xff8 [crct10dif_ce] @ 464
[    2.158001] initcall cpu_feature_match_ASIMD_init+0x0/0xff8 [crct10dif_ce] returned 0 after 136 usecs
[    2.165191] calling  qmp_driver_init+0x0/0xff8 [qcom_aoss] @ 393
[    2.177730] calling  qcom_hwspinlock_init+0x0/0xff8 [qcom_hwspinlock] @ 395
[    2.184286] probe of c300000.power-management returned -517 after 18947 usecs
[    2.184461] probe of 80900000.smem-region returned -517 after 4 usecs
[    2.184737] probe of 1c20000.pcie returned -517 after 10 usecs
[    2.184750] probe of backlight returned -517 after 1 usecs
[    2.184831] probe of gpio-keys returned -517 after 5 usecs
[    2.185032] probe of 1c10000.pcie returned -517 after 8 usecs
[    2.185131] probe of smp2p-adsp returned -517 after 1 usecs
[    2.185201] probe of smp2p-nsp0 returned -517 after 0 usecs
[    2.185271] probe of smp2p-nsp1 returned -517 after 0 usecs
[    2.185759] probe of 1f40000.hwlock returned 0 after 7928 usecs
[    2.185916] initcall qcom_hwspinlock_init+0x0/0xff8 [qcom_hwspinlock] returned 0 after 8168 usecs
[    2.186065] geni_se_qup 8c0000.geniqup: Adding to iommu group 0
[    2.186513] calling  lpasscc_sc8280xp_driver_init+0x0/0xff8 [lpasscc_sc8280xp] @ 475
[    2.186788] probe of regulator-edp-3p3 returned -517 after 263 usecs
[    2.186789] probe of 1c06000.phy returned 0 after 45076 usecs
[    2.186815] probe of regulator-edp-bl returned -517 after 231 usecs
[    2.186887] probe of regulator-nvme returned -517 after 12 usecs
[    2.187000] probe of regulator-wwan returned -517 after 67 usecs
[    2.187336] probe of regulator-wlan returned -517 after 298 usecs
[    2.187345] probe of 8c0000.geniqup returned 0 after 1398 usecs
[    2.187449] probe of 1c00000.pcie returned -517 after 7 usecs
[    2.187481] probe of regulator-misc-3p3 returned -517 after 880 usecs
[    2.187654] geni_se_qup 9c0000.geniqup: Adding to iommu group 1
[    2.187734] probe of 1c14000.phy returned 0 after 928 usecs
[    2.188072] calling  qcom_ipcc_init+0x0/0xff8 [qcom_ipcc] @ 429
[    2.188130] probe of 1c24000.phy returned 0 after 385 usecs
[    2.188332] initcall qmp_pcie_driver_init+0x0/0xff8 [phy_qcom_qmp_pcie] returned 0 after 1461 usecs
[    2.188353] probe of 988000.serial returned -517 after 4 usecs
[    2.188921] probe of 9c0000.geniqup returned 0 after 1350 usecs
[    2.188963] probe of 408000.mailbox returned 0 after 322 usecs
[    2.189045] initcall qcom_ipcc_init+0x0/0xff8 [qcom_ipcc] returned 0 after 458 usecs
[    2.189073] geni_se_qup ac0000.geniqup: Adding to iommu group 2
[    2.189441] probe of 17c10000.watchdog returned 0 after 36759 usecs
[    2.189818] probe of ac0000.geniqup returned 0 after 814 usecs
[    2.189826] initcall qcom_watchdog_driver_init+0x0/0xff8 [qcom_wdt] returned 0 after 1240 usecs
[    2.189911] calling  lpi_pinctrl_driver_init+0x0/0xff8 [pinctrl_sc8280xp_lpass_lpi] @ 398
[    2.189931] probe of 3da0000.iommu returned -517 after 1 usecs
[    2.190008] probe of 33c0000.pinctrl returned -517 after 19 usecs
[    2.190065] probe of wcn6855-pmu returned -517 after 3 usecs
[    2.190064] initcall lpi_pinctrl_driver_init+0x0/0xff8 [pinctrl_sc8280xp_lpass_lpi] returned 0 after 144 usecs
[    2.190192] probe of usb0-sbu-mux returned -517 after 7 usecs
[    2.190289] probe of usb1-sbu-mux returned -517 after 6 usecs
[    2.190366] probe of 32a9000.clock-controller returned 0 after 205 usecs
[    2.190424] probe of pmic-glink returned -517 after 1 usecs
[    2.190542] probe of 33e0000.clock-controller returned 0 after 167 usecs
[    2.190611] initcall lpasscc_sc8280xp_driver_init+0x0/0xff8 [lpasscc_sc8280xp] returned 0 after 691 usecs
[    2.195173] probe of c300000.power-management returned 0 after 4537 usecs
[    2.195616] probe of 80900000.smem-region returned 0 after 236 usecs
[    2.195784] calling  gpu_cc_sc8280xp_driver_init+0x0/0xff8 [gpucc_sc8280xp] @ 436
[    2.195918] probe of 1c20000.pcie returned -517 after 23 usecs
[    2.195943] probe of backlight returned -517 after 2 usecs
[    2.196190] probe of gpio-keys returned -517 after 8 usecs
[    2.196501] probe of 1c10000.pcie returned -517 after 11 usecs
[    2.198390] probe of 3d90000.clock-controller returned 0 after 2511 usecs
[    2.198843] calling  qcom_snps_hsphy_driver_init+0x0/0xff8 [phy_qcom_snps_femto_v2] @ 433
[    2.199234] probe of 88e5000.phy returned 0 after 286 usecs
[    2.199421] probe of 88e7000.phy returned 0 after 179 usecs
[    2.200240] probe of 88e8000.phy returned 0 after 812 usecs
[    2.200547] probe of 88e9000.phy returned 0 after 297 usecs
[    2.201272] initcall qmp_driver_init+0x0/0xff8 [qcom_aoss] returned 0 after 2414 usecs
[    2.203975] calling  qcom_llcc_driver_init+0x0/0xff8 [llcc_qcom] @ 477
[    2.206145] initcall gpu_cc_sc8280xp_driver_init+0x0/0xff8 [gpucc_sc8280xp] returned 0 after 2157 usecs
[    2.206219] calling  bwmon_driver_init+0x0/0xff8 [icc_bwmon] @ 429
[    2.206313] calling  sysmon_driver_init+0x0/0xff8 [qcom_sysmon] @ 393
[    2.206350] initcall sysmon_driver_init+0x0/0xff8 [qcom_sysmon] returned 0 after 28 usecs
[    2.206456] probe of 88ea000.phy returned 0 after 5901 usecs
[    2.206458] probe of smp2p-adsp returned 0 after 9264 usecs
[    2.206852] probe of 9200000.system-cache-controller returned 0 after 2717 usecs
[    2.206916] probe of 8902000.phy returned 0 after 418 usecs
[    2.206975] initcall qcom_llcc_driver_init+0x0/0xff8 [llcc_qcom] returned 0 after 653 usecs
[    2.206999] initcall qcom_snps_hsphy_driver_init+0x0/0xff8 [phy_qcom_snps_femto_v2] returned 0 after 677 usecs
[    2.207309] calling  qfprom_driver_init+0x0/0xff8 [nvmem_qfprom] @ 431
[    2.207622] probe of smp2p-nsp0 returned 0 after 843 usecs
[    2.207673] probe of 9091000.pmu returned 0 after 751 usecs
[    2.207975] probe of smp2p-nsp1 returned 0 after 193 usecs
[    2.208228] probe of 1c00000.pcie returned -517 after 12 usecs
[    2.208288] probe of 784000.efuse returned 0 after 923 usecs
[    2.208408] initcall qfprom_driver_init+0x0/0xff8 [nvmem_qfprom] returned 0 after 1088 usecs
[    2.208649] probe of 90b6400.pmu returned 0 after 966 usecs
[    2.208707] probe of regulator-edp-bl returned -517 after 31 usecs
[    2.208764] initcall bwmon_driver_init+0x0/0xff8 [icc_bwmon] returned 0 after 1444 usecs
[    2.208795] probe of regulator-wwan returned -517 after 40 usecs
[    2.208816] probe of regulator-nvme returned -517 after 9 usecs
[    2.208916] probe of regulator-wlan returned -517 after 16 usecs
[    2.209035] probe of regulator-misc-3p3 returned -517 after 5 usecs
[    2.209207] probe of 988000.serial returned -517 after 6 usecs
[    2.209876] probe of regulator-edp-3p3 returned -517 after 5 usecs
[    2.218617] calling  camcc_sc8280xp_driver_init+0x0/0xff8 [camcc_sc8280xp] @ 398
[    2.227622] calling  qcom_smd_init+0x0/0xff8 [qcom_smd] @ 393
[    2.227624] calling  qcom_edp_phy_driver_init+0x0/0xff8 [phy_qcom_edp] @ 475
[    2.228710] calling  qmp_usb_driver_init+0x0/0xff8 [phy_qcom_qmp_usb] @ 411
[    2.228723] calling  drm_aux_bridge_drv_init+0x0/0xff8 [aux_bridge] @ 387
[    2.228780] initcall drm_aux_bridge_drv_init+0x0/0xff8 [aux_bridge] returned 0 after 42 usecs
[    2.231255] arm-smmu 3da0000.iommu: probing hardware configuration...
[    2.231264] arm-smmu 3da0000.iommu: SMMUv2 with:
[    2.231288] arm-smmu 3da0000.iommu: 	stage 1 translation
[    2.231291] arm-smmu 3da0000.iommu: 	coherent table walk
[    2.231295] arm-smmu 3da0000.iommu: 	stream matching with 9 register groups
[    2.231315] arm-smmu 3da0000.iommu: 	7 context banks (0 stage-2 only)
[    2.231337] arm-smmu 3da0000.iommu: 	Supported page sizes: 0x61311000
[    2.231341] arm-smmu 3da0000.iommu: 	Stage-1: 48-bit VA -> 36-bit IPA
[    2.235343] initcall qcom_smd_init+0x0/0xff8 [qcom_smd] returned 0 after 6605 usecs
[    2.242288] calling  dwc3_qcom_driver_init+0x0/0xff8 [dwc3_qcom] @ 410
[    2.242500] calling  qmp_combo_driver_init+0x0/0xff8 [phy_qcom_qmp_combo] @ 387
[    2.246706] calling  dp_aux_bus_init+0x0/0xff8 [drm_dp_aux_bus] @ 382
[    2.246764] initcall dp_aux_bus_init+0x0/0xff8 [drm_dp_aux_bus] returned 0 after 43 usecs
[    2.246789] calling  qcom_glink_ssr_driver_init+0x0/0xff8 [qcom_glink] @ 426
[    2.249116] calling  sc8280xp_pinctrl_init+0x0/0xff8 [pinctrl_sc8280xp] @ 407
[    2.249576] probe of ad00000.clock-controller returned 0 after 30827 usecs
[    2.249600] arm-smmu 3da0000.iommu: 	preserved 0 boot mappings
[    2.249603] calling  qcom_stats_init+0x0/0xff8 [qcom_stats] @ 477
[    2.250614] probe of 88ef000.phy returned 0 after 21800 usecs
[    2.252023] probe of aec5a00.phy returned 517 after 23330 usecs
[    2.252692] calling  qcom_cci_driver_init+0x0/0xff8 [i2c_qcom_cci] @ 404
[    2.252832] probe of ac4c000.cci returned -517 after 7 usecs
[    2.252922] initcall qcom_cci_driver_init+0x0/0xff8 [i2c_qcom_cci] returned 0 after 219 usecs
[    2.254673] initcall qcom_glink_ssr_driver_init+0x0/0xff8 [qcom_glink] returned 0 after 1970 usecs
[    2.255310] initcall camcc_sc8280xp_driver_init+0x0/0xff8 [camcc_sc8280xp] returned 0 after 2607 usecs
[    2.255488] probe of 3da0000.iommu returned 0 after 46126 usecs
[    2.255839] probe of 88f1000.phy returned 0 after 5213 usecs
[    2.255979] initcall qmp_usb_driver_init+0x0/0xff8 [phy_qcom_qmp_usb] returned 0 after 3276 usecs
[    2.256045] probe of f100000.pinctrl returned 0 after 6808 usecs
[    2.256072] initcall sc8280xp_pinctrl_init+0x0/0xff8 [pinctrl_sc8280xp] returned 0 after 3368 usecs
[    2.256335] probe of 33c0000.pinctrl returned -517 after 15 usecs
[    2.256715] probe of c3f0000.sram returned 0 after 1441 usecs
[    2.256776] initcall qcom_stats_init+0x0/0xff8 [qcom_stats] returned 0 after 4072 usecs
[    2.257246] probe of aux_bridge.aux_bridge.0 returned 517 after 129 usecs
[    2.257285] probe of wcn6855-pmu returned 0 after 751 usecs
[    2.257645] probe of usb0-sbu-mux returned 0 after 165 usecs
[    2.257795] calling  cec_devnode_init+0x0/0xff8 [cec] @ 382
[    2.257838] initcall cec_devnode_init+0x0/0xff8 [cec] returned 0 after 30 usecs
[    2.257898] probe of usb1-sbu-mux returned 0 after 120 usecs
[    2.258190] initcall qcom_edp_phy_driver_init+0x0/0xff8 [phy_qcom_edp] returned 0 after 381 usecs
[    2.258420] probe of 88eb000.phy returned 0 after 15814 usecs
[    2.265200] calling  disp_cc_sc8280xp_driver_init+0x0/0xff8 [dispcc_sc8280xp] @ 458
[    2.281746] probe of aux_bridge.aux_bridge.1 returned 517 after 689 usecs
[    2.286928] calling  qrtr_proto_init+0x0/0xff8 [qrtr] @ 1391
[    2.286921] calling  drm_display_helper_module_init+0x0/0xff8 [drm_display_helper] @ 382
[    2.288238] probe of 8903000.phy returned 0 after 29805 usecs
[    2.288383] initcall qmp_combo_driver_init+0x0/0xff8 [phy_qcom_qmp_combo] returned 0 after 1421 usecs
[    2.290433] initcall drm_display_helper_module_init+0x0/0xff8 [drm_display_helper] returned 0 after 3470 usecs
[    2.290510] NET: Registered PF_QIPCRTR protocol family
[    2.290555] initcall qrtr_proto_init+0x0/0xff8 [qrtr] returned 0 after 3593 usecs
[    2.290567] probe of af00000.clock-controller returned 0 after 25194 usecs
[    2.290624] initcall disp_cc_sc8280xp_driver_init+0x0/0xff8 [dispcc_sc8280xp] returned 0 after 3662 usecs
[    2.291223] probe of pmic-glink returned 0 after 33181 usecs
[    2.291657] probe of 1c20000.pcie returned -517 after 4 usecs
[    2.291709] probe of backlight returned -517 after 2 usecs
[    2.297881] calling  drm_sched_fence_slab_init+0x0/0xff8 [gpu_sched] @ 382
[    2.297953] initcall drm_sched_fence_slab_init+0x0/0xff8 [gpu_sched] returned 0 after 51 usecs
[    2.301640] calling  ocmem_driver_init+0x0/0xff8 [ocmem] @ 382
[    2.301811] initcall ocmem_driver_init+0x0/0xff8 [ocmem] returned 0 after 157 usecs
[    2.307823] calling  pmic_spmi_driver_init+0x0/0xff8 [qcom_spmi_pmic] @ 481
[    2.309352] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    2.309530] probe of gpio-keys returned 0 after 17719 usecs
[    2.310432] probe of 1c10000.pcie returned -517 after 4 usecs
[    2.310578] probe of regulator-edp-bl returned -517 after 28 usecs
[    2.310585] probe of 1c00000.pcie returned -517 after 1 usecs
[    2.310732] probe of regulator-wwan returned -517 after 109 usecs
[    2.310798] probe of regulator-wlan returned -517 after 9 usecs
[    2.311600] probe of regulator-misc-3p3 returned -517 after 13 usecs
[    2.312155] probe of 988000.serial:0 returned 0 after 15 usecs
[    2.312201] probe of 988000.serial:0.0 returned 0 after 11 usecs
[    2.312229] 988000.serial: ttyHS1 at MMIO 0x988000 (irq = 182, base_baud = 0) is a MSM
[    2.312233] calling  adsp_driver_init+0x0/0xff8 [qcom_q6v5_pas] @ 426
[    2.312531] serial serial0: tty port ttyHS1 registered
[    2.313378] probe of 988000.serial returned 0 after 1721 usecs
[    2.313880] probe of 0-00 returned 0 after 6010 usecs
[    2.314057] probe of regulator-edp-3p3 returned 0 after 409 usecs
[    2.314205] remoteproc remoteproc0: adsp is available
[    2.314422] probe of 3000000.remoteproc returned 0 after 1891 usecs
[    2.314707] probe of aec5a00.phy returned 0 after 801 usecs
[    2.315646] /soc@0/camss@ac5a000: Fixed dependency cycle(s) with /soc@0/cci@ac4c000/i2c-bus@1/camera@10
[    2.315696] /soc@0/cci@ac4c000/i2c-bus@1/camera@10: Fixed dependency cycle(s) with /soc@0/camss@ac5a000
[    2.315828] probe of ac4c000.cci returned 0 after 659 usecs
[    2.316052] probe of 33c0000.pinctrl returned 517 after 70 usecs
[    2.316250] remoteproc remoteproc1: cdsp is available
[    2.323629] probe of c440000.spmi:pmic@1:gpio@8800 returned 0 after 9128 usecs
[    2.323662] probe of aux_bridge.aux_bridge.0 returned 517 after 5943 usecs
[    2.323743] probe of aux_bridge.aux_bridge.1 returned 517 after 69 usecs
[    2.345365] probe of regulator-nvme returned 0 after 34737 usecs
[    2.345595] probe of backlight returned -517 after 3 usecs
[    2.347839] qcom-pcie 1c20000.pcie: supply vdda not found, using dummy regulator
[    2.348019] qcom-pcie 1c20000.pcie: host bridge /soc@0/pcie@1c20000 ranges:
[    2.348062] qcom-pcie 1c20000.pcie:       IO 0x003c200000..0x003c2fffff -> 0x0000000000
[    2.348078] qcom-pcie 1c20000.pcie:      MEM 0x003c300000..0x003dffffff -> 0x003c300000
[    2.348105] probe of 0-01 returned 0 after 34213 usecs
[    2.348551] probe of regulator-edp-bl returned 0 after 636 usecs
[    2.363867] probe of 1c10000.pcie returned -517 after 18081 usecs
[    2.363949] probe of 1b300000.remoteproc returned 0 after 48830 usecs
[    2.364095] initcall adsp_driver_init+0x0/0xff8 [qcom_q6v5_pas] returned 0 after 51843 usecs
[    2.364178] probe of 1c00000.pcie returned -517 after 13308 usecs
[    2.364220] probe of regulator-wlan returned -517 after 13275 usecs
[    2.364245] probe of 33c0000.pinctrl returned 517 after 15635 usecs
[    2.364327] probe of aux_bridge.aux_bridge.0 returned 517 after 33 usecs
[    2.364349] probe of aux_bridge.aux_bridge.1 returned 517 after 17 usecs
[    2.364410] probe of regulator-wwan returned -517 after 13519 usecs
[    2.364589] probe of a4f8800.usb returned 0 after 122193 usecs
[    2.364862] probe of regulator-misc-3p3 returned 0 after 13886 usecs
[    2.368864] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a600000.usb for /pmic-glink/connector@0
[    2.370487] probe of a6f8800.usb returned 0 after 5889 usecs
[    2.375417] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a800000.usb for /pmic-glink/connector@1
[    2.377861] probe of a8f8800.usb returned 0 after 7365 usecs
[    2.377921] initcall dwc3_qcom_driver_init+0x0/0xff8 [dwc3_qcom] returned 0 after 65669 usecs
[    2.399563] probe of c440000.spmi:pmic@2:gpio@8800 returned 0 after 51035 usecs
[    2.401583] probe of 0-02 returned 0 after 53469 usecs
[    2.422549] probe of c440000.spmi:pmic@3:gpio@8800 returned 0 after 20518 usecs
[    2.422574] probe of 0-03 returned 0 after 20978 usecs
[    2.444648] probe of c440000.spmi:pmic@4:gpio@8800 returned 0 after 21833 usecs
[    2.444671] probe of 0-04 returned 0 after 22086 usecs
[    2.444698] initcall pmic_spmi_driver_init+0x0/0xff8 [qcom_spmi_pmic] returned 0 after 132446 usecs
[    2.460022] qcom-pcie 1c20000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    2.467990] remoteproc remoteproc1: powering up cdsp
[    2.472120] remoteproc remoteproc1: Booting fw image qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn, size 3575808
[    2.554503] qcom-pcie 1c20000.pcie: PCIe Gen.3 x4 link up
[    2.554726] qcom-pcie 1c20000.pcie: PCI host bridge to bus 0002:00
[    2.554734] pci_bus 0002:00: root bus resource [bus 00-ff]
[    2.554738] pci_bus 0002:00: root bus resource [io  0x0000-0xfffff]
[    2.554741] pci_bus 0002:00: root bus resource [mem 0x3c300000-0x3dffffff]
[    2.554796] pci 0002:00:00.0: calling  quirk_cmd_compl+0x0/0xb0 @ 1279
[    2.554809] pci 0002:00:00.0: quirk_cmd_compl+0x0/0xb0 took 0 usecs
[    2.554815] pci 0002:00:00.0: [17cb:010e] type 01 class 0x060400 PCIe Root Port
[    2.554825] pci 0002:00:00.0: BAR 0 [mem 0x00000000-0x00000fff]
[    2.554832] pci 0002:00:00.0: PCI bridge to [bus 01-ff]
[    2.554837] pci 0002:00:00.0:   bridge window [io  0x0000-0x0fff]
[    2.554840] pci 0002:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    2.554845] pci 0002:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    2.554883] pci 0002:00:00.0: PME# supported from D0 D3hot D3cold
[    2.556968] pci 0002:01:00.0: [1cc4:6303] type 00 class 0x010802 PCIe Endpoint
[    2.564650] pci 0002:01:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
[    2.567483] pci 0002:01:00.0: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0002:00:00.0 (capable of 63.012 Gb/s with 16.0 GT/s PCIe x4 link)
[    2.647625] pci 0002:00:00.0: bridge window [mem 0x3c300000-0x3c3fffff]: assigned
[    2.647636] pci 0002:00:00.0: BAR 0 [mem 0x3c400000-0x3c400fff]: assigned
[    2.647645] pci 0002:01:00.0: BAR 0 [mem 0x3c300000-0x3c303fff 64bit]: assigned
[    2.647687] pci 0002:00:00.0: PCI bridge to [bus 01-ff]
[    2.650564] pci 0002:00:00.0:   bridge window [mem 0x3c300000-0x3c3fffff]
[    2.650574] pci_bus 0002:00: resource 4 [io  0x0000-0xfffff]
[    2.650577] pci_bus 0002:00: resource 5 [mem 0x3c300000-0x3dffffff]
[    2.650580] pci_bus 0002:01: resource 1 [mem 0x3c300000-0x3c3fffff]
[    2.650735] pcieport 0002:00:00.0: calling  ks_pcie_quirk+0x0/0x180 @ 1279
[    2.650745] pcieport 0002:00:00.0: ks_pcie_quirk+0x0/0x180 took 0 usecs
[    2.655261] pcieport 0002:00:00.0: PME: Signaling with IRQ 202
[    2.655290] probe of 0002:00:00.0:pcie001 returned 0 after 72 usecs
[    2.657281] pcieport 0002:00:00.0: AER: enabled with IRQ 202
[    2.657308] probe of 0002:00:00.0:pcie002 returned 0 after 1996 usecs
[    2.657815] probe of 0002:00:00.0 returned 0 after 7166 usecs
[    2.658039] probe of 1c20000.pcie returned 0 after 333921 usecs
[    2.667443] probe of backlight returned 517 after 9030 usecs
[    2.667852] probe of 1c10000.pcie returned -517 after 4 usecs
[    2.669505] probe of 1c00000.pcie returned -517 after 3 usecs
[    2.673221] probe of 33c0000.pinctrl returned 517 after 3663 usecs
[    2.697523] probe of aux_bridge.aux_bridge.0 returned 517 after 24237 usecs
[    2.707521] probe of aux_bridge.aux_bridge.1 returned 517 after 9978 usecs
[    2.710728] probe of regulator-wlan returned 0 after 2537 usecs
[    2.712382] probe of regulator-wwan returned 0 after 4563 usecs
[    2.730611] probe of backlight returned 517 after 19712 usecs
[    2.733461] qcom-pcie 1c10000.pcie: supply vdda not found, using dummy regulator
[    2.733863] probe of 33c0000.pinctrl returned 517 after 2531 usecs
[    2.738417] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
[    2.740339] calling  qcom_socinfo_driver_init+0x0/0xff8 [socinfo] @ 390
[    2.740461] calling  msm_drm_register+0x0/0x90 [msm] @ 382
[    2.743648] qcom-pcie 1c10000.pcie: host bridge /soc@0/pcie@1c10000 ranges:
[    2.743672] qcom-pcie 1c10000.pcie:       IO 0x0034200000..0x00342fffff -> 0x0000000000
[    2.743679] qcom-pcie 1c10000.pcie:      MEM 0x0034300000..0x0035ffffff -> 0x0034300000
[    2.748540] calling  geni_i2c_driver_init+0x0/0xff8 [i2c_qcom_geni] @ 395
[    2.787720] probe of aux_bridge.aux_bridge.0 returned 517 after 53483 usecs
[    2.787963] qcom-pcie 1c00000.pcie: host bridge /soc@0/pcie@1c00000 ranges:
[    2.787983] qcom-pcie 1c00000.pcie:       IO 0x0030200000..0x00302fffff -> 0x0000000000
[    2.787992] qcom-pcie 1c00000.pcie:      MEM 0x0030300000..0x0031ffffff -> 0x0030300000
[    2.789849] probe of aux_bridge.aux_bridge.1 returned 517 after 2106 usecs
[    2.790512] probe of backlight returned 517 after 403 usecs
[    2.797088] probe of qcom-socinfo returned 0 after 56640 usecs
[    2.797126] initcall qcom_socinfo_driver_init+0x0/0xff8 [socinfo] returned 0 after 48566 usecs
[    2.797461] probe of 33c0000.pinctrl returned 517 after 110 usecs
[    2.797573] probe of aux_bridge.aux_bridge.0 returned 517 after 41 usecs
[    2.797600] probe of aux_bridge.aux_bridge.1 returned 517 after 20 usecs
[    2.798133] probe of backlight returned 517 after 378 usecs
[    2.799327] calling  drm_aux_hpd_bridge_drv_init+0x0/0xff8 [aux_hpd_bridge] @ 387
[    2.799370] initcall drm_aux_hpd_bridge_drv_init+0x0/0xff8 [aux_hpd_bridge] returned 0 after 30 usecs
[    2.801483] remoteproc remoteproc0: powering up adsp
[    2.815744] remoteproc remoteproc0: Booting fw image qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn, size 14367860
[    2.828593] calling  qcom_battmgr_driver_init+0x0/0xff8 [qcom_battmgr] @ 410
[    2.833919] calling  pm8916_pon_driver_init+0x0/0xff8 [qcom_pon] @ 404
[    2.834407] calling  pm8xxx_rtc_driver_init+0x0/0xff8 [rtc_pm8xxx] @ 445
[    2.854251] adreno 3d00000.gpu: Adding to iommu group 3
[    2.855159] calling  sdam_driver_init+0x0/0xff8 [nvmem_qcom_spmi_sdam] @ 477
[    2.855375] probe of 33c0000.pinctrl returned 517 after 72 usecs
[    2.855462] probe of aux_bridge.aux_bridge.0 returned 517 after 32 usecs
[    2.855516] probe of aux_bridge.aux_bridge.1 returned 517 after 21 usecs
[    2.855537] probe of c440000.spmi:pmic@0:nvram@8500 returned 0 after 210 usecs
[    2.855573] initcall sdam_driver_init+0x0/0xff8 [nvmem_qcom_spmi_sdam] returned 0 after 395 usecs
[    2.855750] probe of 3d00000.gpu returned 0 after 109208 usecs
[    2.855996] probe of backlight returned 517 after 340 usecs
[    2.856162] msm-mdss ae00000.display-subsystem: Adding to iommu group 4
[    2.856411] probe of 33c0000.pinctrl returned 517 after 66 usecs
[    2.856605] probe of alarmtimer.0.auto returned 0 after 18 usecs
[    2.856669] rtc-pm8xxx c440000.spmi:pmic@0:rtc@6100: registered as rtc0
[    2.856715] rtc-pm8xxx c440000.spmi:pmic@0:rtc@6100: setting system clock to 2025-02-04T14:55:38 UTC (1738680938)
[    2.857946] probe of c440000.spmi:pmic@0:pon@1300 returned 0 after 23857 usecs
[    2.859088] initcall pm8916_pon_driver_init+0x0/0xff8 [qcom_pon] returned 0 after 3910 usecs
[    2.860091] qcom-pcie 1c10000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    2.860157] probe of aux_bridge.aux_bridge.0 returned 517 after 2302 usecs
[    2.862200] probe of c440000.spmi:pmic@0:rtc@6100 returned 0 after 27656 usecs
[    2.866098] probe of aux_bridge.aux_bridge.1 returned 517 after 5924 usecs
[    2.866114] initcall pm8xxx_rtc_driver_init+0x0/0xff8 [rtc_pm8xxx] returned 0 after 10936 usecs
[    2.874455] calling  usb_udc_init+0x0/0xff8 [udc_core] @ 433
[    2.874580] initcall usb_udc_init+0x0/0xff8 [udc_core] returned 0 after 50 usecs
[    2.877739] probe of 894000.i2c returned 0 after 129034 usecs
[    2.878065] probe of backlight returned 517 after 11733 usecs
[    2.878416] probe of 33c0000.pinctrl returned 517 after 62 usecs
[    2.878503] probe of aux_bridge.aux_bridge.0 returned 517 after 45 usecs
[    2.878528] probe of aux_bridge.aux_bridge.1 returned 517 after 18 usecs
[    2.878757] probe of pmic_glink.power-supply.0 returned 0 after 50128 usecs
[    2.880223] initcall qcom_battmgr_driver_init+0x0/0xff8 [qcom_battmgr] returned 0 after 5692 usecs
[    2.880366] probe of backlight returned 517 after 1698 usecs
[    2.880702] probe of 33c0000.pinctrl returned 517 after 65 usecs
[    2.880760] probe of aux_bridge.aux_bridge.0 returned 517 after 28 usecs
[    2.880781] probe of aux_bridge.aux_bridge.1 returned 517 after 16 usecs
[    2.881127] probe of backlight returned 517 after 256 usecs
[    2.889722] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000
[    2.889732] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae98000
[    2.889739] /soc@0/display-subsystem@ae00000/display-controller@ae01000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@ae90000
[    2.890913] calling  qcom_pdm_drv_init+0x0/0xff8 [qcom_pd_mapper] @ 398
[    2.891441] probe of qcom_common.pd-mapper.1 returned 0 after 73 usecs
[    2.891455] probe of qcom_common.pd-mapper.0 returned 0 after 9 usecs
[    2.891525] initcall qcom_pdm_drv_init+0x0/0xff8 [qcom_pd_mapper] returned 0 after 171 usecs
[    2.892261] calling  ulpi_init+0x0/0xff8 [ulpi] @ 393
[    2.892307] initcall ulpi_init+0x0/0xff8 [ulpi] returned 0 after 36 usecs
[    2.895814] probe of 990000.i2c returned 0 after 18059 usecs
[    2.896130] probe of 33c0000.pinctrl returned 517 after 4492 usecs
[    2.896341] probe of ae01000.display-controller returned 0 after 6085 usecs
[    2.898577] calling  qcom_pbs_driver_init+0x0/0xff8 [qcom_pbs] @ 411
[    2.900014] initcall qcom_pbs_driver_init+0x0/0xff8 [qcom_pbs] returned 0 after 1425 usecs
[    2.900018] qcom-pcie 1c00000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    2.905305] probe of aux_bridge.aux_bridge.0 returned 517 after 9130 usecs
[    2.906437] probe of aux_bridge.aux_bridge.1 returned 517 after 1097 usecs
[    2.908019] probe of backlight returned 517 after 1418 usecs
[    2.908290] probe of 33c0000.pinctrl returned 517 after 82 usecs
[    2.908353] probe of aux_bridge.aux_bridge.0 returned 517 after 32 usecs
[    2.911088] probe of a8c000.i2c returned 0 after 15214 usecs
[    2.911123] probe of aux_bridge.aux_bridge.1 returned 517 after 41 usecs
[    2.911138] initcall geni_i2c_driver_init+0x0/0xff8 [i2c_qcom_geni] returned 0 after 12549 usecs
[    2.915233] probe of backlight returned 517 after 3950 usecs
[    2.915574] probe of 33c0000.pinctrl returned 517 after 75 usecs
[    2.915638] probe of aux_bridge.aux_bridge.0 returned 517 after 30 usecs
[    2.916490] probe of ae90000.displayport-controller returned 517 after 10466 usecs
[    2.916549] probe of aux_bridge.aux_bridge.1 returned 517 after 34 usecs
[    2.925945] probe of backlight returned 517 after 9220 usecs
[    2.926347] probe of 33c0000.pinctrl returned 517 after 109 usecs
[    2.926414] probe of aux_bridge.aux_bridge.0 returned 517 after 28 usecs
[    2.934415] remoteproc remoteproc1: remote processor cdsp is now up
[    2.937624] probe of ae90000.displayport-controller returned 517 after 3074 usecs
[    2.938259] probe of ae98000.displayport-controller returned 517 after 3709 usecs
[    2.938543] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel
[    2.938666] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000
[    2.940965] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel
[    2.940992] /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: Fixed dependency cycle(s) with /soc@0/display-subsystem@ae00000/displayport-controller@aea0000
[    2.942819] calling  rpmsg_chrdev_init+0x0/0xa8 [rpmsg_char] @ 475
[    2.942861] initcall rpmsg_chrdev_init+0x0/0xa8 [rpmsg_char] returned 0 after 32 usecs
[    2.944726] calling  qcom_smd_qrtr_driver_init+0x0/0xff8 [qrtr_smd] @ 436
[    2.945657] probe of aux_bridge.aux_bridge.1 returned 517 after 41 usecs
[    2.946304] probe of backlight returned 517 after 445 usecs
[    2.946632] probe of 33c0000.pinctrl returned 517 after 106 usecs
[    2.946689] probe of aux_bridge.aux_bridge.0 returned 517 after 25 usecs
[    2.947076] probe of 1b300000.remoteproc:glink-edge.IPCRTR.-1.-1 returned 0 after 2324 usecs
[    2.947096] initcall qcom_smd_qrtr_driver_init+0x0/0xff8 [qrtr_smd] returned 0 after 2358 usecs
[    2.947288] probe of ae90000.displayport-controller returned 517 after 461 usecs
[    2.948030] probe of ae98000.displayport-controller returned 517 after 612 usecs
[    2.990754] probe of aea0000.displayport-controller returned 0 after 50115 usecs
[    2.990921] probe of ae00000.display-subsystem returned 0 after 134892 usecs
[    2.991074] probe of aux_bridge.aux_bridge.1 returned 517 after 45 usecs
[    2.991136] initcall msm_drm_register+0x0/0x90 [msm] returned 0 after 46398 usecs
[    2.991667] probe of backlight returned 517 after 386 usecs
[    2.991978] probe of 33c0000.pinctrl returned 517 after 80 usecs
[    2.992027] probe of aux_bridge.aux_bridge.0 returned 517 after 18 usecs
[    2.992575] probe of ae90000.displayport-controller returned 517 after 423 usecs
[    2.993055] probe of ae98000.displayport-controller returned 517 after 334 usecs
[    2.994994] qcom-pcie 1c00000.pcie: PCIe Gen.2 x1 link up
[    2.995085] qcom-pcie 1c00000.pcie: PCI host bridge to bus 0006:00
[    2.995985] pci_bus 0006:00: root bus resource [bus 00-ff]
[    2.996454] pci_bus 0006:00: root bus resource [io  0x200000-0x2fffff] (bus address [0x0000-0xfffff])
[    2.996457] pci_bus 0006:00: root bus resource [mem 0x30300000-0x31ffffff]
[    2.996520] pci 0006:00:00.0: calling  quirk_cmd_compl+0x0/0xb0 @ 73
[    2.998069] pci 0006:00:00.0: quirk_cmd_compl+0x0/0xb0 took 1 usecs
[    2.998083] pci 0006:00:00.0: [17cb:010e] type 01 class 0x060400 PCIe Root Port
[    2.998096] pci 0006:00:00.0: BAR 0 [mem 0x00000000-0x00000fff]
[    2.998107] pci 0006:00:00.0: PCI bridge to [bus 01-ff]
[    2.998111] pci 0006:00:00.0:   bridge window [io  0x200000-0x200fff]
[    2.998114] pci 0006:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    2.998119] pci 0006:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    2.998181] pci 0006:00:00.0: PME# supported from D0 D3hot D3cold
[    2.999621] pci 0006:01:00.0: [17cb:1103] type 00 class 0x028000 PCIe Endpoint
[    3.005294] pci 0006:01:00.0: BAR 0 [mem 0x00000000-0x001fffff 64bit]
[    3.006016] pci 0006:01:00.0: PME# supported from D0 D3hot D3cold
[    3.006456] pci 0006:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 0006:00:00.0 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
[    3.009576] pci 0006:00:00.0: bridge window [mem 0x30400000-0x305fffff]: assigned
[    3.009581] pci 0006:00:00.0: BAR 0 [mem 0x30300000-0x30300fff]: assigned
[    3.009585] pci 0006:01:00.0: BAR 0 [mem 0x30400000-0x305fffff 64bit]: assigned
[    3.009633] pci 0006:00:00.0: PCI bridge to [bus 01-ff]
[    3.009637] pci 0006:00:00.0:   bridge window [mem 0x30400000-0x305fffff]
[    3.009642] pci_bus 0006:00: resource 4 [io  0x200000-0x2fffff]
[    3.009644] pci_bus 0006:00: resource 5 [mem 0x30300000-0x31ffffff]
[    3.009646] pci_bus 0006:01: resource 1 [mem 0x30400000-0x305fffff]
[    3.010043] pcieport 0006:00:00.0: calling  ks_pcie_quirk+0x0/0x180 @ 73
[    3.010052] pcieport 0006:00:00.0: ks_pcie_quirk+0x0/0x180 took 0 usecs
[    3.011473] pcieport 0006:00:00.0: PME: Signaling with IRQ 214
[    3.013985] probe of 3000000.remoteproc:glink-edge.glink_ssr.-1.-1 returned 0 after 93 usecs
[    3.014023] probe of aux_bridge.aux_bridge.1 returned 517 after 39 usecs
[    3.014156] probe of 0006:00:00.0:pcie001 returned 0 after 2725 usecs
[    3.014592] probe of backlight returned 517 after 363 usecs
[    3.014871] probe of 33c0000.pinctrl returned 517 after 80 usecs
[    3.014926] probe of aux_bridge.aux_bridge.0 returned 517 after 22 usecs
[    3.015415] remoteproc remoteproc0: remote processor adsp is now up
[    3.015579] probe of 3000000.remoteproc:glink-edge.IPCRTR.-1.-1 returned 0 after 145 usecs
[    3.016321] pcieport 0006:00:00.0: AER: enabled with IRQ 214
[    3.017778] probe of ae90000.displayport-controller returned 517 after 436 usecs
[    3.018118] probe of 0006:00:00.0:pcie002 returned 0 after 2621 usecs
[    3.018776] probe of 0006:00:00.0 returned 0 after 8799 usecs
[    3.019026] calling  rpmsg_ctrldev_init+0x0/0xa0 [rpmsg_ctrl] @ 429
[    3.019187] probe of 1b300000.remoteproc:glink-edge.rpmsg_ctrl.0.0 returned 0 after 129 usecs
[    3.019258] probe of 3000000.remoteproc:glink-edge.rpmsg_ctrl.0.0 returned 0 after 62 usecs
[    3.019277] initcall rpmsg_ctrldev_init+0x0/0xa0 [rpmsg_ctrl] returned 0 after 240 usecs
[    3.020398] probe of ae98000.displayport-controller returned 517 after 513 usecs
[    3.020563] probe of aux_bridge.aux_bridge.1 returned 517 after 55 usecs
[    3.020847] probe of 1c00000.pcie returned 0 after 289617 usecs
[    3.021135] probe of backlight returned 517 after 412 usecs
[    3.022516] probe of 33c0000.pinctrl returned 517 after 1163 usecs
[    3.022591] calling  apr_init+0x0/0xff8 [apr] @ 458
[    3.022619] probe of aux_bridge.aux_bridge.0 returned 517 after 45 usecs
[    3.026664] probe of ae90000.displayport-controller returned 517 after 3640 usecs
[    3.026914] probe of 3000000.remoteproc:glink-edge.adsp_apps.-1.-1 returned 0 after 4268 usecs
[    3.026952] initcall apr_init+0x0/0xff8 [apr] returned 0 after 4350 usecs
[    3.027626] probe of ae98000.displayport-controller returned 517 after 642 usecs
[    3.027672] probe of aux_bridge.aux_bridge.1 returned 517 after 24 usecs
[    3.028175] probe of backlight returned 517 after 342 usecs
[    3.028435] probe of 33c0000.pinctrl returned 517 after 78 usecs
[    3.028506] probe of aux_bridge.aux_bridge.0 returned 517 after 21 usecs
[    3.029001] probe of ae90000.displayport-controller returned 517 after 359 usecs
[    3.029153] PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
[    3.043564] PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
[    3.043603] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
[    3.043673] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
[    3.415479] probe of 3000000.remoteproc:glink-edge.PMIC_RTR_ADSP_APPS.-1.-1 returned 0 after 463 usecs
[    3.416755] probe of ae98000.displayport-controller returned 517 after 405 usecs
[    3.416794] probe of aux_bridge.aux_bridge.1 returned 517 after 15 usecs
[    3.417209] probe of backlight returned 517 after 301 usecs
[    3.417389] probe of 33c0000.pinctrl returned 517 after 52 usecs
[    3.417425] probe of aux_bridge.aux_bridge.0 returned 517 after 13 usecs
[    3.417797] probe of ae90000.displayport-controller returned 517 after 251 usecs
[    3.818817] qcom-pcie 1c10000.pcie: Phy link never came up
[    3.818944] qcom-pcie 1c10000.pcie: PCI host bridge to bus 0004:00
[    3.818960] pci_bus 0004:00: root bus resource [bus 00-ff]
[    3.818974] pci_bus 0004:00: root bus resource [io  0x100000-0x1fffff] (bus address [0x0000-0xfffff])
[    3.818980] pci_bus 0004:00: root bus resource [mem 0x34300000-0x35ffffff]
[    3.819046] pci 0004:00:00.0: calling  quirk_cmd_compl+0x0/0xb0 @ 1504
[    3.819065] pci 0004:00:00.0: quirk_cmd_compl+0x0/0xb0 took 0 usecs
[    3.819074] pci 0004:00:00.0: [17cb:010e] type 01 class 0x060400 PCIe Root Port
[    3.819087] pci 0004:00:00.0: BAR 0 [mem 0x00000000-0x00000fff]
[    3.819098] pci 0004:00:00.0: PCI bridge to [bus 01-ff]
[    3.819105] pci 0004:00:00.0:   bridge window [io  0x100000-0x100fff]
[    3.819110] pci 0004:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    3.819117] pci 0004:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    3.819171] pci 0004:00:00.0: PME# supported from D0 D3hot D3cold
[    3.821275] pci 0004:00:00.0: BAR 0 [mem 0x34300000-0x34300fff]: assigned
[    3.830391] pci 0004:00:00.0: PCI bridge to [bus 01-ff]
[    3.830399] pci_bus 0004:00: resource 4 [io  0x100000-0x1fffff]
[    3.830401] pci_bus 0004:00: resource 5 [mem 0x34300000-0x35ffffff]
[    3.830532] pcieport 0004:00:00.0: calling  ks_pcie_quirk+0x0/0x180 @ 1504
[    3.832575] pcieport 0004:00:00.0: ks_pcie_quirk+0x0/0x180 took 0 usecs
[    3.833739] pcieport 0004:00:00.0: PME: Signaling with IRQ 217
[    3.833751] probe of 0004:00:00.0:pcie001 returned 0 after 47 usecs
[    3.834160] pcieport 0004:00:00.0: AER: enabled with IRQ 217
[    3.834568] probe of ae98000.displayport-controller returned 517 after 395 usecs
[    3.834904] probe of 0004:00:00.0:pcie002 returned 0 after 1135 usecs
[    3.834986] probe of aux_bridge.aux_bridge.1 returned 517 after 32 usecs
[    3.834994] probe of 0004:00:00.0:pcie010 returned 0 after 60 usecs
[    3.835054] probe of 0004:00:00.0 returned 0 after 4602 usecs
[    3.835112] probe of 1c10000.pcie returned 0 after 1104089 usecs
[    3.837487] probe of backlight returned 517 after 2361 usecs
[    3.837819] probe of 33c0000.pinctrl returned 517 after 86 usecs
[    3.839120] probe of aux_bridge.aux_bridge.0 returned 517 after 1274 usecs
[    3.839262] calling  pmic_glink_altmode_driver_init+0x0/0xff8 [pmic_glink_altmode] @ 387
[    3.839516] probe of aux_hpd_bridge.dp_hpd_bridge.0 returned 0 after 17 usecs
[    3.839545] probe of aux_hpd_bridge.dp_hpd_bridge.1 returned 0 after 8 usecs
[    3.839578] probe of pmic_glink.altmode.0 returned 0 after 277 usecs
[    3.839597] initcall pmic_glink_altmode_driver_init+0x0/0xff8 [pmic_glink_altmode] returned 0 after 323 usecs
[    3.851820] calling  dwc3_driver_init+0x0/0xff8 [dwc3] @ 393
[    3.863804] calling  nvme_core_init+0x0/0x188 [nvme_core] @ 391
[    3.866186] calling  lpg_driver_init+0x0/0xff8 [leds_qcom_lpg] @ 411
[    3.878827] dwc3 a400000.usb: Adding to iommu group 5
[    3.879102] probe of ae90000.displayport-controller returned 517 after 38181 usecs
[    3.879811] probe of ae98000.displayport-controller returned 517 after 434 usecs
[    3.879860] probe of aux_bridge.aux_bridge.1 returned 0 after 30 usecs
[    3.879884] probe of c440000.spmi:pmic@2:pwm returned 0 after 13491 usecs
[    3.879923] initcall lpg_driver_init+0x0/0xff8 [leds_qcom_lpg] returned 0 after 13726 usecs
[    3.881176] initcall nvme_core_init+0x0/0x188 [nvme_core] returned 0 after 14978 usecs
[    3.881245] calling  pm8008_mfd_driver_init+0x0/0xff8 [qcom_pm8008] @ 404
[    3.881482] probe of backlight returned 0 after 1457 usecs
[    3.881738] probe of 33c0000.pinctrl returned 517 after 78 usecs
[    3.881990] probe of aux_bridge.aux_bridge.0 returned 0 after 196 usecs
[    3.883005] calling  panel_edp_init+0x0/0xff8 [panel_edp] @ 382
[    3.883369] calling  elan_i2c_hid_ts_driver_init+0x0/0xff8 [i2c_hid_of_elan] @ 436
[    3.883418] initcall elan_i2c_hid_ts_driver_init+0x0/0xff8 [i2c_hid_of_elan] returned 0 after 39 usecs
[    3.883567] calling  i2c_hid_of_driver_init+0x0/0xff8 [i2c_hid_of] @ 410
[    3.883613] initcall i2c_hid_of_driver_init+0x0/0xff8 [i2c_hid_of] returned 0 after 34 usecs
[    3.884076] irq: IRQ218: trimming hierarchy from :soc@0:interrupt-controller@b220000-9
[    3.884341] probe of 24-000d returned 0 after 21 usecs
[    3.884585] probe of ae90000.displayport-controller returned 0 after 627 usecs
[    3.886231] probe of ae98000.displayport-controller returned 0 after 1061 usecs
[    3.886640] probe of 33c0000.pinctrl returned 517 after 65 usecs
[    3.897524] probe of 21-002c returned 6 after 13397 usecs
[    3.898304] calling  nvme_init+0x0/0xff8 [nvme] @ 391
[    3.898771] initcall nvme_init+0x0/0xff8 [nvme] returned 0 after 450 usecs
[    3.903803] probe of 24-000c returned 0 after 19856 usecs
[    3.903832] initcall pm8008_mfd_driver_init+0x0/0xff8 [qcom_pm8008] returned 0 after 5510 usecs
[    3.904054] probe of 33c0000.pinctrl returned 517 after 82 usecs
[    3.905515] nvme nvme0: pci function 0002:01:00.0
[    3.905626] nvme 0002:01:00.0: enabling device (0000 -> 0002)
[    3.905633] nvme 0002:01:00.0: calling  ks_pcie_quirk+0x0/0x180 @ 71
[    3.905642] nvme 0002:01:00.0: ks_pcie_quirk+0x0/0x180 took 0 usecs
[    3.918330] hwmon hwmon4: temp1_input not attached to any thermal zone
[    3.922020] nvme nvme0: 8/0/0 default/read/poll queues
[    3.927320]  nvme0n1: p1 p2 p3
[    3.927573] probe of 0002:01:00.0 returned 0 after 29221 usecs
[    3.927857] probe of 33c0000.pinctrl returned 517 after 74 usecs
[    3.941012] probe of a400000.usb returned 0 after 88994 usecs
[    3.941205] dwc3 a600000.usb: Adding to iommu group 6
[    3.941774] probe of 33c0000.pinctrl returned 517 after 542 usecs
[    3.962569] input: hid-over-i2c 04F3:000D Keyboard as /devices/platform/soc@0/8c0000.geniqup/894000.i2c/i2c-21/21-0068/0018:04F3:000D.0001/input/input1
[    3.967623] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a600000.usb for /pmic-glink/connector@0
[    3.968538] probe of a600000.usb returned 0 after 27510 usecs
[    3.968671] dwc3 a800000.usb: Adding to iommu group 7
[    3.968893] probe of 33c0000.pinctrl returned 517 after 184 usecs
[    3.973925] input: hid-over-i2c 04F3:3193 Mouse as /devices/platform/soc@0/8c0000.geniqup/894000.i2c/i2c-21/21-0015/0018:04F3:3193.0002/input/input3
[    3.993823] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a800000.usb for /pmic-glink/connector@1
[    3.993898] probe of a800000.usb returned 0 after 25347 usecs
[    3.993938] initcall dwc3_driver_init+0x0/0xff8 [dwc3] returned 0 after 95616 usecs
[    3.994136] probe of 33c0000.pinctrl returned 517 after 68 usecs
[    4.006028] panel-simple-dp-aux aux-aea0000.displayport-controller: Detected IVO R133NW4K-R0 (0x854b)
[    4.006671] input: hid-over-i2c 04F3:000D Mouse as /devices/platform/soc@0/8c0000.geniqup/894000.i2c/i2c-21/21-0068/0018:04F3:000D.0001/input/input2
[    4.006816] input: hid-over-i2c 04F3:3193 Touchpad as /devices/platform/soc@0/8c0000.geniqup/894000.i2c/i2c-21/21-0015/0018:04F3:3193.0002/input/input5
[    4.006920] hid-generic 0018:04F3:3193.0002: input,hidraw0: I2C HID v1.00 Mouse [hid-over-i2c 04F3:3193] on 21-0015
[    4.006942] probe of 0018:04F3:3193.0002 returned 0 after 33231 usecs
[    4.006969] probe of 21-0015 returned 0 after 122964 usecs
[    4.007251] probe of 33c0000.pinctrl returned 517 after 85 usecs
[    4.008289] hid-generic 0018:04F3:000D.0001: input,hidraw1: I2C HID v1.00 Keyboard [hid-over-i2c 04F3:000D] on 21-0068
[    4.010952] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
[    4.011799] probe of 0018:04F3:000D.0001 returned 0 after 49446 usecs
[    4.011976] probe of 33c0000.pinctrl returned 517 after 55 usecs
[    4.012793] probe of 21-0068 returned 0 after 128665 usecs
[    4.012928] probe of 33c0000.pinctrl returned 517 after 41 usecs
[    4.016385] msm_dpu ae01000.display-controller: bound ae98000.displayport-controller (ops msm_dp_display_comp_ops [msm])
[    4.017113] msm_dpu ae01000.display-controller: bound aea0000.displayport-controller (ops msm_dp_display_comp_ops [msm])
[    4.018727] adreno 3d00000.gpu: supply vdd not found, using dummy regulator
[    4.018787] adreno 3d00000.gpu: supply vddcx not found, using dummy regulator
[    4.024440] calling  devfreq_simple_ondemand_init+0x0/0xff8 [governor_simpleondemand] @ 2543
[    4.024453] initcall devfreq_simple_ondemand_init+0x0/0xff8 [governor_simpleondemand] returned 0 after 0 usecs
[    4.282711] i2c_hid_of_elan 4-0010: i2c_hid_get_input: IRQ triggered but there's no data
[    4.284777] input: ekth5015m 04F3:2FE6 Touchscreen as /devices/platform/soc@0/9c0000.geniqup/990000.i2c/i2c-4/4-0010/0018:04F3:2FE6.0003/input/input6
[    4.287794] input: ekth5015m 04F3:2FE6 as /devices/platform/soc@0/9c0000.geniqup/990000.i2c/i2c-4/4-0010/0018:04F3:2FE6.0003/input/input7
[    4.288145] input: ekth5015m 04F3:2FE6 as /devices/platform/soc@0/9c0000.geniqup/990000.i2c/i2c-4/4-0010/0018:04F3:2FE6.0003/input/input8
[    4.292046] hid-generic 0018:04F3:2FE6.0003: input,hidraw2: I2C HID v1.00 Device [ekth5015m 04F3:2FE6] on 4-0010
[    4.292089] probe of 0018:04F3:2FE6.0003 returned 0 after 11191 usecs
[    4.292137] probe of 4-0010 returned 0 after 408157 usecs
[    4.292481] probe of 33c0000.pinctrl returned 517 after 90 usecs
[    4.300338] platform 3d6a000.gmu: Adding to iommu group 8
[    4.305859] calling  mt_driver_init+0x0/0xff8 [hid_multitouch] @ 419
[    4.311563] msm_dpu ae01000.display-controller: bound 3d00000.gpu (ops a3xx_ops [msm])
[    4.320587] calling  pm8008_regulator_driver_init+0x0/0xff8 [qcom_pm8008_regulator] @ 398
[    4.323609] calling  xhci_plat_init+0x0/0xff8 [xhci_plat_hcd] @ 445
[    4.323931] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[    4.325162] xhci-hcd xhci-hcd.4.auto: new USB bus registered, assigned bus number 1
[    4.325326] xhci-hcd xhci-hcd.4.auto: hcc params 0x0120ffe5 hci version 0x110 quirks 0x0000808000000010
[    4.325354] xhci-hcd xhci-hcd.4.auto: irq 232, io mem 0x0a400000
[    4.325504] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
[    4.325616] xhci-hcd xhci-hcd.4.auto: new USB bus registered, assigned bus number 2
[    4.325620] xhci-hcd xhci-hcd.4.auto: Host supports USB 3.1 Enhanced SuperSpeed
[    4.325690] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    4.325694] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.325696] usb usb1: Product: xHCI Host Controller
[    4.325698] usb usb1: Manufacturer: Linux 6.13.1-300.vanilla.fc41.aarch64 xhci-hcd
[    4.325700] usb usb1: SerialNumber: xhci-hcd.4.auto
[    4.326038] hub 1-0:1.0: USB hub found
[    4.326174] hub 1-0:1.0: 4 ports detected
[    4.329873] vreg_l6q: Bringing 2800000uV into 1800000-1800000uV
[    4.338066] Console: switching to colour dummy device 80x25
[    4.344351] probe of pm8008-regulator.1.auto returned 0 after 23474 usecs
[    4.344403] initcall pm8008_regulator_driver_init+0x0/0xff8 [qcom_pm8008_regulator] returned 0 after 20776 usecs
[    4.344623] probe of 33c0000.pinctrl returned 517 after 74 usecs
[    4.349155] probe of 0018:04F3:3193.0002 returned 19 after 29 usecs
[    4.350770] [drm:dpu_kms_hw_init:1129] dpu hardware revision:0x80000000
[    4.351909] [drm] Initialized msm 1.12.0 for ae01000.display-controller on minor 1
[    4.354573] msm_dpu ae01000.display-controller: [drm:adreno_request_fw [msm]] loaded qcom/a660_sqe.fw from new location
[    4.358656] msm_dpu ae01000.display-controller: [drm:adreno_request_fw [msm]] loaded qcom/a660_gmu.bin from new location
[    4.359884] input: hid-over-i2c 04F3:3193 Mouse as /devices/platform/soc@0/8c0000.geniqup/894000.i2c/i2c-21/21-0015/0018:04F3:3193.0002/input/input10
[    4.360070] input: hid-over-i2c 04F3:3193 Touchpad as /devices/platform/soc@0/8c0000.geniqup/894000.i2c/i2c-21/21-0015/0018:04F3:3193.0002/input/input12
[    4.360221] hid-multitouch 0018:04F3:3193.0002: input,hidraw0: I2C HID v1.00 Mouse [hid-over-i2c 04F3:3193] on 21-0015
[    4.361375] probe of 0018:04F3:3193.0002 returned 0 after 12210 usecs
[    4.361648] probe of 33c0000.pinctrl returned 517 after 75 usecs
[    4.405063] probe of 0018:04F3:2FE6.0003 returned 19 after 30 usecs
[    4.414794] input: ekth5015m 04F3:2FE6 as /devices/platform/soc@0/9c0000.geniqup/990000.i2c/i2c-4/4-0010/0018:04F3:2FE6.0003/input/input13
[    4.414934] input: ekth5015m 04F3:2FE6 UNKNOWN as /devices/platform/soc@0/9c0000.geniqup/990000.i2c/i2c-4/4-0010/0018:04F3:2FE6.0003/input/input14
[    4.414997] input: ekth5015m 04F3:2FE6 UNKNOWN as /devices/platform/soc@0/9c0000.geniqup/990000.i2c/i2c-4/4-0010/0018:04F3:2FE6.0003/input/input15
[    4.415094] hid-multitouch 0018:04F3:2FE6.0003: input,hidraw2: I2C HID v1.00 Device [ekth5015m 04F3:2FE6] on 4-0010
[    4.415114] probe of 0018:04F3:2FE6.0003 returned 0 after 10041 usecs
[    4.415119] initcall mt_driver_init+0x0/0xff8 [hid_multitouch] returned 0 after 91492 usecs
[    4.415375] probe of 33c0000.pinctrl returned 517 after 62 usecs
[    4.428677] BTRFS: device label fedora_fedora devid 1 transid 7731 /dev/nvme0n1p3 (259:3) scanned by mount (2624)
[    4.428857] BTRFS info (device nvme0n1p3): first mount of filesystem 66ed970b-b91a-483e-9b82-b10fdfc12ea7
[    4.428875] BTRFS info (device nvme0n1p3): using crc32c (crc32c-arm64) checksum algorithm
[    4.428881] BTRFS info (device nvme0n1p3): using free-space-tree
[    4.430338] BTRFS info (device nvme0n1p3): bdev /dev/nvme0n1p3 errs: wr 0, rd 0, flush 0, corrupt 25630, gen 0
[    4.455508] Console: switching to colour frame buffer device 240x75
[    4.455523] fb0: Framebuffer is not in virtual address space.
[    4.475043] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb frame buffer device
[    4.483589] probe of aux-aea0000.displayport-controller returned 0 after 555091 usecs
[    4.483615] initcall panel_edp_init+0x0/0xff8 [panel_edp] returned 0 after 159988 usecs
[    4.483653] probe of 1-0:1.0 returned 0 after 157630 usecs
[    4.483697] probe of usb1 returned 0 after 157814 usecs
[    4.483739] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    4.483802] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    4.483820] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.483834] usb usb2: Product: xHCI Host Controller
[    4.483841] probe of 33c0000.pinctrl returned 517 after 71 usecs
[    4.483844] usb usb2: Manufacturer: Linux 6.13.1-300.vanilla.fc41.aarch64 xhci-hcd
[    4.483858] usb usb2: SerialNumber: xhci-hcd.4.auto
[    4.484037] hub 2-0:1.0: USB hub found
[    4.484055] hub 2-0:1.0: 2 ports detected
[    4.484193] probe of 2-0:1.0 returned 0 after 159 usecs
[    4.484219] probe of usb2 returned 0 after 224 usecs
[    4.484242] probe of xhci-hcd.4.auto returned 0 after 160424 usecs
[    4.484314] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    4.484338] probe of 33c0000.pinctrl returned 517 after 30 usecs
[    4.484406] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 3
[    4.486869] xhci-hcd xhci-hcd.5.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x0000808000000010
[    4.487530] fb0: Framebuffer is not in virtual address space.
[    4.488676] xhci-hcd xhci-hcd.5.auto: irq 233, io mem 0x0a600000
[    4.490105] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    4.495095] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 4
[    4.495106] xhci-hcd xhci-hcd.5.auto: Host supports USB 3.1 Enhanced SuperSpeed
[    4.495171] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    4.495175] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.495177] usb usb3: Product: xHCI Host Controller
[    4.495179] usb usb3: Manufacturer: Linux 6.13.1-300.vanilla.fc41.aarch64 xhci-hcd
[    4.495180] usb usb3: SerialNumber: xhci-hcd.5.auto
[    4.495529] hub 3-0:1.0: USB hub found
[    4.495546] hub 3-0:1.0: 1 port detected
[    4.495715] probe of 3-0:1.0 returned 0 after 191 usecs
[    4.495757] probe of usb3 returned 0 after 412 usecs
[    4.495900] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    4.495948] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    4.495951] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.495953] usb usb4: Product: xHCI Host Controller
[    4.495955] usb usb4: Manufacturer: Linux 6.13.1-300.vanilla.fc41.aarch64 xhci-hcd
[    4.495956] usb usb4: SerialNumber: xhci-hcd.5.auto
[    4.495987] probe of 33c0000.pinctrl returned 517 after 71 usecs
[    4.496168] hub 4-0:1.0: USB hub found
[    4.496183] hub 4-0:1.0: 1 port detected
[    4.496254] probe of 4-0:1.0 returned 0 after 89 usecs
[    4.496461] probe of 33c0000.pinctrl returned 517 after 62 usecs
[    4.507023] probe of usb4 returned 0 after 10925 usecs
[    4.507048] probe of xhci-hcd.5.auto returned 0 after 22802 usecs
[    4.507129] xhci-hcd xhci-hcd.6.auto: xHCI Host Controller
[    4.507197] xhci-hcd xhci-hcd.6.auto: new USB bus registered, assigned bus number 5
[    4.507238] probe of 33c0000.pinctrl returned 517 after 62 usecs
[    4.509635] xhci-hcd xhci-hcd.6.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x0000808000000010
[    4.511114] xhci-hcd xhci-hcd.6.auto: irq 234, io mem 0x0a800000
[    4.511776] xhci-hcd xhci-hcd.6.auto: xHCI Host Controller
[    4.511825] xhci-hcd xhci-hcd.6.auto: new USB bus registered, assigned bus number 6
[    4.511828] xhci-hcd xhci-hcd.6.auto: Host supports USB 3.1 Enhanced SuperSpeed
[    4.511878] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    4.511880] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.511882] usb usb5: Product: xHCI Host Controller
[    4.511884] usb usb5: Manufacturer: Linux 6.13.1-300.vanilla.fc41.aarch64 xhci-hcd
[    4.511885] usb usb5: SerialNumber: xhci-hcd.6.auto
[    4.511997] hub 5-0:1.0: USB hub found
[    4.512005] hub 5-0:1.0: 1 port detected
[    4.512078] probe of 5-0:1.0 returned 0 after 84 usecs
[    4.512101] probe of usb5 returned 0 after 135 usecs
[    4.512126] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
[    4.512152] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    4.512154] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.512156] usb usb6: Product: xHCI Host Controller
[    4.512157] usb usb6: Manufacturer: Linux 6.13.1-300.vanilla.fc41.aarch64 xhci-hcd
[    4.512159] usb usb6: SerialNumber: xhci-hcd.6.auto
[    4.512252] hub 6-0:1.0: USB hub found
[    4.512252] probe of 33c0000.pinctrl returned 517 after 53 usecs
[    4.512259] hub 6-0:1.0: 1 port detected
[    4.512314] probe of 6-0:1.0 returned 0 after 64 usecs
[    4.512335] probe of usb6 returned 0 after 111 usecs
[    4.512353] probe of xhci-hcd.6.auto returned 0 after 5298 usecs
[    4.512369] initcall xhci_plat_init+0x0/0xff8 [xhci_plat_hcd] returned 0 after 188741 usecs
[    4.512461] probe of 33c0000.pinctrl returned 517 after 44 usecs
[    4.722488] usb 1-4: new full-speed USB device number 2 using xhci-hcd
[    4.850108] usb 1-4: New USB device found, idVendor=06cb, idProduct=00fc, bcdDevice= 0.00
[    4.850942] usb 1-4: New USB device strings: Mfr=0, Product=0, SerialNumber=1
[    4.851732] usb 1-4: SerialNumber: 18d0332a5cd2
[    4.853313] systemd-journald[259]: Received SIGTERM from PID 1 (systemd).
[    4.859361] probe of 1-4 returned 0 after 6501 usecs
[    4.859834] probe of 33c0000.pinctrl returned 517 after 80 usecs
[    4.993272] audit: type=1404 audit(1738680940.634:2): enforcing=1 old_enforcing=0 auid=4294967295 ses=4294967295 enabled=1 old-enabled=1 lsm=selinux res=1
[    5.086073] SELinux:  Permission nlmsg in class netlink_route_socket not defined in policy.
[    5.086779] SELinux:  Permission nlmsg in class netlink_tcpdiag_socket not defined in policy.
[    5.087396] SELinux:  Permission nlmsg in class netlink_xfrm_socket not defined in policy.
[    5.088019] SELinux:  Permission nlmsg in class netlink_audit_socket not defined in policy.
[    5.088669] SELinux: the above unknown classes and permissions will be allowed
[    5.092275] SELinux:  policy capability network_peer_controls=1
[    5.094048] SELinux:  policy capability open_perms=1
[    5.094049] SELinux:  policy capability extended_socket_class=1
[    5.094050] SELinux:  policy capability always_check_network=0
[    5.094051] SELinux:  policy capability cgroup_seclabel=1
[    5.094052] SELinux:  policy capability nnp_nosuid_transition=1
[    5.094053] SELinux:  policy capability genfs_seclabel_symlinks=1
[    5.094054] SELinux:  policy capability ioctl_skip_cloexec=0
[    5.094054] SELinux:  policy capability userspace_initial_context=0
[    5.094055] SELinux:  policy capability netlink_xperm=0
[    5.146031] audit: type=1403 audit(1738680940.787:3): auid=4294967295 ses=4294967295 lsm=selinux res=1
[    5.147130] systemd[1]: Successfully loaded SELinux policy in 155.854ms.
[    5.162240] systemd[1]: RTC configured in localtime, applying delta of -300 minutes to system time.
[    5.278849] systemd[1]: Relabeled /dev/, /dev/shm/, /run/ in 53.164ms.
[    5.288895] systemd[1]: systemd 256.11-1.fc41 running in system mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT +LIBARCHIVE)
[    5.291155] systemd[1]: Detected architecture arm64.
[    5.571347] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    5.839553] calling  zram_init+0x0/0xff8 [zram] @ 2798
[    5.840121] zram: Added device: zram0
[    5.841165] initcall zram_init+0x0/0xff8 [zram] returned 0 after 1593 usecs
[    6.140525] calling  nfnetlink_init+0x0/0xff8 [nfnetlink] @ 2799
[    6.140612] initcall nfnetlink_init+0x0/0xff8 [nfnetlink] returned 0 after 32 usecs
[    6.168789] systemd[1]: run-credentials-systemd\x2djournald.service.mount: Deactivated successfully.
[    6.170053] systemd[1]: initrd-switch-root.service: Deactivated successfully.
[    6.170984] systemd[1]: Stopped initrd-switch-root.service - Switch Root.
[    6.174124] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
[    6.174802] systemd[1]: Created slice machine.slice - Virtual Machine and Container Slice.
[    6.176853] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[    6.180457] systemd[1]: Created slice system-systemd\x2dcryptsetup.slice - Encrypted Volume Units Service Slice.
[    6.183227] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[    6.184917] systemd[1]: Created slice system-systemd\x2dzram\x2dsetup.slice - Slice /system/systemd-zram-setup.
[    6.188022] systemd[1]: Created slice user.slice - User and Session Slice.
[    6.192223] systemd[1]: systemd-ask-password-console.path - Dispatch Password Requests to Console Directory Watch was skipped because of an unmet condition check (ConditionPathExists=!/run/plymouth/pid).
[    6.192536] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[    6.199193] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[    6.203044] systemd[1]: Expecting device dev-disk-by\x2duuid-22A3\x2d9756.device - /dev/disk/by-uuid/22A3-9756...
[    6.204634] systemd[1]: Expecting device dev-disk-by\x2duuid-272968d5\x2d7443\x2d443d\x2dab75\x2d923986def66e.device - /dev/disk/by-uuid/272968d5-7443-443d-ab75-923986def66e...
[    6.209363] systemd[1]: Expecting device dev-disk-by\x2duuid-45c00456\x2d7f79\x2d47e5\x2da4c9\x2d73678a90a916.device - /dev/disk/by-uuid/45c00456-7f79-47e5-a4c9-73678a90a916...
[    6.210952] systemd[1]: Expecting device dev-disk-by\x2duuid-46155096\x2d179b\x2d42ae\x2db14d\x2d909c504a3a02.device - /dev/disk/by-uuid/46155096-179b-42ae-b14d-909c504a3a02...
[    6.215945] systemd[1]: Expecting device dev-disk-by\x2duuid-5500906b\x2df41b\x2d4b21\x2db926\x2d3584733a7543.device - /dev/disk/by-uuid/5500906b-f41b-4b21-b926-3584733a7543...
[    6.217630] systemd[1]: Expecting device dev-disk-by\x2duuid-5b2a7b9f\x2de1ac\x2d453e\x2db862\x2d9bf977c503f4.device - /dev/disk/by-uuid/5b2a7b9f-e1ac-453e-b862-9bf977c503f4...
[    6.223290] systemd[1]: Expecting device dev-disk-by\x2duuid-5d893f4d\x2d499b\x2d41c1\x2dabc2\x2db751203fd79b.device - /dev/disk/by-uuid/5d893f4d-499b-41c1-abc2-b751203fd79b...
[    6.229096] systemd[1]: Expecting device dev-disk-by\x2duuid-66ed970b\x2db91a\x2d483e\x2d9b82\x2db10fdfc12ea7.device - /dev/disk/by-uuid/66ed970b-b91a-483e-9b82-b10fdfc12ea7...
[    6.231215] systemd[1]: Expecting device dev-disk-by\x2duuid-6a257f7a\x2d627f\x2d49cb\x2db9a4\x2d10aaa7332ab8.device - /dev/disk/by-uuid/6a257f7a-627f-49cb-b9a4-10aaa7332ab8...
[    6.237178] systemd[1]: Expecting device dev-disk-by\x2duuid-736e2c2c\x2d3cf1\x2d4466\x2db87c\x2d7bfb0546ca96.device - /dev/disk/by-uuid/736e2c2c-3cf1-4466-b87c-7bfb0546ca96...
[    6.243358] systemd[1]: Expecting device dev-disk-by\x2duuid-75a96596\x2d7a37\x2d4536\x2d9ae0\x2d2f56ea4faf41.device - /dev/disk/by-uuid/75a96596-7a37-4536-9ae0-2f56ea4faf41...
[    6.245842] systemd[1]: Expecting device dev-disk-by\x2duuid-9e34e910\x2d4147\x2d4c42\x2da45c\x2d3bf262a32e4e.device - /dev/disk/by-uuid/9e34e910-4147-4c42-a45c-3bf262a32e4e...
[    6.248808] systemd[1]: Expecting device dev-disk-by\x2duuid-b09a04cb\x2def76\x2d4492\x2db304\x2da1b23327b6fc.device - /dev/disk/by-uuid/b09a04cb-ef76-4492-b304-a1b23327b6fc...
[    6.251769] systemd[1]: Expecting device dev-disk-by\x2duuid-c8e29478\x2d8fe9\x2d49bc\x2d90cd\x2de816cbe753b8.device - /dev/disk/by-uuid/c8e29478-8fe9-49bc-90cd-e816cbe753b8...
[    6.259028] systemd[1]: Expecting device dev-disk-by\x2duuid-d7a0758e\x2d38b7\x2d4182\x2dbc15\x2d105cfc8492a6.device - /dev/disk/by-uuid/d7a0758e-38b7-4182-bc15-105cfc8492a6...
[    6.262110] systemd[1]: Expecting device dev-disk-by\x2duuid-fa8c2f6a\x2d991c\x2d451d\x2d9350\x2dfaa87c3aeabc.device - /dev/disk/by-uuid/fa8c2f6a-991c-451d-9350-faa87c3aeabc...
[    6.268771] systemd[1]: Expecting device dev-zram0.device - /dev/zram0...
[    6.272005] systemd[1]: Reached target cryptsetup.target - Local Encrypted Volumes.
[    6.274775] systemd[1]: Reached target getty.target - Login Prompts.
[    6.277511] systemd[1]: Stopped target initrd-switch-root.target - Switch Root.
[    6.284256] systemd[1]: Stopped target initrd-fs.target - Initrd File Systems.
[    6.291148] systemd[1]: Stopped target initrd-root-fs.target - Initrd Root File System.
[    6.298105] systemd[1]: Reached target integritysetup.target - Local Integrity Protected Volumes.
[    6.300675] systemd[1]: Reached target slices.target - Slice Units.
[    6.303435] systemd[1]: Reached target veritysetup.target - Local Verity Protected Volumes.
[    6.306977] systemd[1]: Listening on dm-event.socket - Device-mapper event daemon FIFOs.
[    6.316647] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
[    6.322609] systemd[1]: Listening on systemd-coredump.socket - Process Core Dump Socket.
[    6.328820] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[    6.334538] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[    6.338026] systemd[1]: Listening on systemd-journald-audit.socket - Journal Audit Socket.
[    6.344371] systemd[1]: Listening on systemd-mountfsd.socket - DDI File System Mounter Socket.
[    6.353035] systemd[1]: Listening on systemd-nsresourced.socket - Namespace Resource Manager Socket.
[    6.361290] systemd[1]: Listening on systemd-oomd.socket - Userspace Out-Of-Memory (OOM) Killer Socket.
[    6.367750] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.367781] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.371719] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[    6.380107] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    6.385427] systemd[1]: Listening on systemd-userdbd.socket - User Database Manager Socket.
[    6.398634] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[    6.409785] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[    6.428320] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[    6.434548] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[    6.436533] systemd[1]: auth-rpcgss-module.service - Kernel Module supporting RPCSEC_GSS was skipped because of an unmet condition check (ConditionPathExists=/etc/krb5.keytab).
[    6.437991] systemd[1]: iscsi-starter.service was skipped because of an unmet condition check (ConditionDirectoryNotEmpty=/var/lib/iscsi/nodes).
[    6.443951] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[    6.451763] systemd[1]: Starting lvm2-monitor.service - Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    6.459081] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[    6.463353] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel Module dm_mod...
[    6.471566] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[    6.476535] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[    6.480086] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[    6.483227] systemd[1]: Starting modprobe@loop.service - Load Kernel Module loop...
[    6.484608] systemd[1]: plymouth-switch-root.service: Deactivated successfully.
[    6.484706] systemd[1]: Stopped plymouth-switch-root.service - Plymouth switch root service.
[    6.488795] systemd[1]: systemd-fsck-root.service: Deactivated successfully.
[    6.488883] systemd[1]: Stopped systemd-fsck-root.service - File System Check on Root Device.
[    6.492429] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    6.494399] calling  loop_init+0x0/0xff8 [loop] @ 2814
[    6.496362] loop: module loaded
[    6.496363] initcall loop_init+0x0/0xff8 [loop] returned 0 after 270 usecs
[    6.497761] systemd[1]: Starting systemd-journald.service - Journal Service...
[    6.502175] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[    6.506495] systemd[1]: Starting systemd-network-generator.service - Generate network units from Kernel command line...
[    6.507836] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.509433] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[    6.511776] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.513918] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[    6.517827] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    6.524827] BTRFS info (device nvme0n1p3 state M): use zstd compression, level 1
[    6.526179] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
[    6.528542] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[    6.531418] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[    6.532766] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[    6.534235] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[    6.536543] systemd-journald[2815]: Collecting audit messages is enabled.
[    6.539476] audit: type=1130 audit(1738698942.181:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.540045] systemd[1]: Finished lvm2-monitor.service - Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling.
[    6.544054] audit: type=1130 audit(1738698942.186:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=lvm2-monitor comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.544495] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    6.548387] systemd[1]: Finished modprobe@configfs.service - Load Kernel Module configfs.
[    6.550143] audit: type=1130 audit(1738698942.192:6): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=modprobe@configfs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.550161] audit: type=1131 audit(1738698942.192:7): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=modprobe@configfs comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.550588] systemd[1]: modprobe@dm_mod.service: Deactivated successfully.
[    6.558924] systemd[1]: Finished modprobe@dm_mod.service - Load Kernel Module dm_mod.
[    6.565868] audit: type=1130 audit(1738698942.208:8): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=modprobe@dm_mod comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.565877] audit: type=1131 audit(1738698942.208:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=modprobe@dm_mod comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.565938] systemd[1]: Started systemd-journald.service - Journal Service.
[    6.581535] audit: type=1130 audit(1738698942.223:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.590534] audit: type=1130 audit(1738698942.232:11): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=modprobe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.590542] audit: type=1131 audit(1738698942.232:12): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=modprobe@drm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    6.668836] systemd-journald[2815]: Received client request to flush runtime journal.
[    6.731575] systemd-journald[2815]: /var/log/journal/980e4cb938d74f53ade116d4358c6098/system.journal: Realtime clock jumped backwards relative to last journal entry, rotating.
[    6.731587] systemd-journald[2815]: Rotating system journal.
[    7.278309] zram0: detected capacity change from 0 to 16777216
[    7.385947] Adding 8388604k swap on /dev/zram0.  Priority:100 extents:1 across:8388604k SSDsc
[    7.540940] EXT4-fs (nvme0n1p2): mounted filesystem c8e29478-8fe9-49bc-90cd-e816cbe753b8 r/w with ordered data mode. Quota mode: none.
[    7.552920] calling  joydev_init+0x0/0xff8 [joydev] @ 2940
[    7.552943] initcall joydev_init+0x0/0xff8 [joydev] returned 0 after 8 usecs
[    7.578639] calling  init_fat_fs+0x0/0xf50 [fat] @ 3638
[    7.578754] initcall init_fat_fs+0x0/0xf50 [fat] returned 0 after 91 usecs
[    7.581661] calling  init_vfat_fs+0x0/0xff8 [vfat] @ 3638
[    7.581679] initcall init_vfat_fs+0x0/0xff8 [vfat] returned 0 after 8 usecs
[    7.650609] calling  init_misc_binfmt+0x0/0xff8 [binfmt_misc] @ 3783
[    7.650632] initcall init_misc_binfmt+0x0/0xff8 [binfmt_misc] returned 0 after 4 usecs
[    7.742580] calling  init_soundcore+0x0/0xff8 [soundcore] @ 2919
[    7.742625] initcall init_soundcore+0x0/0xff8 [soundcore] returned 0 after 24 usecs
[    7.760163] calling  gpio_led_driver_init+0x0/0xff8 [leds_gpio] @ 2915
[    7.770260] probe of leds returned 0 after 9961 usecs
[    7.773183] probe of 33c0000.pinctrl returned 517 after 3013 usecs
[    7.776910] initcall gpio_led_driver_init+0x0/0xff8 [leds_gpio] returned 0 after 16727 usecs
[    7.786891] calling  qcom_cpufreq_hw_init+0x0/0xff8 [qcom_cpufreq_hw] @ 2875
[    7.790434] cpu cpu0: EM: OPP:1555200 is inefficient
[    7.790441] cpu cpu0: EM: OPP:595200 is inefficient
[    7.790443] cpu cpu0: EM: OPP:499200 is inefficient
[    7.790446] cpu cpu0: EM: OPP:403200 is inefficient
[    7.790448] cpu cpu0: EM: OPP:300000 is inefficient
[    7.790812] cpu cpu0: EM: created perf domain
[    7.790815] energy_model: Accessing cpu4 policy failed
[    7.801125] calling  fastrpc_init+0x0/0xa8 [fastrpc] @ 2889
[    7.804375] qcom,fastrpc 1b300000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FASTRPC
[    7.807522] calling  alsa_sound_init+0x0/0xc0 [snd] @ 2919
[    7.807572] initcall alsa_sound_init+0x0/0xc0 [snd] returned 0 after 23 usecs
[    7.820210] calling  alsa_timer_init+0x0/0xff8 [snd_timer] @ 2919
[    7.821761] initcall alsa_timer_init+0x0/0xff8 [snd_timer] returned 0 after 1533 usecs
[    7.844662] calling  pci_pwrctrl_pwrseq_driver_init+0x0/0xff8 [pci_pwrctrl_pwrseq] @ 2892
[    7.850407] cpu cpu4: EM: created perf domain
[    7.856497] energy_model: updating cpu0 cpu_cap=798 old capacity=981
[    7.856511] cpu cpu0: EM: OPP:1555200 is inefficient
[    7.856516] cpu cpu0: EM: OPP:595200 is inefficient
[    7.856518] cpu cpu0: EM: OPP:499200 is inefficient
[    7.856520] cpu cpu0: EM: OPP:403200 is inefficient
[    7.856522] cpu cpu0: EM: OPP:300000 is inefficient
[    7.857826] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@1: Adding to iommu group 9
[    7.858023] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@1 returned 0 after 284 usecs
[    7.874108] probe of 33c0000.pinctrl returned 517 after 15872 usecs
[    7.874112] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@2: Adding to iommu group 10
[    7.875325] calling  alsa_pcm_init+0x0/0xff8 [snd_pcm] @ 4043
[    7.875347] initcall alsa_pcm_init+0x0/0xff8 [snd_pcm] returned 0 after 6 usecs
[    7.877817] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@2 returned 0 after 19511 usecs
[    7.882575] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 11
[    7.882605] probe of 18591000.cpufreq returned 0 after 95566 usecs
[    7.882624] probe of 33c0000.pinctrl returned 517 after 4637 usecs
[    7.883628] initcall qcom_cpufreq_hw_init+0x0/0xff8 [qcom_cpufreq_hw] returned 0 after 8287 usecs
[    7.883649] calling  alsa_seq_device_init+0x0/0xff8 [snd_seq_device] @ 4081
[    7.883672] calling  mhi_init+0x0/0xff8 [mhi] @ 2933
[    7.883681] initcall alsa_seq_device_init+0x0/0xff8 [snd_seq_device] returned 0 after 24 usecs
[    7.883710] initcall mhi_init+0x0/0xff8 [mhi] returned 0 after 20 usecs
[    7.883839] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@3 returned 0 after 5762 usecs
[    7.885790] probe of 33c0000.pinctrl returned 517 after 2987 usecs
[    7.888509] probe of 33c0000.pinctrl returned 517 after 2570 usecs
[    7.888622] calling  alsa_seq_init+0x0/0x80 [snd_seq] @ 4080
[    7.888628] calling  rfkill_init+0x0/0x110 [rfkill] @ 2933
[    7.888701] initcall alsa_seq_init+0x0/0x80 [snd_seq] returned 0 after 63 usecs
[    7.888875] initcall rfkill_init+0x0/0x110 [rfkill] returned 0 after 237 usecs
[    7.894895] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 12
[    7.895043] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@4 returned 0 after 234 usecs
[    7.895242] probe of 33c0000.pinctrl returned 517 after 57 usecs
[    7.895430] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 13
[    7.895545] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@5 returned 0 after 156 usecs
[    7.895706] probe of 33c0000.pinctrl returned 517 after 45 usecs
[    7.895751] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 14
[    7.895845] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@6 returned 0 after 135 usecs
[    7.895971] probe of 33c0000.pinctrl returned 517 after 36 usecs
[    7.897246] calling  ac97_bus_init+0x0/0xff8 [ac97_bus] @ 2879
[    7.897282] initcall ac97_bus_init+0x0/0xff8 [ac97_bus] returned 0 after 26 usecs
[    7.905506] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 15
[    7.905966] probe of 1c00000.pcie:pcie@0:wifi@0 returned 0 after 61147 usecs
[    7.905991] initcall pci_pwrctrl_pwrseq_driver_init+0x0/0xff8 [pci_pwrctrl_pwrseq] returned 0 after 8734 usecs
[    7.906356] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@7 returned 0 after 8461 usecs
[    7.906386] probe of 33c0000.pinctrl returned 517 after 233 usecs
[    7.906674] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@8: Adding to iommu group 16
[    7.908289] probe of 33c0000.pinctrl returned 517 after 1670 usecs
[    7.908425] probe of 33c0000.pinctrl returned 517 after 20 usecs
[    7.908452] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@8 returned 0 after 1845 usecs
[    7.908604] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@9: Adding to iommu group 17
[    7.908824] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@9 returned 0 after 263 usecs
[    7.908958] probe of 33c0000.pinctrl returned 517 after 178 usecs
[    7.909980] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@10: Adding to iommu group 17
[    7.910079] probe of 33c0000.pinctrl returned 517 after 24 usecs
[    7.911454] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@10 returned 0 after 1516 usecs
[    7.911663] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@11: Adding to iommu group 18
[    7.911843] probe of 33c0000.pinctrl returned 517 after 26 usecs
[    7.912220] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@11 returned 0 after 608 usecs
[    7.912342] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@12: Adding to iommu group 19
[    7.912592] probe of 33c0000.pinctrl returned 517 after 18 usecs
[    7.912615] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@12 returned 0 after 305 usecs
[    7.912728] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@13: Adding to iommu group 20
[    7.912885] probe of 33c0000.pinctrl returned 517 after 16 usecs
[    7.912908] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@13 returned 0 after 209 usecs
[    7.913020] qcom,fastrpc-cb 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@14: Adding to iommu group 21
[    7.923406] probe of 1b300000.remoteproc:glink-edge:fastrpc:compute-cb@14 returned 0 after 10415 usecs
[    7.926562] probe of 33c0000.pinctrl returned 517 after 3232 usecs
[    7.926901] probe of 1b300000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1 returned 0 after 123227 usecs
[    7.927505] probe of 33c0000.pinctrl returned 517 after 652 usecs
[    7.928346] calling  snd_soc_init+0x0/0xc8 [snd_soc_core] @ 2876
[    7.928713] probe of snd-soc-dummy returned 0 after 32 usecs
[    7.928821] initcall snd_soc_init+0x0/0xc8 [snd_soc_core] returned 0 after 448 usecs
[    7.928875] probe of 33c0000.pinctrl returned 517 after 41 usecs
[    7.949273] calling  va_macro_driver_init+0x0/0xff8 [snd_soc_lpass_va_macro] @ 2879
[    7.949364] probe of 3370000.codec returned -517 after 6 usecs
[    7.949422] calling  media_devnode_init+0x0/0xff8 [mc] @ 2935
[    7.949436] mc: Linux media interface: v0.10
[    7.949461] initcall va_macro_driver_init+0x0/0xff8 [snd_soc_lpass_va_macro] returned 0 after 25 usecs
[    7.949543] initcall fastrpc_init+0x0/0xa8 [fastrpc] returned 0 after 107 usecs
[    7.949719] calling  sdw_bus_init+0x0/0xff8 [soundwire_bus] @ 2899
[    7.949752] initcall sdw_bus_init+0x0/0xff8 [soundwire_bus] returned 0 after 20 usecs
[    7.950577] calling  tx_macro_driver_init+0x0/0xff8 [snd_soc_lpass_tx_macro] @ 2876
[    7.950674] probe of 3220000.txmacro returned -517 after 3 usecs
[    7.950729] initcall tx_macro_driver_init+0x0/0xff8 [snd_soc_lpass_tx_macro] returned 0 after 100 usecs
[    7.950935] calling  rx_macro_driver_init+0x0/0xff8 [snd_soc_lpass_rx_macro] @ 2942
[    7.950985] probe of 3200000.rxmacro returned -517 after 4 usecs
[    7.951038] initcall rx_macro_driver_init+0x0/0xff8 [snd_soc_lpass_rx_macro] returned 0 after 94 usecs
[    7.951943] initcall media_devnode_init+0x0/0xff8 [mc] returned 0 after 999 usecs
[    7.955036] calling  cfg80211_init+0x0/0xf0 [cfg80211] @ 2933
[    7.955422] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    7.955701] calling  wsa_macro_driver_init+0x0/0xff8 [snd_soc_lpass_wsa_macro] @ 2877
[    7.956162] probe of 3240000.codec returned -517 after 5 usecs
[    7.956253] initcall wsa_macro_driver_init+0x0/0xff8 [snd_soc_lpass_wsa_macro] returned 0 after 168 usecs
[    7.956642] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    7.956783] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    7.960064] initcall cfg80211_init+0x0/0xf0 [cfg80211] returned 0 after 3978 usecs
[    7.970248] calling  mbhc_init+0x0/0xff8 [snd_soc_wcd_mbhc] @ 2919
[    7.970261] initcall mbhc_init+0x0/0xff8 [snd_soc_wcd_mbhc] returned 0 after 0 usecs
[    7.971234] calling  qcom_llcc_edac_driver_init+0x0/0xff8 [qcom_edac] @ 2878
[    7.971233] calling  apm_driver_init+0x0/0xff8 [snd_q6apm] @ 2897
[    7.976792] calling  slimbus_init+0x0/0xff8 [slimbus] @ 2899
[    7.976833] initcall slimbus_init+0x0/0xff8 [slimbus] returned 0 after 28 usecs
[    7.976838] EDAC DEVICE0: Giving out device to module qcom_llcc_edac controller llcc: DEV qcom_llcc_edac (INTERRUPT)
[    7.976861] probe of qcom_llcc_edac returned 0 after 5541 usecs
[    7.980068] probe of 33c0000.pinctrl returned 517 after 3039 usecs
[    7.980118] calling  wcd9380_codec_driver_init+0x0/0xff8 [snd_soc_wcd938x_sdw] @ 2919
[    7.980152] initcall wcd9380_codec_driver_init+0x0/0xff8 [snd_soc_wcd938x_sdw] returned 0 after 25 usecs
[    7.980241] probe of 3370000.codec returned -517 after 3 usecs
[    7.980315] probe of 3220000.txmacro returned -517 after 2 usecs
[    7.981067] probe of 3200000.rxmacro returned -517 after 3 usecs
[    7.981164] probe of 3240000.codec returned -517 after 2 usecs
[    7.982702] initcall qcom_llcc_edac_driver_init+0x0/0xff8 [qcom_edac] returned 0 after 2575 usecs
[    7.982874] calling  tsens_driver_init+0x0/0x40 [qcom_tsens] @ 2876
[    7.989566] calling  wcd938x_codec_driver_init+0x0/0xff8 [snd_soc_wcd938x] @ 2919
[    7.990179] probe of audio-codec returned 0 after 501 usecs
[    7.990247] initcall wcd938x_codec_driver_init+0x0/0xff8 [snd_soc_wcd938x] returned 0 after 671 usecs
[    7.990402] probe of 33c0000.pinctrl returned 517 after 47 usecs
[    7.990563] probe of 3370000.codec returned -517 after 3 usecs
[    7.990635] probe of 3220000.txmacro returned -517 after 1 usecs
[    7.990698] probe of 3200000.rxmacro returned -517 after 1 usecs
[    7.990759] probe of 3240000.codec returned -517 after 1 usecs
[    7.991003] calling  videodev_init+0x0/0xff8 [videodev] @ 2935
[    7.991028] videodev: Linux video capture interface: v2.00
[    7.992402] initcall videodev_init+0x0/0xff8 [videodev] returned 0 after 1373 usecs
[    7.993896] calling  qcom_swrm_driver_init+0x0/0xff8 [soundwire_qcom] @ 2893
[    7.993987] probe of 3210000.soundwire returned -517 after 2 usecs
[    7.993994] probe of 3250000.soundwire returned -517 after 0 usecs
[    7.993999] probe of 3330000.soundwire returned -517 after 0 usecs
[    7.994097] initcall qcom_swrm_driver_init+0x0/0xff8 [soundwire_qcom] returned 0 after 191 usecs
[    8.004839] calling  hdmi_codec_driver_init+0x0/0xff8 [snd_soc_hdmi_codec] @ 2878
[    8.007164] probe of 33c0000.pinctrl returned 517 after 62 usecs
[    8.007312] probe of c251000.thermal-sensor returned 0 after 24311 usecs
[    8.007356] probe of 3370000.codec returned -517 after 4 usecs
[    8.007489] probe of 3220000.txmacro returned -517 after 46 usecs
[    8.007623] probe of hdmi-audio-codec.7.auto returned 0 after 1560 usecs
[    8.007675] probe of 3200000.rxmacro returned -517 after 3 usecs
[    8.007786] probe of 3240000.codec returned -517 after 5 usecs
[    8.007900] probe of 3210000.soundwire returned -517 after 1 usecs
[    8.007992] probe of 3250000.soundwire returned -517 after 1 usecs
[    8.008077] probe of 3330000.soundwire returned -517 after 1 usecs
[    8.008574] probe of 33c0000.pinctrl returned 517 after 430 usecs
[    8.008748] probe of c252000.thermal-sensor returned 0 after 1429 usecs
[    8.008812] probe of hdmi-audio-codec.8.auto returned 0 after 35 usecs
[    8.009411] probe of 3370000.codec returned -517 after 5 usecs
[    8.009526] probe of 3220000.txmacro returned -517 after 2 usecs
[    8.009601] probe of 3200000.rxmacro returned -517 after 1 usecs
[    8.009658] calling  v4l2_async_init+0x0/0xff8 [v4l2_async] @ 2915
[    8.009682] initcall v4l2_async_init+0x0/0xff8 [v4l2_async] returned 0 after 14 usecs
[    8.009697] probe of 3240000.codec returned -517 after 2 usecs
[    8.009779] probe of 3210000.soundwire returned -517 after 0 usecs
[    8.009854] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.009917] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.010372] probe of 33c0000.pinctrl returned 517 after 406 usecs
[    8.012451] probe of hdmi-audio-codec.9.auto returned 0 after 3112 usecs
[    8.012612] probe of 3370000.codec returned -517 after 5 usecs
[    8.012708] probe of 3220000.txmacro returned -517 after 2 usecs
[    8.012789] probe of 3200000.rxmacro returned -517 after 2 usecs
[    8.012873] probe of 3240000.codec returned -517 after 2 usecs
[    8.012956] probe of 3210000.soundwire returned -517 after 1 usecs
[    8.013063] probe of 3250000.soundwire returned -517 after 1 usecs
[    8.013163] probe of 3330000.soundwire returned -517 after 1 usecs
[    8.013538] probe of 33c0000.pinctrl returned 517 after 297 usecs
[    8.014657] initcall hdmi_codec_driver_init+0x0/0xff8 [snd_soc_hdmi_codec] returned 0 after 4988 usecs
[    8.023547] calling  ieee80211_init+0x0/0x78 [mac80211] @ 2933
[    8.023635] initcall ieee80211_init+0x0/0x78 [mac80211] returned 0 after 13 usecs
[    8.035547] calling  ov5675_i2c_driver_init+0x0/0xff8 [ov5675] @ 2915
[    8.037758] probe of c263000.thermal-sensor returned 0 after 29003 usecs
[    8.037950] probe of 3370000.codec returned -517 after 4 usecs
[    8.038055] probe of 3220000.txmacro returned -517 after 2 usecs
[    8.038119] probe of 3200000.rxmacro returned -517 after 1 usecs
[    8.038183] probe of 3240000.codec returned -517 after 1 usecs
[    8.038244] probe of 3210000.soundwire returned -517 after 0 usecs
[    8.038305] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.038363] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.039158] calling  snd_sc8280xp_driver_init+0x0/0xff8 [snd_soc_sc8280xp] @ 2889
[    8.041283] probe of sound returned 517 after 2016 usecs
[    8.041294] probe of 33c0000.pinctrl returned 517 after 2882 usecs
[    8.041358] initcall snd_sc8280xp_driver_init+0x0/0xff8 [snd_soc_sc8280xp] returned 0 after 2191 usecs
[    8.053585] calling  iio_init+0x0/0xff8 [industrialio] @ 2917
[    8.053832] initcall iio_init+0x0/0xff8 [industrialio] returned 0 after 228 usecs
[    8.056719] calling  qpnp_tm_driver_init+0x0/0xff8 [qcom_spmi_temp_alarm] @ 2917
[    8.056726] calling  qcom_camss_driver_init+0x0/0xff8 [qcom_camss] @ 2935
[    8.056951] probe of 23-0010 returned 0 after 21299 usecs
[    8.057162] probe of 3370000.codec returned -517 after 4 usecs
[    8.057523] initcall ov5675_i2c_driver_init+0x0/0xff8 [ov5675] returned 0 after 780 usecs
[    8.060440] probe of c440000.spmi:pmic@1:temp-alarm@a00 returned 517 after 3550 usecs
[    8.061108] probe of 3220000.txmacro returned -517 after 4 usecs
[    8.061222] probe of 3200000.rxmacro returned -517 after 2 usecs
[    8.061290] probe of 3240000.codec returned -517 after 1 usecs
[    8.061353] probe of 3210000.soundwire returned -517 after 0 usecs
[    8.061415] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.061487] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.061557] probe of c265000.thermal-sensor returned 0 after 23633 usecs
[    8.063426] qcom-camss ac5a000.camss: Adding to iommu group 22
[    8.063594] initcall tsens_driver_init+0x0/0x40 [qcom_tsens] returned 0 after 6849 usecs
[    8.063883] probe of c440000.spmi:pmic@3:temp-alarm@a00 returned 517 after 3427 usecs
[    8.063904] initcall qpnp_tm_driver_init+0x0/0xff8 [qcom_spmi_temp_alarm] returned 0 after 7160 usecs
[    8.065918] probe of sound returned 517 after 4366 usecs
[    8.068053] probe of 33c0000.pinctrl returned 517 after 2045 usecs
[    8.068171] probe of 3370000.codec returned -517 after 3 usecs
[    8.069593] probe of c440000.spmi:pmic@1:temp-alarm@a00 returned 517 after 1359 usecs
[    8.070090] probe of 3220000.txmacro returned -517 after 4 usecs
[    8.070185] probe of 3200000.rxmacro returned -517 after 1 usecs
[    8.070258] probe of 3240000.codec returned -517 after 2 usecs
[    8.070326] probe of 3210000.soundwire returned -517 after 0 usecs
[    8.070390] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.070461] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.072330] probe of c440000.spmi:pmic@3:temp-alarm@a00 returned 517 after 1786 usecs
[    8.072501] probe of sound returned 517 after 47 usecs
[    8.082267] calling  ath11k_pci_init+0x0/0x68 [ath11k_pci] @ 2933
[    8.082471] ath11k_pci 0006:01:00.0: BAR 0 [mem 0x30400000-0x305fffff 64bit]: assigned
[    8.082537] ath11k_pci 0006:01:00.0: enabling device (0000 -> 0002)
[    8.082545] ath11k_pci 0006:01:00.0: calling  ks_pcie_quirk+0x0/0x180 @ 2933
[    8.082552] ath11k_pci 0006:01:00.0: ks_pcie_quirk+0x0/0x180 took 0 usecs
[    8.090527] calling  adc_tm5_driver_init+0x0/0xff8 [qcom_spmi_adc_tm5] @ 2883
[    8.098555] calling  adc5_driver_init+0x0/0xff8 [qcom_spmi_adc5] @ 2936
[    8.098798] probe of c440000.spmi:pmic@0:adc-tm@3400 returned 517 after 8125 usecs
[    8.098859] initcall adc_tm5_driver_init+0x0/0xff8 [qcom_spmi_adc_tm5] returned 0 after 292 usecs
[    8.099026] probe of c440000.spmi:pmic@0:adc@3100 returned 0 after 327 usecs
[    8.099052] initcall adc5_driver_init+0x0/0xff8 [qcom_spmi_adc5] returned 0 after 484 usecs
[    8.099116] ath11k_pci 0006:01:00.0: MSI vectors: 32
[    8.099141] ath11k_pci 0006:01:00.0: wcn6855 hw2.1
[    8.099256] probe of 33c0000.pinctrl returned 517 after 57 usecs
[    8.099446] probe of 3370000.codec returned -517 after 4 usecs
[    8.100124] calling  pm8941_pwrkey_driver_init+0x0/0xff8 [pm8941_pwrkey] @ 2880
[    8.116813] probe of c440000.spmi:pmic@1:temp-alarm@a00 returned 0 after 17261 usecs
[    8.117053] probe of 3220000.txmacro returned -517 after 3 usecs
[    8.117154] probe of 3200000.rxmacro returned -517 after 1 usecs
[    8.117220] probe of 3240000.codec returned -517 after 1 usecs
[    8.117284] probe of 3210000.soundwire returned -517 after 0 usecs
[    8.117344] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.117402] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.136500] probe of c440000.spmi:pmic@3:temp-alarm@a00 returned 0 after 19027 usecs
[    8.136768] probe of sound returned 517 after 40 usecs
[    8.150536] input: pmic_pwrkey as /devices/platform/soc@0/c440000.spmi/spmi-0/0-00/c440000.spmi:pmic@0:pon@1300/c440000.spmi:pmic@0:pon@1300:pwrkey/input/input17
[    8.170794] calling  bt_init+0x0/0xf0 [bluetooth] @ 2922
[    8.170852] Bluetooth: Core ver 2.22
[    8.177202] NET: Registered PF_BLUETOOTH protocol family
[    8.177567] Bluetooth: HCI device and connection manager initialized
[    8.177917] Bluetooth: HCI socket layer initialized
[    8.178235] Bluetooth: L2CAP socket layer initialized
[    8.178246] Bluetooth: SCO socket layer initialized
[    8.178251] initcall bt_init+0x0/0xf0 [bluetooth] returned 0 after 7399 usecs
[    8.196740] probe of c440000.spmi:pmic@0:adc-tm@3400 returned 0 after 59859 usecs
[    8.196880] probe of c440000.spmi:pmic@0:pon@1300:pwrkey returned 0 after 96350 usecs
[    8.197687] probe of 33c0000.pinctrl returned 517 after 730 usecs
[    8.197899] probe of 3370000.codec returned -517 after 5 usecs
[    8.197990] probe of 3220000.txmacro returned -517 after 2 usecs
[    8.198079] probe of 3200000.rxmacro returned -517 after 2 usecs
[    8.198170] probe of 3240000.codec returned -517 after 2 usecs
[    8.198255] probe of 3210000.soundwire returned -517 after 1 usecs
[    8.198347] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.198444] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.202382] probe of sound returned 517 after 3833 usecs
[    8.225392] input: pmic_resin as /devices/platform/soc@0/c440000.spmi/spmi-0/0-00/c440000.spmi:pmic@0:pon@1300/c440000.spmi:pmic@0:pon@1300:resin/input/input18
[    8.228468] probe of c440000.spmi:pmic@0:pon@1300:resin returned 0 after 31565 usecs
[    8.230553] initcall pm8941_pwrkey_driver_init+0x0/0xff8 [pm8941_pwrkey] returned 0 after 59701 usecs
[    8.232876] probe of 33c0000.pinctrl returned 517 after 4246 usecs
[    8.233160] probe of 3370000.codec returned -517 after 5 usecs
[    8.233294] probe of 3220000.txmacro returned -517 after 3 usecs
[    8.233398] probe of 3200000.rxmacro returned -517 after 2 usecs
[    8.233514] probe of 3240000.codec returned -517 after 2 usecs
[    8.233607] probe of 3210000.soundwire returned -517 after 1 usecs
[    8.233692] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.233778] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.246155] probe of sound returned 517 after 12292 usecs
[    8.265409] mhi mhi0: Requested to power ON
[    8.266428] mhi mhi0: Power on setup success
[    8.270440] calling  hci_uart_init+0x0/0x98 [hci_uart] @ 2922
[    8.270485] Bluetooth: HCI UART driver ver 2.3
[    8.270999] Bluetooth: HCI UART protocol H4 registered
[    8.271454] Bluetooth: HCI UART protocol BCSP registered
[    8.273708] Bluetooth: HCI UART protocol LL registered
[    8.273711] Bluetooth: HCI UART protocol ATH3K registered
[    8.289407] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    8.300219] Bluetooth: HCI UART protocol Intel registered
[    8.313017] Bluetooth: HCI UART protocol Broadcom registered
[    8.325366] Bluetooth: HCI UART protocol QCA registered
[    8.325887] Bluetooth: HCI UART protocol AG6XX registered
[    8.327985] Bluetooth: HCI UART protocol Marvell registered
[    8.327989] initcall hci_uart_init+0x0/0x98 [hci_uart] returned 0 after 57501 usecs
[    8.335146] probe of serial0-0 returned 0 after 11502 usecs
[    8.336317] Bluetooth: hci0: setting up wcn6855
[    8.342967] probe of 33c0000.pinctrl returned 517 after 7642 usecs
[    8.343230] probe of 3370000.codec returned -517 after 6 usecs
[    8.343319] probe of 3220000.txmacro returned -517 after 1 usecs
[    8.343383] probe of 3200000.rxmacro returned -517 after 2 usecs
[    8.343456] probe of 3240000.codec returned -517 after 1 usecs
[    8.343610] probe of 3210000.soundwire returned -517 after 1 usecs
[    8.343684] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.343748] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.351023] probe of sound returned 517 after 7210 usecs
[    8.404802] Bluetooth: hci0: QCA Product ID   :0x00000013
[    8.405269] Bluetooth: hci0: QCA SOC Version  :0x400c0210
[    8.405716] Bluetooth: hci0: QCA ROM Version  :0x00000201
[    8.406155] Bluetooth: hci0: QCA Patch Version:0x000038e6
[    8.409766] probe of ac5a000.camss returned 0 after 352797 usecs
[    8.409880] initcall qcom_camss_driver_init+0x0/0xff8 [qcom_camss] returned 0 after 139386 usecs
[    8.410008] probe of 33c0000.pinctrl returned 517 after 65 usecs
[    8.410180] probe of 3370000.codec returned -517 after 3 usecs
[    8.410248] probe of 3220000.txmacro returned -517 after 1 usecs
[    8.410311] probe of 3200000.rxmacro returned -517 after 1 usecs
[    8.410372] probe of 3240000.codec returned -517 after 1 usecs
[    8.410434] probe of 3210000.soundwire returned -517 after 0 usecs
[    8.410573] probe of 3250000.soundwire returned -517 after 0 usecs
[    8.410639] probe of 3330000.soundwire returned -517 after 0 usecs
[    8.410730] probe of sound returned 517 after 26 usecs
[    8.416619] Bluetooth: hci0: QCA controller version 0x02100201
[    8.416624] Bluetooth: hci0: QCA Downloading qca/hpbtfw21.tlv
[    8.455675] nvme nvme0: using unchecked data buffer
[    8.482107] calling  init_sunrpc+0x0/0xb0 [sunrpc] @ 4784
[    8.482431] RPC: Registered named UNIX socket transport module.
[    8.482509] mhi mhi0: Wait for device to enter SBL or Mission mode
[    8.482891] RPC: Registered udp transport module.
[    8.483621] RPC: Registered tcp transport module.
[    8.483622] RPC: Registered tcp-with-tls transport module.
[    8.483623] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    8.483625] initcall init_sunrpc+0x0/0xb0 [sunrpc] returned 0 after 1466 usecs
[    9.060990] calling  nf_tables_module_init+0x0/0x118 [nf_tables] @ 4811
[    9.061040] initcall nf_tables_module_init+0x0/0x118 [nf_tables] returned 0 after 23 usecs
[    9.072533] Bluetooth: hci0: QCA Downloading qca/hpnv21.bin
[    9.094780] calling  ip_set_init+0x0/0xff8 [ip_set] @ 4821
[    9.094809] initcall ip_set_init+0x0/0xff8 [ip_set] returned 0 after 12 usecs
[    9.104712] probe of 0006:01:00.0 returned 0 after 1022363 usecs
[    9.104746] initcall ath11k_pci_init+0x0/0x68 [ath11k_pci] returned 0 after 9949 usecs
[    9.105293] probe of 33c0000.pinctrl returned 517 after 79 usecs
[    9.105506] probe of 3370000.codec returned -517 after 5 usecs
[    9.105610] probe of 3220000.txmacro returned -517 after 3 usecs
[    9.105695] probe of 3200000.rxmacro returned -517 after 2 usecs
[    9.105776] probe of 3240000.codec returned -517 after 2 usecs
[    9.105858] probe of 3210000.soundwire returned -517 after 1 usecs
[    9.105939] probe of 3250000.soundwire returned -517 after 0 usecs
[    9.106017] probe of 3330000.soundwire returned -517 after 0 usecs
[    9.106138] probe of sound returned 517 after 38 usecs
[    9.209312] calling  nf_defrag_init+0x0/0xff8 [nf_defrag_ipv4] @ 5069
[    9.209326] initcall nf_defrag_init+0x0/0xff8 [nf_defrag_ipv4] returned 0 after 1 usecs
[    9.211694] calling  nf_defrag_init+0x0/0xff8 [nf_defrag_ipv6] @ 5069
[    9.241758] Bluetooth: hci0: QCA setup on UART is completed
[    9.246925] Bluetooth: hci0: AOSP extensions version v0.98
[    9.246931] Bluetooth: hci0: AOSP quality report is supported
[    9.276580] initcall nf_defrag_init+0x0/0xff8 [nf_defrag_ipv6] returned 0 after 64870 usecs
[    9.286958] calling  nf_conntrack_standalone_init+0x0/0xff8 [nf_conntrack] @ 5232
[    9.348814] initcall nf_conntrack_standalone_init+0x0/0xff8 [nf_conntrack] returned 0 after 61834 usecs
[    9.354784] calling  nf_nat_init+0x0/0xff8 [nf_nat] @ 5069
[    9.355265] initcall nf_nat_init+0x0/0xff8 [nf_nat] returned 0 after 468 usecs
[    9.356663] calling  nft_chain_nat_init+0x0/0xff8 [nft_chain_nat] @ 5069
[    9.356672] initcall nft_chain_nat_init+0x0/0xff8 [nft_chain_nat] returned 0 after 1 usecs
[    9.383994] calling  nft_ct_module_init+0x0/0xff8 [nft_ct] @ 5407
[    9.384010] initcall nft_ct_module_init+0x0/0xff8 [nft_ct] returned 0 after 2 usecs
[    9.471836] calling  nft_reject_inet_module_init+0x0/0xff8 [nft_reject_inet] @ 5456
[    9.471847] initcall nft_reject_inet_module_init+0x0/0xff8 [nft_reject_inet] returned 0 after 1 usecs
[    9.489811] calling  nft_fib6_module_init+0x0/0xff8 [nft_fib_ipv6] @ 5595
[    9.489823] initcall nft_fib6_module_init+0x0/0xff8 [nft_fib_ipv6] returned 0 after 1 usecs
[    9.491020] calling  nft_fib4_module_init+0x0/0xff8 [nft_fib_ipv4] @ 5595
[    9.491030] initcall nft_fib4_module_init+0x0/0xff8 [nft_fib_ipv4] returned 0 after 1 usecs
[    9.492062] calling  nft_fib_inet_module_init+0x0/0xff8 [nft_fib_inet] @ 5595
[    9.492070] initcall nft_fib_inet_module_init+0x0/0xff8 [nft_fib_inet] returned 0 after 0 usecs
[    9.498079] calling  nf_conntrack_netbios_ns_init+0x0/0xff8 [nf_conntrack_netbios_ns] @ 5608
[    9.498095] initcall nf_conntrack_netbios_ns_init+0x0/0xff8 [nf_conntrack_netbios_ns] returned 0 after 3 usecs
[    9.594620] calling  qcom_mhi_qrtr_driver_init+0x0/0xff8 [qrtr_mhi] @ 2876
[    9.595205] probe of mhi0_IPCR returned 0 after 557 usecs
[    9.595223] initcall qcom_mhi_qrtr_driver_init+0x0/0xff8 [qrtr_mhi] returned 0 after 590 usecs
[    9.595457] probe of 33c0000.pinctrl returned 517 after 66 usecs
[    9.595682] probe of 3370000.codec returned -517 after 4 usecs
[    9.595773] probe of 3220000.txmacro returned -517 after 2 usecs
[    9.595865] probe of 3200000.rxmacro returned -517 after 2 usecs
[    9.595968] probe of 3240000.codec returned -517 after 2 usecs
[    9.596065] probe of 3210000.soundwire returned -517 after 1 usecs
[    9.596173] probe of 3250000.soundwire returned -517 after 1 usecs
[    9.596277] probe of 3330000.soundwire returned -517 after 0 usecs
[    9.596419] probe of sound returned 517 after 47 usecs
[    9.611888] ath11k_pci 0006:01:00.0: chip_id 0x2 chip_family 0xb board_id 0x8c soc_id 0x400c0210
[    9.612299] ath11k_pci 0006:01:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
[   10.025173] ath11k_pci 0006:01:00.0 wlP6p1s0: renamed from wlan0
[   11.387946] rfkill: input handler disabled
[   11.808983] calling  snd_hrtimer_init+0x0/0xff8 [snd_hrtimer] @ 6235
[   11.808999] initcall snd_hrtimer_init+0x0/0xff8 [snd_hrtimer] returned 0 after 2 usecs
[   11.811848] calling  alsa_seq_dummy_init+0x0/0xe10 [snd_seq_dummy] @ 6236
[   11.811866] initcall alsa_seq_dummy_init+0x0/0xe10 [snd_seq_dummy] returned 0 after 9 usecs
[   13.283555] qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
[   13.284567] probe of gprsvc:service:2:1 returned 0 after 5312966 usecs
[   13.284615] initcall apm_driver_init+0x0/0xff8 [snd_q6apm] returned 0 after 1472658 usecs
[   13.285251] probe of 33c0000.pinctrl returned 517 after 195 usecs
[   13.285624] probe of 3370000.codec returned -517 after 12 usecs
[   13.285923] probe of 3220000.txmacro returned -517 after 8 usecs
[   13.286193] probe of 3200000.rxmacro returned -517 after 7 usecs
[   13.286460] probe of 3240000.codec returned -517 after 6 usecs
[   13.286720] probe of 3210000.soundwire returned -517 after 3 usecs
[   13.286999] probe of 3250000.soundwire returned -517 after 2 usecs
[   13.287252] probe of 3330000.soundwire returned -517 after 1 usecs
[   13.287369] probe of sound returned 517 after 35 usecs
[   13.291951] calling  prm_driver_init+0x0/0xff8 [q6prm] @ 2897
[   13.306432] probe of gprsvc:service:2:2 returned 0 after 14439 usecs
[   13.306499] initcall prm_driver_init+0x0/0xff8 [q6prm] returned 0 after 14529 usecs
[   13.306769] probe of 33c0000.pinctrl returned 517 after 141 usecs
[   13.307919] probe of 3370000.codec returned -517 after 13 usecs
[   13.308206] probe of 3220000.txmacro returned -517 after 8 usecs
[   13.308478] probe of 3200000.rxmacro returned -517 after 7 usecs
[   13.308747] probe of 3240000.codec returned -517 after 7 usecs
[   13.309099] probe of 3210000.soundwire returned -517 after 3 usecs
[   13.309372] probe of 3250000.soundwire returned -517 after 2 usecs
[   13.309639] probe of 3330000.soundwire returned -517 after 2 usecs
[   13.310028] probe of sound returned 517 after 86 usecs
[   13.319246] calling  q6apm_dai_platform_driver_init+0x0/0xff8 [q6apm_dai] @ 2921
[   13.319718] q6apm-dai 3000000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 23
[   13.320033] probe of 3000000.remoteproc:glink-edge:gpr:service@1:dais returned 0 after 522 usecs
[   13.320079] initcall q6apm_dai_platform_driver_init+0x0/0xff8 [q6apm_dai] returned 0 after 808 usecs
[   13.320374] probe of 33c0000.pinctrl returned 517 after 100 usecs
[   13.320670] probe of 3370000.codec returned -517 after 9 usecs
[   13.320911] probe of 3220000.txmacro returned -517 after 6 usecs
[   13.321123] probe of 3200000.rxmacro returned -517 after 5 usecs
[   13.321332] probe of 3240000.codec returned -517 after 5 usecs
[   13.321534] probe of 3210000.soundwire returned -517 after 2 usecs
[   13.321742] probe of 3250000.soundwire returned -517 after 1 usecs
[   13.321971] probe of 3330000.soundwire returned -517 after 2 usecs
[   13.322236] probe of sound returned 517 after 54 usecs
[   13.324322] calling  q6prm_clock_platform_driver_init+0x0/0xff8 [q6prm_clocks] @ 2897
[   13.329130] calling  q6apm_lpass_dai_platform_driver_init+0x0/0xff8 [q6apm_lpass_dais] @ 2895
[   13.329665] probe of 3000000.remoteproc:glink-edge:gpr:service@1:bedais returned 0 after 326 usecs
[   13.329716] initcall q6apm_lpass_dai_platform_driver_init+0x0/0xff8 [q6apm_lpass_dais] returned 0 after 554 usecs
[   13.329986] probe of 33c0000.pinctrl returned 517 after 114 usecs
[   13.330185] probe of 3370000.codec returned -517 after 6 usecs
[   13.330269] probe of 3220000.txmacro returned -517 after 2 usecs
[   13.330353] probe of 3200000.rxmacro returned -517 after 2 usecs
[   13.330457] probe of 3240000.codec returned -517 after 2 usecs
[   13.330541] probe of 3210000.soundwire returned -517 after 1 usecs
[   13.330638] probe of 3250000.soundwire returned -517 after 0 usecs
[   13.330729] probe of 3330000.soundwire returned -517 after 0 usecs
[   13.331081] probe of sound returned 517 after 137 usecs
[   13.341156] probe of 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller returned 0 after 16644 usecs
[   13.341205] initcall q6prm_clock_platform_driver_init+0x0/0xff8 [q6prm_clocks] returned 0 after 12042 usecs
[   13.358063] probe of 33c0000.pinctrl returned 0 after 16736 usecs
[   13.360205] probe of 3370000.codec returned 0 after 1840 usecs
[   13.361023] probe of 3220000.txmacro returned 0 after 503 usecs
[   13.362785] probe of 3200000.rxmacro returned 0 after 1639 usecs
[   13.364495] probe of 3240000.codec returned 0 after 1466 usecs
[   13.365479] probe of sdw:2:0:0217:010d:00:4 returned 0 after 197 usecs
[   13.366923] qcom-soundwire 3210000.soundwire: Qualcomm Soundwire controller v1.6.0 Registered
[   13.367005] probe of 3210000.soundwire returned 0 after 2409 usecs
[   13.475259] qcom-soundwire 3250000.soundwire: Qualcomm Soundwire controller v1.6.0 Registered
[   13.475610] probe of 3250000.soundwire returned 0 after 108315 usecs
[   13.479402] wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
[   13.479433] wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops [snd_soc_wcd938x_sdw])
[   13.480465] probe of sdw:3:0:0217:010d:00:3 returned 0 after 1222 usecs
[   13.482251] qcom-soundwire 3330000.soundwire: Qualcomm Soundwire controller v1.6.0 Registered
[   13.482290] probe of 3330000.soundwire returned 0 after 6164 usecs
[   13.482519] probe of sound returned 517 after 79 usecs
[   13.494769] calling  wsa883x_codec_driver_init+0x0/0xff8 [snd_soc_wsa883x] @ 2895
[   13.495960] probe of sdw:1:0:0217:0202:00:1 returned 0 after 926 usecs
[   13.496544] probe of sdw:1:0:0217:0202:00:2 returned 0 after 565 usecs
[   13.496678] initcall wsa883x_codec_driver_init+0x0/0xff8 [snd_soc_wsa883x] returned 0 after 1881 usecs
[   13.497935] wsa883x-codec sdw:1:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   13.500399] wsa883x-codec sdw:1:0:0217:0202:00:1: WSA883X Version 1_1, Variant: WSA8835_V2
[   13.503664] wsa883x-codec sdw:1:0:0217:0202:00:2: WSA883X Version 1_1, Variant: WSA8835_V2
[   13.515035] snd-sc8280xp sound: ASoC: Parent card not yet available, widget card binding deferred
[   13.523139] ALSA: Control name 'stream0.vol_ctrl0 MultiMedia1 Playback Volume' truncated to 'stream0.vol_ctrl0 MultiMedia1 Playback Volu'
[   13.523173] ALSA: Control name 'stream1.vol_ctrl1 MultiMedia2 Playback Volume' truncated to 'stream1.vol_ctrl1 MultiMedia2 Playback Volu'
[   13.526149] input: SC8280XP-LENOVO-X13S Headset Jack as /devices/platform/sound/sound/card0/input19
[   13.526435] probe of sound returned 0 after 30084 usecs
[   14.521994] Bluetooth: MGMT ver 1.23
[   14.522712] Bluetooth: hci0: setting up wcn6855
[   14.561337] calling  bnep_init+0x0/0x140 [bnep] @ 6572
[   14.561354] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   14.561360] Bluetooth: BNEP filters: protocol multicast
[   14.561368] Bluetooth: BNEP socket layer initialized
[   14.561372] initcall bnep_init+0x0/0x140 [bnep] returned 0 after 18 usecs
[   14.581950] Bluetooth: hci0: QCA Product ID   :0x00000013
[   14.581959] Bluetooth: hci0: QCA SOC Version  :0x400c0210
[   14.581961] Bluetooth: hci0: QCA ROM Version  :0x00000201
[   14.581963] Bluetooth: hci0: QCA Patch Version:0x000038e6
[   14.595477] Bluetooth: hci0: QCA controller version 0x02100201
[   14.595491] Bluetooth: hci0: QCA Downloading qca/hpbtfw21.tlv
[   14.974000] rfkill: input handler enabled
[   15.252174] Bluetooth: hci0: QCA Downloading qca/hpnv21.bin
[   15.441782] Bluetooth: hci0: QCA setup on UART is completed
[   15.478121] Bluetooth: hci0: AOSP extensions version v0.98
[   15.478130] Bluetooth: hci0: AOSP quality report is supported
[   15.537305] calling  rfcomm_init+0x0/0x110 [rfcomm] @ 6834
[   15.537377] Bluetooth: RFCOMM TTY layer initialized
[   15.537395] Bluetooth: RFCOMM socket layer initialized
[   15.537404] Bluetooth: RFCOMM ver 1.11
[   15.537408] initcall rfcomm_init+0x0/0x110 [rfcomm] returned 0 after 86 usecs
[   16.141744] rfkill: input handler disabled
[   18.487985] calling  ovl_init+0x0/0xff8 [overlay] @ 7693
[   18.488055] initcall ovl_init+0x0/0xff8 [overlay] returned 0 after 42 usecs
[   18.533055] evm: overlay not supported
[   20.694289] calling  michael_mic_init+0x0/0xff8 [michael_mic] @ 7813
[   20.694481] initcall michael_mic_init+0x0/0xff8 [michael_mic] returned 0 after 157 usecs
[   20.889160] wlP6p1s0: authenticate with 1c:87:2c:49:c7:9c (local address=96:6c:a5:55:7e:7d)
[   20.889174] wlP6p1s0: send auth to 1c:87:2c:49:c7:9c (try 1/3)
[   20.892239] wlP6p1s0: authenticated
[   20.895344] wlP6p1s0: associate with 1c:87:2c:49:c7:9c (try 1/3)
[   20.898068] wlP6p1s0: RX AssocResp from 1c:87:2c:49:c7:9c (capab=0x1011 status=0 aid=11)
[   20.912047] wlP6p1s0: associated

--ABq91/YDHTD7iOmD--

