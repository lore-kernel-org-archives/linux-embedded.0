Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE431A08A3;
	Sun, 10 May 2026 22:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778452616; cv=pass; b=iSunCuAY0vf/52o5U90JpnBWKTLzi8geLb5eJLLd7/WCkuTmiGGYOFaFn9cK+chrf9CocsA99yLFXHW6cB10DZpYTgBn2Kc6d//ZDaQjFBTxB68jkG+HbYoZlJsb9wpVnmk0T6YoEJU8zW0hg6kuTp+PnfQZMoJXeTpvU5BRCY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778452616; c=relaxed/simple;
	bh=tIxfZpWNGOuzJwgTKm5cW5kf4HZX6TEm5aiLFJMofUc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=khpYpSvSlUoox+jnHRhvJuZYX870xzUMGoqnzGdNkLZf9xvVnSbnEXkk8Hvf4qKTXZwUU3Chbfq3Wg5pnycIBSC5Kb5/H56vWaHfY60ZuybRDQRuC2vcLzi3/b1eW/cUWdJibT2kS+U3HzvOpZt9HQrJKnc5Z20onhWbbfNkqSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=TEhIw92b; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=ZPLL9TB+; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="TEhIw92b";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="ZPLL9TB+"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-kz0n.prod.antispam.mailspamprotection.com; s=arckey; t=1778452614;
	 b=YNkQKjd9FfUy40rUxbhS0OremDSquO1aS+lCuifgIfdjwMFZ8RaPDa2QDtUN8Grb9mFO2ZQ09b
	  YyRFbWBDB/0bHVZ9QACUOwRUi+8fwiAp9foJYZWQGiFN2YFK+q9vuT/B4XXjo9KPgaOs1miCl2
	  g1sXGeY5xrUhgj41R50/z+HNRddco+vsUGiyS+27DXlrJceZKDvUo3QbBhfAw2L8y99WiKYYnw
	  pWM6U3koYAsEWrL5g3E6+9dEtiJL3RBCBwLjnZ0SkppGGISmBEDnMhYNGGlUQk5kAJUqf4GNim
	  EARBUQNsp9Dw/nTIj9uWieRoiXl50hl4MDXM4LJZuuzG4g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-kz0n.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-kz0n.prod.antispam.mailspamprotection.com; s=arckey; t=1778452614;
	bh=tIxfZpWNGOuzJwgTKm5cW5kf4HZX6TEm5aiLFJMofUc=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=CagjRuYYU+ptydlpNZCNsn0g8ESn6bZZrsHihR8Rmnah/jAt2MomnQMMY34HnoQ4FcDb7AkPMT
	  x21m9dcqn6kkDsiDq2jWvdXl8kmVqxHSq6KKH70GwX4ILVSPMDUHHOrdHOEFlK2CI+RB6NZ9ic
	  QTNZzg5FIycZ5iBD7zfB5P+LN44TX78EgijF68pqZfkr1pNVHd2RPSKi2PNK7HuJ8ZA6xBdrga
	  MBWY2ITOtx55t5cFT1bSJsDGQij3zOF7s4321lroVyuSbZMbZCUks0yi5S1splEFE65z7zl3xq
	  iQnZPAjSu1ttNkLZ8Ln7Ficzpktr860n5YQGVV4+S1fPyQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=/vPpY1OpToTP1NIiMD/OIBw5dqDYUYDnHC/WuuJj9D8=; b=TEhIw92bIJN2zLUsGnPBxxb9xQ
	+QLDLVzOLuGwOOkD4lSO02wKL0zWfsuyt2tY77X3PUgIbnROwas8wUK7pVNHTrk8MsgucbglexoU/
	+4LAfjdVyOk0SVNY5kUbaBb3bvAwLW0ArmZUUb9i5OScYa5s/JGBop92O+m8T67HLDTA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-kz0n.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1wMCbA-0000000412Z-0nSR;
	Sun, 10 May 2026 22:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=/vPpY1OpToTP1NIiMD/OIBw5dqDYUYDnHC/WuuJj9D8=; b=ZPLL9TB+ImLeDPJDFqZW0WZGSE
	N1i7ZJ6BVmqldLIH/MBOngGWHGufg5m+lvcOOXtXf/cTBjThiiThXGrZvNKRqEcjqOWuW4VFCKI1n
	Z2Y46Q1O1wpWiEky3UMViiHrKppzarIkfuy1ktjgVKfmWHLhzYXUQHMuLBG0S0OZm+Bg=;
