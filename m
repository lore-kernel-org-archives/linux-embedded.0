Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36565476684
	for <linux-embedded@vger.kernel.org>; Fri,  2 Oct 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937117; cv=pass; b=VlSKpWF6wR8xY8//74/r1yhfXVB4ywuquzJUVo6wD4czhfZb+YpE5a2HvajV49dzn4dR0Dr7hjiX/havoMMem96nehL+rNli/ZzHbrSrnyQfJlI+ZgEUPrmjLFVDcuTVfGrpwpNtCiQzVcrxcQAcE+frMJWL10C3vg+Dj7ts/k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937117; c=relaxed/simple;
	bh=sa6cF+phhWeD9Aoo8fTq1BNxnw8+Twhmjz3xClhMO9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYHv79RwEfaQGIIHVrfZ1Vely5iZ573xNcgQgCTlhI3274SKmkD9S2PYzjfbe4fiLr51Vjo87vTT4at6WN2GH3cm0+aoFuLAv7sIgOAmmmZjNuK+JJIdRgBv1Rbv2Qky7u82UNUWbZiahKuVyk73Jc2rmuSdZe8fDdAVftJSM7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mErxwQfK; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mErxwQfK"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ad795d5205so3859110a12.0
        for <linux-embedded@vger.kernel.org>; Fri, 02 Oct 2026 03:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790937109; cv=none;
        d=google.com; s=arc-20260327;
        b=MKzcSxV+x9AgoK4bcdDGwqy+kVf3XukPXBiSxVoJ9FvZa/55LDOhk6xUaT9/eWQLEI
         UZraC6/yMOUC3osGM+VjuZT0J8GdT7p3NMPvhBaZDwCrNUVuWhN7qdCoxdOnMw/7RK9g
         dp3qUkCWFZ3zMfj+BvBcYP4LVqy2dQmKqZTeVIhOweJJbKwrOraJBX/F5vhXrNnNKs8+
         0Uqsm2Vhm5KxLdq819VgFqIPtyfnoq0NIDDKrg+RsmOMLxnYamXFjKc3xMLqGvsA0Lby
         QzVcBVHE3GOzGQqxFQRJDHSU9Yjvq1iYrEBdGe1s8vHYaYWEcIkSy72nfbyr+MJdhXHB
         z+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=64r7ulkEn38K4zwS5C600ZIxGpt8NqYtlKiQJ/l1vMU=;
        fh=YMxcia2qHAOmOdPS2uxd8EsEk+rA5pzlBdQ3byceA5I=;
        b=ezLsFy8GGo4xCjYsnlyqO5LMDl9/uPb3uWfrjoEeNtS4u2FsH/w2EDbDO9wf0stgW8
         bfzm8b/VeiE9YfXuuZpqLeltBiuu5aej8lazfD4OGNafJoPDIKiVcrgaDplg9RjH7b9Y
         6H2B9wEG+zpB3+HnnMczYCx+LnHaAB7y4kASVCNxpYeNYckdTwka0tFIGSJBrr+8lwin
         lgu3x2tNROiOWeXEHt/l/hqWWu66qXInflRkKXlhGqJdLO13BGORd9NO/t+pZ5RFF8p+
         bGJ42h7Dwt4YsGWMAzyH2CL9vpTypZrFluIcWLqNDEaJo6BMxBMdwNguXePuIjHgsALl
         oifw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790937109; x=1791541909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=64r7ulkEn38K4zwS5C600ZIxGpt8NqYtlKiQJ/l1vMU=;
        b=mErxwQfKcT0oPSsbpcBLFEMyvx5qZUSCYW0mmuz1tIGAmrfxdPa1dygE4eF/wROVID
         /OYGHT0OTV3EEa/C9WgQCvd85LwaD3F0QIRroZeTUuDUfcprRNVx/hRcVGmIL0As9Qfn
         r6rHg6DDCqOHPBUBLfCwEEwf0xYE9ElNE96U/qfF+/xDy6zlSVnoamAr1doQWnsR8KYM
         t8AYNTFTMFmTSR7Pe870QY2GhikFDmR1QrBbZ+Q2J+/MouldOH2xIMM7LvgQ2w8IifmO
         R10nGHGWLeI21slZRGi3SpU7yYxZ626k1+ywBKemoe1PXC9btN1eu3VLSmbF2omXFs5/
         IU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790937109; x=1791541909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64r7ulkEn38K4zwS5C600ZIxGpt8NqYtlKiQJ/l1vMU=;
        b=JbxXt00fXI7UrxMOxYbpsUnI1xCfgXQtC86glxUwIlRpV/lpPM79q/GCZ1Cr+5g9Hi
         Kfa4/6Wy2qMRyESu0jrZCeDB1oOuWaXFko5gYsbMs0H9nAhMRjK9p410LsHPlRzxmEvs
         AyKoqyhD4GB1FTqLJtpgHz62ltsF6MIIaTPPLvapWEbJKTcTBcncTQJdoK/Gb/MtCG59
         wvnTAYE5KByAGVoBQYnNP/WIaOJAlu2Y2jdpA698JAjERCOir4ivZ07QTe20N6Kctojy
         eUskMhlxvq8P/3S0gBwDaXPmhe3L7EVlPpn0wlsHvZ11fa5ScAhHpHkrJAuorTJ/WiTT
         tqMA==
X-Forwarded-Encrypted: i=1; AKwUvBwA4EqwjGSRMQGKoMVJm6ed/eOYkEABd83CJ+Y9EI5w6BcrDbd2J5n2xEKA+kMT6e6tDP/gyswxkMVTZzBWcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8MaOU8WuZayIRSLGReGjIvFdnVqO7kbcAJ3rpNyUyilJ+kHoY
	bEB8VdY0Pp+t2rhekKlPIrXhw8DBsfnEdg3FC9e8kprp7oIDUrD+EnOnUhRtYP0UX6P+K4PN1a4
	MLNVKvyWvbouArehIG1qG5+sbD6WJ5g0=
