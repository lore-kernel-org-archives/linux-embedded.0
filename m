Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3149B5AB
	for <linux-embedded@vger.kernel.org>; Thu,  1 Oct 2026 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884753; cv=none; b=GrsFtJE35MAM/rUoTPgw+v9+QH8ediLFItx12rxzkuvCW2al78WcnVzjkrY7F6tx9Csb7oYUx+NXC50D7YbHl8VRQTLC7Ao8P0SDPO/yozWRTELYhX/8WE4+Y6cKBnq3LbB96JIBlSOBssoN+iP2L54FqzEwJvzNeNgu7pgF0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884753; c=relaxed/simple;
	bh=TDcCzgQ7j2XRNyu1L5o95jOmam698lXIfeK9VpmCoV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSkmvK3rbeBPwECTwCbMN/V4hzUGpTvo4zYVrCcNukf0Wp8os9N8UAvvX0gi8ZUiKeORkC5iZ/pgG9eWLCh1so7zeMKgyyH0fNuMk+3FnU2DbXaqYl0E4jctAb0Pt/2wey/BMvvngrlHPN77v/K5P817tnKrtsCxgR/3YpuLqzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI1/NqQP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI1/NqQP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so65673775e9.0
        for <linux-embedded@vger.kernel.org>; Thu, 01 Oct 2026 12:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884748; x=1791489548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZJ/XRjiJbnnbNutncIPfctKC3qkIxRHuKxqk+LioEA=;
        b=nI1/NqQP66hVEI0/upZrM0fjeVPMQ6i2b5GcEeb48LJ64GTpDLBDslFdZoxVy3o6UY
         9dVIL8Oeeiu5zLGZeizEIm2AJaufYE9EyjYaFIUPyrtmiC9l/TAi/dQmivMO7MqW0u+r
         ZHlFBVty2oQ59PUCizKWof8sZKy+/Im23ME3N+NsQYbq6IyNs/RQEwErdnPlY1pleXLr
         ua1N+aNKuKnnpZM9yRb6vaDdZIW7NqmpF+FI1NaDRr5cQaSE6HpUFyEm5Qzrx/S60JNj
         h36v3jZq++LmDss4k/vXuYG8mnhhVZRVDWTJMMGpS6vihN0CkP8JZ/JuY1/8mIAV4jco
         oC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884748; x=1791489548;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZJ/XRjiJbnnbNutncIPfctKC3qkIxRHuKxqk+LioEA=;
        b=BHg0XTBVzjnH0MI54o3nq9Ng5cFVXhdMmW72rdoTNHiZfpjiYzqWLlDhtlPh0JCuMO
         TpEtcvZgiw8pBIa1PynMSobgeki8CYEmJ70z328uw5ggx5v7Ou1r3Omt918kCgQHOF6h
         ul6boF6AOKZeZQ17hgtTx9VIWHwgbDD86M+v0GNgk50SBtzEOdEwAB6iC9F5xB47Y37d
         o8LqH8ibk+8bcxDn/jEC5ANW3nZSPjjfeIPHSwX368HbTnqq6gxeKgVjN1DJMMIFO8x1
         4X8y7zWS8RH1xRTmPpDg7zEBxajdjHCzALNlpy949QbA6ETeXb4uQFo0IAQ8jXikcVZ3
         mP7Q==
X-Forwarded-Encrypted: i=1; AKwUvByDi144aLokGhW1yfO6/VcBCk9dr3XmlgLcz56OW07raNB94ViG8votC56SFLPWiq7kIHy6KMEGK8lj7wKfrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lc3XeV7iPqAPHPKYrnv252JkcRUC+QUjE2/iK0T5UoGSu9alCR
	KQzmx9mfc1gF5QXHgcySL9XxAtG6IH2KySdDCnKpWMfPqFSB3Vz6Mmxt
X-Gm-Gg: AYBFou2MFL55nwHN2M4XUuRNH3kdU45wLdO+by2m6lHb3Ab40yk/h+AfGYHmYxjBf49
	dT8BJj5KiNulyvjme0Wv5LsUpOgvii746UyfH1z+wQWJOO5Imm88IbCvGF0YZULynSASQSllyZh
	CIfmu7FOgkn19JC9JyGA9zBPqx/FUtpYLn/Ie7Ky6GbtpSWrc7UlY5oMwl97g0Cual2kU7h1zbM
	vRo9sEfpPOxL0FMIMRv/TsD//aXUNOJoHFWfZqgx4/DbzHmifnHOYTwOsVJi2BD2nzVgipcyn+J
	m4X+QsyJNOEtEK79ObtTBfvQ1qjyS7v/TguhxQll/iccwnhS0BOrQ0S8nTa6APX3GzUCHNzUOOY
	CkK/n1Gg8AhcMcooCBXE1xSBfDW+RY6FQtQDWxnHHDULTc0aefv+9lFD36KDFkxbP+/lEAk8gbj
	67W9EUC/S4tS1q2/FoIAUVH/hIADdFDB54WHuzJE/yYzT5c4UfOn5fwaaSD0VBAsHUvoX88tJpT
	1gtZFz9PLU3NtlEY8GComuLoA==