Received: from [95.232.18.244] (port=61481 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1wMBil-00000000PdN-1rms;
	Sun, 10 May 2026 21:29:55 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC v3 0/3] Add splash DRM client
Date: Sun, 10 May 2026 23:29:37 +0200
Message-Id: <20260510-drm_client_splash-v3-0-a9aee9f0b2fc@valla.it>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTQrCMBAF4KtI1kby0yatK0HwAG5FStpM7UBsS
 1KCUnp3Q1Fw0eWb4X0zMwngEQI57mbiIWLAoU9B7nek6Uz/AIo2ZSKYyDkTilr/rBqH0E9VGJ0
 JHQXOrLZKSdAtSb3RQ4uv1byR6+VM7mnYYZgG/17vRL6uvqTeICOnjDKmyqKUspaZOUXjnDngt
 GJR/ADFONv6KYoEKCiU0ZnM6rz8A5Zl+QCScqg+9wAAAA==
X-Change-ID: 20251026-drm_client_splash-e10d7d663e7f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=francesco@valla.it;
 h=from:subject:message-id; bh=tIxfZpWNGOuzJwgTKm5cW5kf4HZX6TEm5aiLFJMofUc=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkMP874rGqcvvmCTGKDerZSfJLsnPQP4ot10ufnrGA8s
 7Q778TzjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAiOmcZ/nu9Xv76ac+1a5ty
 2pQKwx9b3pv2cMf9X1sulTsu/HPX9kAzI8NGi6edNtNqhHfPct9qZbuy7UTPO/tz9QJ6sqnLPxe
 oTGcEAA==
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
X-SGantispam-id: 55ca6dff58b104b23fb4846ca6c2adfd
X-AntiAbuse: ID - 55ca6dff58b104b23fb4846ca6c2adfd
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wMCbA-0000000412Z-0nSR-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-kz0n.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

this is the third (and hopefully last) RFC version for the DRM-based
splash screen.

Motivation behind the work can be found in v1 [0]; in a nutshell, the
splash DRM client can draw a splashscreen using:

  - the BMP image supplied by the EFI BGRT;
  - a BMP image loaded as firmware (either built-in or loaded from the
    filesystem);
  - a colored background.

This revision greatly simplifies the image seletion logic; now the EFI
BGRT is always used as first source if enabled, with a fallback to BMP
image loaded as firmware and then to a plain color.

Sanity checks on the EFI BGRT image have been borrowed from the efifb
driver. More complete splash providers (e.g.: Plymouth) have an
extensive management of platform-specific quirks, but I don't think it
would be reasonable to introduce such complexity here.

Additional notes:
  - Rotation is still not managed (and probably won't?).
  - Support for tiled screens is untested.
  - Plain color and BMP sources were tested on QEMU, Beagleplay and
    i.MX93 FRDM.
  - EFI BGRT support was tested using QEMU+OVMF.

Thank you in advance for any feedback.

Best regards,
Francesco

[0] https://lore.kernel.org/all/20251027-drm_client_splash-v1-0-00698933b34a@valla.it

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Changes in v3:
  - Simplified the image selection and management logic, with direct
    fallback from EFI BGRT to MP as firmware
  - Used new drm_draw_can_convert_from_xrgb8888() API
  - Added proper get_unaligned_ calls for EFI BGRT access
  - Fixed Kconfig dependencies
  - Link to v2: https://lore.kernel.org/r/20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it

Changes in v2:
  - Moved from raw dump to BMP format for static image source
  - Removed support for configurable message
  - Removed support for progress bar
  - Added EFI BGRT as image source
Link to v1: https://lore.kernel.org/r/20251027-drm_client_splash-v1-0-00698933b34a@valla.it

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Francesco Valla <francesco@valla.it>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-doc@vger.kernel.org

---
Francesco Valla (3):
      drm: client: add splash client
      MAINTAINERS: add entry for DRM splash client
      drm: docs: remove bootsplash from TODO

 Documentation/gpu/todo.rst                    |  17 -
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/clients/Kconfig               |  63 +-
 drivers/gpu/drm/clients/Makefile              |   1 +
 drivers/gpu/drm/clients/drm_client_internal.h |   9 +
 drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
 drivers/gpu/drm/clients/drm_splash.c          | 932 ++++++++++++++++++++++++++
 7 files changed, 1019 insertions(+), 18 deletions(-)
---
base-commit: afaa0a477099cb7256e26fe11289c753a225ac97
change-id: 20251026-drm_client_splash-e10d7d663e7f

Best regards,
--  
Francesco Valla <francesco@valla.it>