X-Gm-Gg: AYBFou3AHyQkXuMFMetMxB5TflgTXY9w/25/oyk/Qdj8QZFnGGWbYiu93lzWtJR+hbp
	ltMNOmstx2EdJ+zXPbSMXoEJKQaFuZYQ6kpvQ+6RRhkInbUPAjC+b7yaDwy/CkWBVJmcqtrhfXj
	9/VijfcfaavHXiD1plKinWJv85+cHdOh+jqUEPoofO7xt8Dn2yYZkAaDahyGq+oa4bnv/KEjxWv
	81Y4Dc7mfibSCyWPMbNXLDPOz1c2nONR8aM4JcU/mWSZpDLBJaCt1to5GUE16XTeJF02WzU1V6d
	zMfidmMA2GWcvt5KJpVPz0040LDWxrOXRiICuXvoBxMuTGQcTcojNIs=
X-Received: by 2002:a05:6402:350c:b0:6aa:9f93:e991 with SMTP id
 4fb4d7f45d1cf-6af9e04df50mr1455052a12.3.1790937109250; Fri, 02 Oct 2026
 03:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001195847.141192-1-maximpedraza@gmail.com>
 <20261001195847.141192-3-maximpedraza@gmail.com> <5c92c6f27b0778124d2365603374f70bd9b69b8d@intel.com>
In-Reply-To: <5c92c6f27b0778124d2365603374f70bd9b69b8d@intel.com>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Fri, 2 Oct 2026 12:31:37 +0200
X-Gm-Features: AclHuK-AO31UUSmBIVotodEDTlpk8vgR8uy4aHoyOWv0oRmO6rDUZemULA1RRgQ
Message-ID: <CAEUXW=GKRstrsZniQSU0un6r--a2VrRjpZCe5meUyyxunJ-E7w@mail.gmail.com>
Subject: Re: [PATCH RFC v4 02/13] efi: bgrt: export the BGRT table and image size
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Francesco Valla <francesco@valla.it>, 
	Mario Limonciello <mario.limonciello@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	Jocelyn Falempe <jfalempe@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-embedded@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, 02 Oct 2026, Jani Nikula wrote:
> Data is not an interface.
>
> If these will be used more, perhaps it would be better to wrap access to
> them in functions? I think most of the time it will help with
> maintenance.
>
> And you can add stubs for CONFIG_ACPI_BGRT=3Dn where they belong,
> i.e. include/linux/efi-bgrt.h instead of drm_splash.c like in patch 11
> of this series.

Agreed, and the same goes for your comment on patch 3. For v5 I would
replace the export with accessors in efi-bgrt.c, stubbed in
efi-bgrt.h for CONFIG_ACPI_BGRT=3Dn:

      bool efi_bgrt_has_image(void);
      phys_addr_t efi_bgrt_image_address(void);
      size_t efi_bgrt_image_size(void);
      u8 efi_bgrt_status(void);
      u32 efi_bgrt_image_offset_x(void);
      u32 efi_bgrt_image_offset_y(void);

The splash client then drops its own wrappers and stubs, and the
"static inline" in drm_splash.c go as well.

drivers/acpi/bgrt.c is the only other user of bgrt_tab and
bgrt_image_size. I can move it to the accessors too, so that both
variables become static, if that is wanted; otherwise they stay
global for it and are no longer exported.

Ard, this changes the patch you acked, so I will not carry your
Acked-by unless the above works for you. Both variables become
__ro_after_init either way, as you asked.

Thanks,
M=C3=A0xim

El vie, 2 oct 2026 a las 11:37, Jani Nikula
(<jani.nikula@linux.intel.com>) escribi=C3=B3:
>
> On Thu, 01 Oct 2026, M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com> =
wrote:
> > The DRM splash client reads the boot graphics the firmware left behind
> > through bgrt_tab and bgrt_image_size. Built as part of drm_client_lib,
> > which can be a module, it then fails to link:
> >
> >   ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bg=
rt_tab' undefined!
> >   ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bg=
rt_image_size' undefined!
> >
> > Export both. They are filled in once, early in boot, and only read
> > after that.
> >
> > Reported-by: Mario Limonciello <mario.limonciello@amd.com>
> > Closes: https://lore.kernel.org/dri-devel/5d7067de-97b7-4232-9cf6-e4b97=
8696482@amd.com/
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com>
> > ---
> >  drivers/firmware/efi/efi-bgrt.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi=
-bgrt.c
> > index 1da451582812..746a8fb3a337 100644
> > --- a/drivers/firmware/efi/efi-bgrt.c
> > +++ b/drivers/firmware/efi/efi-bgrt.c
> > @@ -17,7 +17,10 @@
> >  #include <linux/efi-bgrt.h>
> >
> >  struct acpi_table_bgrt bgrt_tab;
> > +EXPORT_SYMBOL_GPL(bgrt_tab);
> > +
> >  size_t bgrt_image_size;
> > +EXPORT_SYMBOL_GPL(bgrt_image_size);
>
> Data is not an interface.
>
> If these will be used more, perhaps it would be better to wrap access to
> them in functions? I think most of the time it will help with
> maintenance.
>
> And you can add stubs for CONFIG_ACPI_BGRT=3Dn where they belong,
> i.e. include/linux/efi-bgrt.h instead of drm_splash.c like in patch 11
> of this series.
>
>
> BR,
> Jani.
>
>
> >
> >  struct bmp_header {
> >       u16 id;
>
> --
> Jani Nikula, Intel
