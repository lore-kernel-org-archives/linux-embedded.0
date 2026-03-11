Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983593090CD
	for <linux-embedded@vger.kernel.org>; Wed, 11 Mar 2026 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243957; cv=none; b=oqZ7MgqpxfVqyeKZqL/MXrpr1P7TM2n4g4dQB3c9vBBOPIBR1z2eefuBbX7bi3UiCI25I88UDWU5SL+eHwWLnTTPQm6p97PL8AGKIUPVGpxc1mgenrP3b3dABUGP/xPzrlYjg6uCldOxsj09Jef5X61htlPxvy2BQ2q5L5O4Uik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243957; c=relaxed/simple;
	bh=1X8mdBH/Ph7JyUs+2Pa6cgLOTDUqD6mIen+KZf/zjyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZsXA1+1Q8GoP5BIaI/vDubxU84ychd02P7RCUsRXKwBJJ9tSNsi6WS+Azr5bKnWqz9sPPf0tKkbJ2ECY7ebwfc1ygJZWfDXkp1zq9emVlIu1NC9+mOXpbjjzdX5u7tZvsxEcWjb31ogxr9fmUq1LXz4U5tqNdilWI+pokRJS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=blKsFE2O; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="blKsFE2O"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso41818525e9.3
        for <linux-embedded@vger.kernel.org>; Wed, 11 Mar 2026 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773243954; x=1773848754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ICcqvmVtvds8MCngJDh4dCWonfREdp6QC5HwajZAep0=;
        b=blKsFE2OXtLekTbwl+AyV3OgJ60TxHFsTH2UcjuIru2WvQ33qc0A0fZGLQwGShcIzR
         5a2BlDn2utKknlKYsNIlcBwM947zZvMUDLbOuftAR6N8afCAfqIe58KIl0q/YsnZc5yJ
         NrQgqV+RpJWLnDsRvPTMZbeaqpprBeoUA2F3B1WA3RW+LbETOFtVnnUMzJkQRXl3O5La
         3+gi4G9bePuaUJNOyKzrnQ/1HzUPpwL3tbXHnDQhMhockdaOV7HAC8GsdDWotqM3YadI
         LfAU9q85ik7KS1hLkoLhCqdNnMTSJAjdF5H5Ec/r2tPGynQ8Yu1QqmIK7K3WuodS9t3M
         5DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773243954; x=1773848754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICcqvmVtvds8MCngJDh4dCWonfREdp6QC5HwajZAep0=;
        b=gMF1qmvSe/WPyKN/Q8ssx7O74FM5YTckGA75lAkAOnIcQTF9UxdlldmPtNg83RoByf
         CRuv4kd/GNOvZb3b4JjsyQsYtyTN2YOeLKF4lWcN3c+iDRnMBDQlJEf61CxJt0UzpziC
         xywp0LWPYdxGvGw0j22ilqF3WylVZH3KrecbM+Vg07RfXBK+1bZvADaVhSrUVaI39Ks0
         E4RyZ4OnbAeFOtGzW51m55jb+OkQgyB5u9Y9RJPa+btLDdnScaqeoeLWbbKhy6LPanpq
         C3DBMyIk3MQ7qhOgx6NthKZRF2A8Zwu1RADWuSOsv46gYL4sZ2kd0xskhooAE5vBDrql
         NvMg==
X-Forwarded-Encrypted: i=1; AJvYcCVoWLNvTW7Kb1jAGMWAx6+nOsPkYXm4qqpP4Pi0nWqyWmGbabYpwRMqoscaNBECMj5kn3eDJwx2v1/G5Phbjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/8vJS6K6XgShQbZe9/hMTaozHU3HBEXThcNSHEqv3GjLXwxuZ
	wAwNBUguPwgSzvUPYj1YMmsNzALtV8f7t4gUoOk49Gy0CZywDPew7qEEXK59E5A/QXQ=
X-Gm-Gg: ATEYQzyFw8VDO81YcPJ901uaS7cA2mlTM1wMFrLPuOPJkXCcamXu5P4/YkW0MMxUzns
	jOhYKdgaa9JQ4j2g5MRR1EPMlt0H0NDzaklJlIVt65+yI50fP3SAMhVgggMbWjgE6qJXgIsttA9
	C29FGJr5bBYsGBKMwUeiuyWOI7yMiXMorxWroT1lJfClTMv5KJ8lRaZQwbRPCJw7rDS6Eq2XmnP
	FDtPi2n70kCtIaexTNCDg50dGCBQMefQDlru+AetWi5VImC6OsbdtQXQRisK7YYnXtC2Vqipw+Y
	wg70kMscDcp2IuqJIM+3vqUb1aAc06gigOg7ZKzHwBaojOdwG9xomy9sqGklYLKB38BFNqB8erS
	wLNCNXyTmroUgjSLgZXkTYdddgMAONU0RDCLjfbDpJiMGJtOBnpI4Mxm5xUPLh/jqbJ5dEeF+kG
	P8DMQ5nX22VHLdrxCVQhQuvuXXAw==
