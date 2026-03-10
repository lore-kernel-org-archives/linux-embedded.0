Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7C3876D0
	for <linux-embedded@vger.kernel.org>; Tue, 10 Mar 2026 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142804; cv=none; b=Bc/22oSp0/DamqiY+jPTfaJRjBTbyVl2hLXRYKL1z1AqxcrNJFdVe9fydYVCtlXobMAKV5AGaGr6JDee7xTtKLQxIB/VepETRXOPxq7elYHdgGva4o1aWkKRKJB40Bz0Bx7TNXkhiJB1mx7IYbMddbA+jbmgaB8W25oV7edXCGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142804; c=relaxed/simple;
	bh=D9ZQDowRHLKnRwQZOcZG3FxBGRIwD1bMiHET3WOx+7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckLS17rcqk3iLUZeT9gYP6eom6l3w4Hq2M7JNSD3MuHwnusJArXQoDFChTOiquMCuGVzSND1I7UCFiffmChLdUv40MvPiboAKa8cQ8Y3fTZVnYkPCpn8UN3hz/2/9DrZ4sNFm9W+mdV8fGPjLbjwOfMRuMctebpH8fGUzk9cagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ttl18sQl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ttl18sQl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso103711505e9.1
        for <linux-embedded@vger.kernel.org>; Tue, 10 Mar 2026 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773142801; x=1773747601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n5ib6CVxo4YWBDh4XqhaptrqtUxnt8GY4hJ4WfLeaz4=;
        b=Ttl18sQl1CjRpg8zMIqTDICOdk6Fg6N8i/CuGZPJClaycaN8Vk5o+BiIiqKWL0tT4l
         W3dW7O21sRIVGROSQIReWhR+RhIPC5KUYC1zwc5Gq1uqUVJb5dN5PktXg5dbELtdEj5C
         wBYkRtNHT7CU6VPAXxBs9YezlzQjCLivJzHdunpO/k2NcEODnjerhFCupW5RxzLFqCRi
         ddIWy/V3v/OYluu68VPoFw/cR7YbO9EQ9z19SxWhM2NphfA8wnu63jTgJlqzRMrULb2X
         psEgA5aG3XBdvYNa9xthzBB/wlSqakbDyMbXC94PPKhEAZu4OzgdLFBfLh4ggSmWkDl8
         PTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142801; x=1773747601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5ib6CVxo4YWBDh4XqhaptrqtUxnt8GY4hJ4WfLeaz4=;
        b=nkiM9VuTJzp2O9/Jx/z4RxYuflXicxyAndnFUW189jOrgmWkEtQxubsq0o4x3UDreO
         Kpb+SnmrKaGGwVwCYLEYqhk+IqSpY90lxH5qkHF0urNNn/iiXluf6PS2Ay2LxS4Snwr8
         NuueyfLZq+34D9qX0HCM0EUK3dapq+QZfw/esc/dMP7TRIYph4fQtbff5Juz8thBXuWI
         0EnVEiOrlFiyjt+MrmbwFxm7hxi0v0iCgcVtqze1ED2DW+XngbZYNbx5JpNwxZzaOj+l
         /puyRfs6YN8KoBS7d0SsUrSE/6pFtrdKqoXPC+oOE0L06SmD/5uAOSuoi1G4qrHdfW4d
         rNCw==
X-Forwarded-Encrypted: i=1; AJvYcCXs0QNDdSrHjdvWK767cLLPp57tYxVYyCyLVhcfDOdGvJwwkoQACRPtFAnjM+gxsO7KTFC5wAIc4G15TCJFxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdPudchPCNwFTkUUhYBkc6rGDLJiI3uKpt57qcaAPkToVOeJ2
	uP5Z5tBJ92+KFat/cg/+HyWeHmyJ2YkCm4yrdqG5pLR5f7O/jJnThBv7RuuOG6WxV5E=
X-Gm-Gg: ATEYQzyhFiHlXtUBbRHCS7fkT/ERcyqyP74DJIpJsTU6FtkWOqIMQ8rnhgeY59bvk7Z
	IY5fiay9IX8yVCpDtLBsNOqdElute6BDN8T3CQTG2zJyF+van7wQa+reqwGiN2dxslx9NeqLUxw
	Y3V0K2PyyXlmEx/pydx8wZtegLRHWhki3hul7Ydsn+SqARYe0IljuLTrmwC4TSr849y4+WMU/qg
	wKdmuEMYy/iwQj7wirEtJ62BL72DgAEUTFq7WsgLzh8OOG2a1Ey1ixy49bkF4zkxewk6VchG5PS
	FQlgjEfd3sdZPbShmO2SFLu/rhVDOQoQwYih2R7SZfD/TyWq3LBfb6/c9OIK5NuuicVLggqdaaw
	gJKXgQyU8A/+6Xaxkp/4yGaIFlDJhhUc2jdSTrWMRF2V8r5fHozJvR98TTyhoIQ7LTHWTPUeeNb
	5VSvm8ozRCPoyN+0PtrIbpkvkAmg==
