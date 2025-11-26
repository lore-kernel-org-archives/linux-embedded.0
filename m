Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF50328B55
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764161739; cv=none; b=ZY63bj/pi6D2DaoMEztd5reJ5xbocvvxyp/3ZAnjo2b4B/3bzFvIzYHFGbI+o3lespdC+zi8VhR80G9XEZJSTGwaTS9y6d26XM1XMxMqRCMQkqnYf77i9Apxy3URAiuqcwcwG5mWRT0ZBFhIIPF1wH5Ew2dPUqKfaJlN26kMoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764161739; c=relaxed/simple;
	bh=uED5a7iSGpxFtHihi2C4Q+xB6s/168K7zdZ5PY0KqUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlA+Kkw93QA403L26GpeXoz3XdgNl7jyzQXLQkeCzGuSYVFOV8l9rM3/TTevMkW4EqHRhpMTCdVrmpEyeo7Ssc+OZ4TUD/1EQHuOk1IfQ71lSGy1NzgiP2VbkhnRHnIf1a0PgMTlyCaO6MYKiiCwYI0WWH+yzH/jj0LxJ+mxghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JAf8dNP9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JAf8dNP9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso71312185e9.3
        for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 04:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764161735; x=1764766535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2vJlIMpTVo0GsxLS9m/HKFB95uCVQEqWI88dTXzXL0=;
        b=JAf8dNP9VoB95JQFmk5TFqCva3zhpkVJj48N7Q1DocpJwoWx2F1PnhANMMUujfsYvb
         ElfsK9iEkcjg8SDzMSJQ//cZnPnzTLDjlgWPrfWQ2RWFraNlWRlmq3tDodgXSS256Fig
         OztAUVl+q1nGuqY3XlX0Dn9oRJ4GmsxL29vveXwJCjFXF6UFTw/ABm1nwn3T+9OgGu0c
         islwE4YkYGL0FX/WeZPt8BOEe3ZW75nPEifkiiDcbrBn6qgXB8+YJUzgW+EyEGcbi39y
         ifE+REadLpeINPob6gDcj3o8Fa1w6/tQQclgN6/8mUIam7UIwqnhwzaXJ5Wi7yRGXqkK
         YoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764161735; x=1764766535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2vJlIMpTVo0GsxLS9m/HKFB95uCVQEqWI88dTXzXL0=;
        b=VNgV188M0kdTpbJYeSiWskQumZyTEToHJkQnexFKGOh8Csu9NkhJ+9jPzVaPwq9zoH
         hdnBHVUIIFJp/WkwOA850Q0KsYmm3qMakWKLgzH4R8XUEN8TtcphnoM8GwMXFDfkuPNA
         ETcporCAzYceVii75RnQL6RCCvFABHyGgVDQNbMQm3aVQUcyLwTrNGGyL3TLl7FcOKed
         TT1aRQ1Co+jhp5tQITpUnaUGDajbkBluHrNdv1mlZTLr9RrIPFT6jDlgEktdiKjRBT/O
         ha1hz2gSFZNiDgFy3GRFHH2kh3nG7lgX7bE5Ue9nUScPHmb+1pUeA19tCsv5rJi02QEt
         SjdA==
X-Forwarded-Encrypted: i=1; AJvYcCUXOCqLWrC6m8xreAAQ2Fh3U3/zZluk+F9H0+A/YxhjRMY/kUI89kZboRkN4YR1vgQ16XH1pycVUmpiID3muA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaix5ouMnFjbOTFAiElNBGxDh6UryryUIBsiaO8piNkQd9JpHK
	HuhWU8F1ePf1kddH0efLXWuiT2XqvU7/3TWTt7Fr5ZF4tC69ISEet+V8nx82Pck2gC4=
X-Gm-Gg: ASbGncujkcxxSm0ovTUA5W6x3p9AMb5yaH5wEjc4YhHe36CGmWgrvQj79btXUdvmSw0
	1WWXkz732iSPPA4XFM25vZpJ0aksZlLp+4mOhZa8oUE8md++S/ZJwtL6rVqIiTVRinsLTRlm8co
	8xyGsR9HcUrGjbM+PiBxDcLY9HnkeueYQD397Y0xzlt2khlbvvDP2zwOKYx6zJiqJ2jEXKUaTCN
	Z1Gym0r9nrX9YDzimHiD+HyzJK7o7cPPTbUg4w/kYQEdHYc52TQx8yj4PmwVxJiuJXQnVwfV3uP
	sYBs0wrHzQJCEZsxx/75WtaSElqnparBKB9Z6bQcynruTdnBLDvkDlitQWBSTzWDnMAYqQLWt4L
	xmWV3joAQOu9r6zgNnGiQc8YXhCVoKGQNcbJAA0yZdkRkLlShJLFlYx/veYQ5x1HRkk+9NNmyZ7
	+a3T3ljXtBmA0s5A==
X-Google-Smtp-Source: AGHT+IEeoDSLJrpNt/pDvT31OuLPP8pn7uR1w1BMXtakeH3e5ah7DcmOaz5yt4hY1rLc42un9qLyNw==
X-Received: by 2002:a05:600c:19cd:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-477c1115febmr145030035e9.21.1764161735390;
        Wed, 26 Nov 2025 04:55:35 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm41499132f8f.40.2025.11.26.04.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:55:34 -0800 (PST)
Date: Wed, 26 Nov 2025 13:55:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: Francesco Valla <francesco@valla.it>
Cc: Tim Bird <tim@bird.org>, Steve Rostedt <rostedt@goodmis.org>,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	Tim Bird <Tim.Bird@sony.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Re: [PATCH] printk: add early_counter_ns routine for printk blind
 spot