X-Received: by 2002:a05:600c:46d4:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a0276c01e6mr12542815e9.32.1790884747870;
        Thu, 01 Oct 2026 12:59:07 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:59:07 -0700 (PDT)
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
Subject: [PATCH RFC v4 09/13] drm/client: splash: turn the device tree image as it asks
Date: Thu,  1 Oct 2026 21:58:43 +0200
Message-Id: <20261001195847.141192-10-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001195847.141192-1-maximpedraza@gmail.com>
References: <20261001195847.141192-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The same board is often fitted with the same panel mounted in more than
one orientation. Let the device tree node ask for the image to be turned,
with a "rotation" property counting degrees counter clockwise, as panels
already do and as DRM_MODE_ROTATE_* count, which is what it is kept as.

The rotation turns the image and not the screen: "logo-position" and
"logo-offset" stay in screen pixels, and a quarter turn only swaps how
much room the image takes up. Placing it in a frame that turned with it
would make the same pair of coordinates mean different places on the
same panel, decided by a property that describes the image.

The three blitters, one per destination pixel size, become one that
reads the source pixel through the rotation and writes it according to
the pixel size. Each source pixel is read as three bytes rather than as
an unaligned u32: a BMP row is only padded as a whole, so with 3 * width
already a multiple of four the last pixel of the image was read one byte
past its end. An upright image going to an RGB888 buffer is still copied
a row at a time.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 206 ++++++++++++++-------------
 1 file changed, 110 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 349f68d392e5..924bc0032d1d 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -25,6 +25,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_mode.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 
