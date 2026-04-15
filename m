Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ACA4A07
	for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 00:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776212411; cv=pass; b=E4njprgUOvH2QFWGZ2EW+vkmrc0+CLrZcN3V2kGJWhQDSyDiAd3OKek/ptHXQDd41v3wifcf7wB7+3nddtzAVAeMzYVaEdBZw/F2nvvMNnTzm4/aGY/rzlGZn9Lbz3qYyVaua72iE5xXUyE8LKyFhk8KelWC0r/9RV5AYJnxswY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776212411; c=relaxed/simple;
	bh=PrNj7DsypmtlV9DqmpK7zvfNC2CbNNA6RQ+Pb31K/bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GafQn5j1N2o2fzHlgAlm8hRvGrc1fNhS6lzxoGn+DZxRtq+wyQAk77a2XPKCbCpc8UqnKh3Li3QyVQKZg8zWkpuAL2JiD/jlK6OtOqnpDouuBV7gLOmPM260TbH6nKrm/mnOE8ULhCU41HwFUK5ok1giXcG5ixGnQkoU+FRZKBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XES1kZVk; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XES1kZVk"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7986e538decso66364167b3.1
        for <linux-embedded@vger.kernel.org>; Tue, 14 Apr 2026 17:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776212409; cv=none;
        d=google.com; s=arc-20240605;
        b=YEqN0ioOIczxfoWYhxH4CWWTtWNh2Xcc464AEGndcQNa3d8tA9i8uuvSXQRUamxiqT
         QrhfAOM+/c662dSMkOeWD6nvIcAM9qa0/CLUYaa7aolwu/aNC9RSCVxEp0iAKFZjwVzN
         jcITAFN70vPoFolwvN8spLvZplJiqSFrUDS+Ei2fE+VFZyPyi89aZolZnUy10TrgAuSe
         mBnA6jsOQndwdCHhSZPFyS96ZP57piO7lldGJ3YXTfSYn5v7ULtKZfK3LbWNtD5DroU3
         3KB11rc5JHrNflwf3qmOBY+gjEHXvWVzL5+4mEo5GFhn17YTJaHpIf2Z873+bN5IhOqI
         dvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JhW74GlQj6paeEOlFTGLFyNa3L3i7JjgngfifrHeFNg=;
        fh=IROBA3u0cgpXCtVVD4LTbiZ1f5z428tlApDnufK8Xsc=;
        b=Oook0Evnbdgyt2FHAPM98X4OE5Jxa+mn5GY2LlYz0wvmZ7iKNJHcvfXRKaar2Yo9rO
         QeRfqHgeHTh9RoQ0m5Yd7v2xQ5rAWsqS/lJJXGbyt8hahTR18vdon6gGp0sVYziK4utm
         m4T1EFOdHaeuuovSXRPSG6t9kEpaBxRTU5o9F170OVmWuUiKQktz//+R61Wgz27JrhYz
         ITk8bSAFCowOmiueLpKCCIkcpbCjuKTi5ptjAyjH/Q6GO0cEsPGRbXVcfNs0kHBejR4O
         Hktuzo1jolmLGXfkUaGmhKTqAvNYvu6L+JUVdNL5FisVk8ycD4s3ci7tpOhgwteUFYZz
         PIBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776212409; x=1776817209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JhW74GlQj6paeEOlFTGLFyNa3L3i7JjgngfifrHeFNg=;
        b=XES1kZVkDYBM0lXGbwF17QtG4HD7RAELRgXzIrqK+ALgj37/E8vm/l1La8p2L6LtZ7
         LKIZUu82iNVAqN8bhiRnpyLlIF+Mu/cYvtg4UcT6v+V931tDzZ8SZlu9yaxiDoiHYUyc
         hPVK/VQW//eeGH+tOifCfD55AoJrMhjcfkN7RMVbegRc8fKyxSMqBPY3qjCJNK3HPiUk
         ZxaFX93eExjD0C77RR4Lam9tn1eC1PTiaHdVVSnnb1sdtHHclcgF81sfcy/oKYMcf5ky
         LndTdMzwZ1NVYxr3J/l5oxpaFh7x1kiclI4qZgdXm7EvtHPHfgywkbsuWPkRZ/fIoFmW
         2oYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776212409; x=1776817209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhW74GlQj6paeEOlFTGLFyNa3L3i7JjgngfifrHeFNg=;
        b=px1AHRfKIRkKNCw0AYqn2n+MQ3VFppky0DmUd3KZ0RELqoY0zocCO/U3EBDsxS9zH6
         C7hVPmusqWLWcjRkEEPxQcoFSofR8hx5O21zVpNG+mTmUddCjs9gjf3Thc5keyQm2G7k
         JQCtMYG2l/lSfJ9bs1IwlLvayg7RWpJz+HczihCi29ebPZe3pwo4kDEN0MvokwPgTX71
         mXteHGxjPEnDBsXJGU9OMTTQPz3jHeyGf8P9hS7FPs/KFNFAwJLf/uCJMEqLioJmLEJl
         Nq/6CPG0dc6DNGB8oIiWE0rLrz4NSMANlRfT6Ou37EKlNy0/YjRenET2pYxgUCtM0cjd
         EBZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pvcL+dA2Yn6pT0l1fq7Oy4wNQYM0S+OLANr8A3ho3cLpn73aN0g8aVV+yPTNVZTzbPXTPEUyc19d31OFGfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHka9eiLam0MGemrZdva/EB+CPYCQ970Qhcq9cpzthH44NRlBc
	Db4MWxmeUktcWahnj3ph2zc9JmdY7EVfV2uDT9G2tTzt1qVmr91FCehBS+pOKPNfROIaVqjOJKh
	t53JmHPeFhTKr0l2wvPbnL66RtvxFpFbbbz5mApQE
