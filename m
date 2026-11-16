Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784936;
	b=vgz6+3egYWihX9drNJnZnTOkhOqGP/rMtBdN3+zqrOue6Y0kaqCgUYUETz5JqMKnEDI3
	 03CJsWdfB3ztLSB0GVltlkHPk6MB3r5sxHXktZltdroDCDPnb04l9V3OQd+etqRMyL0UB
	 CYFpbHRriZKgZ8379aHnd5f1pdHAue5oySXHqGOe7kOLFITCQfl7y8VlP++63BK+PxtXl
	 5V0NHMwlzzvPCImFc3xPNPzyWDo5Y0jy0TpCl1Z967tKZbATlwQeySX3V0FvVRxcrneqS
	 pS0DPtIJnr2tpTyf1ZABuYjKeSfwy8uY8X4jm0AjDHhRU1qmQARwYIQwQK/d4VtQ4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Erdyei72788KVv8pLaqul7iSgCQZTDqlNCfVWoF2cUc=;
	b=qYw2LW2E+52cU6W/1CneWirDe2MPTeZzawO51rwH+y2wCnbPrZXmwbC6ZPktTkldcS5a
	 cSVLkyGuJSuXWGinlu6iFPke94TOuKrJgEV/6Y+BbprLlNFCqOrZ3w3OTh6zehOpV2gDj
	 4c7H9uPQUw5LcwLsRQi2oTMRm8qaqAut6dGXaH7wd6eRWzn7RYBDQTLa80frYoNVsaYIb
	 p23KuEDNEs0sCNE7HGnsS443rBCw0YgRTEsUCZjFJ2+atrsNIgGlJ/4RBuohFW1hF/Ord
	 mbm8fsmkucpBK2NvIIJY0HPhhv9LRS5bW8lCYoZxvCp4ER+F/pomo/2pSJ9pkametFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LopHEaxb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4AC606A33F
	for <linux-embedded@vger.kernel.org>; Sun, 15 Nov 2026 23:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B4AC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LopHEaxb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so3653385e9.0
        for <linux-embedded@vger.kernel.org>; Sun, 15 Nov 2026 15:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784935; x=1795389735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Erdyei72788KVv8pLaqul7iSgCQZTDqlNCfVWoF2cUc=;
        b=LopHEaxbU8qluG0bNr0X7YSDk+c0OsgMfGYigZ//YqyCiIDFOvvTCgvq4FYIvzWR5L
         2WxbabMKUv2GXxZwVT777BbykE9Pt73WrQ3c8jH0H6c+Yk/nSQLHK/ROeiv3Tw72dKXm
         8LOi/aISgXUGLQTrQ+bZsiW+vtc3Hlkwm+8czErJfQgaIxkrhqXzLcNubNchYhvq9ORX
         7d32GFh8QvbGh3Tp662n1q2rwQFnjBYjEYczFxotThVDzUblLAEP6ycMVbZ8UwQTCNZ5
         xI2aLRfs9lVYfboicZmB1tcl1R+v80EYEwjVpU7PH63NTXJXLv7CFu1m6U9UeZmjcqNe
         gZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784935; x=1795389735;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Erdyei72788KVv8pLaqul7iSgCQZTDqlNCfVWoF2cUc=;
        b=kDrk5Yij093BNdwXZHYFs9VLTKPiUfzDZz64vc0lRBlTxW9YIWsaWRUUKP4gY9Ij5/
         W4Wyt/l4cij5+k6+7u7pykzRMTudY+a1nW6QA52BipToIfXY9JTdH+6z6K5dZxx4onee
         6w8RP7rjFzIKKNch6YmeNZ7VpLnnvzfu3KiVu9qlUbjSa0xhuo4itxuDtCjRSgaOiE+T
         AMVmrh40+x4GSUYPY1Hz03CC+2ww1q4tUy+E5Pq/K2h79CI+SHu6OANDwELjgHJ3p9Tu
         aZviDBTtJ8BCe7pVzDrgn1etghCaodEnNVJZYX469IqJ0Dnd3UEIm6imMa/mxOogG6Px
         wd1A==
X-Forwarded-Encrypted: i=1; AL+hErFyxYR73+Ww8ThLaAprQ1gaqvU1GiCcVyYpt1yzlw7jb7xmAYkCpj+EsGQv8G3uCHXjNi8lbKyZCh9GrAZQVA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1cxoRYnDNg2ntPAx3xkj+oYWrbsEHHGl/UNC9xJbieH0D2eTf
	s8Kuwjv9BLJs5VDSNcnRp2HLLoytIAt73mCXgui/GDT8Zf83eZ1+2JNt
