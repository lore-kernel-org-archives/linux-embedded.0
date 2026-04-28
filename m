Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0144BC97
	for <linux-embedded@vger.kernel.org>; Tue, 28 Apr 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382868; cv=none; b=J1FFOWFUikK0Pni0kigZ5Ecp5IMSa8KNmRt9CTD2yan6A1rXUydamRcsHhan9H2w1/ydDxsOJzuGDNE4LWA+6Lvs3ilx3ApVQoAe/QeTFuie4BxzRXNIijIsCGlnVNWEReKA27gHagB2T0nZJcmn387IpFa2EDZdOwsBzNN6MlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382868; c=relaxed/simple;
	bh=6mPvojtEV8h5nkh07ONuJatqhjP1SZ22Baf4efwp7AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arH1ZNCLZ9LQre0TUhmRi0XcwyL33r7kY0ZyUCimsz/9houtkHDZ0EveBsH5njIa9zvsP4RMJshy6Kn7Ci/NsCqOawb/yy0s3ESLJ2EglPVipnFCfnWIyzA+r7lYqxVaab2udYYvt9TCA6RHeSUOOvauXkKcuFZWSpL+vOnJoHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so19860588a12.2
        for <linux-embedded@vger.kernel.org>; Tue, 28 Apr 2026 06:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382865; x=1777987665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+KsHqKmBkAQ/+iWMDsOUlJS0XWCOTJvwpoY8wimL4M=;
        b=cFslCVJt+jCjCJYhRAS79HAxqQts1J6dRnsGGTIdDp+KW0EwEMHASA1hpq7j7pACQE
         0p1D3xA0Ru2tPKkD7H38j/3JsOLNg7cdFUFnOEuavS/yuljh3Lpx3l6z3kIutyAfqHCt
         WpQC27b/wybSzr6eQjh0yFPTXgGawFq9ZRrRqvlzyc4yobqQk1fP/7nEIKC6h2PJH2Oy
         uS/YRtkn94ByjULPqPTEFjhIPwKLt5gGNM+jxp2FJ4TnjeGKqCqwSokLp9h/wA9GMcPO
         sjOQHP2Nwe5HQKs/YQtraciD2ldddRHh194TMxgku6dDuAcMk81GUT+dTweNHFipxULH
         E05Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Oxfj0rRKX+sELWqD+IDTU3VR6YcbNxFOoluqyu4LGmuD/8PleruX21l7Xd5p3j1fvIyvP/aktQmMB6+6U/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDfGJI/AWw71GoetRiWuSbas36jwwGrnM9Mgvz1rcrL6R5l1hr
	IXftr14RLmuYOkIQUdkaV1yIeNMWxASwZMLRkLFc1kzij1VChDXxhFZlFv1a2Gp+x3I=
X-Gm-Gg: AeBDies01FM9Ycv8a8HoJuGOlTLOxPg3JuEWZTSZZREph7/dJApH/oue07N5PAI7KAR
	jnnVV7jCcAN2Y1k7UUd/B5Kfnt/dbKsGJLky7PmtAY1XCXc+BIAH5P+hfUL+oxIHkJMrMutu3kC
	yuHzBApPCAe6gspZ+Pp7rRD19ZGkg2tuEMTdkJPv7mcqpkd/aaGq/ApwxqjALz3Y+g7qJYN4+Fz
	tqahxM8qniThizjBakVw3aqzHNvYAWF/72BpWQ5luA1WhbkseApzp5ByNj9LBzYTJ/9AHFiS1kp
	JJscHD/XYENSS2awkdh5esl9XkdxDYAB3hyjFvAL3oVx7yxcNEnb9WK3+SVO6YVf994MpDh9iFE
	uCz3B9HJTv0z4lbCK5VRTmSjwqwjgUyfWXFjqgEdOXlIEtGxFZ74RsUMZbZxitwM10to02gjSR0
	dpjG/UX7Ei/yKtHBjiP/t9PybNOWW52bfn+F0nXmm8bDQtPTke7EZ+c+FG6YmWtT0ZVrYueGk=
X-Received: by 2002:a17:907:3f12:b0:baa:a29f:64a0 with SMTP id a640c23a62f3a-bb804c31b7dmr185474866b.33.1777382865290;
        Tue, 28 Apr 2026 06:27:45 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80902237csm106621666b.24.2026.04.28.06.27.44
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:27:44 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b886fc047d5so2044247266b.3
        for <linux-embedded@vger.kernel.org>; Tue, 28 Apr 2026 06:27:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/2aROhTrWRuEAfli98MAhUS7ACUPYvzn4qqT9E7cl68LYcVOurOUAC9IOn8YPHNz8x1jygjPjrzs7+D2TxKg==@vger.kernel.org
X-Received: by 2002:a17:907:8745:b0:ba7:670b:f076 with SMTP id
 a640c23a62f3a-bb8020c9f60mr204676966b.2.1777382864665; Tue, 28 Apr 2026
 06:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <CALqELGz3qJ=KtDmBHMRP4NMSmmeZGKxk6SpTCQGcvGru5Dn0SA@mail.gmail.com>
 <MW5PR13MB56327ABDE42B1CB0D02B8D5BFD372@MW5PR13MB5632.namprd13.prod.outlook.com>
 <CALqELGx+8=honboz+_dRP8tX2ngnquQhizxNg5J+yVwa_YgUhQ@mail.gmail.com>
In-Reply-To: <CALqELGx+8=honboz+_dRP8tX2ngnquQhizxNg5J+yVwa_YgUhQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:27:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCyNO6p9C20hfDkezA2wm3yU8xaxaNOZ2JiXtGL71MmQ@mail.gmail.com>
X-Gm-Features: AVHnY4IU3_J6HhyfglRXW9VKqvQdh1Gaw6ixS3yY7lGKHO4zpt5BeiILtKpuj7w
Message-ID: <CAMuHMdWCyNO6p9C20hfDkezA2wm3yU8xaxaNOZ2JiXtGL71MmQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, "pmladek@suse.com" <pmladek@suse.com>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"tglx@kernel.org" <tglx@kernel.org>, "shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Tue, 28 Apr 2026 at 13:17, Andrew Murray
<amurray@thegoodpenguin.co.uk> wrote:
> I've tested this on my PocketBeagle2...

> That shows nearly a second of boot time prior to timestamps. In this
> case it's due to a slow console as it's using earlycon
> ("earlycon=ns16550a,mmio32,0x02860000"), without that I get:

"earlycon" (no parameters) should be sufficient, once you have
added the missing serial console speed to chosen/stdout-path in
arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts.

BeaglePlay already has it:
https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts#L44

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
