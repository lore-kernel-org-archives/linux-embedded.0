Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D4B3DA5C3
	for <linux-embedded@vger.kernel.org>; Tue, 31 Mar 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945047; cv=none; b=aW8lSl1EzjHZQK5NAyUbAk6poOdO+Q3ZipmI77rD2SXHB8BlU0Z9vlxiYhSilLdnNsgSuXyLQ37ZZ12S3R8G+/Pqq357aY1lhahtR0whrlHUEDWhBYRbGgQ18aGZJeXoR9V14rA4hpaG4if0vv2t0UBvyUsXuvXDig3g84UJ36Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945047; c=relaxed/simple;
	bh=oMJJcZyHHUrUUv+tbFHnC6JkWX46hfliJyceWu6k2Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoMAi0BkMkPSeeMBuWDuSg1apwh8jRlmCzXN/sUpoZ53na4uepsWg/XEIwZokJIA0+eEFchHZrCuGxwujeRV08pUYY7EV3UPATI2EF5S4K05ySp9o1ahHJCuPNLBEPUF0LCW+dDBgb0WmZ8i9uB5ziIEOtLLYMQotYZnGhVl7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5674d8be45eso1395420e0c.1
        for <linux-embedded@vger.kernel.org>; Tue, 31 Mar 2026 01:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945044; x=1775549844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4cb1ev6rsRvwVCEj/B4Q1bVb5H0yzf1rCbDLKCB+YE=;
        b=pUmhztEs1r7XBVBSKjjkxpLzBTrkeqT+zEljpyxX0x05dDbT5sfejuLVh1Bf9Ti8du
         hTJpO70UHmWRHtVVEvWEzNYwvdBaxrOWlMiGUxAanQ6mDYPez1ysToFWAg9dGNduuU4e
         xLwWJD1Ldio6Ogk7Uqdruh35oRLpgPysuM7tskEEGAGsO0Cos277PMz1UCsoFudubHg+
         0+ml0rY/a0S/C+NgG7sXnroPxesiYq+XdkT0c5jhmMmeTHLwy5/Cw1RtlvPKEDIrEJnh
         A2XN7xa74o2Q2y+M46ACYlS6eQXzqJrMzhX5Xo6qZLXMjLi9IDDQHVh8mSUhbRpDzvaR
         RapA==
X-Forwarded-Encrypted: i=1; AJvYcCV3fvbulztRPqNZy9opQeN+0flty428ONC9dYsONOkTtipOZewm3c9ASC3flYcvr4WbNIbJnQ37vLdFXPOD/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEoDB8HUH59X5GfdQorNDGJNDkdMU8KoH/7WBvhPUsNQ54I77
	miJMhTPFdPd76QX+H/wuwbUBlIjwCTFlTPMbOR94zKxivQmZNEipOdA/NrMJk0XF
X-Gm-Gg: ATEYQzxvONeNL64zm5cgKaWcdj9YRknPnIVGGP+Zg5wfcN/nYRn1jcRF7W//Y4bbAjZ
	r1ysQpCUqE4fQvAE0+P7QA4W8HJsUUGiQ5AvzC0hOqwEVBwiBCPufQBD1sj+ZOoWXIKVDzMo8Yv
	8OsrKhz11cgHQ4l9LorAyaxEuKucdWjj2gjrimy70d56yw4Fa7nznK/aSRUcPwUvoA545JW8dym
	4q4Rr/qkt3lLkNwjcsLGGHzA+H1zPnecXxHufqanlL1yTvn1EsQ5ODiT6ske5mhJYVf8Trutm66
	k3AKHtylrbIjCvuuQWzeM/XfF8aN3WSwxKp13scT+2QnNZmsjErCDg7/cnbr14Zo6l9UqMQIQKP
	/jUvbbDZRkJ3BwONK0jS1NiHkkkisITTF/1MJVafvjxOzRSVmTjoyaMmbecaZb1LYokIB2RzQ23
	5pNrIbsazTlcJMDQBB8MG9pztW+wmTGMLMM9b4HgxcRqv/SOIrQy6quzIj9JWX
X-Received: by 2002:a05:6122:65aa:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56d4a6652f0mr6245856e0c.16.1774945043962;
        Tue, 31 Mar 2026 01:17:23 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893cf2sm11316276e0c.4.2026.03.31.01.17.20
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:17:22 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-604fc147b7cso1335175137.2
        for <linux-embedded@vger.kernel.org>; Tue, 31 Mar 2026 01:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDIm1ScIevxiLoHtE+FyJHmJvj2lu9CudCI9eE0erAA8DMwk1LWEKRDnPwqjhYEZv8NksToHzJ7Oe7SJn67A==@vger.kernel.org
X-Received: by 2002:a05:6102:1497:b0:605:2ccf:49a3 with SMTP id
 ada2fe7eead31-6052ccf6f24mr2997889137.32.1774945040674; Tue, 31 Mar 2026
 01:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyuvboo2.ffs@tglx> <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Mar 2026 10:17:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjVjOaYBXsLNxXkZQXfYK5uUP8oHUhb1k6=rFKDh-5ZQ@mail.gmail.com>
X-Gm-Features: AQROBzA8M_C7a4NHkog7JvCynaSm_qea_e7K2dIkhR8d6pRNat530QybUG2DBC8
Message-ID: <CAMuHMdVjVjOaYBXsLNxXkZQXfYK5uUP8oHUhb1k6=rFKDh-5ZQ@mail.gmail.com>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Thomas Gleixner <tglx@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, 
	Shashank Balaji <shashankbalaji02@gmail.com>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, "francesco@valla.it" <francesco@valla.it>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi TIm,

On Mon, 30 Mar 2026 at 22:42, Bird, Tim <Tim.Bird@sony.com> wrote:
> > From: Thomas Gleixner <tglx@kernel.org>
> > > There are other approaches, but none really work early enough in the
> > > kernel boot to not be a pain.  The goal is to provide timing info
> > > before: timekeeping init, jiffies startup, and even CPU features
> > > determination,
> >
> > As I pointed out before that's wishful thinking:
> >
> >    You _cannot_ access a resource before it has been determined to be
> >    available.
> >
> > Period.
> >
> > It does not matter at all if _you_ know for sure that it is the case in
> > _your_ personal setup.
>
> I used get_cycles(), which has a check for availability in it, so the patch didn't
> access a resource before it was determined to be available.

Note that such a check is only available in the MIPS and x86 versions.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
