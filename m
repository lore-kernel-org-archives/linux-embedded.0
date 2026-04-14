Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787C3C9EE8
	for <linux-embedded@vger.kernel.org>; Tue, 14 Apr 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160322; cv=pass; b=oA+WYmbM0i++8wlJZj4k5ppyeCpsCOEpwWXlbNl4ML8eUYp2zoUm/Ts64FuUwO5Cs93vQngahxvXYQ04dOtwGxQLP6c1AZFlubE33ZrSygsTFhKALdbrsieJzKFqs4rNeUstRdvl6YlXTPFot46WUCvhbF4O0Rq2JTimveYXksE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160322; c=relaxed/simple;
	bh=UArZKnXH8dXqBwEgJCy44P8+M2nfrsmjyHeKxOcsBgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNvWI2GqxQ2O0V6XL6JpXdyl6zXnE3R96B9rBk+cjv+v6xcNRm8/8GPcFN9PPPjmXeip1MpqsYLUG+2z0fNyM+ZeBbTKABKPBxmzQVTYYB+C5vftbMQhuutwnCXIUOXcYtL1+GnK9qdAYvgfLP86OPerLiT413cI6VUvtGCQqeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUcLEKwQ; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUcLEKwQ"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64d5a7926cfso4920041d50.2
        for <linux-embedded@vger.kernel.org>; Tue, 14 Apr 2026 02:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776160319; cv=none;
        d=google.com; s=arc-20240605;
        b=IOPXT1rzy3qvrZmmtjihm90TbCmH5oNGgqDsp7pDUMpjIA9HyLuOu9QLG2oIyhw1oq
         duReQYxZ8LH213vk+sTBuVLHO0IlfJ9xkAe2mpdwJpKctRCJBGDudb0OekJUEsx8hWHX
         Ei3eTlfiCTiHo/r+WSIl3JTM1huIVxAXKdZ76MIer0pG3Xcy4A2DrJ3f4pG9hPUK7JQM
         boKNFtXrnhL7iDgBAwxRUMXscc6M3gdiGtnMQpUG//Kc5JYdfakm2Y9UX/ckCiI1uul+
         mla/VK7EqN3ASkarQvRBRzkfU1uqCPSiQ1+Qc5sFGmjh+et9rzAlyRO9Q8FwEbK2xuD5
         GW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GXw2T2r1CLJpL7yNsNWVHK3i8Hcwa0u1MvmnpkhzXjY=;
        fh=zXzTjsO6rDYTXFYr/ad27hOkp9KIOsAYDyqVkLf8QxE=;
        b=L90TJWJIPtIdQUIysu5uiVjRJK2VT+Ee+k59Jsjx0OtQvXV9s9NzFjH7rdyOO8Ymca
         yegCtz7aqVi4xp/OJMhFpFErY57eJyBoixE1LZolKQTj4cUEbUphXQHEi8aKE/Tf9Zlj
         bvtE7yA60KA9ozMEsv45siq0WkiuNBhqsvaln61ijmgD6B6YKr46lN2d07llPLitre/w
         3Ux3xeJf0ThThxEa9d5QDfl54Hy1V6hOUne2seG2fS9lpcCigXtOZmjwczsuYBO0R45X
         RK36NKloxuIp+eZFCa2gUyqIxphVB1z5Yh0JrMvGn0vYBYuW5pevvRPoCPXOjmxsNGrm
         VY0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160319; x=1776765119; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GXw2T2r1CLJpL7yNsNWVHK3i8Hcwa0u1MvmnpkhzXjY=;
        b=jUcLEKwQwLva4rCwvNuejzgWfiXHxK0MsQyLTH6+jSLPTLM2RzdDvfsGJn9DtqYh9Z
         w5cPzvJDWstJO3qU5FA7NNH/sPeKIoIrXCI85lxr/CGXVgHz+0THoWMw3k8wOQ7y4mEm
         G8AD6LrsHj0luPZP8yNTpQYyHb/pxi4C5Asy7tixZw3FdqTXDX4dGBlnR/0M3fupywq1
         K+Xqi1vCbbG264MNjJCc1uWN2SyVAyF1SovF4OQfScg0QsyBD6+79rifPhUsKWYladqj
         X0gl87tk2MIAR1x2w8QMjW2RauDLq7IcU86UdXRuN6E32m3CeQXPVyzMVN2sv1DbS28w
         JkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160319; x=1776765119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXw2T2r1CLJpL7yNsNWVHK3i8Hcwa0u1MvmnpkhzXjY=;
        b=Kjq3GWxSQUugKv+LnIwMqQ0zkICCciqyelf8t56jqgh60vSgh66M8hINBHje2/I0wv
         /8Xjn+Grn/kNCGAfluz2vP7D0aVeHYQXQamk0a9tq42SBLJTodS06ti3fmVCkcByNYHS
         3OztOB8L6dzZXILU4SHETjgEx37i4beZgpCSi9KuTVX7LH2QbPhT91Wz+gpssACVVtBF
         AGa+m3aJFjhDmOYyKxov1KuveTLPnKBIfALO3iyncQ4jpBQQn5/NAyLW5IvE4DXEKBGp
         MhWM9YbJ3j6ex0i2UGMtIC7cWt3wqmfjfCROVtGOfWCIPgZCpxyRmZOgj0qu1Fn7TgGd
         gXMw==