X-Received: by 2002:a05:600c:a00c:b0:485:3d00:f06 with SMTP id 5b1f17b1804b1-4853d001718mr86016795e9.6.1773142800967;
        Tue, 10 Mar 2026 04:40:00 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f406sm65219845e9.13.2026.03.10.04.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:40:00 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:39:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Shashank Balaji <shashankbalaji02@gmail.com>
Cc: Tim Bird <tim.bird@sony.com>, rostedt@goodmis.org,
	john.ogness@linuxtronix.de, senozhatsky@chromium.org,
	francesco@valla.it, geert@linux-m68k.org,
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <abADDuc43S3Vk-u-@pathway.suse.cz>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <aa8erTKI1K7eO1LI@fedora>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8erTKI1K7eO1LI@fedora>

On Tue 2026-03-10 04:25:33, Shashank Balaji wrote:
> Hi again,
> 
> On Tue, Feb 10, 2026 at 04:47:41PM -0700, Tim Bird wrote:
> > During early boot, printk timestamps are reported as zero before
> > kernel timekeeping starts (e.g. before time_init()).  This
> > hinders boot-time optimization efforts.  This period is about 400
> > milliseconds for many current desktop and embedded machines
> > running Linux.
> > 
> > Add support to save cycles during early boot, and output correct
> > timestamp values after timekeeping is initialized.  get_cycles()
> > is operational on arm64 and x86_64 from kernel start.  Add code
> > and variables to save calibration values used to later convert
> > cycle counts to time values in the early printks.  Add a config
> > to control the feature.
> > 
> > This yields non-zero timestamps for printks from the very start
> > of kernel execution.  The timestamps are relative to the start of
> > the architecture-specified counter used in get_cycles
> > (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> > 
> > All timestamps reflect time from processor power-on instead of
> > time from the kernel's timekeeping initialization.
> > 
> > Signed-off-by: Tim Bird <tim.bird@sony.com>
> 
> So if a console is read before the cycles -> timestamp conversion can
> happen, then they'll see 0. But reading from userspace will give the
> right timestamps.
> 
> Based on the previous discussions, to address this possible confusion,
> if changing the timestamp format, like adding '?', is a no-go because
> of concerns of breaking existing monitoring tools, what about appending
> something to the printk string after the timestamp? Hmm, no, that'll
> affect grep'ability _and_ may break monitoring tools. Or what about a
> pr_warn() early in boot to warn about the possible timestamp difference?

Or we could make it more obvious from the message in
early_times_finish_calibration(), see below.

> At the very least the possibility of this difference should be
> documented in the Kconfig description.

Yeah, it would be nice to mention this in the Kconfig description.

> > --- /dev/null
> > +++ b/include/linux/early_times.h
> > @@ -0,0 +1,85 @@
> > +static inline void early_times_finish_calibration(void)
> > +{
> > +	cycles_t end_cycles;
> > +	u64 end_ns;
> > +
> > +	/* set calibration data for early_printk_times */
> > +	end_cycles = get_cycles();
> > +	end_ns = local_clock();
> > +	clocks_calc_mult_shift(&early_mult, &early_shift,
> > +		mul_u64_u64_div_u64(end_cycles - start_cycles,
> > +			NSEC_PER_SEC, end_ns - start_ns),
> > +		NSEC_PER_SEC, 100);
> > +	early_ts_offset = mul_u64_u32_shr(start_cycles, early_mult, early_shift) - start_ns;
> > +
> > +	pr_debug("Early printk times: mult=%u, shift=%u, offset=%llu ns\n",
> > +		early_mult, early_shift, early_ts_offset);

We might make it more obvious that an offset will get added to the
existing timestamp since this point.

Also it has a "surprising" user visible effect so that it should
be pr_info() instead of pr_debug(). Note pr_debug() messages might be hidden.

A minimalist change would be:

	pr_info("Calibrated offset for early printk times: mult=%u, shift=%u, offset=%llu ns\n",
		early_mult, early_shift, early_ts_offset);

And/Or we might add one more line:

	pr_info("The time offset is added for existing and newly added printk messages since now!");


> > +}
> > +
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -639,7 +647,7 @@ static void append_char(char **pp, char *e, char c)
> >  static ssize_t info_print_ext_header(char *buf, size_t size,
> >  				     struct printk_info *info)
> >  {
> > -	u64 ts_usec = info->ts_nsec;
> > +	u64 ts_usec = adjust_early_ts(info->ts_nsec);
> 
> printk_get_next_message() calls info_print_ext_header() for an extended
> console (/dev/kmsg and netcon_ext use this), whereas for
> non-extended consoles, record_print_text() -> info_print_prefix() ->
> print_time() is called. So, this adjustment should be made in
> print_time() too, otherwise non-extended console users are gonna be
> spooked with insane timestamps.

The v3 patch already modifies print_time().

> This may explain the non-zero early
> timestamps Petr saw in his serial console output [1].

I am a bit confused now. There are three stages:

   1. Early messages where the cycles are stored.

      The serial console shows zero time stamp because
      it reads the messages _before the calibration_, e.g.

	[    0.000000] Linux version 6.19.0-rc7-default+ (pmladek@pathway) (gcc (SUSE Linux) 15.2.1 20251006, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.45.0.20251103-2) #521 SMP PREEMPT_DYNAMIC Mon Feb  2 16:36:53 CET 2026
	[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-6.19.0-rc7-default+ root=UUID=587ae802-e330-4059-9b48-d5b845e1075a resume=/dev/disk/by-uuid/369c7453-3d16-409d-88b2-5de027891a12 mitigations=auto nosplash earlycon=uart8250,io,0x3f8,115200 console=ttyS0,115200 console=ttynull console=tty0 debug_non_panic_cpus=1 panic=10 ignore_loglevel log_buf_len=1M
	[    0.000000] BIOS-provided physical RAM map:
	[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
	[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved

      But "dmesg" shows some numbers because it reads the messages
      _after the calibration_:

	[    8.853613] Linux version 6.19.0-rc7-default+ (pmladek@pathway) (gcc (SUSE Linux) 15.2.1 20251006, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.45.0.20251103-2) #521 SMP PREEMPT_DYNAMIC Mon Feb  2 16:36:53 CET 2026
	[    8.853617] Command line: BOOT_IMAGE=/boot/vmlinuz-6.19.0-rc7-default+ root=UUID=587ae802-e330-4059-9b48-d5b845e1075a resume=/dev/disk/by-uuid/369c7453-3d16-409d-88b2-5de027891a12 mitigations=auto nosplash earlycon=uart8250,io,0x3f8,115200 console=ttyS0,115200 console=ttynull console=tty0 debug_non_panic_cpus=1 panic=10 ignore_loglevel log_buf_len=1M
	[    8.865086] BIOS-provided physical RAM map:
	[    8.865087] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
	[    8.865089] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved


   2. Early messages added _after the timekeeping_ is initialized
      but _before the early cycles calibration_.

      They serial console prints them _without the offset_ because
      it reads them _before the calibration_, e.g.

	[    3.288049][    T1] Write protecting the kernel read-only data: 36864k
	[    3.298554][    T1] Freeing unused kernel image (text/rodata gap) memory: 1656K
	[    3.318942][    T1] Freeing unused kernel image (rodata/data gap) memory: 1540K

       But "dmesg" prints them _with the offset_ because it reads them
       _after the calibration_, e.g.

	[   12.179999] [    T1] Write protecting the kernel read-only data: 36864k
	[   12.190505] [    T1] Freeing unused kernel image (text/rodata gap) memory: 1656K
	[   12.210893] [    T1] Freeing unused kernel image (rodata/data gap) memory: 1540K


   3. Messages added after the calibration of the early cycles.

      They are printed with the offset by both serial console and
      dmesg, e.g.

	[   12.230014][    T1] Early printk times: mult=38775352, shift=27, offset=8891950261 ns
	[   12.246008][    T1] Run /init as init process
	[   12.254944][    T1]   with arguments:
	[   12.264341][    T1]     /init


> An accessor can be implemented for (struct printk_info).ts_nsec, say
> get_timestamp(), which can be called from both the places.

Yeah, a helper function for reading the timestamp might be a cleaner solution.

> [1] https://lore.kernel.org/all/aYDPn2EJgJIWGDhM@pathway/

Everything seems to be as expected there. The non-zero timestamps
on the serial console are from messages added after the timekeeping
was initialized.

Best Regards,
Petr 
