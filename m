Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54C419D89E;
	Tue, 31 Mar 2026 23:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775000190; cv=none; b=JgX73ISR/688KlA5Cd6k9D5U89DAPzu6COw7CsFYhdcdIJRhx5CdYB5ZiqHt53YtYb7tpgEvpVnUnURXfdTc53G6wKiKV+84DDOXry+ChU4SyfnLXLXHpp5LtTaPRe5CtN81EgPdEGgKho+q5ip0kiY20iJbZX5PJ+ITKKLwF9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775000190; c=relaxed/simple;
	bh=oTsdwbPlf21A1swN+H672WjS423hWyg/L/6abgrBM8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PjdIiC2jZsyjwybJHv+hfAzM0kZTojqgiunBAOVuxCVTCWD0jbkE/jiCTpK4tRHj6eZCBJRojPUlQt0Ifv7VCgO+ulo7H2DwkM95HBthfplpK2KgW3VOtW2qN4e8AvUoPSzx39pMIiL3Ga5OnL+nJCqQpJYIewGWnhLkymTSSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPo8uaYf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPo8uaYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247F2C19423;
	Tue, 31 Mar 2026 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775000190;
	bh=oTsdwbPlf21A1swN+H672WjS423hWyg/L/6abgrBM8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EPo8uaYfM121xZysHH46+hFkHv4zCsfG2AvAT7cT+bpZ7m3tKz91voO5UD2R9l97C
	 KSyP0TpUTNG9OjCmuV8PEBXtaRiUskEbvNKcUoWv0fDAtvgVOV5QPbKlY+WdXZ482s
	 yI+28NKT0zAqCZ6ws64Ex9woS6dC1Nq44Qo7NIYMjHHpU5TxQn4e55tveokOQ07OBi
	 mj94ffTom7xlXgrmty4Ly5ytIjIM3fWOpD7H/IC6Ta8HloX342BIVXbfvUp0C5iLbF
	 sbqOCXXAm37YQLGAOAC/xKalOL8EEQGbGGLSZry4MlEIbIRhN2zeTTZ3q8Ayu342Vy
	 hWzBbPpT1Q0sw==
From: Thomas Gleixner <tglx@kernel.org>
To: "Bird, Tim" <Tim.Bird@sony.com>, "pmladek@suse.com" <pmladek@suse.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, Shashank Balaji <shashankbalaji02@gmail.com>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>
Cc: "francesco@valla.it" <francesco@valla.it>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org"
 <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
In-Reply-To: <87jyus9xft.ffs@tglx>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyuvboo2.ffs@tglx>
 <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyus9xft.ffs@tglx>
Date: Wed, 01 Apr 2026 01:36:26 +0200
Message-ID: <87ldf78tc5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tim!

On Tue, Mar 31 2026 at 11:10, Thomas Gleixner wrote:
> So the real good question is whether the extra information of how long
> that earliest init takes is really relevant to the goal of optimizing
> boot time. The expensive part of the boot process definitely comes after
> that.

That actually made me curious and so I hacked up the kernel with the
patch below to compensate for the difference between:

  x86_64_start_reservations()

	i.e. the C entry point of the kernel and the actual earliest
	point (ASM entry code aside) where the kernel can take a
	timestamp, which is modulo the sanity checks in the PoC the same
	thing, right?

and

  tsc_early_init()

        where the upstream kernel enables TSC sched clock today with all
        sanity checks and enumeration in place.

Here is the result on a bare metal 256 CPU machine:

[    0.000000] Linux version 7.0.0-rc3-dirty ...

....

[    0.000000] tsc: Detected 2100.000 MHz processor
[    0.012482] e820: update [mem 0x00000000-0x00000fff] System RAM ==> device reserved

That's ~12ms of time which is not accounted for in the overall boot time
until the machine reaches the init process:

[   12.289141] Run /init as init process

That means we are talking about ~0.1% of overall boot time in this case.

Starting a 4 CPU guest with the same kernel image on the same physical
machine and additionally 'no-kvmclock' on the command line to make the
hack work:

[    0.000000] Linux version 7.0.0-rc3-dirty ...

...

[    0.000000] tsc: Detected 2094.965 MHz processor
[    0.015122] last_pfn = 0x280000 max_arch_pfn = 0x400000000

Unsurpringly it takes a bit longer because during that phase the guest
takes a gazillion of vmexits.

[    0.995082] Run /init as init process

Now in this 4 CPU case we are talking about 1.5% of the overall boot
time.

With the same setup and 32 CPUs in the VM:

[    0.015150] e820: remove [mem 0x000a0000-0x000fffff] System RAM

The initial phase takes 30us more than with 4 CPUs, which is in the
noise and the machine ends up in init at:

[    3.329398] Run /init as init process

which means in total we are up to 0.45% of the overall boot time now.

I'm honestly confused. May I politely ask which problem you are trying
to solve?

Thanks,

        tglx
---
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -291,6 +291,8 @@ asmlinkage __visible void __init __noret
 	x86_64_start_reservations(real_mode_data);
 }
 
+extern u64 start_ts;
+
 void __init __noreturn x86_64_start_reservations(char *real_mode_data)
 {
 	/* version is always not zero if it is copied */
@@ -307,6 +309,8 @@ void __init __noreturn x86_64_start_rese
 		break;
 	}
 
+	start_ts = rdtsc();
+
 	start_kernel();
 }
 
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -53,6 +53,9 @@ static DEFINE_STATIC_KEY_FALSE_RO(__use_
 
 int tsc_clocksource_reliable;
 
+extern u64 start_ts;
+u64 start_ts;
+
 static int __read_mostly tsc_force_recalibrate;
 
 static struct clocksource_base art_base_clk = {
@@ -207,7 +210,7 @@ static void __init cyc2ns_init_boot_cpu(
 	struct cyc2ns *c2n = this_cpu_ptr(&cyc2ns);
 
 	seqcount_latch_init(&c2n->seq);
-	__set_cyc2ns_scale(tsc_khz, smp_processor_id(), rdtsc());
+	__set_cyc2ns_scale(tsc_khz, smp_processor_id(), start_ts);
 }
 
 /*

