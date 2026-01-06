Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836DF29E101;
	Tue,  6 Jan 2026 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709989; cv=pass; b=gFeQypM6QTebVsu6M2LGWOlbfw//nroSJR6r03tanZluWmgt2s4ih8pnKMfIGCaA5rDtstXbfhL2paD+fF71oItapHcoQ2hu/BSEgO4CdTR4ds+2bqtbvK8GFfKTa6HVwK38rEhEGOAzo+1xgBibaFEltrcdmYlOaOjFmJVeNlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709989; c=relaxed/simple;
	bh=IAwJRtP6e6Uok6TXGFtjo0psvVmWxfzfjk894Ekbkgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qA7vNhjM1Yvi6UAxr9egu8sGJVWdOVSD+go9oB2xPlYMZmXEG2/dnr/LujGxkifU9LDquQFIRZ3/T1D73Sk6CQeU3g8kEt/7iQBXFuAoyNC08cYa6dxnTrdWcVxPXmCsZQBGuuCIIbzi5Dl4DCZiNsFTlHF1I4sFtNe75DjO4Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=jNJPbdZM; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=X8DKm7NV; arc=pass smtp.client-ip=185.56.87.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="jNJPbdZM";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="X8DKm7NV"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-rv86.prod.antispam.mailspamprotection.com; s=arckey; t=1767709987;
	 b=CQ0BQyFOB/jEd2oKqcsdlw/KYyTCGP9LJgbfhpnA05dbmWlDOoMjvxf3gtjFxaTqlLEeapkCfw
	  h8BgrWQSXHD202gEG5/U6S1RDObMm76QV9DqawaVW9KYEMqBKiq34/ORNOrkeF2i9gDtAI1UPq
	  jTSs+9QqzLGpNHtT6gP5ECZgaPVKpwqUQFb2Y4OejoBNqcI9ujQWumC8XpiGjzmYA5e447ogZO
	  Z95ZsVT6QChi//GfNzvabxpukh48NiDYfp3QaO5KckDUr+LMfSEB6DGPy9kOvc6C5aD2CnIcmD
	  VGpwo0ozsiyezx+9zpyzQer5fkaRpYe2AdG13zxkCBZVHg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-rv86.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-rv86.prod.antispam.mailspamprotection.com; s=arckey; t=1767709987;
	bh=IAwJRtP6e6Uok6TXGFtjo0psvVmWxfzfjk894Ekbkgk=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=pqHBc2qdnV408IV+Bq7r1k6893wg9jVV+W8Jy/lrEmym3JLOS1Oco3tQHkJgTlDE653mCRSywA
	  8TYwcbQ6Ng16cGotv0RL8wR4nbj6EtvoOfaSaOX2axUf+j1sp1OIcWWJr/8npHyuQHOa0JI3AI
	  uI9HZwuTHuUmrxxpWE75Yl3E6zqUIoHpimihsrxuLkza67DyV6gYdFiJfXK4W6jM+io31j8PP6
	  sSjZqJOngfw3WkyYrEcgXjMeW1InpCXYMGvGe1jGcBwzrnWxpeovYlVRYc+VAEvmyadWE741/O
	  abER0b2/raHSrxxVerf22K/665UcssfXQfb83KYNGahmRQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=DfKGtrGKPa3faWLHh9s5lvGkj1UBCJYGSw0oOVidCkA=; b=jNJPbdZMSApGkNtA1id3RK8qHw
	QN3VC6lR7CiuousgoxvISDydH2dSoCdBVfFJqwCyYfREazdvXm0doH1k74U+WBBmcc+nA0KIHfMvr
	LoJt5e1WLdB9aOpl12eY5rzxAxq8VoqLu/vUcUH29ihGgM/1P0/MqsCnwcfkZWQFpO6w=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-rv86.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vd80X-000000092dR-18Ge;
	Tue, 06 Jan 2026 14:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=DfKGtrGKPa3faWLHh9s5lvGkj1UBCJYGSw0oOVidCkA=; b=X8DKm7NV+9b2ecTeAkwSCIeOFM
	bN+lnqT25kLjdj7zBjEJpPS6d7QsH/dKOrALH6IS0enDINpVBTi0JFeg3nHNk1NJqYZTRf64dpe7k
	7i6K5OMneVpjVgxt6QcU3UXTkF45yd35TKxj664aGtlLWdopO2BcyT93Y5jbDG/WlVIs=;
Received: from [95.248.141.113] (port=61315 helo=[192.168.178.65])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vd80Q-00000000MvX-3A1v;
	Tue, 06 Jan 2026 14:25:54 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 06 Jan 2026 15:25:42 +0100
Subject: [PATCH RFC v2 3/3] drm: docs: remove bootsplash from TODO
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-drm_client_splash-v2-3-6e86a7434b59@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=francesco@valla.it;
 h=from:subject:message-id; bh=IAwJRtP6e6Uok6TXGFtjo0psvVmWxfzfjk894Ekbkgk=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmx0gXmUTertpzR2dZ+eW365IkmL11kct489H+6uy/w0
 LPKwsmHO0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJrPJjZHjeevb4/au3buf3
 7n65r44jj1+ucYK9ifiUbSf4nt/+/KeGkaFBZfl6/7eRrH+vn3r9dnvjpZbdz/aKC2p6ZtxnK4l
 W+sIGAA==
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
X-SGantispam-id: e0e33038253e151e17425215167e02a2
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vd80X-000000092dR-18Ge-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-rv86.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 9013ced318cb97d6895752d4cfe21c94d0000973..e32b303cca26fa284f795e30dab18cf9e9496a9e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -754,23 +754,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
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
2.52.0

