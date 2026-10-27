Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109229;
	b=DALFjlhC9fZ0iIaRYELs5PegXkebTCc+zFmvf6PJj1WARA3D89pjFOGOASk24oqp7PnZ
	 HOzRBzPeDj448dLfjGedSGskl7j1l+WOmQ339Z7hLb21FYBAgK0IwtZKo3xzJ93nROYxC
	 4SatUn8DUy28N1Ih5YriUwLJ7SEohZJ0vH1i+JPdwti5iJymic/gSJBmVjbE9QuhTr3xc
	 I5QNex7EN/jjarcQQI76pVkatgkDbbOlkeIZz5ypzO6G9300D2Zza0MEK8F7axE0daNeu
	 5UKecOlv3bA1x/eT0PBLzS34SqOQgPkrm4aSL6pSCBh8f7tAsuqni5cboNxFgXTCMMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
	b=NqEy85WkaaHORtYINsVYObRZ66pG5sszdva6h43htU4XvPUYCeqyuKpd8hxgsz08cbY7
	 D5bM3h4gBXDoW1RFVztrIdBbTc/j7or/5lx65KvhMfHMfgiHuDI3c4MU5QEs30RgYi5wE
	 i2T6CyPaowpZSGMvYHPtHKtl5uOeDFRkdYLG2Fj0ooyXguB3neT6I9UR7MFfFXBOMjxSO
	 NaQlG4vuQeIFnJkg5uO33zr41s5aasJs3xP9oLnOzZJcxkRm56+z8b48LGAQ3mm3CttNA
	 /FwCCG7Jba2ZW0/glpr6nLyO0DgbMrvWh2f069+PX/AM4RwfXjsAMzsNWpydjvXrW+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9EdSbtg;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB986606A32F
	for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 13:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB986606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9EdSbtg
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2712372f8f.0
        for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109227; x=1793714027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
        b=J9EdSbtgiLFlXq27G6BCfiLyCUmgTmamz/0X4sPuWGR7PI4baQHTwUqiGYuOjNv+Zw
         1+lFWIFT+YbazTtQ73hJYOUYzJ3Z4g1NZE2eOsEyEZytb/i4LPOqbzR0IbSPSNEytzDz
         1hHhw/E32QerKbf6y9ivfV/PqizTxvtDena7LjediVrmbjhB5EjOWBkPv/tNqmWrG319
         Ql3I/u4j6qJosxpMmd/ho6YxJ26kxYdNzdxIqPRZcfKDqva/aEjEcEyumDsrF2yfWlTf
         74MjiDyd35Jl7TGIWolX3bWIaH1dYsBJ625xdzWOV1luCLOkhS12QU6RQOgcVXRjuHtC
         2PGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109227; x=1793714027;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
        b=V2UTR37Zd7EDSzqpTk6ZsjQND6AheHnIZGS5gYhAJ3VVk7471kZqJaosW11E3s5ivo
         05y8WVVecVj2E2Oce2OdPgGCt3MJvQhNS2yzuACBgPpEFSElPBcGDOwbiwqQ1dUBWn2P
         TR9ivk5pWj1d/QtPa2TdxzbyV3ExnnZT8CCVpYRZi0oTuS/n50g3Dm/hBd6n7QQZKagm
         rmd+7lVqGx5n10lIodOInEcjHq8+Y+97UYUsyx/oIDArz1C1sGGo6QqSKJL2U+Ec31eF
         W/h2GES7/zGBjkAEXFkiORZ0/CY36MT1Vc14oYOHamf3FREAcXlDQyianMNwsB+oj8MS
         3KKg==
X-Forwarded-Encrypted: i=1; AKwUvByLrNZQ7+h8b9BxpKnM7KIr1r24zgLu1+T/rKvuZX+iRiVCElX41DV2cFQWofrIWt7t5oEOGQVLzM1VCyN0VQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKBuopVZci3rSM3vXUDdkuLgq27jyIpm3hEM48ofLaOMgwLFs+/
	Rs2WE4ocW4N6294ylGLdjVxDxM7K1eUcAR9N9Xe6vkglnvvsHvfJtlZ6
X-Gm-Gg: AYBFou1cka69BaRk3glxVpJC4SFYU8Ct4QpG+r0njQ9K3kFUyThRHZN8bhGC59vrdlI
	N16GZN0ZwUYwUZEwrOOvIpyHs2u8yeYfiulN/YO/x/IzwIsqj7r29w7Vhuy7XsbCqjprph65PqW
	Xunf3U3/guOOsUXzWUI/0jJnk72k+7tYF5mzkXP+iAKIpxGtAYLOI0Z7U6UGkceMRWu6uKXO70z
	A0S5iQkUtUerGBsmBj279347q6K/kYnENkGn0KXQQIpBLRo9LOssS1KQ9ZDZcEPmIEqhxAMzuVA
	u8WIg6GURb3nASZtjqQxotnMvAtTaLCRIUu5kj3trqOGzXG9UwhBSJw8Y5AIfDyPERk0k5O5f/F
	GT1VX1AuZwpVIKdm/654CbuGjFaLPnODJLs8jAzseUqUdSQxOWRJgVtFemloBeXO5KMlOaMD18m
	PU8Q9NXLwrxwU2LhHZ2Rtqdrd8A7wCeYReZgnJCLnxLVSXp+zQF/EKorkNrufBbnlQvFwMSaEs+
	khtzrzgwew/btvla0y9VvefAuzbI6TEFKTdJNpUnj00m+rYPbLmP4eG1TMCGiq/875hjKROaEMm
	HlYW4+En/FHC1hl0vc/qBpLH2A0x
X-Received: by 2002:a05:6000:43d4:10b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48e3eba1660mr15009254f8f.49.1793109227175;
        Tue, 27 Oct 2026 06:53:47 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:46 -0700 (PDT)
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
Subject: [PATCH v6 01/15] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Tue, 27 Oct 2026 14:53:28 +0100
Message-Id: <20261027135342.2003632-2-maximpedraza@gmail.com>
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

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Assisted-by: Claude:claude-opus-5-5
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

