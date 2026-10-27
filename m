Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109261;
	b=BeZ0PXw1oQcMs7w+DJNjD2pzFa4OJc8PyUer4QX7a1iRE8oJFKyDlAehCjYXeCQMPZOn
	 OxnfCoRCiS56Muk9B1DAScyTLnvYGrHUtVSPxKl06p/zNLf9khDasCXQP1BAh97GY++gZ
	 7n/Yj8iT+5HGckLTaAOjB8YpbWl+RjOWJ+ozeKDxbqiQ+k4/pI/nF8ptP3NpgkXJ/hWDI
	 MDZnJN7b5hqQGnpMsmuAdVf0GRc0uJjCNCyihGS2PrtlPCEiUDxh8WaSgmFII3Qi7oHj0
	 GzvSRoqcXLKqXNtlhUQdv43Nn532s6vpsmFb4VoGAZ5uJwgU3iC4uzfsSjKavMUr3Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kjJRYbm0P/rhDwIhbhLgzvyBgDKoIc1GRXvwAOHpom0=;
	b=bst7U9u/4ta85mAUhLC2x92x8i2/vAZrorvGZ/R1cR+w5UT1QzMSZiELHpOMMBcUd9cL
	 nrE9Mrh9WiC2tDfnLDsAMUtmf3cZ0OJkIcBxADsUqxCDvSQ/ezraZuz8WdmYT/Vev7l5j
	 f64ycPc8RCXwysxy7y8/MliPIz8RYha+iKfrVKEy5SSCI+ekGwGvWK42QSZ2M8kjsfGOy
	 4wVkmpjUurYBJyZ8Ww+Awp9i54KuRTngqmxoByQM9rtF/TBmNsLb9l/N89vTVEWMOAKl5
	 qXmYWZ3LBKBpV4u68LaCLwD/NBDMaRazfYNwIrPi5R/HkUw6vDf254y4TgiJOzguiEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dc5b9Y4f;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1332560A5BC1
	for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 13:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1332560A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dc5b9Y4f
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so27571585e9.3
        for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109260; x=1793714060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kjJRYbm0P/rhDwIhbhLgzvyBgDKoIc1GRXvwAOHpom0=;
        b=Dc5b9Y4fElW6aD+qlyDx5q58yC3WySxSke+A42Ru3IEaWhIZkmQiS7fEXmuMHJhcTy
         9QA9WruBw7Vd//qzUoXTKsf+u4yO5iKMWbqw0VBOmRLHAekyl7ZTWmmKAsuWIA0KtgrS
         wd4U5Q8i92pyCTSMBgc1IlnjphMnMzS1LpOx9V6tmqiTtvkGauL2sBz8yYkSMkbkqF0g
         mDFOUe5oP8He2HMi4w/e/8KLYXXbUmNEjwZ6iZyT5Aw/392osb5+I0xA4jxg7Su81VmO
         kfXxWF2ekvzBDwgMg2yi3sUndI7aAWI2h4vLFCvPXdG3FTNdBq1o5xN0nk8/sXFi95JN
         WrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109260; x=1793714060;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjJRYbm0P/rhDwIhbhLgzvyBgDKoIc1GRXvwAOHpom0=;
        b=0svW44wq2E4VlMphAUkLo2fxGmRdwhufOBPeTutmSRYXY/6FV2Inc+VQG5CdAF6AEt
         b/MlqfWA8FvcWfKSJFgCxqmGqQZEmyvB2uRoKjmgsrwz97F4DQUC3c4GcNkvCOrtjv/Z
         WyllPgkz5kokuCNYDfiwnaku5fCmsDHk9MRMr+g0whXuls2Phj/f55qZqI+6l8VYwOPL
         Iz0Sq5puRq5BQXjmPivqXME+qoiW1nrHiLowU8+tPMEDU0PWgGgYisfcBqku+5gkedOl
         MM1dQCHX9UWILCd75WKGUW2uV9DP87MpNj5EDBwijb2rZjUR/NiGBKR8m6ePkV9aruzJ
         kKxg==
X-Forwarded-Encrypted: i=1; AKwUvBwmPnwaIgmdKMoDeE16mPTSE5XPyz7VEB9yivnsbh2td1WeDfeReWkQndD+Itt5s5Mn5EZI2yiviL+za+nuRA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKaCWAvM9TROAhNhxDAEUmmoQwuNdHpRCJgTpQR4V46v31owKJ9
	IUHI19Ij9pEn3pEiIw3VJRLECVOXjOFZB2sOs5fvIqHf2dnkv2ocEGQV
X-Gm-Gg: AYBFou19X+ZieF+wKQbnVxfNHdiApVWJ3v9jr110PSy7U7JdBJtTAsllWN25Ke50O0T
	D0cgF7z2ZRfxjpAG4bu143saCo1UOlDne6Gp09jnMD2Dr5yVIp21fv7tOeUFMux2SsEyoULnobW
	RnbSwilDYKL8h6R/dUqRX24c61NhuxX7+cNyg0fd8Tmp7usN0OPTvpWDeQ0dX3B6WSg8EJl5W4c
	Il0FSx3dGliQplR0Paawv2hdVDYJxektYyjC/98WTVKA7VcQgG+qCZED7TL5xi28Xqb4aDJBMwS
	fbX4v0PT9ztAcD1yuhlJPOdQ6Dt72onSvR0lh+AKvyCSnXI82hD4r3I6EBt0ijo1aC5nxOQLPGR
	COKHDwnxYZtO7MryGk0fuz+HU3oXGMgf6r4S0f5XB4CBwvaSdxKWKsuYDn4fnOJPTZH1+lzQryI
	+WkAgy0Gf7A3Z4TzyoZhIwQZ2rdr1WZpDoLkIP81QHXVautrCg3/PSuTAQIHaa1UK+p+xpkd4eM
	EQcx5nQNYILB0Wr7wDWdC7cnV60FVWkd512F16lbrGYlooUu8Bj3iySSk94rRvua0AP7o5NV49V
	yGacE5E=
