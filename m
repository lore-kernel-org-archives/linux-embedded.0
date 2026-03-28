Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347DE34753D;
	Sat, 28 Mar 2026 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774735202; cv=none; b=uTuVhntAhuI6wuQyhzoHPERt1WSIh5KrtCSZi/avTIeKpN0UQeuPvnJp9Zi/PAXqXrqMOMvwXdTmJ97mjWS3kzEduCYQV+Y18cS5DKXUJn+mbD8SwUrnkcKyzC/5+2AOYLtlBkFrC7LKZIXGL3kctVcsI5JrZY2970acHoJqehc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774735202; c=relaxed/simple;
	bh=uylg7QS6zJlc30edPWr0j5HAQZJHsuoymADIWoSYu1o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RR8DQkrwh3L19woWsgtcfMlHUzucfZl9cv6I79O9ozF2zYUcBo09oX4JVGR1eSWR3czYfz01I22kOb9qNjfiy3SdIBubKTPV1S4yD/+DmpBvbJaeq6dwRET/kF0qjh51eVBzdTfgRVOdmRiFH0IyQ15HE88QIhrcS0MtatYfm5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBJ6ECVJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBJ6ECVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBF2C4CEF7;
	Sat, 28 Mar 2026 22:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774735201;
	bh=uylg7QS6zJlc30edPWr0j5HAQZJHsuoymADIWoSYu1o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZBJ6ECVJRNqIaiUoeNjP8EY0BjHhx/cXTMr3R53E9FTsbApjukjwiWwP5eTEGgfFw
	 OUuZ3rCml9f8EtNN8BR24uUolG03tNS8QQTR1DRf6YI8ByCs9mwnYAekHd88dY1oUh
	 4CVwdpox6a8M3qlcGJ4MQsSNBywp2wjEc6ZKp3aNEPmM2ir/GsOc129pJUwaN0hx9p
	 s7oQiprPXt5EOLxALy8ClT3r00e1Cd2GB4HS4Y+DKyEyp4YrKjSsRoQdb9xVrAMKpQ
	 UQ/4wsl8f10BxinTq8XH5GmeptgXv2ceA0JU2oLZWMUv88YG+gGftBPoqpk1LzNA54
	 RXGZYc3D0tKsw==
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
In-Reply-To: <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
Date: Sat, 28 Mar 2026 22:59:57 +0100
Message-ID: <87jyuvboo2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tim!

On Fri, Mar 27 2026 at 18:48, Tim Bird wrote:
> Well, this is using get_cycles(), which already exists on most architectures.

The fact that get_cycles() exists does not make it a good choice. There
is a reason why anything which deals with even remotely reliable time
requirements stopped using it. It's still there as a low level
architecture specific interface and most other usage is purely
historical or wrong to begin with and should be removed completely.

A lot of people spent a significant amount of time to get rid of this
ill defined mechanism and it's just sad that they did not manage to
eliminate it completely.

> This patch just adds a funky way to use cycles (which are available
> from power on, rather than from the start of kernel timekeeping) to
> allow saving timing data for some early printks (usually about 20 to
> 60 printks).

I can see that, but I'm not accepting yet another ill defined glued on
mechanism which relies on a historical ill defined mistake.

> Also, my current plan is to back off of adjusting the offset of
> unrelated (non-pre-time_init()) printks, and limit the effect in the
> system to just those first early (pre-time_init()) printks.  The
> complication to add an offset to all following printks was just to
> avoid a discontinuity in printk timestamps, once time_init() was
> called and "real" timestamps started producing non-zeros.  Given how
> confusing this seems to have made things, I'm thinking of backing off
> of that approach.

This discontinuity results from the fact that you glued it into the
printk code and sched_clock() does not know about it.

>> printk()
>> 
>>    time_ns = local_clock();
> that's ts_nsec = local_clock()

That obviously changes the illustrative nature of my narrative
significantly. Thanks for pointing it out.

