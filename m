Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DB2497B90
	for <linux-embedded@vger.kernel.org>; Thu,  1 Oct 2026 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884750; cv=none; b=SKZPHi8WZyJOGco97eXuo7hV+D8MxPtnAHhFBnfNqCUjew++TmyJrmwaClWhkMZ3gseiJgQHr6INhecUeATZAY2Adng7qaRR+ZYSxUwb+GGalNgF2c/or30zhVh49uC+wWDS2nISTpqo/aBL+idyuctNjsYblunSWRxgL4D1w58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884750; c=relaxed/simple;
	bh=f3eUTk8uVDUYSYqdSgy94ltuLUz4fVupzyOjShAdQlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OgUhUBAmWPHNQ+JQRrXyaPzIqugRM6ffjzuthXFMu+4jXCLEY9usYFCcHidaa/g0RetxOKpnY5+iboWtT3dibAN1qYcp7SsvWZQbftn5p4OLvvgZKQIFeH8g3nfDQ5LV1Y1110HF2Z3uDb8BonJI29MnqAQaKf+Q3HiOal2cEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSRqqYD3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSRqqYD3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso71436685e9.1
        for <linux-embedded@vger.kernel.org>; Thu, 01 Oct 2026 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884746; x=1791489546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qywgNTd6TlVJPvtlQJLwhQRTzG27xqxJQYleDreMzo=;
        b=eSRqqYD3YJniySImKviEDCv6dGaYjH6yaIKM9OshhjE0WYxZFYGStU4NgG3jYPiRRs
         dcOj6btKLhFbOrsHYpUNAqjAnybl2CQ4EmlTg7ip0LaF+vD3xkeeOVo9PPT7AQU40+BU
         9IaADJ65EhZ8PeDsoOiZcMLAR4W4rp3gkDFXtfrqlLuXlG6zbxIObcGnBprsFahxZ0hW
         OcoLVulElm5PU4kfdKhwc3AYnT1kCox5tZnN94cx4j+laatDGK7AkTychWs4/kgVZ+xe
         t5MttY59m7JjbzCGIsIbbetSPsGi6qHhW4x41klxF8sf8WK2gwlWzonmVTfqUtfj1fEM
         0QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884746; x=1791489546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qywgNTd6TlVJPvtlQJLwhQRTzG27xqxJQYleDreMzo=;
        b=b5xIihMi/12v9J8tLHPQR7TpFuflO2QbJhfvI3ukFF/0KVJzatng9QJV0mb+i4GzIK
         NCsb4Hqn9Z0zOxpkyymIRmUZiYllaPtuLhP2sozA+u+AlN2CbP36jnmImvfHGABTF1Fw
         kZj8QBNv718aHV30Ma1m9RqusstL8qojJH5sCq+VXHMyluXDfFl9uQVnLB/d0ECfifI7
         l5Kyb2/OFRguoEdlbCWZQoQOBMGNLy3XZA+G2Be6mGvCi4wUAoHJFEVF1CUOl1+c4wV0
         j04MIJIzJzxDVtAmUnno3FmsrxFMPNLqOLN3Q+gD1lv2tOvc4/eQJQGYPzY+g3XLGm2Q
         4X/w==
X-Forwarded-Encrypted: i=1; AKwUvBwWKvAXux/mTuxlJQo9cII6OphS/7zHyP5Wqdfo8604KHB6UFzjGxdQBd4+YTWiPC2C4la9NJrvnEEgq3L0oA==@vger.kernel.org
X-Gm-Message-State: AFuF++kWBQglJKHxKM9Q/qXqDqEsGvbWrLVaxWAJLXvp1sg5JlP+GtX7
	n6OVXZe6P1l4p7lSa4CKZunKbk6oWKo8SUSLn9uJXNCebt1cdPxKZbS3
X-Gm-Gg: AYBFou1IPBg5uktAoigZFQJyB6H3RunSs3m7BbdWwQWfOB1RaICZsNBlb6azo0GuMKM
	CiN809nLthHhPMHKT91e9D1Lp+oreEFKu/z/q4gVSyO5gav50pHUqOIN6p/0NGANbCqJWUKe2Ad
	toc8qIPhVHeEWZzs3rfqnuoZ0Kocm81eBOB5kA/GnymtPa+BOop7ZHc/iQjW/UNsTRvmUvvsQp4
	yvHDuiwWHTf5ohz/0oIAiKn0N/ntctkpAEup97Qw4OysR96wEHHxfteGIWngjoYKOKbBl2ciWvq
	17iNTO5ayR+s/zFeSg/qTk1wzLWSejzg7xKKbVAn1p+DNEBy2R8CGD8Y/g2UQdtt2e1QqHrjNKk
	eJJxGPrruZMmP3Ha2BTY8HxiNkjY26BooBW6ucCiJFCrZ20laHtSKiklZpwZVaEonkn7XDnO/DI
	utXO2tH+qEhGcySTbqqEiEPQMpnSM37hEUpLS8xPn9d/D2BYcJWYgs/uSBzHSx0rEVrEZ6XbKst
	ipqmmZ72tKktON+LvCHWbnf+g==
X-Received: by 2002:a05:600c:4592:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a0276b6860mr10617665e9.34.1790884745507;
        Thu, 01 Oct 2026 12:59:05 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:59:05 -0700 (PDT)
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
Subject: [PATCH RFC v4 08/13] drm/client: splash: place the device tree image where it asks
Date: Thu,  1 Oct 2026 21:58:42 +0200
Message-Id: <20261001195847.141192-9-maximpedraza@gmail.com>
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

