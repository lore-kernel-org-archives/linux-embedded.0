Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784926;
	b=UMRA8OWC4HR1BSo8qAS45jxFyPhtg1UWhGTTYzGLDfUHXTl4HOrvcDzG6MN+s29y0Eo5
	 EPzeO40e9It3Uin4WeYqdSBrgTSdwlU0D3EHpTbRoqYOS+9gmtZ+8vT6Qu0TwgXU0kXbn
	 IO+UZQUCGt6oKIgDXGxrP+bWtKsmNc27jLrIJIDopBYjrPIYg0heLBvfHt8ArJ4TILNw1
	 0FzveXQDCahZXc/k8Da8qXkUOlGTlXKAxnYRBbD3DzC5yyYozptBKl0yOFjPAG5xxBFW/
	 TVZ4fSjrXoaMnOgqyocYDHz67MBNHk2CieS6ET7Y80nSC9NPwfwbruVts3+j31K63AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
	b=qdHGM2/viKcAD7R/8P9FWqQQRGV/3Dp0MXG/KdJtq/azCzEXhN7uL33wV/ECc9Sh/kEF
	 nGVfJ2eD6ZOjJhw2AIwbNEWtAGCVodS9wBaLjEeAxJw66CMLGnZZbCI38iRlbu7Z+QYX2
	 qdjO1TMfU8pfcw44Wqx/KfOmFoSDlYTYjzE9zx2AJuR2frga5TjU9hp0WHi/zgQAo+ZrL
	 Oz1aT1CIuKLKB1jTfeJKe5QuljcYcaDz7aCriBWDtEAhjhnQp3qXbvatPDZBU8pX0pjzr
	 p+8XI42Wg9+M4tnWtIp6TJ8/yJUWeMPLjiHcM3/wbvihd5F5h2hSsKy7Wm08mb/Vstw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbX8W3B;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC2606A88B
	for <linux-embedded@vger.kernel.org>; Sun, 15 Nov 2026 23:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15EC2606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbX8W3B
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso30651895e9.3
        for <linux-embedded@vger.kernel.org>; Sun, 15 Nov 2026 15:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784924; x=1795389724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
        b=ASbX8W3ByAyt5NTODXjPhDEF/llLXL3T+KSc4VFkXSFgOapFIsx89vR4EdHZKzpZ0d
         9OM0B6CkzCWrddXddFfz01PXzxCoLgXIaBSau/cqNSaG/CksiioPlexZ00OVV9do2ufn
         16+eH+ODzHnZBHfhjCxkG7ZJOv2pbKYZ1BXXuP2CqJh+nz+aI2HpkBudQNFKQX1ILj0g
         S78ThpG5NCzY5IsLhI7Mlr+GrpbtjobJHvFRpPTSwjND4M78iyD+2cqOZBLJGEhz23sr
         oZwZWmS23kYNaRtQX44IMSquUhVG6e15QCQOy4AfKBDm+rsn0onfwkmRoyd26KDKjpwt
         a2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784924; x=1795389724;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
        b=X7s5FqWVSyqek9QwrGt7kHFu/mAOTESxZUbzvdTcUFLyb4sP4du9D9KzYs1NSK3emN
         IhTkYDWFYQ0YQzeGHRodWHtOywoL0WWLcjpUyGwsmkFrOlfd4F6uZ0YvBlERU7pP2/Kc
         Z4/wInc5FuVO2+X4MDrnoVnezNXsU+xQGJtjmKEG8Z0ww0mq0AXsbeKmBB9PZV8rR8mT
         4fPywqw23wxLxwQLNLqey1WfzpzY7aFuaEehhkJfliT+QrjMXZq++6YCTmdkkwzgbAu7
         lhvp6huRSgbs2nGNuHTGCFbaHLYFXgTLwZZew8I3LPzYQBcRcG1W1DbK7w6yiDmk1lS8
         +sOQ==
X-Forwarded-Encrypted: i=1; AL+hErHgIOwYl8UYyyAW5mlxdiyEHhZ5AE2utynvHfgTud32RVh0Wb0TBbb45E9WLDxUBqygkDH9EtEVzDF4hDwhxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kLrKNM637h5tprFcxaZIlnZskoxc2zSRdN9PJ+0YutoMymj1C
	pFKngzDVcXsU4rnqwcccAPqw2MC3xQooJKptWXvE1BGl2g5nS4Zaoiy7
X-Gm-Gg: AYBFou3+89T2cPiWMvJchBD4tfGYGFlYnQPt3LiJzuCO6XlH+sw4dmMBZPCHvl9wEmi
	hqI+RbKPqjNrbbRQpnTsvP25QjVdwXDEW531u9C3mZYNCy7n5KLQ0SwcO/uWWmHoX/1UJKJUbKV
	EmftscOBE8dxDCbK8xUkGEJyT+H/Xa83ScejPw6eHQkmIBIN9HTTe2rpOvG58Cx78oT70g87vH8
	AnGsMVngA9OUpZXAVnLl12pc9Cx95h/Yw+7aXwbbqPPMgZlID8POpivD4ei4axsbLqnZyxSkUX+
	0xcS4zbIowFo3yBXkR6i7Ov4uHCsXrc6XCdPqfkR/8XhIY1VzEfIK8VSNmduSfUoz0GrlXkIK2l
	wwP5Qbe5oFurv4m/cPDA+Dn6x6hOv7WkERzRswh++W2I42+YT9T1F9L3RyyUuKiXG/19MVvE8G8
	MO2o3AaYSM7k+LXsPAIueTVbJjQV3V4ukGBISWFyWuqhBA40fu4BEiDVVe08SK0LyLNicJEV5HT
	sPgatPpXqhIqZpN2WEMrvAB3epyaEPy3CaVGrUcm+Fx8/ZVYRsAZHMkrcDFycaDNFMwiXwXzH1Q
	/WXVKdpP/88j+rj65EQHErLqeM2r4wvu/E/PfGMV/sBmgcxOZs+a4C8=
X-Received: by 2002:a05:600c:482:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb55a59c9dmr137490185e9.22.1794784924398;
        Sun, 15 Nov 2026 15:22:04 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:04 -0800 (PST)
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
Subject: [PATCH v7 1/6] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Mon, 16 Nov 2026 01:21:51 +0100
Message-Id: <20261116002156.1027726-2-maximpedraza@gmail.com>
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

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 6096c623d9d5..8d8bc37ec9f2 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -114,10 +114,10 @@ config DRM_CLIENT_DEFAULT_LOG
 endchoice
 
 config DRM_CLIENT_DEFAULT
-       string
-       depends on DRM_CLIENT
-       default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
-       default "log" if DRM_CLIENT_DEFAULT_LOG
-       default ""
+	string
+	depends on DRM_CLIENT
+	default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
+	default "log" if DRM_CLIENT_DEFAULT_LOG
+	default ""
 
 endmenu
-- 
2.39.5

