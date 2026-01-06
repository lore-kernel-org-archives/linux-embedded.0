Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D9632D0CF
	for <linux-embedded@vger.kernel.org>; Tue,  6 Jan 2026 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710886; cv=none; b=JtexaWz2j3TrILZGNrEM92xFH9X6HxVJoR+otTl3Zag4RNPf3ChY89k5ct1vOAknD03xFEPqQRVGZwV1gcAOE1np4/kW4Q3+BleVsXnt21jf6a8z7cN34ipw0adTikROcT/EZS5b9CNeuKX0S7QVthc3w2JCnVB3pRjJPLf18C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710886; c=relaxed/simple;
	bh=FCzIrtyhh7fPA/dw9YZK4XCoQvYOyJniQgX3yVqjUbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeRa6vDC806wzS9+HklcFSZ32ppqTQK4ehvXUhwbhBt/BR79E3h5dKKFTaFH21cHXEg/XvHpzWC0o1lXn9U4+BLXcoEtcbhhVz9+6a3EA2WlFs4zTlkk9s1Z8Klaue1U2EeTV5KhzsYHOzGZdtrsCku0b1OIqi29ybbxrqEfnag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55982d04792so687025e0c.1
        for <linux-embedded@vger.kernel.org>; Tue, 06 Jan 2026 06:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710883; x=1768315683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJJUInj/XbYBOmFssNzAphx4WQGD5E9g7yIXL8sfIgU=;
        b=SJ05rkzY4j5rdbx/1mZ01yWVJvvUfE7ew2WP7eDelh1y2ly5nilw6swPNNHzQjdgvm
         c5gsADRoK08OINq4KPhO/+YpY2oLz7J9g/qmuotS7PylAvmQclGMuQ9wgAFnMjVxH/ll
         1qghwYHIu6NozCawrU7VtaWGk7P4NePWPBFMiCMgBhSGVe2VcsWzXaIaM7KhL21UXLeH
         cW3TSqGxLxb3Cc3zJ566+Oalt1VEV/6Zou2BmtXpx8X/jDnrOP5GKQ9jo+ojepejYek8
         A+Ew5RfapE3CUY+FRuMk89nm2uxEhFkOGOi09DyzQepKMU0PcW9BRrxTyDvcdHU7HfD4
         JhjA==
X-Forwarded-Encrypted: i=1; AJvYcCVRkuEAgk2n09pBmuW8Vge/h93jlBoWfNGZ7yBSfqx3MrqQzJMSCIJZWdAMiEQrF6QikYlU+5mTCWNCJJinjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4Rezp3XKnrsLyZR8LOKTqhO5JfcKiEPpdzdz+tR3yOc+Eec1
	4n0aeATejAa9EaPafneuUHa7Ta0BukmI/HL4wWqmR5ywQDh3inygAeYIK13jYDeH
X-Gm-Gg: AY/fxX7CdsBbs+qhrcPmtHqJRV05VH5LiJb2y0Vu+HJWCCb7IuuDsTFFyR4u/sXf44j
	DW5SruP2M9cpPJwoBs23o0GEgy8FBxGxLLuWg0wKliH+Jo876rkmfsM3Z7Qgf3jPgxY2/HxJp4/
	4uTlYcKekXtKr2+FcPibwmxLCfNAnX6tpoI/JoW2pRMOxd7Am0ZZNFFycGYNdRkWhpWltmLSX0w
	iES3kWDt7HX9iqB5zQ6nvxk72tFe/uc8M+2jUJvQvtAtcqg6yz7Y+9tdO8y0T/HMOo4TJPlTmJC
	hPOtdQVl1yayBLwL6J08ZiRk11HwWDBVtwAUTja6Nh0bDxshi+YGor+/8mFq2Lozy98kvgt1+B8
	nkCPpX/VUtzPuJ7epyoYTrjviejScg4wBjL7o+xrQLOelgx97nlZyn7Rh5rBaH6/I1aO2yQoxyW
	/dXbELS9WKLGiWwSER0bOFWCZkDU443U7ehlvS2ht5ZSlZO8xp
X-Google-Smtp-Source: AGHT+IEgn6n0ZXaWwmb0S4IVbNnE4QfbAvO+XGeH+tBMbzPsHy1qf37UifLK19F/MzbYaBCabLOAfQ==
X-Received: by 2002:a05:6122:a09:b0:560:2442:74bb with SMTP id 71dfb90a1353d-5633958dfa4mr1140143e0c.19.1767710882878;
        Tue, 06 Jan 2026 06:48:02 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea480sm691653e0c.1.2026.01.06.06.48.02
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:48:02 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-940c539de8fso581427241.0
        for <linux-embedded@vger.kernel.org>; Tue, 06 Jan 2026 06:48:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURTPF/JHX8JXeZy91ir6OHhUvg3LUCgX8U1daJi8Tx0080MOJVMQ19CUxsf55HHJLqatd0pUOxaHKOrtyOLQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1623:b0:5df:bddd:b590 with SMTP id
 ada2fe7eead31-5ec7451df5fmr1123054137.34.1767710880890; Tue, 06 Jan 2026
 06:48:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it> <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
In-Reply-To: <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 15:47:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
X-Gm-Features: AQt7F2qsB5hg2NX_ZI18pHFrsB3JeydqfV6kNAMxXv_CqeMBbwVEPLSuyAomQME
Message-ID: <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
To: Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Franceso,

On Tue, 6 Jan 2026 at 15:26, Francesco Valla <francesco@valla.it> wrote:
> Add a DRM client that draws a simple splash, with possibility to show:
>
>   - a colored background;
>   - a static BMP image (loaded as firmware);
>   - the logo provided by EFI BGRT.
>
> The client is not meant to replace a full-featured bootsplash, but
> rather to remove some complexity (and hopefully boot time) on small
> embedded platforms or on systems with a limited scope (e.g: recovery
> or manufacturing images).
>
> The background color can be set either at build time from a dedicated
> config option or at runtime through the drm_client_lib.splash_color
> command line parameter. Any color in RGB888 format can be used.
>
> If enabled, the static BMP image is loaded using the kernel firmware
> infrastructure; a valid BMP image with 24bpp color and no compression
> is expected. The name of the image can be set through the
> drm_client_lib.splash_bmp kernel command line parameter, with the
> default being 'drm_splash.bmp'.
>
> Just like the existing DRM clients, the splash can be enabled from the
> kernel command line using drm_client_lib.active=splash.
>
> Signed-off-by: Francesco Valla <francesco@valla.it>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/clients/drm_splash.c

> +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)

There is no need to protect this block with #if, as it does not generate
any code.

> +#define BMP_FILE_MAGIC_ID 0x4d42
> +
> +/* BMP header structures copied from drivers/video/fbdev/efifb.c */
> +struct bmp_file_header {
> +       u16 id;
> +       u32 file_size;
> +       u32 reserved;
> +       u32 bitmap_offset;
> +} __packed;
> +
> +struct bmp_dib_header {
> +       u32 dib_header_size;
> +       s32 width;
> +       s32 height;
> +       u16 planes;
> +       u16 bpp;
> +       u32 compression;
> +       u32 bitmap_size;
> +       u32 horz_resolution;
> +       u32 vert_resolution;
> +       u32 colors_used;
> +       u32 colors_important;
> +} __packed;
> +#endif // CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT

As per [1], all these values are little-endian.  Hence they should
be declared as such using le16 or le32, and accessed using
get_unalined_le{16,32}().

[1] https://en.wikipedia.org/wiki/BMP_file_format#File_structure

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
