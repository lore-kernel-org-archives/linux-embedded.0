Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109246;
	b=flLCE3FkonHN7gplI0W78nydQA3VBj2vUzxd0ZPyVV9SqY5aPl8Sb7+GWaMzXCynsX5E
	 RclO3UQEfFPWQF3lGHfwG9TCfbOlRB7EQXOxyVJrLKUy+fgQ2ddcc4CKE9hDF6kyNOgpZ
	 DLzhaaIPBL9IPFPsVlVzL8RTnrTrE+k4axkbjaD6IklhDHNvacPVLggHwqsO2EBY6EapB
	 +dF94mpH4g37dUy2/2SOaAuhG5JiXco/nSCnkeJeiPfuR5OwKOu98UbIzhi6GR0B4sowa
	 4oogX1LqiMlRSW1o46w3+k3odpsZRfGPeX6t9O+wIt3weaI8WoFJcroEaC5S9vdGa2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
	b=ugH9pxUkuo/KJhIEzE1kO+/R3gEcxitRDwyp9ag63jhIU8oibwD3uzELSVrdOqeu5wXI
	 DLm/RpHbSXZLiAfSFSnZr3GD7eA4rZsAKpD2UX+RRKwlixJyyaxfQIzRFsuxyTPAeVdWt
	 6vL2QwDq9T2SBS6z/R3NORKVa11JvKlFj6L/kg/0+UA6ydatW8fvlVXWVH5eDILUrexYQ
	 3tuVfUib7PepPh7EBF8vnJUvT4S/CMLPfaSQzAF1OCPxlFj3XSPtz2IpA+yEDuPfaGzDE
	 sYoaxKcJB32x6spALAuLI2lQbf4E09M/JKuMQyei/xTXyoAbuC9kFoLAqKs7phHktqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CXibKdWQ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99A60A382E
	for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 13:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D99A60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CXibKdWQ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso2406655f8f.1
        for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109245; x=1793714045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
        b=CXibKdWQ9F7anjrgC0VMM7aDjT7IZMsjrShnAhjebv9ylc+23J4tWOL8QvB+1moPRX
         +ccoc8d11rCpEb7OtfOrgtPIf/fT8tmb8PVCSRTYx4nbwMkcpY2vtHqVUEpb/OC3PRSX
         n0Ia7Prd8lLKUDe1UZtgqbfo5N4cIvFxQz6SXiyEYg+iyq3EZ/1FhxyWHv5iBM4l7xCx
         7F2ocwI8m+BeAbnle6aJRUD9PWHXDbHOYkGek9AI74WYQgNsj7qt8kMlhNAd0+KVokOO
         6MNd4RtF0WI/55ngrMNg6XmUK6c78cp3ggmzgkKmzUywXESizZ7nCpjNOly4WKzfIN4I
         Qk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109245; x=1793714045;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3TRWoAym08EDkUmxJbEElxgHRIsBB4gzy6Y/BELf6M=;
        b=QK7Vb6fyCTZt1Z3jsniJ7FAYS70afsoDkAd1zs2C7wwvx1lL+3r41BsFkmOoC0opWz
         KqdcfiXVHEicyzN1qYd/O93nUCW9kbAR0yaOWvd+i9n+kYAyFHXIRfQv9vrFhJ9CzwwL
         JQG633KKDj2SJ5Gkd6B/aIQ2I4Zx088HAi7iWNlZVRSl38S1rCLpqmqJTcsFWSoz9bwb
         mAPKUN46cZ5YEaCr9I14NAHmzoWdoQHR2d45QIHS6DvwYFMKNiLc5fwbm4/72HPnrIhi
         ouNsXdLM6n3b6Z3Vl42+9MQEUCgyO45T9Tyme234gYIlKc7QaEoDLGR8KODPxm4RvwB+
         NClw==
X-Forwarded-Encrypted: i=1; AKwUvBzGLX3R6n6uL4/uRVVLO0RVHPcYGUrpqszPO3TAMwesChKlZJ91hEyyy0JXRYI4Bse6zuxvoijsTwmzawxPjA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+Do5G99m9YM5hljXyGUbD2REApFxedR1K9lCa3uVQjiHPBvju
	Xlfj1t6t+c6c2HAa265yg+Z+PbrjVXHzgdrhz4+32eV4ZcGT9rRBXBzE