X-Received: by 2002:a05:600c:620f:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4a35acc731dmr180025295e9.31.1793109259383;
        Tue, 27 Oct 2026 06:54:19 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:19 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/15] drm/client: splash: document the image sources
Date: Tue, 27 Oct 2026 14:53:42 +0100
Message-Id: <20261027135342.2003632-16-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Post: <mailto:linux-embedded@vger.kernel.org>
List-Help: <mailto:linux-embedded+help@vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-embedded+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The overview only said that the client draws a colour or an image. By
now the image can come from three places in a set order, and be placed
and turned. Write it down: the sources and their order, the image
format, placement and rotation, and the background.

Also note that the splash rules out fbdev emulation on the same device,
and that a bootloader that loads no image into a reserved region has to
disable or remove the node, since the region can keep the previous
image across a reset and even a short power cycle.

Pull the overview into Documentation/gpu/drm-client.rst, which covers
the in-kernel clients, so that it is published.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/drm-client.rst     |  6 +++
 drivers/gpu/drm/clients/drm_splash.c | 61 +++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-client.rst b/Documentation/gpu/drm-client.rst
index cbcfe30de777..a58d6440d9f2 100644
--- a/Documentation/gpu/drm-client.rst
+++ b/Documentation/gpu/drm-client.rst
@@ -16,3 +16,9 @@ Kernel clients
 
 .. kernel-doc:: drivers/gpu/drm/drm_client_event.c
    :export:
+
+Splash client
+=============
+
+.. kernel-doc:: drivers/gpu/drm/clients/drm_splash.c
+   :doc: overview
diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index d3ed53cde0f5..0fc72a3fe989 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -40,7 +40,66 @@
  * DOC: overview
  *
  * This is a simple graphic bootsplash, able to display either a plain color or
- * a static image.
+ * a static image. It draws once the display driver has registered, and again
+ * on every hotplug, on the outputs there are then, until userspace takes the
+ * display over; when userspace lets it go, the splash is shown again.
+ *
+ * It is selected with ``drm_client_lib.active=splash`` or
+ * CONFIG_DRM_CLIENT_DEFAULT_SPLASH. A device has a single in-kernel client, so
+ * with the splash there is no fbdev emulation: no ``/dev/fb0`` and no
+ * framebuffer console.
+ *
+ * Image sources
+ * -------------
+ *
+ * The image is a BMP with a BITMAPINFOHEADER, or its V4 or V5 extension,
+ * 24 bits per pixel and no compression. It comes from the first of these that
+ * is present, each built in with its CONFIG_DRM_CLIENT_SPLASH_SRC_* option; if
+ * that one then fails to load, only the background is drawn:
+ *
+ * 1. a node compatible with "boot-logo" under ``/chosen`` in the device tree,
+ *    carrying the BMP itself or pointing at a reserved memory region the
+ *    bootloader loaded it into, if that region can be mapped (see
+ *    Documentation/devicetree/bindings/display/boot-logo.yaml);
+ * 2. the EFI BGRT, the image the firmware showed;
+ * 3. the BMP named by CONFIG_DRM_CLIENT_SPLASH_BMP_NAME, ``drm_splash.bmp`` by
+ *    default, loaded as firmware, for instance built into the kernel with
+ *    CONFIG_EXTRA_FIRMWARE.
+ *
+ * With none of them, only the background is drawn.
+ *
+ * A reserved memory region keeps its contents across a reset, and may even
+ * across a short power cycle, and the kernel cannot tell a stale image from a
+ * fresh one: a bootloader that loads no image there disables the node, or
+ * removes it.
+ *
+ * Placement
+ * ---------
+ *
+ * Everything is given as the screen is seen: once turned as its connector
+ * needs, for a panel mounted turned (the panel's orientation) or as asked
+ * with video=...,rotate=. The plane turns it in hardware when it can, and the
+ * splash turns its buffer in software otherwise, as fbdev does with the
+ * console. A panel mounted turned is described on the panel, not here.
+ *
+ * The image is placed at a position in pixels, where -1 centres it on that
+ * axis, and an offset is added afterwards; the result is clamped so that the
+ * whole image stays on screen. A rotation of 90, 180 or 270 degrees counter
+ * clockwise turns the image and not the screen: position and offset stay in
+ * the same pixels, and a quarter turn only swaps how much room the image
+ * takes up.
+ *
+ * A device tree image is placed and turned as its node says, and any other
+ * image is centred and upright. A BGRT image is the exception to the above: it
+ * is drawn at the table offsets on the screen the firmware drew it on,
+ * unturned but for the table's orientation bits.
+ *
+ * Background
+ * ----------
+ *
+ * The rest of the screen is filled with the node's "background-color" for a
+ * device tree image, and with CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR
+ * otherwise.
  */
 
 /*
-- 
2.39.5

