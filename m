Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AD38F95D
	for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290286; cv=pass; b=oup0c4z9qKGIrc4Jg5ngNvfTvwGTm58eTOLgaJiNFnGiQO9OHRxlxdmETUASTnHkLUhnluQ2T1nD+XqopDYSITZ8nt78a1Mr3Cvep8809ytEY+YVLmFZLOQIxgzEmz+G9XYxmsw4ujACruYnBo1QInyB8AQd4LM9Uq/ab6hai+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290286; c=relaxed/simple;
	bh=oT1WpmQj/cBlx/OvucYsswCvvrwkb0/OOkzXrCRqlrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6T1W/X75eB8Gt1XIb+eG7H77uNMOzVhH/hhmTtxLSEz4SISyu1LGsaUPfdVYlfEjC6oPk+850/hnFBgP+wecCMLNdmZk6spuiL5t2Uz9+dLUCa5IP3bz3bXZGAtlp8Mm/+iDWpVrB5COSmASbOrxif9yNOAzUu/UsGcybQXyGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGzmQVSB; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGzmQVSB"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79ab3e26cceso71952367b3.3
        for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 14:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776290284; cv=none;
        d=google.com; s=arc-20240605;
        b=DMFzUFamztapINZbxmgXLPvArKsfr1A8XdFhqu9P1NpRXnn5HoRrLVd6MF4h2KOQHs
         9O35UVtuO3u8rZ8i7mI3lriAxdywIdCZBiYt2Pp5UaZs7YBggfhpe7C05vbhRq3oq0iG
         7o9+pjKG+O6/pZ7DrtQT9Y8gje4UI9gt1xW6ZkTSujU91hroIRvYuqx51rNVtKOe/hk0
         +uG1s21VAFutAZ1+17C8FNCQAQKaGwCnuK3IKxgDVQESBFVsgzZ5T1j3HOeoBDUPRiB3
         a8tCqiUaLxM/6o+0n/rINK7J1UeXGC0IH0gzt8b0D2S8nLkgDstQ1kgrqoX6zOUUwQoO
         BQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oT1WpmQj/cBlx/OvucYsswCvvrwkb0/OOkzXrCRqlrI=;
        fh=HTg9loss1sUnEJoDgPCOUHGflNwDBCTfy1NCu7L1cbc=;
        b=QBqcuD930s8QE+4bl/ZdJpZdHlvsqIX5hZRnsGgIf5G3Ffym76V6OyeTrpDEiCypuz
         yqCfcIoOoJv3QJVqcgWAOahyDYpi1TB+OAksaxGG0ZuBNIN4w8BybBzppw2WJPNBnAgg
         r73xoedwlBN8A/+WQxjkqC0aJxcpSbJ6SEqxuwXHIVgc8k/7bMB/Of6sGbER02DjSVtW
         0OO+5wtmPUyMpcupJqnI4XjVNRsIb9Hr6U0r6WYJss3Gk/PCIff09nPbnTeqZf3zf1uN
         FWD1CZxPntRMbskxlaoONog+g4NJYfQXPZ5Z+BxkINqTn5uX9nhlV6WkjAFqpDSR9Ez/
         yB6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776290284; x=1776895084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oT1WpmQj/cBlx/OvucYsswCvvrwkb0/OOkzXrCRqlrI=;
        b=DGzmQVSBcGcaTK07SrYZVvafuemx/7SYJSJUwH0pGIKA874dr6QXqQPhysIDwfJgto
         kbrg4QmRg98gjfhSKfHjuBlem/U4ArhHbnttEMUri04O6AqfN9hvRuBs8/Zbzf9sgZUS
         2VRjzxscfru7srTXkLMoTuyqP2611qg24BuDY05lf3mksx/HCMlqx6A/OtfQdy/mBYkb
         r/mWXFLfQtnL4BePlpAycFi5EOCArTv80AeCppoW6T0rTtCpsggk5Zkw7TV7oiEVqfIH
         lR1QoQMJBATsvbiSvsCWZwiOeHSQmuw5eaPA/ECVWQRUrggxDue7fnDWgQu+YyYW4PSO
         9YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776290284; x=1776895084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oT1WpmQj/cBlx/OvucYsswCvvrwkb0/OOkzXrCRqlrI=;
        b=HcyubiFnj5AGZwXrA7Z4ChLuEeiJZS+LiDFAqoDIWhf/EzDx+y8su15XJ1Nf8zsaCo
         6zOxizZlLhk36+OCeUJkb31gsCMv020lxEhLZB3i7HOokdC1b206Rwa73PlaRWawNVuj
         y2h//R4X8g4bzdDsL7/EKnbddIa/4pGvNxLI7yuIzAcuhHDtVCx9IMGWj2kp/i0enDiu
         I2UOaFqvea/pE1wWWwM4h0eZ/pU3F37vp+VpZvYD5kqGRBEhZbZmCr7YaKg/xe9HK1or
         LpSwsbUhAEzeuU3eeVT0N77QKiKQMJKE+hr/Dx+4SlyxZn1Mepcwp7HYfow2xK7Qe47m
         cdmw==
