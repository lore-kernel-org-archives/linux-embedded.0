Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163BD443C10
	for <linux-embedded@vger.kernel.org>; Tue, 13 Oct 2026 09:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883999; cv=none; b=JnGiWarrNjVG4Ozbd8VsrSFj6btT/qnvZX2eCJiUjR5nG+O6IMpJCw1BIB7hKD4ANR9NncVRmRblmqeP1EWeafNSo5XE+XRllTqdN8H3josQPwNKPQriFuClzQA51aiN8ebE0IY+VNHOQYhb6CapA3TRKg862X01BeGrH7z0D9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883999; c=relaxed/simple;
	bh=NPPTuJMFbR++IvlpmQYNkBndrUAcpQgMz91TsS9FU7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuvegNeIxPPPZCXbsF3FKAUx5V7cxOcekIBWmiVCegRuQ+s4JATyh0G/HayN8B8OcPSdoSNToqRqPp2s1P8wRgpQpZ/5Q36RntwRaNO04EsnCOtCijPRfvpwAX7bVdyeCmet0txkYKJ+mASW1XAIB5jK7jUugwL9TUf8EUwMYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITdj5X4L; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITdj5X4L"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso3036819f8f.0
        for <linux-embedded@vger.kernel.org>; Tue, 13 Oct 2026 02:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883994; x=1792488794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdKVfmAGa7RaZVKgQWROr2rYza34vttyTey4iUR61tg=;
        b=ITdj5X4LJqCUkQoF0IHHdHsIvCaWPw/AGuPz+e9WtALsg7E1bffbbNka0MzR9UBT8P
         FlMSrIbVDfZvqOFzV6uJ+Osf7fCkqPEF32Stokkb0hu7omCfr4xurzXOV7K3fOcAW+gJ
         dqlROtEjp2VMQL4DHestT7NXU4yYjBDYvN/LCw++Fqz6UYrhQaIeTrRYZjepCGAOBlsh
         Myk3Yph1a5ifDEjUuztXvBXqhgkp8QLdMNisFrGVM8+8SzVAfYDZXlizN/5ycaxNMvqK
         a8/aatVWxnZwRGQcIxRKroQczbyuKOHR7TRCI4XEkpMgl02qLTfBEynMlezizeFFipM5
         2Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883994; x=1792488794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdKVfmAGa7RaZVKgQWROr2rYza34vttyTey4iUR61tg=;
        b=jmjS0NGguiKn3aikMZkO80jxUisLoFaibM9SOYPdGT8ggGj3JnpdXaD6woFWAEtDxY
         0HIsRhEg+gp+HxJeOIhQamvaHzJz5s4xOnMndsjO2IMKPpNwqVLSZtzNRw7w1Odbu035
         vnn4loJU3JswadAayDCz7C2G3w8UClV0bcUF2fXcdEqhyjIwRdP8T+ZzxLe5z6MBKKDd
         MT/ZYbzlKPj2As9zDwPNU2G+J8jXdMjGEL04su0gE0rPSN2fdzoFV5bo7T/+E/o7hpW8
         QGlEMbU16q6nqXrniq2+HkXftMGmXpwtmeDV7huw95SSXlFMyrLxcnNcIFbyQIeBb042
         J1Zg==
X-Forwarded-Encrypted: i=1; AKwUvByVTkdYR0XP8Z571HXaOLc0FpwSzhOvBpw/skU3djtNwQ+Sn/kNeN3G9ya7fsD4MeE7LWqyeLYiKBI7NYlW3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJoKAY3unRm6v2hXx1ENEM+TrIPKWlh/X+vaGtP0WX2Ck3WP20A
	TUyF1JwLWu1pP6Nt7ITKtqcN29uIiY9jk9UHns9Kk0LT6ws0UpP5vA60
X-Gm-Gg: AYBFou1j1pUe5Ws0+aHwqdFAN58solWgKAM5uYKHOmpGKLGHH2fRuzlAVYL21/Q+ik5
	faDZw3le2jb532UsIryT4UMyXe82N3MV5auyUoSIy1yybCQ1jVLuA+TFQfLADfxohNqmP1Tnulf
	PwHtfu4Kp09KDseLpfhpMSZJehUH730X7tb7fJ8SF8aXWeiCvIZaTkz/+tjatJ4clm3SkYFVuTI
	T+vb3oU2iNAtPXEwoadylkXbGaijnFIT8G9ZuF2J0jxiqbEnxgjJJFkNuPypd5LTL4h1ppBwjc1
	JVm9BsfU5j9J+HI8H4HNU6qN2XzWc98oiTN0qNvsFfSwZNTEXIXdweznxoWkjmBSIISabd2edy4
	PFBqrRxT7uMOm2LkI/lN/kFbjXB0SXVWzP0lpW6s7Sm9KJ4eRYIFBa99trVBEOmvE7dWC6uvv0M
	KVT5HyJWDR98eTHp9Z2XVdFaDShzRqJwW63LqiPO8tlyieKNiJK7RHUacBZuV/oudcdJ+eYNv0W
	JRLPPz1xLDbOjGF/O5V4zVc