X-Gm-Gg: AeBDietqRpE9Ez7WqDfQiI2Sfs3CszN2uUZnzZ0ur6m4w7wkyBjeqYqS+VICKJuQTeD
	DEbhCdrvgiF9TC6xSZal6ZL7sDn9eiMgk2oxaY9rSDCuecmMabHOeTDaVXlPQuKm2L9g8/e15qW
	7wKfrj+Ugczxp8XMTITegpyZBi+WeI3tuF5vf+7xFCaYrWZzysRLJVqLhkDz4SIPkkauaA7w8vd
	mrd0w6W+u+GtuG1pKD58lMGpqByGSrsEA4tFNOjufkoXGue6RdUEg6vtid0TmFoaU7OY8JEurg/
	c+SGK9xvb4Ecj/yyjGRtLkxrJuQsesZziUCJWxFOvvlp0zCpcv84tNVoMIky41ihCJdeOuHrHn5
	fDfcEjwIh
X-Received: by 2002:a05:690c:c508:b0:7b6:f4f:f05e with SMTP id
 00721157ae682-7b60f4ff740mr44006197b3.40.1776212409315; Tue, 14 Apr 2026
 17:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx>
In-Reply-To: <87qzohdv6i.ffs@tglx>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Wed, 15 Apr 2026 02:19:30 +0200
X-Gm-Features: AQROBzCNuQbinjpH-HdlnNCzVugxI012fKiMcDoHXPKBYi2jQGbskT9rxmLeRbg
Message-ID: <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Thomas Gleixner <tglx@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 00:38, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Fri, Apr 10 2026 at 14:37, Tim Bird wrote:
> > +
> > +#include <linux/timekeeping.h>
> > +#ifdef CONFIG_ARM64
> > +#include <asm/sysreg.h>
> > +#endif
> > +
> > +#ifdef CONFIG_EARLY_CYCLES_KHZ
> > +static inline u64 early_unsafe_cycles(void)
> > +{
> > +#if defined(CONFIG_X86_64)
> > +     /*
> > +      * This rdtsc may happen before secure TSC is initialized, and
> > +      * it is unordered. So please don't use this value for cryptography
> > +      * or after SMP is initialized.
> > +      */
> > +     return rdtsc();
> > +#elif defined(CONFIG_ARM64)
> > +     return read_sysreg(cntvct_el0);
> > +#elif defined(CONFIG_RISCV_TIMER)
> > +     u64 val;
> > +
> > +     asm volatile("rdtime %0" : "=r"(val));
> > +     return val;
> > +#else
> > +     return 0;
> > +#endif
> > +}
>
> No. Generic code and generic headers have no business to implement any
> architecture specific code and there is zero justification for
> architecture specific #ifdefs in generic code.

This translates in practice in early_unsafe_cycles() various
instances, one for each architecture supported. Even better a macro
for each architecture like this example below (untested code, just for
exemplification):

  ts_nsec = local_clock();
#ifdef CONFIG_EARLY_CYCLES_KHZ
#if defined(CONFIG_ARM64)
#include <asm/sysreg.h>
#define early_unsafe_cycles read_sysreg(cntvct_el0);
#elif defined(CONFIG_X86_64)
#define early_unsafe_cycles rdtsc()
#elif defined(CONFIG_RISCV_TIMER)
#define early_unsafe_cycles ({ u64 val; asm volatile("rdtime %0" :
"=r"(val)); val; })
#else
#define early_unsafe_cycles 0
#endif
+ if (unlikely(!ts_nsec))
+ ts_nsec = early_times_ns();
 #endif // CONFIG_EARLY_CYCLES_KHZ
  caller_id = printk_caller_id();

While keeping architectures separate is for abstraction layer best
practice, in very specific cases abstraction can be a meaningless
concept or much less important than having a single file for a single
feature (the complementary way of organising stuff). Because in Linux
the abstraction layer approach applies for architectures, the gap
between aesthetic and a specific case like an early boot macros set
hack for debugging is to clarify the exception from the general rule
in the header itself.

On Wed, 15 Apr 2026 at 00:38, Thomas Gleixner <tglx@kernel.org> wrote: (to TIM)
>
> Ask your favourite AI assistant for an opinion.

(Roberto maintaining the cold blood in front of "Tim's overlooking a
false positive gcc warning" and check Thomas suggestion just for the
sake of curiosity)

Gemini Thinking AI: Whether or not you can justify this exception
depends entirely on whether this is a permanent feature or a transient
debug hack.

Cheers, R-
