Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99CB2777FC
	for <linux-embedded@vger.kernel.org>; Mon,  2 Feb 2026 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049445; cv=none; b=BOiTsjfPZAu/4wBeYHkN9Fv2iLYTcfBx3GYOGe5smLsGQ/0idT8pDNJAusk9wH2t0Q1wjXCfIvm63VrR7bf0C+V2mSJKCTkbUNCQ8LXY3IQdbI5gKRx1j9eNbydlqcmAcJOtgqs+OHimJvsntwAQVo3tJ3pyUnv+Y2r2chrxxNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049445; c=relaxed/simple;
	bh=EOztiiSVGrgmHJOg7T+Bw+S50gTH6cV0Y9/IQqtRkkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4wgtGw+L9FIeFsANDP582gYwsF1Na+BKLm1dcRf/MqFryq7FIhiBPisWrdNMfydncMBbUFf+tCBpah9I8yihSSqhyrDPFuiWfY/IlYp9pWg194j7jgmneadiqkRb5fmRd8qjmU34BpaoGxwaJnK1ANMxYUQjkv8tynO8XAPE1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F6ODCcYl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F6ODCcYl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4805ef35864so39653495e9.0
        for <linux-embedded@vger.kernel.org>; Mon, 02 Feb 2026 08:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770049442; x=1770654242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AHNIP0Ho0/lz3K1ulWMW08g4abIwfEx3RKfx/a/iykU=;
        b=F6ODCcYlFCddjqq379Hm3shtmu531MD0/3TBnr5FIPmsRCnvxtBxhNBoB1ogL/aE6n
         UwurTLbjceDUU8B2IDy26d+vzzuRTg4E/07+DdGa9fPJNR/sW8QAs6YJHVcB8ur5DT2i
         lAH/Zv4TWCIcfI7ApC5Ijlfz0wdYPWw4X1ztcdNKIdYPSSQMzWeAHwmqxQNzGzJGgQjL
         87ya5WXcXGa7ye3CnV3ZiUv3iTCJkCy12nu5kkBeoDes4g3Sej8NZjXKCyL92D/axg5t
         pBEBqllzwOALSIZNLmOIkeI9H6X90mM/0U9OLi9G0sgO1tqlVIMdF1SifVWqH0++rpJX
         EOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049442; x=1770654242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHNIP0Ho0/lz3K1ulWMW08g4abIwfEx3RKfx/a/iykU=;
        b=xKIMOZIuqnVvR3xzT2jbpOOCqfGJsbo79D65VQVm6RGKt5gBgLKDbd43MqjDYm0XEI
         iIssyv1RDW33is5/z93aiIvn82qxGY6hsL8mWBxmx72HNq+mtnf2iU0J8HEBqbLIA+Vt
         naOtM6K+8CtpU15NQKVR+LsXiaUGQwoImPm50FhqDTkyBOCbmWhYYs3ZVbg0jtbKIX+H
         Y6Dfe0hfBQTPYRTx50GcfULTwrT36qb5idJlXAiKNN7lpDGFF+PPn7jAFlzZZXNQYliv
         v3rNxHSRqeFk6ti1VRk6HXPtpQq1/dfKeZlmTXZl3XfcDQYYGQifOKn0Ltg+vzhu+w6M
         pZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwBLT3L0P/9LOC/bRdbRiQ5/UuqZtEWsc9GvYbwpzfQZWaiF4aWZe7dCJ8EqqkZKWjPRf/Pc7pvGX/pXYTNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJt1mzT+PsYWMkFFxkBIMHNH2D21usdxEoPVFlaGFaaHPo0O2U
	C+gMU4awN4PKg6IumQCkdLsHC0TRsUU+CJDOxuCNkN25F/Wgf9bqCAcTksiICe9mN9U=
X-Gm-Gg: AZuq6aIzQTeLNT/wd0A05lt6QKHFowAyUqCUCv5WKsTepcDh/wj71y/Z7Pn0cHeM2Ga
	76nw0x558+qJfdFZvIfebwbnuZWnzgq7m8mgaLLb0betaLYSE44vJRCADCCxoSYqM+ngEpTrPPD
	2C5zUKaHBi5Z6g2DSaUMSS/YtMTH6IYiqdlbmHgKGUd2n4Tzp+FWaRtRDpvNOGNqlkjuBC/KvCv
	pnj5YsTG01Rigqu8qNpxSgG/hmW6DQDFj9RkzJNdsMYe5RPxZ7s5BsLammhVn9cL9yjabeR1IsC
	xEXXaRXyN+Qso3Wkl0vDysKk5Rvo5vHDUp/rMWPxX1iqkqZEDo6p1HIKUqzf8gX2HBn+LVXJGSo
	vvwA+VklCc6D4al5AsHcn2v48F2EdVGjtgdmE0nuY/sj003dKndfeXkbOiWm5LU+xnMYbhTyHUE
	kCXWGfiJUBUMpB9oxUZQ==