@@ -128,6 +129,8 @@ struct drm_splash {
 	 */
 	s32 pos_x, pos_y;
 	s32 off_x, off_y;
+	/* One of DRM_MODE_ROTATE_*: turns the image, not the screen */
+	unsigned int rotation;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -275,6 +278,28 @@ static void drm_splash_dt_placement(struct drm_splash *splash,
 		splash->off_x = (s32)val[0];
 		splash->off_y = (s32)val[1];
 	}
+
+	/* Degrees counter clockwise, as for panels, and as DRM counts them */
+	if (!of_property_read_u32(np, "rotation", &val[0])) {
+		switch (val[0]) {
+		case 0:
+			splash->rotation = DRM_MODE_ROTATE_0;
+			break;
+		case 90:
+			splash->rotation = DRM_MODE_ROTATE_90;
+			break;
+		case 180:
+			splash->rotation = DRM_MODE_ROTATE_180;
+			break;
+		case 270:
+			splash->rotation = DRM_MODE_ROTATE_270;
+			break;
+		default:
+			drm_warn(splash->client.dev,
+				 "splash: %pOF: unsupported rotation %u",
+				 np, val[0]);
+		}
+	}
 }
 
 static int drm_splash_dt_load(struct drm_splash *splash, const u8 **data,
@@ -500,73 +525,68 @@ static unsigned int drm_splash_place_axis(s32 pos, s32 off, unsigned int span,
 	return clamp_t(s64, coord + off, 0, last);
 }
 
-static void drm_splash_blit_pix16(struct iosys_map *map, unsigned int dpitch,
-				  unsigned int x_pad, unsigned int y_pad,
-				  const u8 *sbuf8, unsigned int spitch,
-				  unsigned int width, unsigned int height,
-				  bool invert_y, u32 format)
-{
-	unsigned int x, y, src_offset, dst_offset;
-	u32 scolor, dcolor, wr_off;
-
-	for (y = 0; y < height; y++) {
-		src_offset = (invert_y ? (height - y - 1) : y) * spitch;
-		dst_offset = (y_pad + y) * dpitch;
-
-		for (x = 0; x < width; x++) {
-			scolor = *(const u32 *)(&sbuf8[src_offset + 3 * x]);
-			dcolor = drm_draw_color_from_xrgb8888(scolor, format);
-			wr_off = dst_offset + (x_pad + x) * sizeof(u16);
-
-			iosys_map_wr(map, wr_off, u16, dcolor);
-		}
-	}
-}
-
-static void drm_splash_blit_pix24(struct iosys_map *map, unsigned int dpitch,
-				  unsigned int x_pad, unsigned int y_pad,
-				  const u8 *sbuf8, unsigned int spitch,
-				  unsigned int width, unsigned int height,
-				  bool invert_y, u32 format)
-{
-	unsigned int x, y, src_offset, dst_offset;
-	u32 scolor, dcolor, wr_off;
-
-	for (y = 0; y < height; y++) {
-		src_offset = (invert_y ? (height - y - 1) : y) * spitch;
-		dst_offset = (y_pad + y) * dpitch;
-
-		for (x = 0; x < width; x++) {
-			scolor = *(const u32 *)(&sbuf8[src_offset + 3 * x]);
-			dcolor = drm_draw_color_from_xrgb8888(scolor, format);
-			wr_off = dst_offset + (x_pad + x) * 3;
-
-			iosys_map_wr(map, wr_off, u8, (dcolor & 0x000000FF) >> 0);
-			iosys_map_wr(map, wr_off + 1, u8, (dcolor & 0x0000FF00) >> 8);
-			iosys_map_wr(map, wr_off + 2, u8, (dcolor & 0x00FF0000) >> 16);
-		}
-	}
-}
-
-static void drm_splash_blit_pix32(struct iosys_map *map, unsigned int dpitch,
-				  unsigned int x_pad, unsigned int y_pad,
-				  const u8 *sbuf8, unsigned int spitch,
-				  unsigned int width, unsigned int height,
-				  bool invert_y, u32 format)
+/*
+ * Copy the BMP pixels into the buffer, converted to its format and turned by
+ * @rotation, one of DRM_MODE_ROTATE_*, which count counter clockwise. The
+ * rotation turns the image, not the screen: a quarter turn swaps how much
+ * room the image takes up, and @x_pad and @y_pad place that room on screen.
+ *
+ * Each source pixel is three bytes read on their own, since a BMP row is
+ * only padded to four bytes as a whole and the image need not be aligned.
+ */
+static void drm_splash_blit(struct iosys_map *map, unsigned int dpitch,
+			    u32 format, unsigned int cpp,
+			    unsigned int x_pad, unsigned int y_pad,
+			    const u8 *sbuf8, unsigned int spitch,
+			    unsigned int width, unsigned int height,
+			    bool invert_y, unsigned int rotation)
 {
-	unsigned int x, y, src_offset, dst_offset;
-	u32 scolor, dcolor, wr_off;
-
-	for (y = 0; y < height; y++) {
-		src_offset = (invert_y ? (height - y - 1) : y) * spitch;
-		dst_offset = (y_pad + y) * dpitch;
+	bool quarter = rotation & (DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270);
+	unsigned int dw = quarter ? height : width;
+	unsigned int dh = quarter ? width : height;
+	unsigned int x, y, sx, sy, row, off;
+	u32 scolor, dcolor;
+
+	for (y = 0; y < dh; y++) {
+		for (x = 0; x < dw; x++) {
+			switch (rotation) {
+			case DRM_MODE_ROTATE_90:
+				sx = width - 1 - y;
+				sy = x;
+				break;
+			case DRM_MODE_ROTATE_180:
+				sx = width - 1 - x;
+				sy = height - 1 - y;
+				break;
+			case DRM_MODE_ROTATE_270:
+				sx = y;
+				sy = height - 1 - x;
+				break;
+			default:
+				sx = x;
+				sy = y;
+				break;
+			}
 
-		for (x = 0; x < width; x++) {
-			scolor = *(const u32 *)(&sbuf8[src_offset + 3 * x]);
+			/* A positive BMP height stores the rows bottom up */
+			row = invert_y ? height - 1 - sy : sy;
+			scolor = get_unaligned_le24(&sbuf8[row * spitch + 3 * sx]);
 			dcolor = drm_draw_color_from_xrgb8888(scolor, format);
-			wr_off = dst_offset + (x_pad + x) * sizeof(u32);
+			off = (y_pad + y) * dpitch + (x_pad + x) * cpp;
 
-			iosys_map_wr(map, wr_off, u32, dcolor);
+			switch (cpp) {
+			case 2:
+				iosys_map_wr(map, off, u16, dcolor);
+				break;
+			case 3:
+				iosys_map_wr(map, off, u8, dcolor & 0xff);
+				iosys_map_wr(map, off + 1, u8, (dcolor >> 8) & 0xff);
+				iosys_map_wr(map, off + 2, u8, (dcolor >> 16) & 0xff);
+				break;
+			case 4:
+				iosys_map_wr(map, off, u32, dcolor);
+				break;
+			}
 		}
 	}
 }
@@ -605,7 +625,7 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 	bool bmp_invert_y;
 	u32 bitmap_offset;
 	size_t row_len, pixels_len, end;
-	unsigned int x_pad, y_pad;
+	unsigned int x_pad, y_pad, img_w, img_h;
 	const u8 *image_data;
 	struct iosys_map map;
 	struct drm_rect r;
@@ -665,7 +685,16 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 	}
 	bmp_pitch = row_len & ~(size_t)3;
 
-	if (bmp_width > scanout->width || bmp_height > scanout->height) {
+	/* The room the image takes up on screen, once turned */
+	if (splash->rotation & (DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270)) {
+		img_w = bmp_height;
+		img_h = bmp_width;
+	} else {
+		img_w = bmp_width;
+		img_h = bmp_height;
+	}
+
+	if (img_w > scanout->width || img_h > scanout->height) {
 		drm_err(client->dev, "splash: BMP image is too big for the screen");
 		return -EINVAL;
 	}
@@ -699,9 +728,9 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 #endif
 	} else {
 		x_pad = drm_splash_place_axis(splash->pos_x, splash->off_x,
-					      scanout->width, bmp_width);
+					      scanout->width, img_w);
 		y_pad = drm_splash_place_axis(splash->pos_y, splash->off_y,
-					      scanout->height, bmp_height);
+					      scanout->height, img_h);
 	}
 
 	image_data = data + bitmap_offset;
