Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D738C43D
	for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776258399; cv=pass; b=rcmVEHjwrPBrIHUCRiwXFR3UakcQk9h91zYdH61XVaQmeeoF85ohkXUmdUAZgpBAluTmynfr4jzB0cAy57b2D8ci7XEYGbPeCfxnYmlyr15wO8fFwEl9reK+XLVCjK6+5daOpN92zEebnWentJbrrobXt/sRcpz+lm8C9fk2jdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776258399; c=relaxed/simple;
	bh=zMnSctsuBo5PflxphPiQFV3aLOZYAxXRaO0heKXfx9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s8lHavbvN5JE85aNItFHxC3+v75ZIsBZLRczyu+OSBkfF9swJF7qiCoHrnWOIu0coFl7RJR/92upz7S9DiIxTMszYQNkvOVnGqFkZ1Aw+fOIPryI5QBNZO3nixvsE0ptAw2n6CEXklwMKQVKNVSW5KjunvRML3499A8WBFqYi3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULeBgj1f; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULeBgj1f"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-797ab169454so93839927b3.3
        for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 06:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776258397; cv=none;
        d=google.com; s=arc-20240605;
        b=kC1u9srYRBHYxQYds5DKQCDUBcrQ4oR6i53U8XtOikhftaUHurqZ02xHJGJnntPskF
         jxtu7C+5hKMKHMniaDb6+ssMOBkw8l4EyrPG53f/KKInD5cupGvMEqV2CwOBVeOzB8oA
         N2//diW4e2CvA3PJrczPFHV+XJd4HWiT2iZu7posxHGGuCg7rwzEQS6+5RRqN9on0uU0
         0qL+KB9Lh+3ymupnITeeytIHS9ZTjkZwk97WOuEXrRiFZUGs41VVh8qFmbafD/SOuOMa
         Tw9P6UJfwSxmMwoV9yJRJYT2B26POXJR5p9xhPGxdEfGFQp71Lm7I/NAqvgWEPqoj9F3
         Pqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DNMNXpGiuY4UvdJjUZeMcSt6+Srv3yVtmg2Q12Wmjqw=;
        fh=KixHH5llxrVq//hoieYSaHdtjSkZjoyoqlRZStORHlE=;
        b=QY6m+rM73QOnS9M+OX1nEa1MqGTpPnrAbjyoP5C8Cx81HnbBC3ABHS0ELkBXsDD1Wj
         elwI91y+zee4hwsTVIO6j5GzVwF6XP75gefmg/i/sz0y66vgf3hBSAUmPgJpxk5senI3
         oPLSXCxBKNN8gRH+i1Bt2JlXXW1KWIeladXYJAYtYfsTGJP+qD14yRiaYyJLpcLLL3w1
         gE6Cbrn4UWHTZgZ5pq0bnFwVyYxqjpERj3yiC86neuu6X4jdvjFllQZg7PyjsV0l3tNm
         sa0B+e10/1qPBn3Dwri5UCghYtHILU3O2HnNrn5bYErCXSSls6TM3Mu+Xo3AToi0k/ir
         0mrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776258397; x=1776863197; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DNMNXpGiuY4UvdJjUZeMcSt6+Srv3yVtmg2Q12Wmjqw=;
        b=ULeBgj1fWjQiV7kP4tgR1Thh9pqo3SbVjkmNPanQ1kn++keI4nrMhuh05zJbXaZ75P
         MY8lTQ52Uk6W0fJyNhro68lVbd42qqempw4BCLlUu6Farj2p2Al3YFNhTTQVol5n8yUS
         l3FASDhiUjEVsf/te4NtgCIVj2Rd21nqtuPU6V45xNbuBcmc0pXySOkgBGxOdO38QiY6
         B0owJy0OshzilMU9j9CQa0dhtw3uQMCrFXN+ZQkFvT04NQ4Ml9FGeNSmFwu71MOn8HfH
         y/3vrSCr+UWKhrRV8Y0ylLjnjeUiMliZsGDUf7dta8eXrtSs5lGyv7UVkPfkYcw0/9sk
         fjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258397; x=1776863197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNMNXpGiuY4UvdJjUZeMcSt6+Srv3yVtmg2Q12Wmjqw=;
        b=BYfT9ifuOVz4vGDv4a1Wh509bUAf4DyRm1ZMGMZGDpkXJbgeTIqV708QVEUPqomuJ+
         phuXHJMylb6g0uIUWDetS8jGTUoh0rylr0fD37jWMYqiDf/UmaaLnZJmFK4fpQZKTAdN
         5cuGPLaiIZ+vP1fOkZtazacz6rT0u/mb6IdNwVS+yhjphftNXFUiE+m3Hp3FQ8cfWsC9
         kdFBvApfJ6uEdCtuImLjbUV/ccH5YruKH/nyJ0QzkpAalnzUdlgAGw4iuahXOns13qJF
         fR/y8iEt6VAcSLOTvryvjTsfGFr+PaPkL3KI5kkjW63eMCMSxIzbkbLXfZ/atlkcNyJX
         zddA==