X-Received: by 2002:a05:600c:3f0a:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-482db447c57mr146134075e9.5.1770049441984;
        Mon, 02 Feb 2026 08:24:01 -0800 (PST)
Received: from pathway (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051286e0sm71505e9.5.2026.02.02.08.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:24:01 -0800 (PST)
Date: Mon, 2 Feb 2026 17:23:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Francesco Valla <francesco@valla.it>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"john.ogness@linuxtronix.de" <john.ogness@linuxtronix.de>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <aYDPn2EJgJIWGDhM@pathway>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260124194027.713991-1-tim.bird@sony.com>
 <aXYrn8QFCSZ5Q8CB@bywater>
 <MW5PR13MB5632FE304C7FA3D86309D6F1FD93A@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR13MB5632FE304C7FA3D86309D6F1FD93A@MW5PR13MB5632.namprd13.prod.outlook.com>

On Mon 2026-01-26 16:52:57, Bird, Tim wrote:
> 
> 
> > -----Original Message-----
> > From: Francesco Valla <francesco@valla.it>
> > 
> > Hi Tim,
> > 
> > I tested this both on X86_64 QEMU and on a i.MX93 (ARM64) and can
> > confirm it is working as expected. Auto-calc of calibration data is far
> > better than the configuration parameters in v1.
> > 
> > It is slightly confusing to see a time value printed to serial output
> > and another one inside kmsg, but that's a human thing and should not
> > confuse any tool.
> Agreed.  I wasn't too worried about it, because most serious developers working
> on boot-time will not be watching early messages over serial console.  (Usually they
> use 'quiet' or some lower log level).  But on qemu, it does look strange to see 0s
> on the first output sequence, and then non-zeroes when using dmesg later in the same
> boot.
> 
> I just realized though, that I should go back and see if there's a discontinuity on the output via serial
> (before and after calibration), and possibly put a note about that in the config description.

I see the following in the serial console output:

[    3.288049][    T1] Write protecting the kernel read-only data: 36864k
[    3.298554][    T1] Freeing unused kernel image (text/rodata gap) memory: 1656K
[    3.318942][    T1] Freeing unused kernel image (rodata/data gap) memory: 1540K
[   12.230014][    T1] Early printk times: mult=38775352, shift=27, offset=8891950261 ns
[   12.246008][    T1] Run /init as init process
[   12.254944][    T1]   with arguments:
[   12.264341][    T1]     /init
[   12.272184][    T1]     nosplash

And this is from dmesg -S

[   12.179999] [    T1] Write protecting the kernel read-only data: 36864k
[   12.190505] [    T1] Freeing unused kernel image (text/rodata gap) memory: 1656K
[   12.210893] [    T1] Freeing unused kernel image (rodata/data gap) memory: 1540K
[   12.230014] [    T1] Early printk times: mult=38775352, shift=27, offset=8891950261 ns
[   12.246008] [    T1] Run /init as init process
[   12.254944] [    T1]   with arguments:
[   12.264341] [    T1]     /init
[   12.272184] [    T1]     nosplash

> I'll think about what I can do here to reduce the confusion.

I though about showing the non-adjusted timestamp with '?',
Something like:

[    3.288049?][    T1] Write protecting the kernel read-only data: 36864k
[    3.298554?][    T1] Freeing unused kernel image (text/rodata gap) memory: 1656K
[    3.318942?][    T1] Freeing unused kernel image (rodata/data gap) memory: 1540K
[   12.230014][    T1] Early printk times: mult=38775352, shift=27, offset=8891950261 ns
[   12.246008][    T1] Run /init as init process
[   12.254944][    T1]   with arguments:
[   12.264341][    T1]     /init
[   12.272184][    T1]     nosplash

But I am afraid that it might break some monitoring tools.

Well, it might be acceptable when this feature is not enabled
in production systems.

> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -777,6 +777,18 @@ config IKHEADERS
> > >  	  or similar programs.  If you build the headers as a module, a module called
> > >  	  kheaders.ko is built which can be loaded on-demand to get access to headers.
> > >
> > > +config EARLY_PRINTK_TIMES
> > > +	bool "Show non-zero printk timestamps early in boot"
> > > +	default y
> > 
> > Considering that this might have a significant impact on monitoring
> > mechanisms already in place (that e.g. expect a specific dmesg print to
> > have a maximum associated time value), please consider a N default here.
> 
> Oops!  Sorry, that was supposed to be 'default n'.  You're right.  I know I had
> this as default N, and I think I switched it temporarily for testing, and forgot
> to switch it back (and never caught it the numerous times I reviewed the
> patch before sending it out again, ugh).  Thanks for catching this.
> 
> If people like this, and we don't see any problems with tooling or virtualization, I
> could see it switching to default Y in the future.  But for now this should definitely
> be 'default n'.

We need to be careful. The different output on console and via dmesg
might confuse people. The extra '?' might help poeple but it might confuse
tools.

> > 
> > > +	depends on PRINTK
> > > +	depends on ARM64 || X86_64
> > > +	help
> > > +	  Use a cycle-counter to provide printk timestamps during
> > > +	  early boot.  This allows seeing timestamps for printks that
> > > +	  would otherwise show as 0.  Note that this will shift the
> > > +	  printk timestamps to be relative to machine power on, instead
> > > +	  of relative to the start of kernel timekeeping.
> > > +
> > 
> > To be precise, the timestamps will be relative to processor power on;
> > the machine might have some other processors that run before the Linux
> > one (this is the case for example of i.MX9 or AM62 SoCs) and will be
> > unaccounted for even by this mechanism.
> 
> Good point.   Even more precisely, it will be relative to
> cycle-counter value initialization or reset, which often (but not always)
> corresponds to processor power on.
> 
> I'll adjust the wording.
> 
> I'm still a bit unsure what happens in the virtualization case.  qemu seems to initialize
> the TSC at qemu start, but I'm not sure what happens for e.g. client VMs on cloud servers.

I see the following via QEMU (from dmesg):

[    8.853613] Linux version 6.19.0-rc7-default+ (pmladek@pathway) (gcc (SUSE Linux) 15.2.1 20251006, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.45.0.20251103-2) #521 SMP PREEMPT_DYNAMIC Mon Feb  2 16:36:53 CET 2026
[    8.853617] Command line: BOOT_IMAGE=/boot/vmlinuz-6.19.0-rc7-default+ root=UUID=587ae802-e330-4059-9b48-d5b845e1075a resume=/dev/disk/by-uuid/369c7453-3d16-409d-88b2-5de027891a12 mitigations=auto nosplash earlycon=uart8250,io,0x3f8,115200 console=ttyS0,115200 console=ttynull console=tty0 debug_non_panic_cpus=1 panic=10 ignore_loglevel log_buf_len=1M
[    8.865086] BIOS-provided physical RAM map:
[    8.865087] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    8.865089] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    8.865090] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    8.865090] BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
[    8.865091] BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
[    8.865092] BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
[    8.865092] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    8.865093] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    8.865093] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    8.865094] BIOS-e820: [mem 0x0000000100000000-0x000000017fffffff] usable
[    8.865094] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    8.865171] earlycon: uart8250 at I/O port 0x3f8 (options '115200')
[    8.865176] printk: legacy bootconsole [uart8250] enabled
[    8.892181] printk: allow messages from non-panic CPUs in panic()
[    8.893327] printk: debug: ignoring loglevel setting.
[...]
[   12.162011] Freeing unused decrypted memory: 2036K
[   12.171970] Freeing unused kernel image (initmem) memory: 7120K
[   12.179999] Write protecting the kernel read-only data: 36864k
[   12.190505] Freeing unused kernel image (text/rodata gap) memory: 1656K
[   12.210893] Freeing unused kernel image (rodata/data gap) memory: 1540K
[   12.230014] Early printk times: mult=38775352, shift=27, offset=8891950261 ns
[   12.246008] Run /init as init process
[   12.254944]   with arguments:
[   12.264341]     /init
[   12.272184]     nosplash
[   12.280738]   with environment:
[   12.288728]     HOME=/
[   12.296319]     TERM=linux

Best Regards,
Petr
