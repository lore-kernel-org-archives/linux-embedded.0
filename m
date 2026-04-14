Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A833C2BD11
	for <linux-embedded@vger.kernel.org>; Tue, 14 Apr 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150230; cv=none; b=hK/+p3CJgc/mG5UHxwuTdHevTzJNKS0RDlAcEjnQXd+cuLBqxHToGZh3TiKO05LaKBLNGRYF0t8hRzPnu5gCQZI0l5ZA93e9u9peA/5PmNahGw2c5mxvaXJMI6dnC6NhH52L9/7diZMwHOaHsfdlHfURvhRp/A4+8nF7TnhMzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150230; c=relaxed/simple;
	bh=J8k5RLIlvEiUGYbwytJu/Pp9z1zEHln/ZgJEnF3Uocw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9TYe5IbSQQKs5GpbfmNh3nnacVTh0e0y3PMoo7J8zFGGT4p7WzMrUty4pqIbaBIBfW8rJAy8ReRELWYCqRLhu+OkY9Lu/tLx45DUKjuKQ3nmzyZiAcLiRodOLpBOL39IQWho4ue1boTAC6lsHX+ixT2rMHn26JuJpzi6yeWpYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56eec951db1so1717744e0c.3
        for <linux-embedded@vger.kernel.org>; Tue, 14 Apr 2026 00:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776150227; x=1776755027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yYWwqHPakuhsQJ09VUYUuBwBWjEH2mH2cZco0kr36k=;
        b=ATHvEik/1xcOsZlVJGtHDqTNWqwQhakZjdyTPbJoDq6uvJ73/xhcKJui+rPOvDd2ib
         gHDOIP4vXiLgedH4RiEx5auh/Fsf+dbbl+XpJBGQ7IZRg3HX5ku0jppx2g43LmY3XBQK
         ruJYfz8V00E8htl10OmO+Dy9HV1mtdHjDyZRBArQgq9XVv1QNR4iYahZo47vE9W13nUm
         DKvDd0CANPl9rXN/UGr5Rjgdf2tQ/46LZu6mf/3gFqs3nc4tTTAnhDe2HAIOf7kbjSzC
         AEhNFO7itHFWfAG1ZVli+Ttxnzw7P2l6rbwkk+6GPkaX0klrFHZmek1iiiBoFhyfBxxy
         TorA==
X-Forwarded-Encrypted: i=1; AFNElJ9sNJtyG1bu1+JuaoR+i4eLCnezewShVKTPAK2MPoN0r/Y6rJ0OeaLeojLeGcErhSmtewX6dr2iLqMDv2twvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcvdG/urlzpl9Ct6wyiYW2zj5drBjqkJPSZdG3hKNk7CV1LqIb
	ago5xm2mAyM2o2cbrfWblG5sIRDU9ZJ6C84d3LR6ryUcqg2ksWPuCWmFRx/1dMbl
X-Gm-Gg: AeBDievfoJRetOBDVMi3TPsMLrzfUWr5+vbilKGPmNQqNlR2qhk9RHXu9eEBX+jeZKb
	Wh/kkd9R/Y2jcYdzXzBhpA1TzJJOvcAISdNwnQdGdKUwglkxM2rA31NoDERC/zXk1ucuC0y+zOF
	XixmL5oKLT9sHkuvlYmxt/9J+1AEebSQSM8e+k+ZKuKFEM3BkWrE+Z+GO6oVqlQ3AMCIVrmvUcW
	d7Huz+fq/iqI+PQNnwW5Q7swhPV5g0i1CKC+9wRzbzEj9qA1j0wsPIN1JR1G3W+yaxNL4xUWPYe
	6uw+2OOyhD6bSoSuhs9b9zD0S7YjcpKzgq5xqZDZyRLvTyqJcYQDDHEuh4PY/iQdlCGMq77+rS4
	zD3xVqbgVKDuzyMFMSTxGdBx0fMqcRxdrFo1zH4eMOPbGvAbFy6C7bPW14FWeoli9FRZeV64Wia
	E+1ALCK2ffYvnFbq2o51O4kE3XGtMAvErb7Q87XY/3Ofm8AjuuRrct8MYQh52H
