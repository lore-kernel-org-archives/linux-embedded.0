Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB167384234
	for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776329052; cv=none; b=pdcADuFS39Lf/81PQhdI5XxlrwF9T1+ZIseIkZDtD+bG2sco72tPMuWuc/kDlIxxBgJvQgni+CweGs6wEkIrPH2Y5ZupXoWVkXGpY/vRmMvSXdqtabcS714x/aKzYpEtGNyw9j8kJXccqMiI5Pd/i88UUFFP5ZU6MkWhwFqivA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776329052; c=relaxed/simple;
	bh=0kmpofnOdFJVayV18Ccn9rlnjZidgzSWK63hLP6DPCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaoQ55WmusKMgJSPgbAX/1rMCO3cF4w2yaSatnn7RTfp7oG7ZOAqBROL7DEeez8hrx38QfZeYNpo06oMDMTjLcUmO3CWZ39ltTDK5r0m08QFaUu/q/sQAlQTrZXlOH7tJMOeHu8vtsCiu5J9Fm90Sz0ptgF/Eiqt46UzIAbKyJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-612d8a59ca0so970223137.1
        for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 01:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776329050; x=1776933850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMH0C8DG4FH0+fS1pb5wAjONn3HAEZk5WF601QLZvWw=;
        b=BoCRkTUKJZhvrcERxFkF/GZ5fgb0t3EIQFOV+j8lGltqlyHiaazsf/etl0UIR4ZgiL
         xLlkqenR22EUZtShsiIUR+GNT6dJ3fq9rju1f15MQLrSjLdWWxT3u1UIJEw2lwE0umUR
         dYypj0R0NrTe7g+3ljYjonmF9EbsdjHlbxGxRFhLYXEeEcHI9SuZLO3PR5HFQ/W6/WlP
         4ooFkPxAv8GvLEP3HBaMWP9nI0qkft/75pfAtLFv7tzE73dwvg/p9iT28qdfDQTzWD+P
         bZRXsI8p6jA7DZeFwd4dJD6lXNkNZD3I+KKuE+fAKqC4j7BOUCTWoTCyLeFOlcG84Yyk
         uUIA==
X-Forwarded-Encrypted: i=1; AFNElJ/2enGVxyWrYMwcV/+oZjHUkONzowehXTsK+qAcuqOTJtctHdR+ptRiqoduSHsHyx9J2RVicZiih2G/r7IEmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydFp2g8uYi8U9KsXd+grsGqfdrpwniYOBeNYM1tFII07pxWuF0
	4C53F+7k2X0470k7oAHyx2bUY053ZO7mpmtOITg87TG1RLJyQe+ntpLLTzICRDgm
X-Gm-Gg: AeBDietFvlZ+7r0O2jJPcHPVb+ldS6qJC8/zzkx6/7mAHm6NNXkAiRKg9YBFS6OosCz
	RW1rkf4hKmRoNeWgUbU1xGkKfg3EA3cGsa/dx/sLMs/cgXmkaZBiKj/vfkaH14iRmdujb8X7m//
	lXsz9vq1mvUuK2JFOIBJPDBZqRn0QOokxWFqp9bmt3JNYbxaYGUyaJdb2WvflcgpOxheuvpBNRk
	EQPUzGHTKP0L1ipxl/XPrvEDH+c3/w1ZnlIJlPU6LVyPNrlNI4kZETff1IsbQYdRvxa0iWexHaM
	spVif2wQQfx8y3CYvWcNWNHKpX1REVo+6h+p5gtBpT5fMT1AkCO/Lg4JPZILOm5oY8kRmE20atp
	VFat2gV2mGFJw2mqM+OdY6+hIdNFf/I7i7hII2UWnMozC1jB/m8JazMnwve7ccgJXiK9dvy0PaV
	htE9G1EEMprTRuRVBxBhRJxtjJGOPAgpQKr9uHb8WlNEX05qBtIvxTHuXCGEU8RAj4W1Syw/s=
X-Received: by 2002:a05:6102:38d1:b0:607:4fe2:d3e1 with SMTP id ada2fe7eead31-609ff7d06ecmr13201318137.13.1776329049615;
        Thu, 16 Apr 2026 01:44:09 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612cf7fe3d9sm1998724137.11.2026.04.16.01.44.08
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:44:08 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6102bac3752so2832784137.3
        for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 01:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8wo/ZkFBakpl6hFfwVtqU4bSfkZoalkFFILYJtcMajerjXKjba2byhobXjLNgFnG7s9ikG0DwMsKl/gec9qA==@vger.kernel.org
X-Received: by 2002:a67:e70d:0:b0:603:1a8a:c84a with SMTP id
 ada2fe7eead31-609fecb952fmr12890892137.2.1776329048105; Thu, 16 Apr 2026
 01:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <87bjfjap37.ffs@tglx> <CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
 <CAJGKYO4PatnJLPVuwp730hEEqsMCEAravO-cS6xyenMNJEsXtQ@mail.gmail.com>
 <MW5PR13MB563296D757735B5B84336781FD222@MW5PR13MB5632.namprd13.prod.outlook.com>
 <CAJGKYO5TotaDTPYP5Ddoy9cgi2L8emFrNxdxyJNZ_UZm=jfWLA@mail.gmail.com> <CAJGKYO7==hZ3OnRNuG81j6rxH3y1gK8qB-orxxrDsc4pNFv=hQ@mail.gmail.com>
In-Reply-To: <CAJGKYO7==hZ3OnRNuG81j6rxH3y1gK8qB-orxxrDsc4pNFv=hQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 10:43:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUW1CGpR3k8UCCGLdoEBgxpHz5=sgMGOB0E4FNmA94MiA@mail.gmail.com>
X-Gm-Features: AQROBzANljFASVu9ZJUeCVUXWv9tYb3J0e8roYUG4qEVoh4QLYpv5O1e5fejSBY
Message-ID: <CAMuHMdUW1CGpR3k8UCCGLdoEBgxpHz5=sgMGOB0E4FNmA94MiA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, Thomas Gleixner <tglx@kernel.org>, 
	"pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <david.laight.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Roberto,

On Thu, 16 Apr 2026 at 10:25, Roberto A. Foglietta
<roberto.foglietta@gmail.com> wrote:
> In attachment the V6 of the patch, and these are the changes since Tim
> proposed it:

Please no attachments, as it makes it much harder to read the patch,
and comment on it:

https://elixir.bootlin.com/linux/v7.0/source/Documentation/process/submitting-patches.rst#L278

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