Message-ID: <aSb4xHCB6i_Q6JpC@pathway.suse.cz>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <aSWqWD1BQ-m-Zy9C@bywater>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSWqWD1BQ-m-Zy9C@bywater>

On Tue 2025-11-25 14:08:40, Francesco Valla wrote:
> Hi Tim,
> 
> I tested this on my i.MX93 FRDM (arm64) board and after a bit of
> fiddling with the MULT/SHIFT values I got it working. It can be a very
> valuable addition.
> 
> Some comments follow.
> 
> On Mon, Nov 24, 2025 at 10:30:52PM -0700, Tim Bird wrote:
> > From: Tim Bird <tim.bird@sony.com>
> > 
> > During early boot, printk timestamps are reported as zero,
> > which creates a blind spot in early boot timings.  This blind
> > spot hinders timing and optimization efforts for code that
> > executes before time_init(), which is when local_clock() is
> > initialized sufficiently to start returning non-zero timestamps.
> > This period is about 400 milliseconds for many current desktop
> > and embedded machines running Linux.
> > 
> > Add an early_counter_ns function that returns nanosecond
> > timestamps based on get_cycles().  get_cycles() is operational
> > on arm64 and x86_64 from kernel start.  Add some calibration
> > printks to allow setting configuration variables that are used
> > to convert cycle counts to nanoseconds (which are then used
> > in early printks).  Add CONFIG_EARLY_COUNTER_NS, as well as
> > some associated conversion variables, as new kernel config
> > variables.
> > 
> > After proper configuration, this yields non-zero timestamps for
> > printks from the very start of kernel execution.  The timestamps
> > are relative to the start of the architecture-specific counter
> > used in get_cycles (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> > This means that the time reported reflects time-from-power-on for
> > most embedded products.  This is also a useful data point for
> > boot-time optimization work.
> > 
> > Note that there is a discontinuity in the timestamp sequencing
> > when standard clocks are finally initialized in time_init().
> > The printk timestamps are thus not monotonically increasing
> > through the entire boot.
> 
> This is... not going to work, IMO, and might lead to breakages in
> userspace tools (are printk timings a userspace API?).

Honestly, I am not sure if it would break anything. The fact is
that printk() always used monotonic timers. And it is possible
that some userspace depends on it.

I personally thing that non-monotonic time stamps might be confusing
but they should not cause any serious breakage. But I might be wrong.
People are creative...

> I actually have a counter-proposal: the time obtained through cycle
> evaluation is used as an offset to be added to the printk time after
> time_init() is called. A (working, but maybe sub-optimal) patch to
> obtain this is attached at the end.

I am not sure if this is a good idea. The offset would cause
that all post-timer-init printk timestamps differ from values
provided by the timer API. And it might cause confusion,
for example, when they are printed as part of the message,
or when analyzing a crash dump.

On the other hand, there are various clock sources in the kernel
which are not comparable anyway. So maybe I am too cautious.

> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -770,6 +770,53 @@ config IKHEADERS
> >  	  or similar programs.  If you build the headers as a module, a module called
> >  	  kheaders.ko is built which can be loaded on-demand to get access to headers.
> >  
> > +config EARLY_COUNTER_NS
> > +	bool "Use counter for early printk timestamps"
> > +	default y
> > +	depends on PRINTK
> > +	help
> > +	  Use a cycle-counter to provide printk timestamps during early
> > +	  boot.  This allows seeing timing information that would
> > +	  otherwise be displayed with 0-valued timestamps.
> > +
> > +	  In order for this to work, you need to specify values for
> > +	  EARLY_COUNTER_MULT and EARLY_COUNTER_SHIFT, used to convert
> > +	  from the cycle count to nanoseconds.
> > +
> > +config EARLY_COUNTER_MULT
> > +	int "Multiplier for early cycle counter"
> > +	depends on PRINTK && EARLY_COUNTER_NS
> > +	default 1
> > +	help
> > +	  This value specifies a multiplier to be used when converting
> > +	  cycle counts to nanoseconds.  The formula used is:
> > +		  ns = (cycles * mult) >> shift
> > +
> > +	  Use a multiplier that will bring the value of (cycles * mult)
> > +	  to near a power of two, that is greater than 1000.  The
> > +	  nanoseconds returned by this conversion are divided by 1000
> > +	  to be used as the printk timestamp counter (with resolution
> > +	  of microseconds).
> > +
> > +	  As an example, for a cycle-counter with a frequency of 200 Mhz,
> > +	  the multiplier would be: 10485760, and the shift would be 21.
> > +
> 
> If I got this correclty:
> 
> 	EARLY_COUNTER_MULT = (10^9 / freq) << EARLY_COUNTER_SHIFT
> 
> where EARLY_COUNTER_SHIFT can be chosen at will, provided it is big
> enough to survice the ns->us conversion but small enough not to overflow
> the u64 container. 
> 
> > +config EARLY_COUNTER_SHIFT
> > +	int "Shift value for early cycle counter"
> > +	range 0 63
> > +	depends on PRINTK && EARLY_COUNTER_NS
> > +	default 0
> > +	help
> > +	  This value specifies a shift value to be used when converting
> > +	  cycle counts to nanoseconds.  The formula used is:
> > +		  ns = (cycles * mult) >> shift
> > +
> > +	  Use a shift that will bring the result to a value
> > +	  in nanoseconds.
> > +
> > +	  As an example, for a cycle-counter with a frequency of 200 Mhz,
> > +	  the multiplier would be: 10485760, and the shift would be 21.
> > +
> >  config LOG_BUF_SHIFT
> >  	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
> >  	range 12 25

So, it is usable only for a particular HW. It is not usable for a
generic kernel which is supposed to run on misc HW.

I guess that there is no way to detect the CPU frequency at runtime?

Best Regards,
Petr