X-Received: by 2002:a05:600c:800f:b0:485:4972:35b with SMTP id 5b1f17b1804b1-4854b0cbf90mr51740325e9.14.1773243953826;
        Wed, 11 Mar 2026 08:45:53 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c3a10sm21083345e9.12.2026.03.11.08.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:45:53 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:45:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Shashank Balaji <shashankbalaji02@gmail.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"john.ogness@linuxtronix.de" <john.ogness@linuxtronix.de>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"francesco@valla.it" <francesco@valla.it>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <abGOL-sr7pMr3Ua_@pathway.suse.cz>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <aa8erTKI1K7eO1LI@fedora>
 <abADDuc43S3Vk-u-@pathway.suse.cz>
 <SA1PR13MB5634C64991FD94776E9D3D82FD46A@SA1PR13MB5634.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR13MB5634C64991FD94776E9D3D82FD46A@SA1PR13MB5634.namprd13.prod.outlook.com>

On Tue 2026-03-10 18:54:22, Bird, Tim wrote:
> > From: Petr Mladek <pmladek@suse.com>
> > There are three stages:
> > 
> >    1. Early messages where the cycles are stored.
> > 
> >       The serial console shows zero time stamp because
> >       it reads the messages _before the calibration_, e.g.
> > 
> > 	[    0.000000] Linux version 6.19.0-rc7-default+ (pmladek@pathway) (gcc (SUSE Linux) 15.2.1 20251006, GNU ld (GNU Binutils;
> > openSUSE Tumbleweed) 2.45.0.20251103-2) #521 SMP PREEMPT_DYNAMIC Mon Feb  2 16:36:53 CET 2026
> > 	[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-6.19.0-rc7-default+ root=UUID=587ae802-e330-4059-9b48-
> > d5b845e1075a resume=/dev/disk/by-uuid/369c7453-3d16-409d-88b2-5de027891a12 mitigations=auto nosplash
> > earlycon=uart8250,io,0x3f8,115200 console=ttyS0,115200 console=ttynull console=tty0 debug_non_panic_cpus=1 panic=10 ignore_loglevel
> > log_buf_len=1M
> > 	[    0.000000] BIOS-provided physical RAM map:
> > 	[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> > 	[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> > 
> >       But "dmesg" shows some numbers because it reads the messages
> >       _after the calibration_:
> > 
> > 	[    8.853613] Linux version 6.19.0-rc7-default+ (pmladek@pathway) (gcc (SUSE Linux) 15.2.1 20251006, GNU ld (GNU Binutils;
> > openSUSE Tumbleweed) 2.45.0.20251103-2) #521 SMP PREEMPT_DYNAMIC Mon Feb  2 16:36:53 CET 2026
> > 	[    8.853617] Command line: BOOT_IMAGE=/boot/vmlinuz-6.19.0-rc7-default+ root=UUID=587ae802-e330-4059-9b48-
> > d5b845e1075a resume=/dev/disk/by-uuid/369c7453-3d16-409d-88b2-5de027891a12 mitigations=auto nosplash
> > earlycon=uart8250,io,0x3f8,115200 console=ttyS0,115200 console=ttynull console=tty0 debug_non_panic_cpus=1 panic=10 ignore_loglevel
> > log_buf_len=1M
> > 	[    8.865086] BIOS-provided physical RAM map:
> > 	[    8.865087] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> > 	[    8.865089] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> > 
> > 
> >    2. Early messages added _after the timekeeping_ is initialized
> >       but _before the early cycles calibration_.
> > 
> >       They serial console prints them _without the offset_ because
> >       it reads them _before the calibration_, e.g.
> > 
> > 	[    3.288049][    T1] Write protecting the kernel read-only data: 36864k
> > 	[    3.298554][    T1] Freeing unused kernel image (text/rodata gap) memory: 1656K
> > 	[    3.318942][    T1] Freeing unused kernel image (rodata/data gap) memory: 1540K
> > 
> >        But "dmesg" prints them _with the offset_ because it reads them
> >        _after the calibration_, e.g.
> > 
> > 	[   12.179999] [    T1] Write protecting the kernel read-only data: 36864k
> > 	[   12.190505] [    T1] Freeing unused kernel image (text/rodata gap) memory: 1656K
> > 	[   12.210893] [    T1] Freeing unused kernel image (rodata/data gap) memory: 1540K
> > 
> > 
> >    3. Messages added after the calibration of the early cycles.
> > 
> >       They are printed with the offset by both serial console and
> >       dmesg, e.g.
> > 
> > 	[   12.230014][    T1] Early printk times: mult=38775352, shift=27, offset=8891950261 ns
> > 	[   12.246008][    T1] Run /init as init process
> > 	[   12.254944][    T1]   with arguments:
> > 	[   12.264341][    T1]     /init
> 
> This is correct.  I don't want to overwhelm users of this, but there are three time-gathering periods, and roughly
> 2 output times (before calibration and after calibration).
> 
> early boot = before time init, before cycles calibration and offset calculation
> mid boot = after time init, before cycles calibration and offset calculation
> late boot = after time init, after cycles calibration and offset calculation
> All of these are before the start of user space processes.
>
> time of printk	output time	timestamp type	stored	timestamp output
> ------------------	----------------	-----------------------------	------------------------
> early boot	early boot	cycles			0
> mid boot	mid-boot	nanosecs		seconds, with offset from time_init
> late boot	late-boot	nanosecs		seconds with offset from cycle counter start

This is a bit confusing. I looks like the offset from time_init() is
not longer added.

> -----
> early boot	post-boot	(cycles already stored)	seconds with offset from cycle counter start
> mid boot	post-boot	(ns already stored)	seconds with offset from cycle counter start
> late boot	post-boot	(ns already stored)	seconds with offset from cycle counter start
> all others	post-boot	nanosecs		seconds with offset from cycle counter start			

> The confusing thing is messages that are output to the console before calibration and offset calculation.
> Reports from all user space tools (ie from dmesg or journalctl) should be correct and consistent.

Yup.

I like that table. I just wonder how to better distinguish the offset from
timekeeping and calibrated cycles. My variant:

<proposal>
The printk timestamps are stored and interpretted differently in
the following periods:

  - early boot: before timekeeping init, before cycles calibration
  - mid boot:   after timekeeping init, before cycles calibration
  - late boot:  after timekeeping init, after cycles calibration

Console output (immediately):

printk() time	stored value	immediate output(sec)
-----------------------------------------------------------------------------
early boot	cycles		0
mid boot	get_time()	get_time()
late boot	get_time()	get_time + calibrated(cycles offset)

User space tools and late registered consoles:

printk() time	stored value	output after calibration (sec)
-----------------------------------------------------------------------------
early boot	cycles		calibrated(cycles)
mid boot	get_time()	get_time() + calibrated(cycles offset)
late boot	get_time()	get_time() + calibrated(cycles offset)

I am not sure where to put this. One place might be
Documentation/core-api/printk-basics.rst. But it might be better
add a separate file either under core-api/ or under admin-guide/.

> > 
> > > An accessor can be implemented for (struct printk_info).ts_nsec, say
> > > get_timestamp(), which can be called from both the places.
> > 
> > Yeah, a helper function for reading the timestamp might be a cleaner solution.
> > 
> I consider adjust_early_ts() to be such an accessor function.  It's supposed
> to hide the details of the type of the timestamp (cycles or ns) and
> the offset. Maybe this could be renamed to something better,
> like: get_adjusted_ts()? Let me know what you think.

This a bike shedding area ;-)

I personally find

    u64 ts = get_printk_info_ts(info);

a bit cleaner than

    u64 ts = adjust_early_ts(info->ts_nsec);

because you might add a comment into struct printk_info
definition that nobody should read the timestamp directly.
They should use the helper intead.

The helper would do something like:

/*
 * The number of early cycles is stored before the timekeeping gets initialized.
 * The local_clock() value is stored later.
 *
 * Note that early_ts_offset, early_mult, and early_shift are 0
 * before the cycles get calibrated against the official time keeping.
 *
 * Any output after user space start (eg. from dmesg or journalctl)
 * will show consistent values with calibrated cycles and offset.
 */
static inline u64 get_printk_info_ts(const struct printk_info *info)
{
	if (likely(!(info->ts_cycles & EARLY_CYCLES_BIT)))
		/* if timestamp is not in cycles, just add offset */
		return info->ts_nsec + early_ts_offset;

	/* mask high bit and convert to nanoseconds */
	return mul_u64_u32_shr(info->ts_cycles & EARLY_CYCLES_MASK,
			       early_mult, early_shift);
}

Note that I have already used two names (ts_cycles and ts_nsec) which
would point to the same data via an union.

> I'll rebase this patch to resolve the #include conflicts, and address
> this feedback, and hopefully get a new version out this week.

Thanks a lot. v3 looked good enough to me. But v4 will be even better
after the feedback.

Take your time ;-)

Best Regards,
Petr