X-Forwarded-Encrypted: i=1; AFNElJ8OxkZldXOhuxBkoo5IW/13Y1Sr0heyHzjC/z36yUdypwmel7Hkjr9todae1xpGB879Gz1QN+gkSL47GWTGHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFm4iAY5NzF6GofTLSFj7PG3XoJHkb1QeM6LwkedhpgQPLQcq
	JAihxeuyBYI5og5laQatp7qsVyibCkK25Ur4gGkJHT6mn8nPAo50/aZVYQx5HtQ1QL+bCSRa2kK
	cCPVn0nN1PvRPk4PaLgx4EerSmmazyw==
X-Gm-Gg: AeBDietf3v+1hUcpXQtV9FRLaJV8gK3v1UG3gn66cpALlUL4ShXwQgvIdrL6W4gnaTa
	0hkV8qHSBIaJiBVVcsYahkqEbqZ8h+lWrJy3d/dRNpN4kzLB/NEuKzF5j6nYPcd0abVKNPNLHKA
	+kWu5FCd57uJCQVl2Q8jtl2tCuDsqAjqxYUm1+dKFABIEUIuzFXnLDdsh/wRbaeTjrSL6ddDFkn
	cWtbvVT6xLITPb0K7T66ouWNyx3rgDiX4/YbhyxvFWUR/p9LULp7EYoPmX4tMpQOxyQ5EujG5ot
	e8+jwuF0dpaONRhRx/7b7p4AArEwfIdw6r7ic0fjNNUCvuzLowe+xhcPkQncUUOywxda7pMzrMJ
	BSVc1ItJTAg0rrkswfw==
X-Received: by 2002:a05:690c:7681:b0:79f:eed5:ba44 with SMTP id
 00721157ae682-7af6f228d60mr140446497b3.2.1776160318762; Tue, 14 Apr 2026
 02:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <CAMuHMdX-jeO83JQQaQXkk2oFsFH=K_p8Nmta7s5J-_BgwF5KXQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX-jeO83JQQaQXkk2oFsFH=K_p8Nmta7s5J-_BgwF5KXQ@mail.gmail.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Tue, 14 Apr 2026 11:51:19 +0200
X-Gm-Features: AQROBzAFp1qUgdn9JSlZzespfyhpy1VNHRvD3OcJDE2XTDbNentfZCzs6xtttqs
Message-ID: <CAJGKYO5uosg=KiRuapEJM_cv-yxUu=dG9zF1r-=xtxfvRURwLg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	tglx@kernel.org, shashankbalaji02@gmail.com, linux-embedded@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 09:03, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Tim,
>
> Thanks for your patch!
>
> On Fri, 10 Apr 2026 at 22:38, Tim Bird <tim.bird@sony.com> wrote:
> > During early boot, printk timestamps are reported as zero before
> > kernel timekeeping starts (i.e. before time_init()).  This
...
> Won't it be hard to see where the discontinuity happens in some cases?
> Perhaps this can be made more obvious by not doing the time conversion
> in kernelspace, like in your first version?
>
> > Signed-off-by: Tim Bird <tim.bird@sony.com>
>
> > --- /dev/null
> > +++ b/include/linux/early_times.h
>
> > +/* returns a nanosecond value based on early cycles */
> > +static inline u64 early_times_ns(void)
> > +{
> > +       if (CONFIG_EARLY_CYCLES_KHZ)
> > +               /*
> > +                * Note: the multiply must precede the division to avoid
> > +                * truncation and loss of resolution
> > +                * Don't use fancier MULT/SHIFT math here.  Since this is
> > +                * static, the compiler can optimize the math operations.
> > +                */
> > +               return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
>
> Still, this contains a 64-by-32 division, so let's see how this works
> out on 32-bit (RISCV_TIMER is set on rv32!).  If the compiler would
> generate a function call to a libgcc helper, you will have to switch
> to the mul_u64_u32_div() helper...

Interesting.

https://github.com/robang74/uchaosys/blob/53e72d169/cnfg/printk-fix-early-boot-timestamps-patch-v4.txt#L92

Elvis the King (A?:), R-
