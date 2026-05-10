Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6556A1DE2AD;
	Sun, 10 May 2026 21:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449000; cv=pass; b=ARI66MuQUzneNJwIr1P2/P3uzJZNXbMa03cuFwTH9HwbHhuDOmOSykOQdDaKnBFXVIHWpNheV+reAdmdQvJLJCHrwKR8D8XKhyK23PWDcxTEEDDEkZ6QmqDxnfVAp/ana3cvYZx+O77AvB73J5FL3YXmmQYya9zhFOjEyilfUGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449000; c=relaxed/simple;
	bh=b77YSloUDf1bQe4XnZJQJVHsMv8N/tf5dK9SHW0/Uj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlbqKbNCKElkPXFsr2YIsM1cKEDSg4/IaqeHcKMsU2kHpbFNNwChHtf4WInUv15/oJRTAwHhyLFoSmgc2aPjogKNsK28Z4V6I2k28l3yT6VVR/Nex0OvFbHyU02SMgni9glH826P5pkCvP9TxOX5DMCjadUGrTaUumlt5tLeez8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=CMHrkyMy; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=uCY7t++F; arc=pass smtp.client-ip=185.56.87.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="CMHrkyMy";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="uCY7t++F"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-g8lr.prod.antispam.mailspamprotection.com; s=arckey; t=1778448998;
	 b=axFpJlsZrjoRJpEvclDT7RglubSmWWvEiR0u502c+yfiP3myDftMKzIrp0MeuGvS35+b4d2Q8x
	  xGd7Qbw9EBx/nR7/keIqF6JpjMTzBDl85xXP13ewwHYYD13M0Dc7QPrPgjOMzW9NE+eCBqP+30
	  53ygkT1LNs4dtH+VdAHKvnlEciWpoQQBg3c6j+i+iQ2egdTKCnKb2HBnCSvK69Y+P8dcgqmlWB
	  0w1fKR64c37DXPtTwo3RfUkAcmu7HJ+iEMJNS+YB+v1QXJkOscuJHdL1YyLIR3/PEBOjXx2oQq
	  2vLOcIIy8g6ciYinHjQCty+nXZf2LUMWEfINM8+5jsxG3A==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-g8lr.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-g8lr.prod.antispam.mailspamprotection.com; s=arckey; t=1778448998;
	bh=b77YSloUDf1bQe4XnZJQJVHsMv8N/tf5dK9SHW0/Uj0=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=pJ97Cp4YvVGJskcjDtKTzycTe4KbS+SRcrawLovK9wZPMiXgwdZpr89Jn4TYoYY93ERz4WVYNB
	  MjUBzoatpQhNzxT+HflqjY8V4tVJvaOFjsNDfHP9OJp7BYwmFwJpolyW5wh3PyVh46wF3aOWRD
	  UbCUvij0dWPa0fhZ1hOVull7i/Kmqqf2P11O5Rle5ZP/HbOC+rb3jpk0Rt//e9kMsd0lrUJVEE
	  qX0ZsWnsVgclGObkzRbCa+Mnreb8zaOkXDAtmwTXQc9XxQ/Me7X3O3//MWsL3mCwddn4SidOz/
	  vn0g9VWKDNYdEU0432YqeI2y6uMQl2wSkeQl3iKUtL0FBA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=cc4l52O81Yr5VXf89Cd/KNg6LHCRrq8/in15WyV/j5M=; b=CMHrkyMyLF+wc08vhm/laSomWh
	fdhLWm4iim+39rfkXxjuzPkT7/j/ZtA7M6YdlxaFiFMF5CL1NtMPE+bVRC8D+wxFND1dSpjprA7GA
	4y0bj/40CDgtKxy958BTC9fWLZhaOmKg4gs2moZ2LSOVW1V++87CQHYdGLQKl23CRlCM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-g8lr.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1wMBj0-00000005rYY-3bYR;
	Sun, 10 May 2026 21:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=cc4l52O81Yr5VXf89Cd/KNg6LHCRrq8/in15WyV/j5M=; b=uCY7t++FxBE/xoqffuHU6wNZEL
	ALaf2jpfKwfqVvp/BV/sDiMKoufuPdvBdiWE33X3FM7fCVycYxdThkoUCCksrJTf8NPj/ffStDgLY
	EqMUji2h/ca3FsYjUuqrsisMDUU8Du1O5uuc8Xh23HQ0RvcHxs/EsbfU1yVNhjjuP0hM=;
Received: from [95.232.18.244] (port=61481 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1wMBim-00000000PdN-3Dnf;
	Sun, 10 May 2026 21:29:56 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 10 May 2026 23:29:39 +0200
Subject: [PATCH RFC v3 2/3] MAINTAINERS: add entry for DRM splash client
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-drm_client_splash-v3-2-a9aee9f0b2fc@valla.it>
References: <20260510-drm_client_splash-v3-0-a9aee9f0b2fc@valla.it>
In-Reply-To: <20260510-drm_client_splash-v3-0-a9aee9f0b2fc@valla.it>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=789; i=francesco@valla.it;
 h=from:subject:message-id; bh=b77YSloUDf1bQe4XnZJQJVHsMv8N/tf5dK9SHW0/Uj0=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkMPy4F6Vr+M5wh9Tzj0KpjHussNuYlaO312L34RErTz
 FDjiDcfOkpZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJxF1m+F9opHPWXvVW0WdB
 cQEzvuk2nwUcmF4Wv/ZlDlYpufdvijUjw/rY1JXFNlLbjfJffPr6ZZV2ZnHg3SyhzxqNiXwsX0P
 P8gIA
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
X-SGantispam-id: bcbe145cd0d02b2a6a23d46dbe69fd67
X-AntiAbuse: ID - bcbe145cd0d02b2a6a23d46dbe69fd67
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wMBj0-00000005rYY-3bYR-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-g8lr.prod.antispam.mailspamprotection.com;
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
index b2040011a386..6c132139e87c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8933,6 +8933,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
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
2.54.0

