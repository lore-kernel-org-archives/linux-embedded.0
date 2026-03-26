Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45D2D9EDB;
	Thu, 26 Mar 2026 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531025; cv=none; b=FjUEeJkBFgihCGDasxIGpHHyzUcoMwpsczb2zuID3V6y2DkDqQ7TBZ58LTwRTDUf86xOvdnAYhlHc56oPezL2XWvG2+788UG9h/L8cUHkM54ekZ+3lxyWQZoq8qLjyZvzYI7GYAHXPV3knEPdruAYFepVmcp3KCrsjwddfArAnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531025; c=relaxed/simple;
	bh=gHLYDlDv+Qnc5OYZEF+aXLbWBNaGkZ3mVweC/Vb2sQA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dahW4HimireAu/uMsQMhADQr4tOCq1C00oN2qLBv2yMIFhOgJe11Y2YxdLylsaoHFDEO6UsW3rVv6yX2CEtRFybJ9zbf/EYd/tRiDs+ieyLOAHutmcvJ9AD4p31Ek75XO3fvWBCWvQm8KhP1YDaGSiBGVAhZxeE71Sw67SyVic4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1bxdR7D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1bxdR7D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDB7C116C6;
	Thu, 26 Mar 2026 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531024;
	bh=gHLYDlDv+Qnc5OYZEF+aXLbWBNaGkZ3mVweC/Vb2sQA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V1bxdR7DU02T03zHZrGYP/97J4zWS7z93EYSYWKVnu9I/O8P8PMWM5+0hBsazmtX2
	 8LMyU5g+Sme7iot43acO4kxVmW2hA6n91AKFzQCB7iZc8sOcNwdbsIQk+Ozk9E6Iyr
	 YvVS0jlJdWuKuAw7BKawlQaKMXUL3hvknVTewFllq7RqiDv3gPO1ftZFZ7DzOh+STl
	 MTtkB/2rI8UL+meL31fT8YDArry6Y9a/nYmtDZlWzuc2iBbCHu05gIzJFqv+CTzjTW
	 GEZbJaiuEhwCHXhZDqeJr2ECzMiaXq+R/VKSFOaIZfZp1vOQBobRJGaBfuW/6IY0uv
	 bIFpkJPIl/+2Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org,
 john.ogness@linuxtronix.de, senozhatsky@chromium.org
Cc: francesco@valla.it, geert@linux-m68k.org,
 linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird
 <tim.bird@sony.com>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
In-Reply-To: <20260210234741.3262320-1-tim.bird@sony.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
Date: Thu, 26 Mar 2026 14:17:00 +0100
Message-ID: <87zf3ud92r.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 10 2026 at 16:47, Tim Bird wrote:
> During early boot, printk timestamps are reported as zero before
> kernel timekeeping starts (e.g. before time_init()).  This
> hinders boot-time optimization efforts.  This period is about 400
> milliseconds for many current desktop and embedded machines
> running Linux.
>
> Add support to save cycles during early boot, and output correct
> timestamp values after timekeeping is initialized.  get_cycles()
> is operational on arm64 and x86_64 from kernel start.  Add code
> and variables to save calibration values used to later convert
> cycle counts to time values in the early printks.  Add a config
> to control the feature.
>
> This yields non-zero timestamps for printks from the very start
> of kernel execution.  The timestamps are relative to the start of
> the architecture-specified counter used in get_cycles
> (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
>
> All timestamps reflect time from processor power-on instead of
> time from the kernel's timekeeping initialization.

Can we pretty please _not_ introduce yet another side channel to
generate time stamps?

printk()

   time_ns = local_clock();

local_clock()
  local_clock_noinstr()
  	// After boot
	if (static_branch_likely(&__sched_clock_stable))
		return sched_clock_noinstr() + __sched_clock_offset;

	// Before sched_clock_init()
	if (!static_branch_likely(&sched_clock_running))
		return sched_clock_noinstr();

	clock = sched_clock_local(this_scd());

On x86:
sched_clock_noinstr()
  // bare metal
  native_sched_clock()
     // After TSC calibration
     if (static_branch_likely(&__use_tsc)) {
       ...
     }

  // Jiffies fallback.

So the obvious solution is to expand the fallback with:

    if (tsc_available())
    	return tsc_early_uncalibrated();

    return jiffies ....;

As this needs to be supported by the architecture/platform in any case
there is close to zero benefit from creating complicated generic
infrastructure for this.

Thanks,

        tglx