X-Gm-Gg: AYBFou2VdcwH6x4Fv9bcNpDnOlw0StB+GQ5rYYODwGmbweCDepQsJUiJ/y2UC/Yfi76
	uAUquOhR8CxSPU9SwOTPcnJIGABUkh1lBvIhb5Oo36juP3v6E27rk/OYmvfiwKqPwsLu0+UOfbr
	oT2wiL/lTd6s66P5DZ3pQcMtJf0VKSDxq+wPc8V0Fm0U4UmFeO0L/RjwR6tHNsYT2nwfL9KE8Vb
	HyODbt/w3yafPgN+ankDfYoN2oy0F26JtAjLb7qdJzEd6QX/8GraOrfjhTYgewFGgisd22Pq8cE
	v6IlAHIb1QI/rLengbTm9apOrstrAg/g6HFePSSyaOm2qL3YbdlWFTbtRoNeIxqRVVASG6CFjsX
	IqBe2+J4Dr6l+ddkk0aZCjm9unmVwLYr4NLVMNuwtoHuPAvuJygWNLxESWGT/fosWenjzYrBHzi
	8Uf1TsmTVLmnStOkHjw/sJazzrPiJwKoSQEUFYgJpUCnUX9ElG0bM7clxezqe6bnkWQqpe/VxAg
	+2i8JCIjZapN+s30NebaH6fr0L8Q5Neu1P3ZOYT00iKe5vuUoAXVv78zCgiLH4ewWYHpO7advVS
	mBM0Au39aVtqj3ZwiPair5ihZ3hQmJPIwLLn8M6TUmKLEPj+3PBInTM=
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr183275325e9.2.1794784934909;
        Sun, 15 Nov 2026 15:22:14 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:14 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] drm/client: splash: pick the image source in one place
Date: Mon, 16 Nov 2026 01:21:56 +0100
Message-Id: <20261116002156.1027726-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116002156.1027726-1-maximpedraza@gmail.com>
References: <20261116002156.1027726-1-maximpedraza@gmail.com>
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

The client chooses between two sources with a boolean: the BGRT if the
firmware left one, otherwise the BMP loaded as firmware. A third one is
coming, and with it an order of preference that a boolean cannot hold.

Name the source in use with an enum, picked once by
drm_splash_pick_source(), and have drm_splash_image_load() switch on
it. No functional change.

v7:
- DRM_SPLASH_SRC_FW for DRM_SPLASH_SRC_BMP: the BGRT is a BMP too

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 46 ++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index d54cf628cf17..fbbdc034e417 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -39,6 +39,16 @@
  * a static image.
  */
 
+/*
+ * Where the image comes from. drm_splash_pick_source() sets the order of
+ * preference; NONE is zero, so that a new splash starts without a source.
+ */
+enum drm_splash_source {
+	DRM_SPLASH_SRC_NONE,
+	DRM_SPLASH_SRC_BGRT,
+	DRM_SPLASH_SRC_FW,
+};
+
 struct drm_splash_scanout {
 	int id;
 	/* Modesets scanning this buffer out, by position in the list */
@@ -91,7 +101,7 @@ struct drm_splash {
 	const struct firmware *fw;
 	void *map_data;
 
-	bool use_bgrt;
+	enum drm_splash_source src;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -439,7 +449,7 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		return -EINVAL;
 	}
 
-	if (splash->use_bgrt) {
+	if (splash->src == DRM_SPLASH_SRC_BGRT) {
 		x_pad = efi_bgrt_image_offset_x();
 		y_pad = efi_bgrt_image_offset_y();
 
@@ -509,13 +519,31 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
 				 size_t *img_data_len)
 {
-	if (splash->use_bgrt)
+	switch (splash->src) {
+	case DRM_SPLASH_SRC_BGRT:
 		return drm_splash_bgrt_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_FW:
+		return drm_splash_fw_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_NONE:
+		break;
+	}
 
-	if (!IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_FW))
-		return -ENOENT;
+	return -ENOENT;
+}
+
+/*
+ * Pick the one source the image will come from: the BGRT is whatever the
+ * firmware shows, and the BMP loaded as firmware is the fallback. With
+ * neither, only the background colour is drawn.
+ */
+static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
+{
+	if (drm_splash_bgrt_available(splash))
+		return DRM_SPLASH_SRC_BGRT;
+	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_FW))
+		return DRM_SPLASH_SRC_FW;
 
-	return drm_splash_fw_load(splash, img_data, img_data_len);
+	return DRM_SPLASH_SRC_NONE;
 }
 
 /* At unregister, once nothing else can use the image */
@@ -858,10 +886,10 @@ static void drm_splash_rebuild(struct drm_splash *splash)
 
 	if (!splash->source_picked) {
 		splash->source_picked = true;
-		splash->use_bgrt = drm_splash_bgrt_available(splash);
+		splash->src = drm_splash_pick_source(splash);
 
-		/* If no other image has been loaded, try to load a BMP as firmware */
-		if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_FW) && !splash->use_bgrt) {
+		/* The BMP loaded as firmware is the only source that arrives later */
+		if (splash->src == DRM_SPLASH_SRC_FW) {
 			ret = drm_splash_fw_request(splash);
 			splash->fw_requested = !ret;
 			if (ret)
-- 
2.39.5

