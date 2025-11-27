Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEF7339A8
	for <linux-embedded@vger.kernel.org>; Thu, 27 Nov 2025 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260215; cv=none; b=Af04hrdQIEYAguBAUc2pPvY7+W+woScDwkGxKvLNRv2B1eDRhtdgXHDHRaIyoB85gzzHsnxt1xUIiuttTJWG803DY8S9TW727f1as8CoBfrhjgXq6Afa6haB2xMTQZq2dc65wSRx+r7mtNNzqWm6LFvA0acA1r3ZUCwFzd7jnBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260215; c=relaxed/simple;
	bh=yrXS0keLo3e5FE3/Ha3wm/MkCNEWw09GJ4Z/NVtRhd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiBttUtmuVtd3K/fUdvtFgQYzrN/ritrBVUIHKxoGxRzDSFQZhzdnvFqfZ9eP9AtU93niDXSmCsQNYTQij0t9BrXN+rDHEzX2541fVRT+OWi/7u34Qb6tB11vK1DdUjlACOa8uGw8tidGMCjFZ1JoBWhMl406HX4bCkd9Xotg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=csAfJXiP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="csAfJXiP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47790b080e4so4671195e9.3
        for <linux-embedded@vger.kernel.org>; Thu, 27 Nov 2025 08:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764260211; x=1764865011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AqRFoMLC3QuaWmtBeZEzRC0ZCq5aGwPbl1yr0R997Wc=;
        b=csAfJXiPFNsl5uM0Ii2R5sFbbamRtemv2xgZOPaC7V4jimRo7lxelYASCB4W4StN7M
         ugBt9Alg8vkwNcBfCGDCajykYd8nBgUdQs3g5JWoFtsmH3A5t1tnNYYcU1sIiUV0zm17
         Z++huhX87XkdF8SgezG297oZ+vBaw3EjIdkUGs+O1WfuWuaoqNuCQkXdr1lBujgfFxyw
         Csq8Q4UO5bAbI6/Z0lr1V8swQPSeWVDvbokMyPw+9Itx/XtXncDiiC271Ph2rGlS4IaX
         dQkvMIvL3QMsHMtCznu6IMtAC7xhzZcngqwc70vXEgX4db7sip3U01ht9G55sOEIo/XV
         YlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260211; x=1764865011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqRFoMLC3QuaWmtBeZEzRC0ZCq5aGwPbl1yr0R997Wc=;
        b=cFAK+vgGBeybiBiYPo40Qzfqbf3mA2IfffZhkF/U69NUgXEDmyX31cnj1AnRcPinHV
         dC3UZ0EWy3VHIjwo4ZJ6aBZlxSqWvYCHC3presiUqovnHA9dTziXu6f20MPahJ5gZEhX
         YmRB3sXhMFGO3E20rUPdH7P/oVG1UJ3iLAER1mr7n8UVHNmRFEsUksrdWoH//ajE8B5E
         9cbb+16nEekVXPmfFpxxiTa2Xd3jIUqrh0DNkkkpZoN5yJ+GEJfknMfYBNyd4336lGi9
         GnsqvrzzseuovNG4ua8cZtMD8kLErr8tGR0xTJpj1kvX6Bv82eoOWlWUReoUwlpXlfAt
         Hb3g==
X-Forwarded-Encrypted: i=1; AJvYcCVkTo61oEWYf7CUwXPI639npbhoVynbU853DsA0P6QeixQhDMLXhPYEPzbfOgVqJwNECY3l0ZNeuzNKfe5BZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKWQNmB5xy0UMptxeCZK5kcD5NqSFKwAEvezsK4vynLEziOSSg
	8I+BWSxee+FAaJe1Avfm/D9rej4kqI01/XwFTQQEDr2S57/F5k4R9y5TRc5eUIjpaDc=
X-Gm-Gg: ASbGnctVej16cqGA/W89wHgF08gRbhDRl7dKzSQfschWzQDwhATMcxrIlbwXWxV/JYJ
	rlDPPcQsJBV1A8oKcd9Fu6algxGOiWlxRAsQIEPYSUviv3qW0wMTJc3hfJxoXAnBC6+9gGEYo1O
	WTZBPZ+xcDMdVa+TOFTQl9fioVX5y/sTquCnPOWZN8r+y0u4Zra4kfwG+1jCu+EfBrzj26HvveC
	rdKf/K6ITX8D7QD/IjB+6lpuFNTOBI2bq8s3fDIN8n454ONIrwYlS51lFlyTbglGBu5ZHB6kuMo
	1ET5KearoMOmQvVonNA8F+x4pSgO34uQn+X7xU1Qoyo8aC3n4pTtpInwhC/L4HhY8/Rd6DJrtcg
	6dbiEaaDY9YIlQR8Uh5eUZnICCw7EoqYyi17ALmdsJ91jSNoApI9MXzdaD0c36FZehjNAPaKJez
	N8tgmGNRwiONPoPQ==
X-Google-Smtp-Source: AGHT+IEARZSgpfOqEksi/q1MBLmKxFYGEDlyNwq1CUbUQ+/GGREmV9/0ZC3yJFNPmXF382hzzQNJlg==
X-Received: by 2002:a05:600c:529a:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-477c1133932mr237399885e9.33.1764260211473;
        Thu, 27 Nov 2025 08:16:51 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc186sm99127185e9.13.2025.11.27.08.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:16:51 -0800 (PST)
