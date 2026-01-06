Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577161898F8;
	Tue,  6 Jan 2026 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709573; cv=pass; b=VS3Y38ru6JPCz3KWkCPO3i4b4xihOFlVrIocmeGjkwTGsmSpAnplnGxaUTBbrFwfwT0UIBjt2BeuYKFbcxCMtaGcEGtrtzk63tX3XuMZieZ+cMF2t1qC4HQfsx3Uv40ePxFRMnZpakffBadIKI6wICKTWGLDVhm1gZzjJEgM9dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709573; c=relaxed/simple;
	bh=0IYFBwj/1Tc94SMR8BBfztM14FE1yqGNpcH/ENSaQ1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6b0oMHMXogKon0uGGlpboS10YFrqDd1cZdaYxRR63axtkmtDKa+8XtssVjchIAwV8N/+MSkWfo3KBx8jZ6kdKczbDxRSkGqVmMt+9A29VlSYf85HjbdI8OCAdqkn3j2g8RTA0ZvBiaBXDoc9fJ+nQCDihaDbGkEUuKpJq7RyQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=krE7LJU7; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=jquIUnvn; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="krE7LJU7";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="jquIUnvn"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-q36k.prod.antispam.mailspamprotection.com; s=arckey; t=1767709571;
	 b=sFQGjhlIzp47y3QVKvRDKGWcf85f2aOktg1GV2Izs3wzRtSBhIfG1cA2HsXtelBr0BlOrOQOuc
	  h27yx4vDrvpDAvBFN8GBtX9Pos90/1Tx4rNJyThqMVq9HAMFL4G0I1FXiQle/AE8DYnA4vRwJh
	  t7pyrJKucvRMXE1BOkNDyXcPyIkYrNN/vizF1bu5fChNYwya4ORLBj0I97wnDOx5puQKGnbG7D
	  X/bczLcIRIo/yoY5MPJij4ShXAZY1SV3cpoStTDIyu9AQhwCsGv5YnvSrThd0sYWdaxCpiYXV6
	  0ZHP8013qCuhzdT7AqyKQ024R+Dt8oZ3Ma00Cc9ALWc5XQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-q36k.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-q36k.prod.antispam.mailspamprotection.com; s=arckey; t=1767709571;
	bh=0IYFBwj/1Tc94SMR8BBfztM14FE1yqGNpcH/ENSaQ1c=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=zKFZYVO3poVnQDNejCC50igKKaCDd9kBVrA7ODSgKmn2dJRUDrx2/mhUBEuOSO+ABBLzCnArOR
	  is3K0cJC4nIwrsd23mc4fbZgc5Mn2k3CCodpemPUOLcnK9H4U9jNKfBC48dFS/0Lb6eo749Adp
	  gmtqnvI0/2M6alipY8g4spOYsLIYVDy3Qys5bV5otIZlu4r0qW40ZNBP3XaX66Zic0Ld3Pmmyu
	  PQHvhjQJzNUHBZF8wxnUQChzUT8AQimkhOxMJ387VIuimBcKpF6UE/YhldqK3mF5bkGC2XGpMu
	  vy9hnxvAv6Uoz0+bNTEkt+NI5oliFe5TTwypGq5rsdfzMA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=wiIHoTKpqez2GTpzlzsY8o+kb8sgJMLZXwtewGty5hM=; b=krE7LJU7LNakqPT3XkL1ON99Nc
	8dy/qqvZP1IzLO3m2y8T+rPPE+yZPF/BfgLV+lFrV4JI7/mg10M5NcOTWJMkMrTf3cs2m52Ky6oLu
	6892SCoxKFQFuOpHydHPn5uDCL0y9cXnBFhJHD25NLfq4xwCQqxDZYeNctEGk37ly5wo=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-q36k.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vd80W-00000007JlC-46z4;
	Tue, 06 Jan 2026 14:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=wiIHoTKpqez2GTpzlzsY8o+kb8sgJMLZXwtewGty5hM=; b=jquIUnvnh807JgCtpiNwojuMa6
	CbnE88N3AOndu1b8mbrmryg/EcwUoOmLuA67FsmAP2hHlEpvvyiyVuEFp5ohWGbqC+6H+a+k9w5Xu
	RpTLqcXIU2bEeSHfh3Kc8+OwRuLagbH+978ZpgYCbp50+niM4ZKaRvpTLkNc2EIQ0Ezg=;
Received: from [95.248.141.113] (port=61315 helo=[192.168.178.65])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vd80Q-00000000MvX-0eas;
	Tue, 06 Jan 2026 14:25:54 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 06 Jan 2026 15:25:41 +0100
Subject: [PATCH RFC v2 2/3] MAINTAINERS: add entry for DRM splash client
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-drm_client_splash-v2-2-6e86a7434b59@valla.it>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
In-Reply-To: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=francesco@valla.it;
 h=from:subject:message-id; bh=0IYFBwj/1Tc94SMR8BBfztM14FE1yqGNpcH/ENSaQ1c=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmx0gWmrCpurisy4upDdth3XxK8LZ3yg7NQP6/C1d79J
 hdL4a2OUhYGMS4GWTFFlpB1N+7tmWv+LW0D4yOYOaxMIEMYuDgFYCLRexkZlkbdds9RTr17hVnA
 oD9lWd28/VLPpzzwuWSSd2i2qK/nO4Z/1s8Yrh/hP2g+dUGjXaxk3JOX2nzLK+sy+6IUOLlMc4Q
 YAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0e1ea53b869b0fd5d173713231c2b2dc
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vd80W-00000007JlC-46z4-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-q36k.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add myself as maintainer for the DRM splash client.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd762f5648b7e4e6fc62560662e43720422e01..35032cd6fddf4828906ca30924c5322949551ddf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8758,6 +8758,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_privacy_screen*
 F:	include/drm/drm_privacy_screen*
 
+DRM SPLASH
+M:	Francesco Valla <francesco@valla.it>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_splash.c
+
 DRM TTM SUBSYSTEM
 M:	Christian Koenig <christian.koenig@amd.com>
 M:	Huang Rui <ray.huang@amd.com>

-- 
2.52.0

