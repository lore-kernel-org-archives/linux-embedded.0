Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C7E3ECBD9;
	Tue, 31 Mar 2026 09:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948218; cv=none; b=jQcTotWX3Bu2ATjOWSWZVR4DcRIoS1o+ZtY88CtEEnf9fb4dxmzBUZFxo8NTS5WSxXC4qfGsxrGXF1YDbBL24D8f+0EUkO7Ph+Q2iPyzfXoxQMECSRTEhNlG6GX1Tf4BhMjzroDTrEgLKK7joWxtQ0/F0W4O2a/Cz6at4NmO6tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948218; c=relaxed/simple;
	bh=h4wTUB19nIXnGYtOjbj2xjQOdflTVZGjdBSNC75eWjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WXtWmK1vtNkn8lzTocfVAyYT97ToQzguXS9KAlaQGPfJfUbe7VkxmRo1j8X1dZYviJyZ8bu6NBrzhT1E9B53xRctGGGVWsdtb3jx7AVnKByy8p0imYzsoGOsvuziU/6HTqZDgdUyu5BdKpLWCMT3Bo2xEIxeljgOiIFsFPFmn20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHbGxtTk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHbGxtTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A43C19423;
	Tue, 31 Mar 2026 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774948217;
	bh=h4wTUB19nIXnGYtOjbj2xjQOdflTVZGjdBSNC75eWjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cHbGxtTkhrmNv1SEKy/IkNlmERDMaRIWcP11wMiRTr4nYHEX6rfwrMopwoGe8H5kQ
	 Wjexvl1mPntKLGe53+3w52a6att/5AEPsQfKa6whBEs1VuoXH9roCib3tmO1hO72D4
	 gpb+sJBRKGdAgFPWXvSSXvQG8Dw+50jLW0aqBp8bP5sc1EZu2NQLwUpuA7fIe/1YjO
	 wq8oSMag3qOiAd0X0r5YwxwrJcgYqkC0tssRy7lU44rCvWQYFk9JUE+a8r1nNdyZ5T
	 xruLS0uRreM3BCCsGg2Yl2dOjy6Yd3lAb4iaNeftAHWKxzHMWqnl/hrBJDS6F94MKu
	 eclk/q4wJVqzQ==
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
In-Reply-To: <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyuvboo2.ffs@tglx>
 <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
Date: Tue, 31 Mar 2026 11:10:14 +0200
Message-ID: <87jyus9xft.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tim!

On Mon, Mar 30 2026 at 20:42, Tim Bird wrote:
>> From: Thomas Gleixner <tglx@kernel.org>
>> > The approach that I originally started with
>> > (see https://lore.kernel.org/linux-embedded/39b09edb-8998-4ebd-a564-7d594434a981@bird.org/
>> > was to use hardcoded multiplier and shift values for converting from cycles
>> > to nanoseconds.  These multiplier and shift values would be set at kernel
>> > configuration time (ie, using CONFIG values).
>> 
>> Which makes it unusable for distro kernels and therefore a non-starter.
>
> Can you elaborate on this?  Indeed distro kernels would not be able to pre-set
> TCS calibration values, and would not turn on this feature (in that version
> of the patch) for production release kernels.  But it sounds like you are saying that
> anything that requires a configuration that is non-general (or indeed used
> temporarily during development) is not acceptable upstream.  Is that your position?

The point is that we really want to provide general available
functionality as much as we can. The problem with all these special
features is that they add to the overall maintainence burden. We do them
when there is no other way.

> This "feature" is intended as a tool for developers who are optimizing Linux
> kernel boot time. (I'm not sure who else would be interested in getting
> timing data for these (currently zero-timestamped) printks during the
> first 100-400 milliseconds of kernel boot).  This would be, I believe, developers

The existing early TSC enablement on x86 starts providing printk
timestamps at about 30ms after boot out of the box when I remove
'earlyprintk' from the command line on the same VM/host combo I tested
the PoC. That too uses sched clock and not some special mechanism.

The real question is whether this boot time optimization really needs to
have earlier time stamps and whether the hacks required for that are
actually worth it.

> This patch is part of a larger effort on my part to help automate
> boot-time tuning of the kernel.  Many other parts of that effort rely
> on reconfiguration and recompilation of the kernel, which makes the
> whole thing a development-time effort, not so much a run-time,
> end-user, or production-level feature.  And very much not a thing that
> can be accomplished with distro-only configs.

I understand that, but when you can achieve it by utilizing what's there
already just by providing access to the TSC at the earliest possible
time, then adding new infrastructure is obviously not the right thing to
do.

>> 
>> > There are other approaches, but none really work early enough in the
>> > kernel boot to not be a pain.  The goal is to provide timing info
>> > before: timekeeping init, jiffies startup, and even CPU features
>> > determination,
>> 
>> As I pointed out before that's wishful thinking:
>> 
>>    You _cannot_ access a resource before it has been determined to be
>>    available.
>> 
>> Period.
>> 
>> It does not matter at all if _you_ know for sure that it is the case in
>> _your_ personal setup.
>
> I used get_cycles(), which has a check for availability in it, so the patch didn't
> access a resource before it was determined to be available.
> It sounds like you're responding to my wording above and not the patch itself.

Correct: '... and even CPU feature determination'

>> Either it is solved in a generic way or we have to agree that it's not
>> solvable at all.
>
> I disagree that solving this limited problem (zero-valued timestamps
> in early boot) has to be solved in a generic way.
> I already limited the solution space to only processors that I believed
> had reliable, pre-kernel-initialized cycle generators.
>
> I think it's fair to have a specialized solution to a specialized problem, if
> it can be made to have very limited effect on other code.

This 'my problem is special' mindset is exactly what frustrates me to be
honest. It causes technical debt and I've spent several decades of work to
mop up the technical debt caused by it.

> I tried to avoid affecting any other timekeeping mechanism
> (ie  re-engineering local_clock), specifically to avoid unwanted
> side effects.

As I demonstrated there is no need to even touch printk or local clock
at all. 

>> The early TSC init happens in setup_arch() via tsc_early_init() and it's
>> completely unclear whether you can always access the TSC safely before
>> that unconditionally due to SNP, which requires to enable the secure TSC
>> first. There is a reason why all of this is ordered the way it is.
>
> OK.  Thanks for that info. I'll take a look at that.
> What happens if you try a rdtsc() before tsc_early_init?  If it returns zero, I can
> live with that.  If it faults or returns random data that's a problem.

As I said it's unclear.

>> The only clean way to solve this cleanly is moving the sched clock
>> initialization to the earliest point possible and accepting that due to
>> hardware, enumeration and virtualization constraints this point might be
>> suboptimal. Everything else is just an attempt to defy reality.
>
> I think we're willing to accept different areas of sub-optimality.
> I can live with having to configure the feature, and statically configure
> the TSC clock calibration, at the expense of non-monotonic printk
> timestamps for the early printks.
>
> Personally, I think that altering sched_clock or any other
> kernel timekeeping is overkill for this.

I'm not asking to change any of that. I clearly pointed out to you
in my first reply that the existing local clock path is where you want
to add your 'even earlier' access.

That said, let me come back to the question I asked earlier.

The existing early sched clock enablement, which happens either in the
hypervisor detection for VMs and/or tsc_early_init() is around 30ms into
the boot process.

The initialization which happens before that is pretty much the bare
minimum to get so far. The optimization potential of that stage is very
close to zero.

So the real good question is whether the extra information of how long
that earliest init takes is really relevant to the goal of optimizing
boot time. The expensive part of the boot process definitely comes after
that.

Thanks,

        tglx