X-Forwarded-Encrypted: i=1; AFNElJ+dwPutW8Bah6FUTX9XnKdsFKwnUzXUy/NX87awO/RyNe4G2KH3hKWXkyQmVCokNqvD2bzgEZo9L+b50B/+JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPWHxLR7c95b0/xp3QvAm1dn/ViIr/6UCFkhhKkfaZOaW036qT
	CPpX7HmDxTdWGBdvk+8ZOrK4ssFJE5y+bTPvWb1Ly/ODzb2dPMZbozWzZrghUq+QHXo3zRLj2TS
	REzjtfFSTR7rFA/NIwyk/NYg+nb6o3A==
X-Gm-Gg: AeBDietRuu3bQE+OOGLQWm7HU0bSPNGQ95K5ChUhMCOzormUJmBPnPPWMwAuyrC7Ige
	AT7AQoV/Q2ghMEJtFi3c3xFyV/AzhJXmg83RdNdGO4Zq4kJOL62khl2ToA1sZZdrY/fVcB9FeTH
	dB9v1dbfmLqUrzVQGuw6q4CK9FcVfElsN9B5j6OuR5Abu94A0Q78NGsL5PieVLb6TLYXUlC2Bhx
	GdrG+9Nmo/Q13w6AIrVzpMEdk759FwjjVkJ3uuUSnv/brlhW1YFhnk1nO6c+GBk6N0K0liJhQZU
	EpdtAtUmFYgNUwibmKrbgMG8BN9thhQS2h2YXVjSp5L9Kp/HWrwDM+QrZfJWNfOucx3Ighs0+Wa
	IW72+orS9iA==
X-Received: by 2002:a05:690c:d92:b0:79e:ce16:38b with SMTP id
 00721157ae682-7af6f327154mr267659677b3.4.1776290284000; Wed, 15 Apr 2026
 14:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <87bjfjap37.ffs@tglx>
In-Reply-To: <87bjfjap37.ffs@tglx>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Wed, 15 Apr 2026 23:57:25 +0200
X-Gm-Features: AQROBzD9h7qHrb8XbuoTqdj4eQlOfAeF_dplRQ24wQW4ZsgRTXUcD4qI-BtlDVw
Message-ID: <CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Thomas Gleixner <tglx@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 23:30, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Wed, Apr 15 2026 at 02:19, Roberto A. Foglietta wrote:
> > While keeping architectures separate is for abstraction layer best
> > practice, in very specific cases abstraction can be a meaningless
> > concept or much less important than having a single file for a single
> > feature (the complementary way of organising stuff). Because in Linux
> > the abstraction layer approach applies for architectures, the gap
> > between aesthetic and a specific case like an early boot macros set
> > hack for debugging is to clarify the exception from the general rule
> > in the header itself.
>
> Please spare me this AI bullsh*t.
>
> There is absolutely ZERO justification for this at all. End of story.
>

V5

A single file with the essential for hacking the early boot,
activatable by debug export menuconfig, an #include "locale.h" in the
same folder in which printk.c lives and when the developer did every
insanity to make things work, rm -f $file and push all. No one in
production nor users will complain that there is a Kconfig debug
expert feature potentially broken. No one among kernel janitors will
need to care about an isolated file in which the whole future changes
acceptable are extending the framework to another architecture
maintaining the essential simplicity of reading a register protected
by a fence to grant WHEN it would be read.

! AI bullsh*t.

Beware of activating debug expert options, crying isn't allowed in
adulthood... What you call bullshit is simplicity for both the worlds.
The speed at which I am writing about things you cannot compute as
fast as I can write, has nothing to do with AI. Try to compile your
metacognition.ko with -O2 option instead of -xxs... LOL (yes this last
paragraph is a bullsh*t, so we can have a comparison between the
prototype and the instance of the BS class/template LOLx2).

Best regards, R-
