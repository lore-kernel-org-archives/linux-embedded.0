Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784935;
	b=bskryIt0n3opcSB8VZyxs1BpD6tLvwWlVkUW0hSL4AUl/pl5R3IHkWWIkzWFnPwaNCwp
	 zsLDfr9i7LR/gg7M6BJwG1gzACaIAg+V4m8YwiEkcFlEAW2apAh+uiFlzMWBJ9/o0x7K+
	 dn9OqLCK4b6kr9A5rzSi6HxDFCioYtI23jFpNSsfaSWJ+OVTTWvkmk4Y10zY5MLVUddr2
	 uDfXOJkqABy9oWUz2sVdWT0LMzfysdkhxPWEaI+yZ3OKfSFXkqq70WAiK8UvhpoyLsYIb
	 9k6jGr6KJZzvE4gQjSqU1JnBwymNlu5PltSyg9yiWCCVXX5NazICCGIVgeuGe7Hzh9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
	b=R3LzVI61mRsaD6/UZjGX0jf7UGTxXdOzwCTdpG7LC+AiDNzDkddrShHdxklAZUDl2/OC
	 Eldai5jcl/KripuCw9sF6T9c8UiUPGI0fVWRuyVwy0TBz+Vj2kbGN+/CSrNhi64IS8uB0
	 yEOppnT3N4rODawKKufvQrDXHxDruNKRrXIQybZ6UKGaLE7ADQMyn3O46a7jXulYO7RYv
	 0yqNbJCjBeAk/dxxWn7vNJCHfbHbbz/+KLRZ3w/B/odbipjy5lJC/jtB1ygiIMqVkgLd3
	 +sedp3LUPlgllLyvuZkvaj+k3S7jBkTqy07qOukR5LLWwJJ6qCb2LUFtErbyJCQp1pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQkNrinm;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D6606A8A2
	for <linux-embedded@vger.kernel.org>; Sun, 15 Nov 2026 23:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF8D6606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQkNrinm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso21144285e9.1
        for <linux-embedded@vger.kernel.org>; Sun, 15 Nov 2026 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784933; x=1795389733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
        b=jQkNrinmnyiH3DT7YlgTu03VUyhi7q9DOquQaVlWG2jLJQvITuOTfMsr31WXFI+y8G
         +Ms42TCNfD1X8Dl6ARmdwurW4X+BahBcgVm8UHxkrzd8kxbab0jv+ZArjfC5id5O4hdm
         GzWp+0uOyvdUhTypeyVI95yeEE2pWqOZXxXXhi8gCTsDd6ZjFC3cyM4MtwGcv3j1c2E/
         I84JM9NZjz4EQwQzv7fYTqHIxRyZ1rZX8ReX7qzYdCxIqdLajnu0wbev3sqsM13aXYpO
         PG+kJApuGBCqeDWtl3PDAywcNnmBGGlKcyWUwatKPfe9hZBUeNTrDbGmpnHeB+Dymb9V
         upkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784933; x=1795389733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
        b=lUe779AWiD0BuEyS7RF5HNtdf9mRUg+tTOdw/9IqdhrjDDDM8Hw9HVK11BfHhXa1jI
         2XNEnXD40uhM8pSxRsvC1p2ZYiBcY4CjLiHzbcrg1kapehvDGFlTU5qNet8mKaY23D3x
         1xnH5QbISycdtTVRzYpRV7xvMCFs5bI+68Y09oY/LWCl7DlBccbmb7E5Q5ppL9XAHjJP
         t5vYMWwNfFsuTI8H1BR0wow6dofAmWjebhANSD+OXSLvjGJpqWpNUrMonHZegWCWu+Bo
         lBn4izWEQ//ErIfM/5hjjGY74CASXHognpu1/JIVcmdzZntnCXb6uSGRm20R7nhzotiN
         XNFg==
X-Forwarded-Encrypted: i=1; AL+hErGqKAc1QY/djbd4aNEPrColHOJH4t9zQiWOj6z/UlNWUcrv87RsXbvwsGWDzDa6M7QigN49skTE3MMtRMm51Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WU99jHi6Hx/nUOJIDCXF7ZadTMOJwCHPy9smfMLBUcLhHt4HG
	HrVV1TpuO0VhJ5UDggfBDoTfTSILatdBNVXGfKvC9frd0NxBvv3JbLAM
X-Gm-Gg: AYBFou0XtR61MUvbTavaveZWwblLhynQ55P5Ha+oAMISo8Wu2jmzmNxeOudj6h5Fg5d
	lvTZ0cM55pNG8Lzzl+tfgTx+J6veU2SbYQMMU7CQlTbq/yeVsCgHthcY6OonQ74VxJeTR8LAeU/
	omdGVkT7vht34YB3cdVhHhUH+/xHz3vJfctZztEfot16RGIh+piCW/018LWt7YVk0GtAG0TD98k
	KDPBSTze7RwGN/flCMcyokFF40UXJk8p7E+8ayZYzaCut0MQjBxVqr3yYQyf7sY1aMDD6mFP2No
	AYZF5iRfq0QyIeZ6272F4XwOZYwWRcdGxDCp9wMz2AXgK9AsCgniwa5otQHWNUr2v4QRwEompEd
	lLF2CMSzDsS9RMwIxBTLmWeqXJtwr21w/+dVBkg+22JY97do9BA3WlHkk5Imk2smAZvGCcnHqt1
	to+/A9c87/xtQbcQ+3BtDqKqVX7uTRDBBrMB3hXQ06F8oQwA7F4b3jWQ1xFnv1I5QzA7XgR3OLs
	BUJuD+XS8pRpyhLY9GDmUNInKoCf0w47MYU0+Hvu1mGMBRrcOkCMWTyJTdGGg0EuOuHEToqD1Mz
	UKEefbokl1AQ1uwZK/dpIYZ+cmZX0lxZQRMIUzh4AQxPq+nBIpuXfCY=
X-Received: by 2002:a05:600c:34d5:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb55ab1610mr175771075e9.26.1794784932986;
        Sun, 15 Nov 2026 15:22:12 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:12 -0800 (PST)
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
Subject: [PATCH v7 5/6] drm: docs: remove bootsplash from TODO
Date: Mon, 16 Nov 2026 01:21:55 +0100
Message-Id: <20261116002156.1027726-6-maximpedraza@gmail.com>
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

From: Francesco Valla <francesco@valla.it>

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..5e987e18bfcd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -756,23 +756,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
-Bootsplash
-==========
-
-There is support in place now for writing internal DRM clients making it
-possible to pick up the bootsplash work that was rejected because it was written
-for fbdev.
-
-- [v6,8/8] drm/client: Hack: Add bootsplash example
-  https://patchwork.freedesktop.org/patch/306579/
-
-- [RFC PATCH v2 00/13] Kernel based bootsplash
-  https://lore.kernel.org/r/20171213194755.3409-1-mstaudt@suse.de
-
-Contact: Sam Ravnborg
-
-Level: Advanced
-
 Brightness handling on devices with multiple internal panels
 ============================================================
 
-- 
2.39.5

