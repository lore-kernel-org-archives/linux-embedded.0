Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A03ACA5D
	for <linux-embedded@vger.kernel.org>; Wed,  4 Mar 2026 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623425; cv=none; b=p9QP5uBW5EgyBzVYHv6GZnLf1oepAL18uaaUC89UtoQLMlF3sL5Ohg7DXx+loX0PSCRc11coETydAciCmyHyf1jgGNbhElWWlMvCoWkxNv7vv7dtmnsFLcs0DwDlZCqQXa/vaTcepdvmf/3MLmYp4YcEeXPMt7lrqywS3LJdCLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623425; c=relaxed/simple;
	bh=M10XbYztuklpVC0yacSPWXPpQoo003EH+hfGf48BpR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIGNAe2GnMgKZrAAl5q5BLTmAKJvHPchAIPWbjryrJZADx8GRNlfJ5TvAy8M69IF92YI/g9AxeYrn3qE0AWbpoNANmuU+s4VptAvQkQ/qKXhqWc6vnXur5wesHgzb956KAjZQFPIIfisp+r5zjc95i2OyDsjEV+5LM5hXHkylwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ha00N4xq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ha00N4xq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483abed83b6so56604725e9.0
        for <linux-embedded@vger.kernel.org>; Wed, 04 Mar 2026 03:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772623422; x=1773228222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QsPWhQRnRBZhO6KZxSKo3Nkp5kgtgVBf3BcJ9YTOOm0=;
        b=Ha00N4xqjoqXIb5WxewC+zibsY6YLXZBvkEXAJzv9LyEq0ld9VvoyFsEMQ4U1iE/1B
         vGfAjBXAhEhG9sjoST8wKQI6ymSwLfBWYMNo1XfI+TeWoZYw2w7isAVpzAI/inmyG4xt
         32bzvML7Hj0DScxtwXoB6yVBXHVdG65kfEXfas1GA61HWQdfCVlltEhEFq6Zlugre7S1
         Dq2T0E2nNrXz7XU9FalhHeO8lJjwJ1fptxNIi24R+/U7nYHqPimBuJ/4ZJ0E2wqXNUYw
         BGZ9RIjT1Qi7e/rQWw9sJ05z8fA4bNsFrZEYwdBi/nTdyjOQBOqrU5RKaE3lwH5ybRdL
         qqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623422; x=1773228222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsPWhQRnRBZhO6KZxSKo3Nkp5kgtgVBf3BcJ9YTOOm0=;
        b=YvK11U7TWwdi+vMen42lq7lA6DhZkof560L1F6VJV8svk6xLmijJRPxEzuWvQHFJZJ
         2qnuxZ/qry8dDJDhpLsAwqCr5GmQozT0KX7MmWKDZ0cxvLb+OBj/YVHDcTurlfgP49BE
         N3N0RXt59jUHSlLxwnFXEI72Yuqt2qz4hPCMM11lR3c1UJVeN6vN8uwlHHTQdzc5vKvP
         Txocm8NOGK/TLaTqVnuoySf73kkJqe1dt8xx2AJ9V5SyBh2TQV/bjOn3s7ZS1aEcyZvG
         F/PohJMLvgiXVZEhc5KQdcFSpGG92/tPLpLM+BjQjAcTI5I5S1qZYcHAt1cf6Fybd8vZ
         ViqA==
X-Forwarded-Encrypted: i=1; AJvYcCXjW8/fUmHbjDC98PGgTAVXzdHLkH8YW+8AXvXAl1ZfiYozwE0y7htz+cki/aXBL3xT77z4AhCtUZvT3bVQRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF2Wv3l6kFW8ia9ZrIKOc52YmxjbFEXBDkhNABTq5cl/vsrnWL
	81Vi1urSTaeAbd0oht5pIwtt2pYjIt3UrYFID2ezeDtequVSKrJmkjXjOvaJZTYECB8=
X-Gm-Gg: ATEYQzzpblbaXWH6h9N0eTxN/b6oNl0bp+KqETSodKM8cvqdx9MLnuleVDWBdch+9sL
	5gPVjroxPoRn2XaB+pUncbnRwhmshM29cGQLhNi67THdwzCHq/raLTsGq3go0Q8k+709inqrh6/
	ppPAMFooe+ZsxatO16gLUmPl83AaPhnsfp17N+eSZgMR7F+qP8Wpd30hftHQ2zipR0ySH5/66w8
	d7vNd15vURifuTPEaypngGRMbegzGywmYuNaorzlbSggT/wnESc0CqkeM3SS8P5chXW+46xS5ZA
	HXfdYRPlSLRa8+EPWZzpHHc6khBU5AiHi2bsoxw0dXShvr3XpAcZjuPCKb7OZS7xr8AxeB7ZcUj
	9YhfhgJpXd6nR+tPuegH0vlpXUKJGUy/pBE4IrEEDlsv+bS42JmkJrzUNIss1ejxGggHFntB9LF
	ym0+aJA77j+qadLxeeAmK9ZFeWSvkuiVPePK/d
X-Received: by 2002:a05:600c:45c6:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-485198491ebmr25769235e9.15.1772623422396;
        Wed, 04 Mar 2026 03:23:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ae0e7abasm28929528f8f.23.2026.03.04.03.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:23:41 -0800 (PST)
Date: Wed, 4 Mar 2026 12:23:40 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tim Bird <tim.bird@sony.com>
Cc: rostedt@goodmis.org, john.ogness@linuxtronix.de,
	senozhatsky@chromium.org, francesco@valla.it, geert@linux-m68k.org,
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <aagWPEaF1A-ITl4f@pathway.suse.cz>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210234741.3262320-1-tim.bird@sony.com>

On Tue 2026-02-10 16:47:41, Tim Bird wrote:
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
> 
> Signed-off-by: Tim Bird <tim.bird@sony.com>

It looks good to me and seems to work fine. Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

See a note below.

> --- a/init/main.c
> +++ b/init/main.c
> @@ -104,6 +104,7 @@
>  #include <linux/pidfs.h>
>  #include <linux/ptdump.h>
>  #include <linux/time_namespace.h>
> +#include <linux/early_times.h>

JFYI, I have tried this patch on top of the current Linus' tree (v7.0-rc2+)
and it conflicted with the commit 499f86de4f8c34e19 ("init/main: read
bootconfig header with get_unaligned_le32()") which added here:

 #include <linux/unaligned.h>

>  #include <net/net_namespace.h>
>  
>  #include <asm/io.h>

Best Regards,
Petr
