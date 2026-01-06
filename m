Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AF933C50B;
	Tue,  6 Jan 2026 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767713262; cv=pass; b=oDhY3bu+Df8fu2qKfI8wKhyCBh5kWoXfk3+uxiQJ3aWKOTfMwMjxe1S8TPuoE/E/jDUb32LgburZKaV0keqp2yG2y5Sco3xI+1TiRp0F1GtVI3vbEJdLI4ETP6ZXWAmjpANx8+ksT57LMF2mfnCboAPiL9Iemf1+xio72JakTd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767713262; c=relaxed/simple;
	bh=5RBZj5fiknLzyrEUj0wxw39RQT3sg1+tqKapk21gXJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HyNuKDK5DoY+xvKnqeUYgBKOEAg2IMHMBrrGe4MUnrxwF6DDmFtFTCco6Py6NEvuakxann2Ed2s+Lq3+04tSD+Kg4bzupYIJZkKTaySxu8g+r01iHYehpsGLRkfn6SFB3n115abUT3qx/JESa/IAE3AI6wutS2+mXoEYMfw5gRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=ZJV4di2d; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=pysWJJ9K; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="ZJV4di2d";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="pysWJJ9K"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qrct.prod.antispam.mailspamprotection.com; s=arckey; t=1767713260;
	 b=e7NF8dfSVJgCpQu4wtCoUTNn2BByZHBEAlLfkgYjYaJ0ZFuBK9MrDziLv3QTc1K5zpz8qIdOx2
	  zzx06BWROP97K5KJn3RoPHXpzpJSGZz7iD0aEhPV2TeytMkCvCfWoRiCWfyuChCCShhe+3ey9O
	  /4mfs3b4RihuPm+yGumzosY/jSCUSLgV9FFDRNomw5XbpfkNQYUOytbXbMn7Lhxt5iVOubu2iG
	  bhGZrUlAQ+HplGjmxhTZuxb3ZtIu3D30yMsPL87supSu7lTlvCuPwS1mqpZjvmLEeO1gOOC74W
	  d5HsX9m71wpWUDscie/dDdSR5y4csf+a+iMzcTJhfaAKOQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qrct.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qrct.prod.antispam.mailspamprotection.com; s=arckey; t=1767713260;
	bh=5RBZj5fiknLzyrEUj0wxw39RQT3sg1+tqKapk21gXJY=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=n3MDDJEPkSNNHUKJHbWIL3hOKchySvpUeeD+GRVXNe4V2laCKMNmzNrzscz3uKhZoSba1ssZxN
	  zKJdfgjIp5lPWQhbMUuFi+C7TMcuACeS2qny8X5vwq+wdjjiFIGZlWVl0f7gzbKU4/qfRwatWo
	  /MgTIZIaWdfCKPN7PG+mPQfk//uu7/356xOZxsrVz36uk3t7p1U4Js9UnJbbRNE6zAXFlPia5g
	  fnyYj4IOVj5eeuvtVuIN4O4HUdeqK5suCCCtZkdeg8Ku9RmU5xYtiIjjYDpDiYpbSggAGb7Aja
	  PJ+jwrA7HkDvkYH/2iTTFuZ2bkbil+t2fafickGsRAF5RA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=hjiE/vy95miZKmIXOVeCZjg3Col/800s9OhVDa7FJ7I=; b=ZJV4di2dyCB53/Rl6CaciaBjM0
	xuzBE0AhPnm0yFLgeUwkosI7tEpeK6QBJSXU8M/0CS4+KkrAzfL/qVx/ovsuzOTlFCBRplMSoBvK9
	a4Uu/JVC982WVt0OqofHofUVOZHY2sNKKVIcd2uiTEitCnmRT3793xwp01xPT/8U2+sk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qrct.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vd80V-00000007LnT-2nJn;
	Tue, 06 Jan 2026 14:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=hjiE/vy95miZKmIXOVeCZjg3Col/800s9OhVDa7FJ7I=; b=pysWJJ9KhgKk6vhs7nOD76bbaF
	PZz6G1BIUmBiO/u/dkaL/Kr5Pp3AEEHJg9PYKEl153KSi7Ck5krlGLLv+PZHTaiS6crwIifqQaeqy
	QySKJCCaiYQZivxPtITXkiTll9RVY49XrorsOtdQ+w2f44GFSkpD6JfG1dqWvXFRfha4=;
