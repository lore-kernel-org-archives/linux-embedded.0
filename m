Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC848A8C6
	for <linux-embedded@vger.kernel.org>; Thu,  1 Oct 2026 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884744; cv=none; b=GdT01MGLePOi5WCl3mhST7e57J+7yvwQNXZuhI+P/ESiy0cBQYmOfMICWlvLyWFtrGRAo6Q1vJGToff80WWXUCxuxUmiNU3OMCxQZxB61s+Rc04CpIQhHtt/2peSNMv4vMUFp/vd9oowrTEa/tuVEJRs7I/mR//obviFpcvfEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884744; c=relaxed/simple;
	bh=ZcbqbnyKp/n0WpB7iv3NE32Z90PzMJn0VzjmrHwzo7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuRzqFjOet1k9zLlhshkqYJ/Ru4WBlsYuXdTdkm19QcT3EBGsgNPtVXmn0llaSN3U8eChOM7lofrU2l+5ieL5kxGYs4XZ69OLXQNxsjmG9FDZ4Ic2fg0RA/7ab2o4mtC3c/M2aHUSsc9qdxozFDsdsFehA3tDh02mATu7X8L4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvBIhhns; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvBIhhns"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso43889775e9.2
        for <linux-embedded@vger.kernel.org>; Thu, 01 Oct 2026 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884740; x=1791489540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=PvBIhhnsEit6xcQz0XNs2cpZv1N21PkUONjbI1P+8mRsKy6OcD3FC0PISN5I9dHOl+
         pd18maols5p/q6fKps/RuzzWaqBQGo0B6mscIa2dBZ0kaoeTdUoNKLuHQbl1Wa8RaG96
         jvLPkTdtMx5oJPg8zh7ccRKjQyUeTXPYWHA4NMgYn3Wm0Jib+yrNxtn7nEjNLQRJIueP
         YjoxXs7A0ac8lCHeY75vwOrYKSzU9Gl3HbTR84Pw4iX00Ulmd7S7byDfYDnEiEGdq15t
         lr4cczp8ExRlIPK5EDgFIH7Q4jDMCVVdZ/+5ngF+OpB0kyEJYQpQtSGdX8js0XTORvhW
         /xKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884740; x=1791489540;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=XgqBEn5bY3ROMZWAfE/kIE0BRgui/sejdf8GorUbVYe9CCt/4t+XCSJh1moqxWrOa1
         i0PgQdTqeQmapZbpnfxqX2MnZV6by47n1yI6nnael/L+RgA9Ox03bsZjUW5EnyvyYH3b
         geg28b1LlKW2KIf+ppl7ZYdKbZh76lILFcV41g30qfWPxQamcBsnKjiqNkA5J2EMS03k
         0itL0ImhekGPsCw7xYG14bENDWzoTdEpiCH3SF7P0inZQkLcw2dbtSMDcJDmua7VdLNZ
         DLp2mYoFlam2RVn81zJTNLCUzQkzrdAsAGILdw/8fjOKALPj9awEqC1DyBkSjrCArkBK
         pNCQ==
X-Forwarded-Encrypted: i=1; AKwUvBylvaHlLcnP1vbbt1sX017DfLEqVhUJbicF3HBmXi7znT6TvYRba3+CJ8/Zf5ipS+fDjU+zXgBuZs0GnHbTGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kKrvFt1gfoLHqAuR0+uIl/wp8+3D2vEHjrhr0aNx0a2jX6WQyj
	2AOSMoSjKYAtJKrxAJLdnS86z/7vEiQ1PAua1rPrCtmgO/llSI9L6B+6
X-Gm-Gg: AYBFou11m2WcQkDckboZsbiXoUv4zpvL6T63IBVQL72lIxbK4fnuCOYPtiCiI3Aev+Z
	oijBcsUl/ArKNt2FzT6lSSH4PWnvev2zn9KGSZzcXZ1e7isS6MaorMvp9XkLpXkv5K1YCVGCuIG
	C740h+89ByQsaXmuJ2QICMldiGCdFOxzGjnAYBAnP4c1ZsbZiiBNUzd7hOd3G+hQp4olMyfvvEZ
	r8HsAlq+IwTWaVCoI8SKQdgpyRx4rm/t7FpfQebNZY8CzunSzlB9hhanlE1yPlFc4a1IbI4yip2
	Yi4nPJiiPFH+q/XDzdmeOfB+GfY8gTUuKCwaMsdyzsbKkqgs2vXOol0qLmw657ajKtGb4Md+N87
	fqBjmUXubXvqbMS5ZeZdjhpmzJXw0dOLvzvfZQD5nMbRx1LSQGmJuC1nCE17WUBOd4avayBlIz4
	3gCbq1gON6jsTXe7cX3hmwTibPcbFSTfLLejPmQXM+vMmtza2v3TPYvQokoJfowahMtCw2uqdHq
	S/UOgeBlBsJ2Aq6Rsgu9X3dYA==
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr12096855e9.2.1790884740123;
        Thu, 01 Oct 2026 12:59:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:59 -0700 (PDT)
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
Subject: [PATCH RFC v4 05/13] drm: docs: remove bootsplash from TODO
Date: Thu,  1 Oct 2026 21:58:39 +0200
Message-Id: <20261001195847.141192-6-maximpedraza@gmail.com>
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