A logo supplied by the device tree describes a particular product, and
where it lands on the panel matters: some panels only show part of the
mode, so the middle of the mode is not the middle of what the user
sees.

Read the optional "logo-position" and "logo-offset" properties of the
node. The position is the top left corner, with -1 on an axis meaning
centre on that axis, and the offset is added afterwards, which is the
only way to say "below the centre" when the device tree does not know
the image size, as with an image in a reserved region.

Both come straight from the device tree, so the sum is done in 64 bits
and clamped, and a silly pair of values lands the image against an
edge rather than off the screen: the blitters do not clip. Every other
source keeps being centred, except the BGRT, which keeps its own
offsets.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 73 ++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 444f612c48ac..349f68d392e5 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -120,6 +120,14 @@ struct drm_splash {
 	void *map_data;
 
 	enum drm_splash_source src;
+
+	/*
+	 * Where the image goes, in screen pixels: a coordinate of -1 centres
+	 * it on that axis, and the offset is added afterwards. Only the device
+	 * tree asks for anything but the centre.
+	 */
+	s32 pos_x, pos_y;
+	s32 off_x, off_y;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -252,13 +260,21 @@ static struct device_node *drm_splash_dt_node(struct drm_splash *splash)
 	return NULL;
 }
 
-static bool drm_splash_dt_available(struct drm_splash *splash)
+/* The optional placement properties of the node, read once */
+static void drm_splash_dt_placement(struct drm_splash *splash,
+				    struct device_node *np)
 {
-	struct device_node *np = drm_splash_dt_node(splash);
+	u32 val[2];
 
-	of_node_put(np);
+	if (!of_property_read_u32_array(np, "logo-position", val, 2)) {
+		splash->pos_x = (s32)val[0];
+		splash->pos_y = (s32)val[1];
+	}
 
-	return np;
+	if (!of_property_read_u32_array(np, "logo-offset", val, 2)) {
+		splash->off_x = (s32)val[0];
+		splash->off_y = (s32)val[1];
+	}
 }
 
 static int drm_splash_dt_load(struct drm_splash *splash, const u8 **data,
@@ -311,9 +327,14 @@ static int drm_splash_dt_load(struct drm_splash *splash, const u8 **data,
 	return ret;
 }
 #else
-static inline bool drm_splash_dt_available(struct drm_splash *splash)
+static inline struct device_node *drm_splash_dt_node(struct drm_splash *splash)
+{
+	return NULL;
+}
+
+static inline void drm_splash_dt_placement(struct drm_splash *splash,
+					   struct device_node *np)
 {
-	return false;
 }
 
 static inline int drm_splash_dt_load(struct drm_splash *splash,
@@ -459,6 +480,26 @@ static int drm_splash_fill_solid_color(struct drm_client_buffer *buffer,
 }
 
 #if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)
+/*
+ * Place the image along one axis of the screen. @pos is the coordinate asked
+ * for, or -1 to centre on that axis, and @off is added afterwards. Both may
+ * come from the device tree, so the sum is done wide enough not to wrap, and
+ * the result keeps the whole image on the screen: the blitters do not clip.
+ */
+static unsigned int drm_splash_place_axis(s32 pos, s32 off, unsigned int span,
+					  unsigned int size)
+{
+	s64 last = (s64)span - size;
+	s64 coord;
+
+	if (last <= 0)
+		return 0;
+
+	coord = pos == -1 ? last / 2 : pos;
+
+	return clamp_t(s64, coord + off, 0, last);
+}
+
 static void drm_splash_blit_pix16(struct iosys_map *map, unsigned int dpitch,
 				  unsigned int x_pad, unsigned int y_pad,
 				  const u8 *sbuf8, unsigned int spitch,
@@ -657,9 +698,10 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		}
 #endif
 	} else {
-		/* Center X and Y */
-		x_pad = (scanout->width - bmp_width) / 2;
-		y_pad = (scanout->height - bmp_height) / 2;
+		x_pad = drm_splash_place_axis(splash->pos_x, splash->off_x,
+					      scanout->width, bmp_width);
+		y_pad = drm_splash_place_axis(splash->pos_y, splash->off_y,
+					      scanout->height, bmp_height);
 	}
 
 	image_data = data + bitmap_offset;
@@ -742,8 +784,15 @@ static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
  */
 static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 {
-	if (drm_splash_dt_available(splash))
+	struct device_node *np;
+
+	np = drm_splash_dt_node(splash);
+	if (np) {
+		drm_splash_dt_placement(splash, np);
+		of_node_put(np);
 		return DRM_SPLASH_SRC_DT;
+	}
+
 	if (drm_splash_bgrt_available(splash))
 		return DRM_SPLASH_SRC_BGRT;
 	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
@@ -1141,6 +1190,10 @@ void drm_splash_register(struct drm_device *dev,
 	spin_lock_init(&splash->fw_lock);
 	init_completion(&splash->fw_done);
 
+	/* Centred unless the image source asks otherwise */
+	splash->pos_x = -1;
+	splash->pos_y = -1;
+
 	if (format && format->num_planes == 1)
 		splash->preferred_format = format->format;
 	else
-- 
2.39.5