@@ -712,40 +741,24 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		return ret;
 	}
 
-	r = DRM_RECT_INIT(x_pad, y_pad, bmp_width, bmp_height);
+	r = DRM_RECT_INIT(x_pad, y_pad, img_w, img_h);
 
-	/* In case the target format is RGB888, source data can be copied to
-	 * the video buffer line by line, avoiding some overhead.
+	/*
+	 * An unturned image going to an RGB888 buffer has the same byte order
+	 * as the BMP, so it is copied a row at a time.
 	 */
-	if (scanout->format == DRM_FORMAT_RGB888) {
+	if (scanout->format == DRM_FORMAT_RGB888 &&
+	    splash->rotation == DRM_MODE_ROTATE_0) {
 		drm_splash_blit_rgb888(&map, fb->pitches[0], x_pad, y_pad,
 				       image_data, bmp_pitch, bmp_width,
 				       bmp_height, bmp_invert_y);
+	} else if (px_width >= 2 && px_width <= 4) {
+		drm_splash_blit(&map, fb->pitches[0], scanout->format, px_width,
+				x_pad, y_pad, image_data, bmp_pitch, bmp_width,
+				bmp_height, bmp_invert_y, splash->rotation);
 	} else {
-		switch (px_width) {
-		case 2:
-			drm_splash_blit_pix16(&map, fb->pitches[0], x_pad,
-					      y_pad, image_data, bmp_pitch,
-					      bmp_width, bmp_height,
-					      bmp_invert_y, scanout->format);
-			break;
-		case 3:
-			drm_splash_blit_pix24(&map, fb->pitches[0], x_pad,
-					      y_pad, image_data, bmp_pitch,
-					      bmp_width, bmp_height,
-					      bmp_invert_y, scanout->format);
-			break;
-		case 4:
-			drm_splash_blit_pix32(&map, fb->pitches[0], x_pad,
-					      y_pad, image_data, bmp_pitch,
-					      bmp_width, bmp_height,
-					      bmp_invert_y, scanout->format);
-			break;
-		default:
-			drm_warn_once(client->dev,
-				      "splash: can't blit with pixel width %d",
-				      px_width);
-		}
+		drm_warn_once(client->dev, "splash: can't blit with pixel width %d",
+			      px_width);
 	}
 
 	drm_client_buffer_vunmap_local(buffer);
@@ -1190,9 +1203,10 @@ void drm_splash_register(struct drm_device *dev,
 	spin_lock_init(&splash->fw_lock);
 	init_completion(&splash->fw_done);
 
-	/* Centred unless the image source asks otherwise */
+	/* Centred and upright unless the image source asks otherwise */
 	splash->pos_x = -1;
 	splash->pos_y = -1;
+	splash->rotation = DRM_MODE_ROTATE_0;
 
 	if (format && format->num_planes == 1)
 		splash->preferred_format = format->format;
-- 
2.39.5

