Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52570352F86;
	Tue, 12 May 2026 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609450; cv=pass; b=G2vj2vtbRCKBKJg9NoEe9vHgo7EtdotCCbupdmBw84FGKUXvE3njuUSjNSW7qESiMBfiN8Go08dehRDQe454La3QQocPV0k9iXDWSeWUU+6vCu8QCK4YuGC7M58rzbehzj+vjmdTsgF+s3wksDn6G68qopRME/bXqPA0ZTQM7gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609450; c=relaxed/simple;
	bh=N0ory80vSiLGWEVAEYOHsz+lROIdnBjmis4jD8LYDF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJAFcBlpOoDeSGYbtIX86QhhIY4bb0rHNTV9okpwurhzzuypLRJ8N5iQ3WR+A0lcvFy1dlqUZBvh11+TQ7Esk3TGM+UtrIKxVDvOr/hDOmUQTHy76pImkkOKR9lJ5qUD+HmvDadc0Efw7OiP0U+E/CDnfPCbTtPRz05UR9cOMFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=mi7Yo20G; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=jVOub3B6; arc=pass smtp.client-ip=185.56.87.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="mi7Yo20G";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="jVOub3B6"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-tw51.prod.antispam.mailspamprotection.com; s=arckey; t=1778609448;
	 b=m9F7wSvl2WpAkQebz2MpeeFA/bL8dIGeK9gw4Cybnu0YH5kqDnFUGWTYFg92j/zkZ0GQsXisVw
	  D4YeRjrm73dJeJROKJXuFQdlO90+r1JNCS+E23q2qRWhmFXgBsGc/Pc9eE97Olgj0YOd5zjLVu
	  X3MqGKaa81MZZP1l4jZKtNNBnrdIldDseT1IUMTXX3R87hz36msW2f/VOJYl5TANVdxufdIG3l
	  14qqVx99YSqCce2rxwFHQ/fcJFlhkmA9OlHyMReqc4jcHvda3clai4P4AQ/fTdD89CZCWnTPtN
	  6dvKObkddIEtMCPPPr6RNn+3+vGZoqjfcgHLmV1fCVgyzw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-tw51.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-tw51.prod.antispam.mailspamprotection.com; s=arckey; t=1778609448;
	bh=N0ory80vSiLGWEVAEYOHsz+lROIdnBjmis4jD8LYDF4=;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	  Message-ID:Subject:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=m3qC9oCuCxEw/klI0KQnf/HdmY2un5gOJfBRvKjPkxe2x7gK5QRMiqU16+w+HtCG9T2u95TN/x
	  U8vB+6whm1BpUyUNToG3Z1DQx/cr9jlRBtefyESNIMGe09eDntMGb3QMGx+uC7ucd4roBg9QSO
	  eNjhHiZuQ7Y8M0I9tGsUWzhV51OGhmMTg3LNZIrztb/jtKkVIqv+GW/4QDkzp2VrDdQbiQsARJ
	  ILzNzy1kLpSFQl2p0RSoyNlYfQYgMdMLH9bLzVEsJbC6QRiIHM1SYRePMZtR3HB38jx94SeNSo
	  2gLUSlraJXALbmvyYAr+mxCQq6aTFjLOPCDqzGqiCT/1BA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=JuCcCssjBouozGGrCwGDqPLUK44aLy9/bRIDy8dNaOs=; b=mi7Yo20GmAKfgCVYycFsFOLmXP
	cvrGKwim/wkF55BZUfqQ7/fFTzsWaUkM6MEWAhAfmoVL8Q0adZAB6f25A+G9bQvnPsdyreEfYfI6o
	jpdwfqyDKBZ6wB7kk+nS83JZ0qQnUrbeEfLoo1dAxXhgN2oJuTd5wEc9u6X1IndI+hYI=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-tw51.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <francesco@valla.it>)
	id 1wMr7b-00000003bAU-1mwJ;
	Tue, 12 May 2026 17:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=JuCcCssjBouozGGrCwGDqPLUK44aLy9/bRIDy8dNaOs=; b=jVOub3B6/4CiZzAcBrBdp7OVvy
	SbmfAfA29fkZAQs6Sv3xpCcmtmsMy9HwGPFCL4oLbZ2KCy/tSqTdYNpImwR2dcTzoFJgvkeTxNuyP
	SevNHPyK3PhXIyyU27TiMeg/O06+WEqbn/t54xScZR8sztkG9ZB2eyKBzGbXwiMFZu+U=;
Received: from [95.232.18.244] (port=60175 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <francesco@valla.it>)
	id 1wMr6z-000000008cX-0aN7;
	Tue, 12 May 2026 17:41:41 +0000
Date: Tue, 12 May 2026 19:41:39 +0200
From: Francesco Valla <francesco@valla.it>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC v3 0/3] Add splash DRM client
Message-ID: <agNlONKkeOjnJoIr@bywater>
References: <20260510-drm_client_splash-v3-0-a9aee9f0b2fc@valla.it>
 <5d7067de-97b7-4232-9cf6-e4b978696482@amd.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d7067de-97b7-4232-9cf6-e4b978696482@amd.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: c14980a7d7858b75244963daf35804ca
X-AntiAbuse: ID - c14980a7d7858b75244963daf35804ca
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wMr7b-00000003bAU-1mwJ-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-tw51.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Mario,

Thank you for taking a stab at this.

