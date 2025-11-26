Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885342BD5BD
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142704; cv=none; b=WnX34hjEeHIaiSFGv1vwcZsxDQPA9AUvzOXNKZ5/vfc6C/uJHhgcIIrpVFQjzG4RjiUy1rzWJ9amerR9zUNgx3OSU81l7jizqW3HjM6qaJPVC5BS8o/TucFV4RJl9lkFRjyAQHL4GSl7wKJcxWE3Vq/FuvXQIfKNP7YI/lMrrbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142704; c=relaxed/simple;
	bh=hQjcREfmDf8kc6CthdiGrCZppDcgkHBuidE5S8kfQ3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5KQ3DNUT1/ESPF4/PmRgdglWbg4Jf/n/BhJW7uq4zsiTi2QoMqi6WRnT7tVEly61QVt2948tNKDAom6QUk37YhQI6NW316Z2rXA/7ZZ+qxfmIvqYhC7GP+z5Cyh319wJ8KSkZadd46Pi3PCNy1AYp7GX6dlNzyhkxl/C+Aa40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9372634aca2so1871579241.2
        for <linux-embedded@vger.kernel.org>; Tue, 25 Nov 2025 23:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142701; x=1764747501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ldRNpfqbXV5QZPEtLE6N6H3iPgRz6jkmwW5HKpKnis=;
        b=BLW4nauG/RQ3yIny+F9TW9YzHaHTfWyX89pO4n3rj7K/aTms2X25TlU0fyRxdDQ20W
         C9nrtwToRGBfa5wq4Dh8eJZGx1s8IOK1IZNGhFGQDeZjkCCM8F9BbvcmURO6Cnkn+PEj
         8NLU6CWWFPkmukWLSM1x4FVELLjOUJ0D0QMrO7Nam93Djil0hLfyynrPMWuYcqAI4UmN
         JtkxKAWSVKUWIgzxvS3jA75tA4xnMb/NcNM+BSjzM4NpaMnCHv6ImYZqg+05G3rQOyFr
         2qFp8pCfGzXGRfs+QeY43Ljpc3yu7wXYwdE1Fkz0MRnMQel2gp65HVFsDeKRujtsm0Oj
         cvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVePagjzhPasg0+IaKeVp5fva8H9Uh1N6LTLlToFcfbdCtoDgeuNd1B4cNTUTFR1eTliGXySUmv1uoh01tT8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/GOMPx+Eyeib5+EybzRAaY8jr/d03l5kwfZLKf5N4ed0qm8NF
	uZlt8e+4UGG+FSLN++vtD+mds+9qtansUDWD0z4eUr8VK+NW+ei7TYo8GpzzppHI
X-Gm-Gg: ASbGnctUJOg0H3ynErlW4VL3bBc1oXOEPQhktytXFjZmNnOC5GQtJI6N9qLk9FBBaZB
	l7thtIn7cl7LKfsq/fajQ0uMiQasj6U/4kdrbBBahliQ/CtnjLQC58ARIUfGFxSaevKdNYGpAFY
	9XsyDLpN/EVoqleprrUC8ARfR9cAoy6Scpo4ntxKDcPHN6vw7WRbpf85YuZFfn8GTaRFs2k9Hnp
	UjsYQmomg5r4H80H9EmNUoYh0DcaVcy+M5qsfPGGGeWQ+rLewWHmess1ew7/fK58mHeiONp394u
	1ol6Y5UELqXb/DeLDhPCiX9ssAULwL03gJd24GTMHB/13UOuEWhpR4h1xLlW5FCxEGtfAAQE2wW
	04HWkRizw3mq9Br+lK8T+Ma/LI/KOF4DOSjWN4LpoCWTE0Moz1eG8TlogE36xh7pfLViB8MqRdV
	kLFFl4kVhYqTnsSLDoR2d1DVQIOU1PFjI1MyC551syJ8phVVGpEwiJBIxB
X-Google-Smtp-Source: AGHT+IHAAiM3bzLRZMkW6m3fdOSEazJhXUs09SNa/le/p1R3pdn2yNEnBGAf2yLvJioyHNVzZ1w8DA==
X-Received: by 2002:a05:6102:c4a:b0:5db:a481:5639 with SMTP id ada2fe7eead31-5e1de3442f1mr6430987137.20.1764142701236;
        Tue, 25 Nov 2025 23:38:21 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c5621a066sm7847294241.4.2025.11.25.23.38.20
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 23:38:20 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55ab217bb5eso918264e0c.3
        for <linux-embedded@vger.kernel.org>; Tue, 25 Nov 2025 23:38:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDiji3eRp+gYJxAMEH+YMNeW2TpLk4t8WpAIaRS1G55sG7lAaRXjWA6kgvHcurPsNpub3oelCWBKaC65sgIw==@vger.kernel.org
X-Received: by 2002:a05:6102:a4e:b0:5db:debf:658f with SMTP id
 ada2fe7eead31-5e1de1bbc80mr6167553137.19.1764142699789; Tue, 25 Nov 2025
 23:38:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org> <aSWqWD1BQ-m-Zy9C@bywater>
In-Reply-To: <aSWqWD1BQ-m-Zy9C@bywater>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Nov 2025 08:38:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvQtCyqSN37QYWCL2T2sz7r-S2Cy7MySn59F3qn5vsZA@mail.gmail.com>
X-Gm-Features: AWmQ_bl9K3DasbrqdP3TSIeyM8E_taze7ucJuUBAyOiXwK8kBD6r8Oh7Vdc01Oo
Message-ID: <CAMuHMdXvQtCyqSN37QYWCL2T2sz7r-S2Cy7MySn59F3qn5vsZA@mail.gmail.com>
Subject: Re: [PATCH] printk: add early_counter_ns routine for printk blind spot
To: Francesco Valla <francesco@valla.it>
Cc: Tim Bird <tim@bird.org>, pmladek@suse.com, Steve Rostedt <rostedt@goodmis.org>, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, 
	Tim Bird <Tim.Bird@sony.com>, Andrew Morton <akpm@linux-foundation.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Embedded <linux-embedded@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Wed, 26 Nov 2025 at 03:24, Francesco Valla <francesco@valla.it> wrote:
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

I think they are.

Another approach would be to defer the calibration/conversion to
userspace, and make sure the early part stands out.
I.e. when real timekeeping is available, kernel messages are prefixed by
"[%5lu.%06lu]".  Early messages could be prefixed by a plain integer
"[%12u]", containing the raw cycle counter value.
The presence of the decimal point would make the difference obvious.

> I actually have a counter-proposal: the time obtained through cycle
> evaluation is used as an offset to be added to the printk time after
> time_init() is called. A (working, but maybe sub-optimal) patch to
> obtain this is attached at the end.

Oh, that's a nice idea, too!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
