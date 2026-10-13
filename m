Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE53F65F7
	for <linux-embedded@vger.kernel.org>; Tue, 13 Oct 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883984; cv=none; b=InAi1I0xtydz1TLkvbBQKdg/SPtZUlE3xqZYcJySvJL3KE3C+P40OJd+Zz2oOU11vW3HIvDRbVdANn/LKmNM1fJjvCqd4ysMZJLjhXFHGGQHLN2xOPcQw3oBZo1k+HZXr1u5lFDL1+EKi0P1j69pnX5xgEi5DxHYHp3fqa1b8U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883984; c=relaxed/simple;
	bh=ZcbqbnyKp/n0WpB7iv3NE32Z90PzMJn0VzjmrHwzo7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSqyWc37VNChsdTOesxKJoPTi8bGvJQBk9PQuVZ4Mvirj5QHdTpLpfInb0ozMBORQe4Yu/aGvcof3X2/2I9oWmH6Tg+SBsGk9GpOpoBa5jy8Q8Tt3o+Pqj6Dkrp7jVTT5plQ7NTRXg+zggof1A4fglipM7gQG43Dmx/BYeEzyl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO4IuQrp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO4IuQrp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2613452f8f.1
        for <linux-embedded@vger.kernel.org>; Tue, 13 Oct 2026 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883981; x=1792488781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=YO4IuQrpAgMQ1QTHYH+FbmHY5hdO3sxVdQQVqHeFHVFwm9xWq9m8WyfZ4PqVGPUXfG
         vmrcKP2z5UV+OR1qnnld2DWRRX1/UEoG4aR0xoP7+3MIAvbWrqCxMR6WhGj6Nr2t5fry
         Z62b6rLKlgAG1muWc5OLvQcimskiQaOo0KFxQdDbFkx96r9q12IWDyL5DGO//A7aF4+g
         uREQ2SEwB8Sm45g7xOvsF+3nGva3w+Pgdw4sxJMD1NL67NhKAG0o41XCJO4wXWIRDoYp
         CbLDC9d7a0DStT5PbujUfMtIl6kbkuUn43/efTThkbV8MJ4+tbm4+jxE6NlRKLuY8r8H
         VwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883981; x=1792488781;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=rVw8sGg+lPN+XGnGwvbwnbX3PR9EH+b01ErAie9QLHbNjPIHdwTloNPdsnMEcmDWYP
         YIn8H2zdQrbGAdLbaNTBNiDMqTrHGvgC/YUeroQniJNA/EFlEBAYTRBGOjGIbDPsXrqz
         09BW6iIIjhvmYWjjjxpFwSAiQV6r1HrLKU8H2wvz49scWnov/mMlXaz+vMe7Z8gwKL1w
         xSW62WJBu4/aIjoMWI4Sw7uZaRvJJgqXg2Dk/4KRngn47E2jV4sC+UfQHHjkWNDs3kCl
         IsLbObCthS8vxzjinkOplW/rnxEqdWyb/VkQDO6Ykpo1z1DhjVnBnX5iD8OmTMtX6PaU
         G9wg==
X-Forwarded-Encrypted: i=1; AKwUvBzgJF+A7z+rhW6Kcj5U9nqbovqaOkBGU3CW03wz6m4aK9eiuLwk45w/J5BqGI3y2ddRQEaepMTnppLSr68B5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIU2WVHuPvUtS5xQhoqoGJ5gcOCVfoYRgs2J+3ybOL1Dq2uOmEX
	QoiHqQRGELdd7x33bnuO0BiCTLXExyj1GyHbji199isD1UtdZV3i4/TR
X-Gm-Gg: AYBFou13lFa2fZHaF2x1Z9VxRiMVcMO/rjggaEA2S9GAE29pQstoiamFGoQ/R1UbG9c
	sLOb02SDyQZNmYRhDcgJrVXxsXgwuLkWjqFPjibCrFszJ9I9SgOJ2wqLG/0lFtwc7nYE05AjwTn
	w7CRDXYr5gbrk9v0+BPaQGbMbuWb6Ns7d5UJ4Oxv8kA3xzao9UG58iRdiX1k7MWWzNk908id2yY
	sW++DOmGJWVp35k6j4OO+tAfqOVSIHer0lMRg+STRZ5+/OhUswG9oiDoaP9YfYtpZWzqiJ5oFlz
	sxaNcz5Mk7nuLTg/Isk1Co7uQqMoaeb7tLiLmvCiBK1v0HUELEPHYPv/wGtQ3Dsego1f+MBl8fb
	NfpjPyHYXNJWCNwUUkVitAZVopD/J3qlaqtLN7DeZFwUUAFecsgLoqsHxBCDXm0//s2QFyDtthM
	1kRBtwIDTsaBagohyzazAXIqB5+ngCUQptQpRwYBaN2gCr1nZp6GqtAruPfMQzNQQbqkrjMmkRa
	gIwa650T02GaXoP5UBb4sJG
X-Received: by 2002:adf:e712:0:b0:488:7927:9ca2 with SMTP id ffacd0b85a97d-48dbace0e05mr17961496f8f.49.1791883980607;
        Tue, 13 Oct 2026 02:33:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:33:00 -0700 (PDT)
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
Subject: [PATCH v5 05/13] drm: docs: remove bootsplash from TODO
Date: Tue, 13 Oct 2026 11:32:35 +0200
Message-Id: <20261013093243.505776-6-maximpedraza@gmail.com>
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

From: Francesco Valla <francesco@valla.it>

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index a437ae5c71f4..e77de5e2a24f 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -773,23 +773,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
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