>> As this needs to be supported by the architecture/platform in any case
>> there is close to zero benefit from creating complicated generic
>> infrastructure for this.
>
> The problem with this is that tsc_early_uncalibrated() can't return
> nanoseconds until after calibration.

In theory it could for most modern x86 CPUs as they advertise the
nominal TSC frequency in CPUID. Other architectures have well known
clocksource frequencies, e.g. S390 has a known nominal frequency of 1GHz
(IIRC).

But that does not solve any of the other problems. See below.

> I don't think it's a good idea to returns cycles sometimes and nanoseconds
> at other times, from a deep-seated timing function like this.
> Also tsc_available() might itself depend on initialization that hasn't happened yet
> (in early boot).

Access to the TSC requires the X86_FEATURE_TSC bit being set, which
happens in early_cpu_init(). Before that get_cycles() returns firmly 0.

> My approach of saving cycles in ts_nsec for the early printks works
> because there's a limited number of places (only 2) inside the printk
> code where ts_nsec is accessed, meaning that the code to detect a
> cycles value instead of a nanoseconds value can be constrained to just
> those two places.  Basically, I'm doing the conversion from cycles to
> nanoseconds at printk presentation time, rather than at the time of
> printk message submission.

I know, but that again requires to add more ill defined infrastructure.

We are not aiming to add more, we want to get rid of it completely to
the extent possible.

> The approach that I originally started with
> (see https://lore.kernel.org/linux-embedded/39b09edb-8998-4ebd-a564-7d594434a981@bird.org/
> was to use hardcoded multiplier and shift values for converting from cycles
> to nanoseconds.  These multiplier and shift values would be set at kernel
> configuration time (ie, using CONFIG values).

Which makes it unusable for distro kernels and therefore a non-starter.

> There are other approaches, but none really work early enough in the
> kernel boot to not be a pain.  The goal is to provide timing info
> before: timekeeping init, jiffies startup, and even CPU features
> determination,

As I pointed out before that's wishful thinking:

   You _cannot_ access a resource before it has been determined to be
   available.

Period.

It does not matter at all if _you_ know for sure that it is the case in
_your_ personal setup.

> and to keep the effect narrow -- limited only to printks, and the
> first few pre-time_init() printk messages, at that.

Either it is solved in a generic way or we have to agree that it's not
solvable at all. Your narrow effect argument is bogus and you know that
very well.

> I'm now researching a suggestion from Shashank Balaji to use the
> existing calibration data from tsc initialization, which might
> simplify the current patch even further.  I'll make sure to CC you on
> the next version of the patch.

If you want to use the calibration data from tsc_early_init() then you
achieve exactly _nothing_ because tsc_early_init() also enables the
early sched clock on bare metal. On a VM with KVM clock available the
KVM clock setup enables the early sched clock even before that via
init_hypervisor_platform().

The early TSC init happens in setup_arch() via tsc_early_init() and it's
completely unclear whether you can always access the TSC safely before
that unconditionally due to SNP, which requires to enable the secure TSC
first. There is a reason why all of this is ordered the way it is.

While reading TSC way before that might work on bare metal and in most
VMs, it's not guaranteed to be safe unconditionally unless someone sits
down and provides proof to the contrary. As always I'm happy to be
proven wrong.

When tsc_early_init() was introduced for the very same reason you are
looking into that, quite some people spent a lot of time to come up with
a solution which was deemed safe enough to be used unconditionally.

Please consult the LKML archive for the full history. The commit links
will give you a proper starting point.

That said, I completely understand the itch you are trying to scratch
and I'm the least person to prevent an architecturally sound solution,
but I'm also the first person to NAK any attempt which is based on
uninformed claims and 'works for me' arguments.

The only clean way to solve this cleanly is moving the sched clock
initialization to the earliest point possible and accepting that due to
hardware, enumeration and virtualization constraints this point might be
suboptimal. Everything else is just an attempt to defy reality.

Thanks,

        tglx

