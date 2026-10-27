Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109240;
	b=mnqabB7Gb4nIbJqYoFunGFqvKtYUY5E14X8LOlkZyR3cTiSVuBKHvHeZABnLzUUgbzqR
	 pp/azoriKMSEwbZFw/8rmjzg85rvxfvF2M6lbGZd7W2gDY85viNQcYFlvVY9F+dc6DjBA
	 QhGrcR9Ia+236XmeuOh/TEn7YpXN1xuC5c7WpCY2Yxulvx/BSNxRcwkzRjTK/xNpqE0+e
	 9FU7iOOTIJsxRyTqiBggSqhMbSHVjz1HB2tRwtjbYzO+Yr0I3uEFH05a+Ur/NTdsoSRFz
	 2+GTBUXSEGkKujZvvESihlmBYNlWSzPjjaA04t/IxjSVmZMKnv6ffMqj6CXax2smxZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
	b=UUp9beOH/ZzFhuiVN56ULY7fQ4mEbVH2yY7JfbAG3tDGJ0ETUHAVsUHxEeLFOJ7SOyGS
	 Eb8o1EdkbJPwIzwbYG3IAe2JmctiKnywTupPTmWooQ2QLLxLy0wfHBtRmImNtKhGF5hfd
	 ZfwDZq99a1p2dVeDb9PzxWNDJtWSf185Avu1WsDS16AWw7rWpmFicns5/7QrGfIyQP4UE
	 4SHyFSiE9qEg5OtKMBH59bhqxTSILsPQ19dDos86SfUNwykmcSyzuHSGDmE5+WxnODD+a
	 XOZdxQjJRjHKr2SZ5uE93+eq0JQxQNN8nMm4Y1d4baX9X+qYeeq0NKnAIyagUPBwZsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBF0TdNK;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD5860A2600
	for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD5860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBF0TdNK
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso32746185e9.1
        for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109238; x=1793714038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=EBF0TdNKiZev92JTXZUKMNM+bikjTpnl6F+xtg1lO25YQMK6ahE6FtSlVFxjBHIfIJ
         2tDrWqG50yvBgr1XKRETOm6kWMHgVeuJM7lBibOyLXXDYgMKX1OPJwSjhZhLALr5KYEc
         Q1SCgLNw6BDYwmvXk5af0SJUgK8tAcDbAMVyUsW6eeK4lI9ZJ/zeaLnLSL3QXyaOHP9c
         3LAIk0jo9oQzD/MXMTG9cVzn0VCwjdkQ/RQrhNaRSRhrf7RTxJJ4NNApmMPopv82MM0Q
         ZP99MlLYSNoqXjI22Xh68F20Jf0avL8oolZjogdrqlkKurBxko1tjvuPerYh9ooefJAS
         w38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109238; x=1793714038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=AM856Ylilh/sOsFG3P7DOpHOAZ5sUIels40FB4HJM31hjEkerf8NCCYMKSOuOhG1pZ
         hGQWHiduhLfSHbI7UrvmFPX3y7QCKH/pGzviq35bDTw6KQgXkZ6RN3GIsL1LQjRlnvV6
         1G30QHTe3zU5fDgzSDpz1dSAWc4Z7jKrVpYwzcoAEElS02sN4C5jAVOSas5DmuIjNtxs
         LTzRFvk/hhvCR7h93UNzdFgWQByj788DXgjpDkxhWVsHh74FnulgxWA+5yhLTdCRykI3
         U0XTBh/BEE2sOWLdzVDX+HwnjsUqmY09NA+KpYL9Nv0/yO+OaAdYaYqeNPc9CTUr1BGp
         NDoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc2NSo2MMpQfCI+VOVLidC0dbL09fYb1c/ogfn3MNVqd4RaLvhVSqrTUBrdohRB/3IQG6e/sMLYHTByiqPRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLW/9MRfKjdh4rG87YIk1l1sSbyc1dBhxln9J8vQcJZKdBcUK5P
	hCaSyeomGRqpIQzApEzKDZzi/qlebHh/Hdjw5NPPFz3wGZLk5UwKeQUC
X-Gm-Gg: AYBFou3eAt5d5mIUryo2xBtZshzakmLltuwVPVOtvnGeHglkM+vWeNXLeydkLkgkNZ9
	zZ7OIH6phkqRerbldFqpleAuc4gYvf/yqzJNKA25lbMZ5OHPii14FD9Agel7hqFEGazWJ4tRL+K
	toFz5q6ZiqK9p8d0lh1ZwGh1XG/qIDrOBlrGXXfFELCSYrlwNjH36eayO9wx14pCYzv/8O7iAJM
	aWO9JBFIzKjZjX5izoiySAud/mw86i502w/A578+zUASaxk/UK9InD3Xc/3k1Efr84QDAar7hWO
	FrlPqK92+PnlhyV5q9NruowpijEWapSrf4Sct3hLB0TEYmItFnel35H3mz/AOTr785qugApePFt
	wZEmJ6puFPCEU5NAgcYiwUKDhGsbOmJXVhE2yUZW87ahqKCmo9hAaZV1TrhCO51E6Qm2tt/h9e+
	kheG/ccc0bR+AVDXhT4RMBGMPda/JXAhzWUa3u9mAIp9ouDbCQSdMqTVVN+Gh45Hn9ful/J26jC
	c+GM2B6NSNrR9oJkIqKWiJcEFX+adKq4/DR05JwJqOwyZdTe9NMwzdSmy3SS/IJA5D3cDJr0Gif
	kHnJ73k=
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr188823805e9.8.1793109237982;
        Tue, 27 Oct 2026 06:53:57 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:57 -0700 (PDT)
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
Subject: [PATCH v6 05/15] MAINTAINERS: add entry for DRM splash client
Date: Tue, 27 Oct 2026 14:53:32 +0100
Message-Id: <20261027135342.2003632-6-maximpedraza@gmail.com>
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

From: Francesco Valla <francesco@valla.it>

Add myself as maintainer for the DRM splash client.

Signed-off-by: Francesco Valla <francesco@valla.it>
[Màxim: add myself as co-maintainer]
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..321ecb9f5b5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9168,6 +9168,14 @@ F:	Documentation/gpu/drm-ras.rst
 F:	drivers/gpu/drm/drm_ras*
 F:	include/drm/drm_ras*
 
+DRM SPLASH
+M:	Francesco Valla <francesco@valla.it>
+M:	Màxim Pedraza Padilla <maximpedraza@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_splash.c
+
 DRM TTM SUBSYSTEM
 M:	Natalie Vock <nat@pixelcluster.dev>
 M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
-- 
2.39.5