Received: from [95.248.141.113] (port=61315 helo=[192.168.178.65])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vd80O-00000000MvX-3k3r;
	Tue, 06 Jan 2026 14:25:52 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC v2 0/3] Add splash DRM client
Date: Tue, 06 Jan 2026 15:25:39 +0100
Message-Id: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywrCMBREf6XctZE8NLVdCYIf4FZKic2tvRDbk
 pSglPy7obh0eWaYMysE9IQB6mIFj5ECTWMGuSugG8z4REY2M0guj4JLzax/tZ0jHJc2zM6EgaH
 gtrRaKyx7yLvZY0/vzXmH2/UCTQ4HCsvkP9tPFFv1U5Z/lFEwzjjX1alS6qEO5hyNc2ZPCzQpp
 S98n243tgAAAA==
X-Change-ID: 20251026-drm_client_splash-e10d7d663e7f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043; i=francesco@valla.it;
 h=from:subject:message-id; bh=5RBZj5fiknLzyrEUj0wxw39RQT3sg1+tqKapk21gXJY=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmx0vmBst9LLTrPL2FLVnujIPlnxsv6yNs7Dy1QPNWrL
 VxZfWdDRykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjAR9yRGhueHNGbcPHawpueT
 qVZ4oKNqyd6FJ0MEuYM3ns6WcFitfYqRYUHtWgVV3mfNHyxu79i92Gd+IqsCn+7SVfviVojpf6p
 7yQ8A
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
X-SGantispam-id: 3ddd559c7c34731153a7f480692e229a
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vd80V-00000007LnT-2nJn-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qrct.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

after quite some time, this is the second RFC version for the DRM-based
splash screen. Motivation behind the work can be found in v1 [0]. 

Following the advice received on the v1, I stripped away all of the
user-driven functionalities (i.e.: configurable message and progress
bar), which can be provided by existing userspace tools, and decided to
use 24-bits bitmap as image format instead of raw dumps.

With the addition of EFI BGRT as a new source, this new DRM client is
now able to draw to screen one of the following:

  - a colored background;
  - a BMP image loaded as firmware (either built-in or loaded from the
    filesystem);
  - the BMP image supplied by the EFI BGRT.

Once compiled inside the kernel, the client can be enabled through the
command line specifying the drm_client_lib.active=splash parameter.

Two additional command-line parameters can be specified:

  - drm_client_lib.splash_color=0xRRGGBB to modify the default
    background color (which can in turn be set through a build-time
    option);
  - drm_client_lib.splash_bmp=<image.bmp> to set the BMP image loaded in
    case this is the chosen source (with a fixed default of
    drm_splash.bmp.

These two parameters were kept against some of the received feedback
because they fit a specific embedded usecase I want to cover (i.e.:
hardware model detected and set by the bootloader, along with a custom
splash for each model).

Additional notes:
  - Rotation is still not managed.
  - As for v1, support for tiled screens is untested.
  - Plain color and BMP sources were tested both on QEMU and on a
    Beagleplay.
  - EFI BGRT support was tested using QEMU+OVMF.

Thank you in advance for any feedback you want to leave.

Best regards,
Francesco

[0] https://lore.kernel.org/all/20251027-drm_client_splash-v1-0-00698933b34a@valla.it

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Changes in v2:
  - Moved from raw dump to BMP format for static image source
  - Removed support for configurable message
  - Removed support for progress bar
  - Added EFI BGRT as image source
Link to v1: https://lore.kernel.org/r/20251027-drm_client_splash-v1-0-00698933b34a@valla.it

---
Francesco Valla (3):
      drm: client: add splash client
      MAINTAINERS: add entry for DRM splash client
      drm: docs: remove bootsplash from TODO

 Documentation/gpu/todo.rst                    |  17 -
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/clients/Kconfig               |  79 ++-
 drivers/gpu/drm/clients/Makefile              |   1 +
 drivers/gpu/drm/clients/drm_client_internal.h |   9 +
 drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
 drivers/gpu/drm/clients/drm_splash.c          | 883 ++++++++++++++++++++++++++
 7 files changed, 986 insertions(+), 18 deletions(-)
---
base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
change-id: 20251026-drm_client_splash-e10d7d663e7f

Best regards,
-- 
Francesco Valla <francesco@valla.it>