Date: Thu, 27 Nov 2025 17:16:48 +0100
From: Petr Mladek <pmladek@suse.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Francesco Valla <francesco@valla.it>, Tim Bird <tim@bird.org>,
	Steve Rostedt <rostedt@goodmis.org>,
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Re: [PATCH] printk: add early_counter_ns routine for printk blind
 spot
Message-ID: <aSh5cCg5TQOh-qUw@pathway.suse.cz>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <aSWqWD1BQ-m-Zy9C@bywater>
 <CAMuHMdXvQtCyqSN37QYWCL2T2sz7r-S2Cy7MySn59F3qn5vsZA@mail.gmail.com>
 <MW5PR13MB5632A34DAEDD321E9813F997FDDFA@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR13MB5632A34DAEDD321E9813F997FDDFA@MW5PR13MB5632.namprd13.prod.outlook.com>

On Thu 2025-11-27 00:16:23, Bird, Tim wrote:
> 
> 
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Hi all,
> > 
> > On Wed, 26 Nov 2025 at 03:24, Francesco Valla <francesco@valla.it> wrote:
> > > On Mon, Nov 24, 2025 at 10:30:52PM -0700, Tim Bird wrote:
> > > > From: Tim Bird <tim.bird@sony.com>
> > > >
> > > > During early boot, printk timestamps are reported as zero,
> > > > which creates a blind spot in early boot timings.  This blind
> > > > spot hinders timing and optimization efforts for code that
> > > > executes before time_init(), which is when local_clock() is
> > > > initialized sufficiently to start returning non-zero timestamps.
> > > > This period is about 400 milliseconds for many current desktop
> > > > and embedded machines running Linux.
> > > >
> > > > Add an early_counter_ns function that returns nanosecond
> > > > timestamps based on get_cycles().  get_cycles() is operational
> > > > on arm64 and x86_64 from kernel start.  Add some calibration
> > > > printks to allow setting configuration variables that are used
> > > > to convert cycle counts to nanoseconds (which are then used
> > > > in early printks).  Add CONFIG_EARLY_COUNTER_NS, as well as
> > > > some associated conversion variables, as new kernel config
> > > > variables.
> > > >
> > > > After proper configuration, this yields non-zero timestamps for
> > > > printks from the very start of kernel execution.  The timestamps
> > > > are relative to the start of the architecture-specific counter
> > > > used in get_cycles (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> > > > This means that the time reported reflects time-from-power-on for
> > > > most embedded products.  This is also a useful data point for
> > > > boot-time optimization work.
> > > >
> > > > Note that there is a discontinuity in the timestamp sequencing
> > > > when standard clocks are finally initialized in time_init().
> > > > The printk timestamps are thus not monotonically increasing
> > > > through the entire boot.
> > >
> > > This is... not going to work, IMO, and might lead to breakages in
> > > userspace tools (are printk timings a userspace API?).
> > 
> > I think they are.
> > 
> > Another approach would be to defer the calibration/conversion to
> > userspace, and make sure the early part stands out.
> > I.e. when real timekeeping is available, kernel messages are prefixed by
> > "[%5lu.%06lu]".  Early messages could be prefixed by a plain integer
> > "[%12u]", containing the raw cycle counter value.
> > The presence of the decimal point would make the difference obvious.
> 
> I thought about this while I was creating this.
> It wouldn't require the extra configuration for MULT and SHIFT (which would be nice),
> and it would be, as you say, very obvious that this was not a regular timestamp. 
> This means it could be enabled on a generic kernel (making more likely it could be
> enabled by default). And really only boot-time optimizers would care enough to
> decode the data, so the onus would be on them to run the tool.  Everyone else
> could ignore them.
> 
> I'm not sure if it would break existing printk-processing tools.  I suspect it would.

I guess that it might break even basic tools, like dmesg, journalctl,
or crash.

A solution might be to pass it as an extra information to the official
timestamp, for example:

  + on console:

      <level>[timestamp][callerid][cl cycles] message
      <6>[    0.000000][    T0][cl  345678] BIOS-provided physical RAM map:
      <6>[    0.000000][    T0][cl 1036890] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
      <6>[    0.000000][    T0][cl 1129452] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved

  + via /dev/kmsg

     <level>,<sequnum>,<timestamp>,<contflag>[,additional_values, ... ];<message text>
     6,2,0,-,caller=T0,cycle=345678;BIOS-provided physical RAM map:
     6,3,0,-,caller=T0,cycle=1036890;BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
     6,4,0,-,caller=T0,cycle=1129452;BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved

The extra field would disappear after time_init().

The value might be stored in struct printk_info in the same field .ts_nsec.
It might be distinguished from a real timestamp using a flag in
enum printk_info_flags. The official timestamp would be zero when
this flag is set.

It will not require the two CONFIG_ values for calibrating the
computation.

The output on the console is a bit messy. But I guess that this
feature is rather for tuning and it won't be enabled on production
systems. So it might be acceptable.

time_init() might even print a message with the cycle value
and the official timestamp on the same line. It can be used
for post-processing and translating cycles back to ns.

> Also,  I find that post-processing tools often get overlooked.
> I asked at ELC this year how many people are using show_delta, which 
> has been upstream for years, and can do a few neat things with printk timestamps,
> and not a single person had even heard of it.

Yeah. We need to make sure that the post processing tool won't get mad,
for example, crash or show garbage.

Best Regards,
Petr