X-Gm-Gg: AYBFou0OhZwpA8/NHhI0oyuoWO0DlD5J7wlQWmKBXmGkRAZIloKhTzObD6XmVV6a80N
	qxtM5QhwIf1gzh8y+y7RZ+h9mzjJzE6rjDZFZGDpFBJmxEX1L+idKaRPlHx1DzN4FYO2tvpJTIS
	oKnapt2C4rgK2H1FG+QPtBlKd49sbKydGItkaS7eWqH0K94A6DrCAg7aYYOpGK0UPwM2jKCphbo
	yHl54CNrrDY6R8Iw1GimQ1KyCB3Gt2GmGJEN/BYfpz9X6SVi65Xq28z8SE6ZfCy3gdw0WR4RM5n
	kBKBwzaB7E2zl5MC5dKmKz0TdBnGaQd990MZVJZ8RuyIPJKoWUZ3JI5/JYDM0FO5gApSdYCRYV1
	CDj5IyN3uUJo8W+QyNCNOlR4hXIdtVVCOEPE1oSNvHOFxSDT+giB7YDGB0z/Q5JqpBvKhgfyi27
	F7G3X8zCP84DxWMB4uIAbOZYDw3Vm9SDUw3nAUanXRcge4Ug42z7ZF4FeSg0BhWtABd8gefHkeD
	sKX5sJpjp/cSEnyKrGKlg6g2yX3820J5j+vc9yZBEdEkYJg9HaFM8SM7wIfvU7JSa81JJPHSRPA
	7/lkkrtNCxQ0VBbhFcvffxjpULo5
X-Received: by 2002:a5d:5d10:0:b0:48e:1c72:abc with SMTP id ffacd0b85a97d-48e3eb9890amr18924302f8f.35.1793109244645;
        Tue, 27 Oct 2026 06:54:04 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:04 -0700 (PDT)
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
Subject: [PATCH v6 08/15] drm/client: splash: pick the image source in one place
Date: Tue, 27 Oct 2026 14:53:35 +0100
Message-Id: <20261027135342.2003632-9-maximpedraza@gmail.com>
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

The client chooses between two sources with a boolean: the BGRT if the
firmware left one, otherwise the BMP loaded as firmware. A third one is
coming, and with it an order of preference that a boolean cannot hold.

Name the source in use with an enum, picked once by
drm_splash_pick_source(), and have drm_splash_image_load() switch on
it. No functional change.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 45 +++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 337c7160c4a1..911149b92a52 100644
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
+	DRM_SPLASH_SRC_BMP,
+};
+
 struct drm_splash_scanout {
 	int id;
 	/* Modesets scanning this buffer out, by position in the list */
@@ -87,7 +97,7 @@ struct drm_splash {
 	const struct firmware *fw;
 	void *map_data;
 
-	bool use_bgrt;
+	enum drm_splash_source src;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -429,7 +439,7 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		return -EINVAL;
 	}
 
-	if (splash->use_bgrt) {
+	if (splash->src == DRM_SPLASH_SRC_BGRT) {
 		x_pad = efi_bgrt_image_offset_x();
 		y_pad = efi_bgrt_image_offset_y();
 
@@ -498,10 +508,31 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
 				 size_t *img_data_len)
 {
-	if (splash->use_bgrt)
+	switch (splash->src) {
+	case DRM_SPLASH_SRC_BGRT:
 		return drm_splash_bgrt_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_BMP:
+		return drm_splash_fw_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_NONE:
+		break;
+	}
+
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
+	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
+		return DRM_SPLASH_SRC_BMP;
 
-	return drm_splash_fw_load(splash, img_data, img_data_len);
+	return DRM_SPLASH_SRC_NONE;
 }
 
 /* At unregister, once nothing else can use the image */
@@ -818,10 +849,10 @@ static int drm_splash_client_hotplug(struct drm_client_dev *client)
 
 	if (!splash->source_picked) {
 		splash->source_picked = true;
-		splash->use_bgrt = drm_splash_bgrt_available(splash);
+		splash->src = drm_splash_pick_source(splash);
 
-		/* If no other image has been loaded, try to load a BMP as firmware */
-		if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP) && !splash->use_bgrt) {
+		/* The BMP loaded as firmware is the only source that arrives later */
+		if (splash->src == DRM_SPLASH_SRC_BMP) {
 			ret = drm_splash_fw_request_bmp(splash);
 			splash->fw_requested = !ret;
 			if (ret)
-- 
2.39.5