X-Received: by 2002:a05:600d:864c:10b0:4a1:8bff:9284 with SMTP id 5b1f17b1804b1-4a18dcd532cmr183789385e9.15.1791883994018;
        Tue, 13 Oct 2026 02:33:14 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:33:13 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>
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
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/13] drm/client: splash: turn the BGRT image on panels mounted turned
Date: Tue, 13 Oct 2026 11:32:41 +0200
Message-Id: <20261013093243.505776-12-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013093243.505776-1-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since ACPI 6.2, bits 1-2 of the BGRT status tell that the firmware
image is not pre-rotated and how far it has to be turned to show
upright on a panel mounted turned. The client skipped such images
altogether, so tablets and 2-in-1s with a portrait panel got no splash.

Turn the image as the bits say. The values count 90 degree steps
counter clockwise, as Plymouth, the main user of the BGRT, applies
them, and as DRM_MODE_ROTATE_* count, which is what they become.

The offsets need more care. For such an image the firmware gives them
on the upright screen, while the client draws into the buffer as it is
scanned out, which on a panel mounted turned is the upright screen
turned the other way. Check them and apply the efifb sanity check in
the upright frame, then move the image's rectangle into the buffer's
frame. An image without the bits is drawn at its offsets as before:
the buffer is the frame the firmware drew it in, so a pre-rotated image
needs none of the guessing userspace has to do for it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 67 +++++++++++++++++++++++-----
 1 file changed, 56 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 463aff27c747..4c30de7c5c16 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -398,11 +398,6 @@ static bool drm_splash_bgrt_available(struct drm_splash *splash)
 		return false;
 	}
 
-	if (efi_bgrt_status() & ACPI_BGRT_ORIENTATION_OFFSET) {
-		drm_info(client->dev, "splash: BGRT rotation bits set, skipping");
-		return false;
-	}
-
 	return true;
 }
 
@@ -431,6 +426,26 @@ static int drm_splash_bgrt_load(struct drm_splash *splash, const u8 **data,
 	return 0;
 }
 
+/*
+ * Since ACPI 6.2, bits 1-2 of the BGRT status say that the image is not
+ * pre-rotated for a panel mounted turned, and by how much it has to be
+ * turned to show upright on it: 0, 90, 180 or 270 degrees, which firmware
+ * and userspace (Plymouth) apply counter clockwise, as DRM counts them.
+ */
+static unsigned int drm_splash_bgrt_rotation(void)
+{
+	switch ((efi_bgrt_status() & ACPI_BGRT_ORIENTATION_OFFSET) >> 1) {
+	case 1:
+		return DRM_MODE_ROTATE_90;
+	case 2:
+		return DRM_MODE_ROTATE_180;
+	case 3:
+		return DRM_MODE_ROTATE_270;
+	default:
+		return DRM_MODE_ROTATE_0;
+	}
+}
+
 static u32 drm_splash_find_usable_format(struct drm_plane *plane,
 					 u32 preferred_format)
 {
@@ -688,11 +703,21 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 	}
 
 	if (splash->src == DRM_SPLASH_SRC_BGRT) {
-		x_pad = efi_bgrt_image_offset_x();
-		y_pad = efi_bgrt_image_offset_y();
-
-		if ((x_pad + bmp_width) > scanout->width ||
-		    (y_pad + bmp_height) > scanout->height) {
+		/*
+		 * The BGRT offsets place the upright image on the upright
+		 * screen, which for a panel mounted turned is not the frame
+		 * the buffer is scanned out in. Work in that frame, then move
+		 * the image's rectangle into the buffer's.
+		 */
+		bool quarter = splash->rotation &
+			       (DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270);
+		unsigned int lw = quarter ? scanout->height : scanout->width;
+		unsigned int lh = quarter ? scanout->width : scanout->height;
+		unsigned int xo = efi_bgrt_image_offset_x();
+		unsigned int yo = efi_bgrt_image_offset_y();
+
+		if (xo > lw || bmp_width > lw - xo ||
+		    yo > lh || bmp_height > lh - yo) {
 			drm_err(client->dev, "splash: BGRT image would overflow");
 			return -EINVAL;
 		}
@@ -709,11 +734,30 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		 * the display looking quite bad.
 		 */
 
-		if (x_pad != (scanout->width - bmp_width) / 2) {
+		if (xo != (lw - bmp_width) / 2) {
 			drm_err(client->dev, "splash: BGRT sanity check failed");
 			return -EINVAL;
 		}
 #endif
+
+		switch (splash->rotation) {
+		case DRM_MODE_ROTATE_90:
+			x_pad = yo;
+			y_pad = lw - xo - bmp_width;
+			break;
+		case DRM_MODE_ROTATE_180:
+			x_pad = lw - xo - bmp_width;
+			y_pad = lh - yo - bmp_height;
+			break;
+		case DRM_MODE_ROTATE_270:
+			x_pad = lh - yo - bmp_height;
+			y_pad = xo;
+			break;
+		default:
+			x_pad = xo;
+			y_pad = yo;
+			break;
+		}
 	} else {
 		x_pad = drm_splash_place_axis(splash->pos_x, splash->off_x,
 					      scanout->width, img_w);
@@ -797,6 +841,7 @@ static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 	/* The BGRT carries no colour: firmware splashes sit on black */
 	if (drm_splash_bgrt_available(splash)) {
 		splash->bg_color = CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR;
+		splash->rotation = drm_splash_bgrt_rotation();
 		return DRM_SPLASH_SRC_BGRT;
 	}
 
-- 
2.39.5