X-Forwarded-Encrypted: i=1; AFNElJ84uj6OgBJRFhq7J9T5yLw3bSO8ZQwJqD3GxwIesldi39P8Q/gkvoFnLzyNdnXpKfQdj7l7UH6bSzwv7yMvcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZW30QBLatL63qUdGEkenY0b/jG4pZ9iuBBwc/Md/jmaPL4N88
	OoevB9aqN/5BQ5eLpevpczAyZcNBCx0PjkWuZwVp9tDIr1s1fD9LI6uJRsI/qVEyzcOg5tHJT+B
	Vvjguy2039mJnpCPEHHKVtHiRuP366J0BybMAFg==
X-Gm-Gg: AeBDievkxR8/oAz3qWyn1aNPN0SsK9/2sm3G/RvFlaBzqzQdg6iOU4nAAd8IlRHZWiN
	3MF6wNIGVy5ZKRm5FXIXDRCXZdN02xTb4QD1ga8+J5DxI2zYUEgOMUo+/ofaD8FWPwx1aIbAHpj
	wQhG3XqE2fuSk0kN88WuBRJ8AdGoE2mQ+NDciNUI4eXS5YdMMSt0APeXDKcCHivVSPy6Kv/TSf8
	MWPow0uuPrcm3Hvi/a2o9NPyGi3rG3rYgeGwPhPITXbLVEV9Ctz9v/P56+a32zVEFJ/jSo7du2t
	I6aTmMGNkXF7E/UaTLleaY6eGCQi007EuCs76yvv14ywKyxjAtrCiObNMVqPu+Svh17QuZlg94w
	TO+pznkVI
X-Received: by 2002:a05:690c:6893:b0:7b8:21ff:e2d8 with SMTP id
 00721157ae682-7b822000660mr4616727b3.22.1776258397557; Wed, 15 Apr 2026
 06:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <CAJGKYO7-9t=KMN4=jARMHhO7gWSSaphDuwqRha0TAhOtUdXuQQ@mail.gmail.com>
In-Reply-To: <CAJGKYO7-9t=KMN4=jARMHhO7gWSSaphDuwqRha0TAhOtUdXuQQ@mail.gmail.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Wed, 15 Apr 2026 15:06:00 +0200
X-Gm-Features: AQROBzAKxgqnQqlFazL4zR_6OraiWC0ptQyyPpLpgB9BpSjD2d6gVHzfQvTi6vU
Message-ID: <CAJGKYO5oCRcRbfVgoH=t4d2LQXCtN4tuJ35FTT=-esxwpFDKnA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Thomas Gleixner <tglx@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Follow up V5 integrated into kdev: uChaos supports _USE_RAW_CYCLES in
new v0.6.5:

~> https://github.com/robang74/uchaosys/commit/e48de8f

[    0.183957] Linux version 5.15.202 (roberto@x280) (x86_64-linux-musl-gcc
               (GCC) 14.3.0, GNU ld (GNU Binutils) 2.44) #1 Wed A6
[    0.183969] Command line: HOST=x86_64 root=/dev/ram0 init=/init
               console=ttyS0,115200n8 net.ifnames=0 nokaslr
[    0.183972] KERNEL supported cpus:
[    0.183973]   Intel GenuineIntel
[    0.183975]   AMD AuthenticAMD
[    0.184138] BIOS-provided physical RAM map:
[    0.184140] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.184144] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.184147] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.184149] BIOS-e820: [mem 0x0000000000100000-0x0000000001fdefff] usable
[    0.184152] BIOS-e820: [mem 0x0000000001fdf000-0x0000000001ffffff] reserved
[    0.184154] BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
[    0.184157] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.184159] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    0.184161] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.184207] NX (Execute Disable) protection: active
[    0.184214] Hypervisor detected: KVM
[    0.184218] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.184241] kvm-clock: cpu 0, msr bac001, primary cpu clock
--------- time skew here ---------
[    0.000001] kvm-clock: using sched offset of 55985760 cycles
[    0.000003] clocksource: kvm-clock: mask: 0xffffffffffffffff
               max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.000005] tsc: Detected 1896.002 MHz processor
[    0.000324] last_pfn = 0x1fdf max_arch_pfn = 0x400000000
[............]
[    0.235538] uchaos: Init mts 4096B access x7 times: 115 < 196.3 > 594 uP

without _USE_RAW_CYCLES:

[    0.245907] uchaos: Init mts 4096B access x7 times: 64 < 134.4 > 322 uS

Cheers,
-- 
Roberto A. Foglietta
+49.176.274.75.661
+39.349.33.30.697