On Mon, May 11, 2026 at 08:59:14PM -0500, Mario Limonciello wrote:
> 
> 
> On 5/10/26 16:29, Francesco Valla wrote:
> > Hello,
> > 
> > this is the third (and hopefully last) RFC version for the DRM-based
> > splash screen.
> > 
> > Motivation behind the work can be found in v1 [0]; in a nutshell, the
> > splash DRM client can draw a splashscreen using:
> > 
> >    - the BMP image supplied by the EFI BGRT;
> >    - a BMP image loaded as firmware (either built-in or loaded from the
> >      filesystem);
> >    - a colored background.
> > 
> > This revision greatly simplifies the image seletion logic; now the EFI
> > BGRT is always used as first source if enabled, with a fallback to BMP
> > image loaded as firmware and then to a plain color.
> > 
> > Sanity checks on the EFI BGRT image have been borrowed from the efifb
> > driver. More complete splash providers (e.g.: Plymouth) have an
> > extensive management of platform-specific quirks, but I don't think it
> > would be reasonable to introduce such complexity here.
> > 
> > Additional notes:
> >    - Rotation is still not managed (and probably won't?).
> >    - Support for tiled screens is untested.
> >    - Plain color and BMP sources were tested on QEMU, Beagleplay and
> >      i.MX93 FRDM.
> >    - EFI BGRT support was tested using QEMU+OVMF.
> > 
> > Thank you in advance for any feedback.
> 
> Unfortunately I found that I couldn't compile with my normal Kconfig.
> 
> ERROR: modpost: "bgrt_tab" [drivers/gpu/drm/clients/drm_client_lib.ko]
> undefined!
> ERROR: modpost: "bgrt_image_size"
> [drivers/gpu/drm/clients/drm_client_lib.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/supermario/src/linux/Makefile:2091: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> ❮ grep ^CONFIG_DRM .config
> CONFIG_DRM=y
> CONFIG_DRM_KMS_HELPER=m
> CONFIG_DRM_DRAW=y
> CONFIG_DRM_CLIENT=y
> CONFIG_DRM_CLIENT_LIB=m

Here lies the source of the issue, since I forgot to export the BGRT
table symbols. In my test setup I had the clients built-in and didn't
catch this. A simple patch (which will be included in v4) is attached.

> CONFIG_DRM_CLIENT_SELECTION=m
> CONFIG_DRM_CLIENT_SETUP=y
> CONFIG_DRM_FBDEV_EMULATION=y
> CONFIG_DRM_FBDEV_OVERALLOC=100
> CONFIG_DRM_CLIENT_SPLASH=y
> CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR=0x000000
> CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT=y
> CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT=y
> CONFIG_DRM_CLIENT_DEFAULT_SPLASH=y
> CONFIG_DRM_CLIENT_DEFAULT="splash"
> CONFIG_DRM_LOAD_EDID_FIRMWARE=y
> CONFIG_DRM_DISPLAY_HELPER=m
> CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV=y
> CONFIG_DRM_DISPLAY_DP_HELPER=y
> CONFIG_DRM_DISPLAY_DSC_HELPER=y
> CONFIG_DRM_DISPLAY_HDCP_HELPER=y
> CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER=y
> CONFIG_DRM_DISPLAY_HDMI_HELPER=y
> CONFIG_DRM_TTM=m
> CONFIG_DRM_EXEC=m
> CONFIG_DRM_BUDDY=m
> CONFIG_DRM_TTM_HELPER=m
> CONFIG_DRM_GEM_SHMEM_HELPER=m
> CONFIG_DRM_SUBALLOC_HELPER=m
> CONFIG_DRM_SCHED=m
> CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS=m
> CONFIG_DRM_PRIVACY_SCREEN=y
> CONFIG_DRM_AMDGPU=m
> CONFIG_DRM_AMDGPU_CIK=y
> CONFIG_DRM_AMDGPU_USERPTR=y
> CONFIG_DRM_AMD_ISP=y
> CONFIG_DRM_AMD_ACP=y
> CONFIG_DRM_AMD_DC=y
> CONFIG_DRM_AMD_DC_FP=y
> CONFIG_DRM_AMD_SECURE_DISPLAY=y
> CONFIG_DRM_BRIDGE=y
> CONFIG_DRM_PANEL_BRIDGE=y
> CONFIG_DRM_PANEL=y
> CONFIG_DRM_SYSFB_HELPER=m
> CONFIG_DRM_SIMPLEDRM=m
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
> CONFIG_DRM_ACCEL=y
> CONFIG_DRM_ACCEL_AMDXDNA=m
> CONFIG_DRM_ACCEL_HABANALABS=m
> CONFIG_DRM_ACCEL_IVPU=m
> CONFIG_DRM_ACCEL_QAIC=m
> ❮ grep BGRT .config
> CONFIG_ACPI_BGRT=y
> CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT=y
>

Regards,
Francesco

---
 drivers/firmware/efi/efi-bgrt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi-bgrt.c
index 1da451582812..4ca06ed5d6f5 100644
--- a/drivers/firmware/efi/efi-bgrt.c
+++ b/drivers/firmware/efi/efi-bgrt.c
@@ -17,7 +17,10 @@
 #include <linux/efi-bgrt.h>
 
 struct acpi_table_bgrt bgrt_tab;
+EXPORT_SYMBOL(bgrt_tab);
+
 size_t bgrt_image_size;
+EXPORT_SYMBOL(bgrt_image_size);
 
 struct bmp_header {
        u16 id;
--