X-Received: by 2002:a05:6102:370a:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-60a00733f22mr6379465137.19.1776150227397;
        Tue, 14 Apr 2026 00:03:47 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-609db8151b5sm7751990137.10.2026.04.14.00.03.46
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 00:03:47 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-956995b5bb6so436883241.3
        for <linux-embedded@vger.kernel.org>; Tue, 14 Apr 2026 00:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8dL9ELsIJ9MDeDfY3qi6HRszmDmHu5PM4BnJkQc+n1qBYdHCw9/6uw/dbeN3faUbELPvrrfhdHIwbFNZHsdw==@vger.kernel.org
X-Received: by 2002:a05:6102:c0d:b0:607:4fe2:a644 with SMTP id
 ada2fe7eead31-609fe7a58e5mr6141223137.6.1776150226699; Tue, 14 Apr 2026
 00:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
In-Reply-To: <20260410203741.997410-2-tim.bird@sony.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Apr 2026 09:03:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-jeO83JQQaQXkk2oFsFH=K_p8Nmta7s5J-_BgwF5KXQ@mail.gmail.com>
X-Gm-Features: AQROBzAN4jbJbAV7dApeeuYOLlLuoiMCYI1t850L-MlkvbgmeKRHnWTDbPl-V-I
Message-ID: <CAMuHMdX-jeO83JQQaQXkk2oFsFH=K_p8Nmta7s5J-_BgwF5KXQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Tim Bird <tim.bird@sony.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de, 
	senozhatsky@chromium.org, francesco@valla.it, tglx@kernel.org, 
	shashankbalaji02@gmail.com, linux-embedded@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tim,

Thanks for your patch!

On Fri, 10 Apr 2026 at 22:38, Tim Bird <tim.bird@sony.com> wrote:
> During early boot, printk timestamps are reported as zero before
> kernel timekeeping starts (i.e. before time_init()).  This
> hinders boot-time optimization efforts.  This period ranges from
> 17 to 1700 milliseconds on different embedded machines running Linux.
>
> Add support for early timestamps based on processor cycle-generators
> that need no kernel initialization. Use a statically-configured
> frequency value for converting cycles to nanoseconds. This means
> that this feature cannot be turned on in generic distro kernels.
> It is intended for temporary use during kernel development and
> boot-time research and optimization only.
>
> This yields non-zero timestamps for printks from the very start
> of kernel execution.  The timestamps are relative to the start of
> an architecture-specific counter (e.g. tsc on x86_64 and cntvct_el0
> on arm64).  Affected timestamps reflect time from cycle counter
> init (usually machine power-on or virtual machine start) instead of
> time from the kernel's timekeeping initialization. This results in a
> discontinuity in the printk timestamp values, one time, when
> kernel timekeeping starts.

Won't it be hard to see where the discontinuity happens in some cases?
Perhaps this can be made more obvious by not doing the time conversion
in kernelspace, like in your first version?

> Signed-off-by: Tim Bird <tim.bird@sony.com>

> --- /dev/null
> +++ b/include/linux/early_times.h

> +/* returns a nanosecond value based on early cycles */
> +static inline u64 early_times_ns(void)
> +{
> +       if (CONFIG_EARLY_CYCLES_KHZ)
> +               /*
> +                * Note: the multiply must precede the division to avoid
> +                * truncation and loss of resolution
> +                * Don't use fancier MULT/SHIFT math here.  Since this is
> +                * static, the compiler can optimize the math operations.
> +                */
> +               return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;

Still, this contains a 64-by-32 division, so let's see how this works
out on 32-bit (RISCV_TIMER is set on rv32!).  If the compiler would
generate a function call to a libgcc helper, you will have to switch
to the mul_u64_u32_div() helper...

> +       return 0;
> +}
> +#else
> +static inline u64 early_times_ns(void)
> +{
> +       return 0;
> +}
> +#endif
> +
> +#endif /* _EARLY_TIMES_H */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
