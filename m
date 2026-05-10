Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D092836A0;
	Sun, 10 May 2026 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449083; cv=pass; b=PIJSbMnXVhvkagLiu7bXfCnRm4PwVSX7c6/BCn9aHzkHWaQheh6bjzLJY1CcS6hqPmWEGMxqVLpu1OQ9iW1SSE03dSMPZ+Lmf/3WJcPDX0LHU9BSr0fdfDJA2ZxrkBlfSx9djtwanahNPUgPn3mWCbzmdsegUenUGs1FGLck8ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449083; c=relaxed/simple;
	bh=rR+36T8oiKeMi7IFE5YhT8MhKdSCfW4HON6L9TmdTZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqoWumWO3jWZTRb7qbbhAi8kawWtVM84MQqy+msoKVxt7FnvH2oYOZNzodzbrBnESe8p3mdUfvTh8wyMSh2Q31L0Qx7tijq9McTjelfuV9ajYXAIu3Igl0+oF+et1QynlfwU4RWlJSvgWBp7VpBaUIAtzwh9xHFx4xxn76Iq6Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=SvZ6cE/l; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=HoBVklFE; arc=pass smtp.client-ip=185.56.87.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="SvZ6cE/l";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="HoBVklFE"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-zkjv.prod.antispam.mailspamprotection.com; s=arckey; t=1778449082;
	 b=pBIizBt3c/mQGnqKt0QvWtdsUx2sKX3OGgLBS6xOWmDiZjrjf/OsT+ff0PtMoTjgd/pOTS0Gs1
	  altmgsF7Bp3lHrEmYcbEMEM/xr67HVse+Km4pf9bBB6zZvCU0fSIiZ/EzLm1baLbsCIWXRNflE
	  WXa8ws9t4IBvXUED64NZXl4lJfygCrODFF677fRc08iquf0dNS3/EaNqSlCskIy0kvgpQ7Vgmt
	  rN3qnNx6twBUlSebNwoHuXltEWW8crcc8mV2ygn0aIBrFsgsEAZ0aDySXd8HtBx44AW6TR5/wC
	  L8/tCrpx+x47NKwyqdstJk9/VoUPXoIjo8gnXXjGhs9g0w==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-zkjv.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-zkjv.prod.antispam.mailspamprotection.com; s=arckey; t=1778449082;
	bh=rR+36T8oiKeMi7IFE5YhT8MhKdSCfW4HON6L9TmdTZY=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Hwv4FFYxpkfdRD5WG8abJ1J3bD05VR7J1FytAi6+dwjSSt62NnMYZPO87HfIsD0i1RjfsE+Xje
	  JrqZzW7wF6dWYMuzBq1JGoIpJ6jCQx8MUDLKXrrXYed9sL6cz8W/ieiFAQ350xRh8P7KJilecb
	  WgSnVPur2WIt/9LgCZHqo9uBXgaECrU4zNunLQUcfD5c0lc8Tu2auep1e7CEKk80YcZstWufDO
	  HXZvSQumcO65S1Y8JZw29NMws4dwaX1XHGMKuqUN+hFP6zV/gZzd+a8cTbC8ThnPHQrIgHftjq
	  kQfY4PRobAFiyLRoOzLIVxk6/bOqQkTsGlX1xHo2VEtW1Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=9CfoUdWJmLDzHn3cJ6W2kDGkt8ZqvTaMqW9oJ3gqphQ=; b=SvZ6cE/l87AC3edllfUeaTWFui
	IJJziCk1zGV+wqAGMW+TCEaqPgI1uBoH1Fejh/9DTfihIc60hD8c6gk3mfULGe6mv2duRfCBtsCo4
	4yGB4WZlGr+cJvSX4f0xe/OjEV6tOWaUDnNxZs7j1Ymqn8UUEkP1QEzCqWjdAyaKEhIk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-zkjv.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1wMBj1-0000000G3nK-3SQB;
	Sun, 10 May 2026 21:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=9CfoUdWJmLDzHn3cJ6W2kDGkt8ZqvTaMqW9oJ3gqphQ=; b=HoBVklFEW1jHuZMcwQaMw7jhSS
	lot+wQwCQeGnwrDhufeOYnjLofyzOs0vXh37AqOWXPygZ0A2ogQgvYSxvL+XqqePFi1Aij94jArZS
	5TwW4MjfrbiSSMk0G++rtk6ePuO+g/C9UCpPyG279CFuYSnJ1ET0hhvf4k9xUCCXFGSA=;
Received: from [95.232.18.244] (port=61481 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1wMBin-00000000PdN-1XU3;
	Sun, 10 May 2026 21:29:57 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 10 May 2026 23:29:40 +0200
Subject: [PATCH RFC v3 3/3] drm: docs: remove bootsplash from TODO
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-drm_client_splash-v3-3-a9aee9f0b2fc@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=francesco@valla.it;
 h=from:subject:message-id; bh=rR+36T8oiKeMi7IFE5YhT8MhKdSCfW4HON6L9TmdTZY=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkMPy69ubF0adbcjQHlCTycx4OMI9InzuyY77VN7P7Vf
 9PSeQI+dpSyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQAT8ctg+O9Sv7jzp8mdxjWy
 fFrPzWvfT+96P/n9not7bNe/9O/occtgZJgicD2wi0mm8OgakdoNTF9eSR5/wnWLTzlBsfX4m6U
 PXzADAA==
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
X-SGantispam-id: 0cb299594a688aaa5adcccab087c516b
X-AntiAbuse: ID - 0cb299594a688aaa5adcccab087c516b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wMBj1-0000000G3nK-3SQB-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-zkjv.prod.antispam.mailspamprotection.com;
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
index bc9f14c8a2ec..f367d8980a87 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -802,23 +802,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
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
2.54.0

