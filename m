Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614793EBF01;
	Fri, 23 Jan 2026 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769205291; cv=pass; b=GAomwPDzSnLWjmsCbW9ZK4tnAvh7L4jd/2jXmq49uEJbyewiqsk1yseMT5mwUVfXhKNsxlxKIgdJ0qD8CR7qKrRLq0I/+/D3U78qqMZScKrFho1MLQdm4VLyd8JUKC+BYC1LbQAqXW9n00Z6X1TvbLn1uIJJhGP86uWq36pJXOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769205291; c=relaxed/simple;
	bh=CqTT7cWwu16mdwerni7Oo2LG+q1ewbjk+4Q9cn4O3e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CW2foKoEAv9SF3mkLzt4CaQ1LrwqFVxfWQB1ai3GaA1PA44HhJ4AXDUjzQ3nnlexu0EnhGSh8WoG/RgDiDbKXv3K1bbfzT6hMqcHd/yjAW/wB3zj6fX3xqvcHMv3uloEo6HRWrAglm8oU2rfaMrxZzlf3/5Es++Pv50/t6ATT64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=NB5Nqjwy; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=YptXpZtq; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="NB5Nqjwy";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="YptXpZtq"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-q28n.prod.antispam.mailspamprotection.com; s=arckey; t=1769205289;
	 b=jQuw8huuQXOcn4Xs3yjZVLJE1Ryhc10zLiGCPu/ZC+Jk5MkNJQ0ZZB396tRVV4bTror8EF7dsJ
	  EidGqAuvJ4/nXBnzO0UOAVeMp9H+UEQvFvcfMtOwz1GM9RutiBb8F8K5VWy0yILKCwTirdDqk3
	  0WcnizKU9O1JeFoWthQhKdcZJ0jtXGxfCSTdCg7Tk31mGuACsAezL6dTKjMU+Hcx/6Rvup0+iO
	  qoSLH8BVZleBubrr8lATEyBKRjyNP5uxyqhIbSrbYgJcFO9TIB902xoeNO2+VawDUr/toMjFSH
	  rnGntUGJzLoDj5b7xXSmXqSoy5/NUwjw6zu1d9InazjbGw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-q28n.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-q28n.prod.antispam.mailspamprotection.com; s=arckey; t=1769205289;
	bh=CqTT7cWwu16mdwerni7Oo2LG+q1ewbjk+4Q9cn4O3e8=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=HdTh7qoNu5pbH5vnI0q91atMH+JHB7/5tFabNEDNpXxUkioyXXv3ZC4bF7H9bKRi0meCdAxXK6
	  qG9SlZ5LNV4AKbrMBRMJiAWjc2DQe4kO96yhDXspa8+xeAyR7rR20aoInkzkt9JFLAloL/IzpA
	  oQkfEIlrM2dvmMM+Rb3P1zNnGDrA17TuY5ADyZ59NI+U6+mGZAeJsS0MWHkNs2hIWBIRzap2fg
	  3o9FbpO9QePdgD9swV+ftesm0SeVtElCGpYg3AhIl3t0HDE90CEU/W6dwusR+P3z1Uw4FELJx0
	  M3yd9YV+zdvl0MaboRm8RTGUapzgVsOXbjGQNGNmQVuGeQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=Znn4tqkGUcgabiI24TDvOgOm/7lC7GjaaWy+L2yLzEo=; b=NB5Nqjwyv9+TczYa0Z4qWKYOmh
	UPUTYQ0NgN9dPJCtLBDHDCqXl/9u98TjIKWrevMjmVDdYH7xAl7GMDzSe6vHUo+5PYfqbAyFRL4tP
	Ky7317fhdUK5RAz798LVxPyGOPeHXQdv2Eo7GRuKfMsTkZpa6wALyH99rMQhM52NQ6Ew=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-q28n.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vjOGQ-0000000E2u1-1P1W;
	Fri, 23 Jan 2026 21:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=Znn4tqkGUcgabiI24TDvOgOm/7lC7GjaaWy+L2yLzEo=; b=YptXpZtq7nyKAA4PvGMA9BW93E
	qZ5b9FYlt4RZUVG9AaFPW4zrBs8FiXdTcISXeAOwHoR6OW12L0lYYPGKnbqh9lSG5zged0lWnO13O
	tig57yRqhIyonmaPd5Vm1YKOYJ8T9+CZXnkDjK+SpBMlTXJWp+7TqUJy1GFG4zgsFB1g=;
Received: from [95.251.204.145] (port=63454 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vjOFy-000000003Ws-3AwI;
	Fri, 23 Jan 2026 20:59:50 +0000
Date: Fri, 23 Jan 2026 21:59:47 +0100
From: Francesco Valla <francesco@valla.it>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
Message-ID: <aXPhQ-KQOBobMBMh@bywater>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
 <20260122-scallop-of-original-domination-3a554a@houat>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-scallop-of-original-domination-3a554a@houat>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: f649a377918a4c9fe08e214c718fe34f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vjOGQ-0000000E2u1-1P1W-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-q28n.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Maxime,

On Thu, Jan 22, 2026 at 02:36:56PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jan 06, 2026 at 03:25:40PM +0100, Francesco Valla wrote:
> > Add a DRM client that draws a simple splash, with possibility to show:
> > 
> >   - a colored background;
> >   - a static BMP image (loaded as firmware);
> >   - the logo provided by EFI BGRT.
> > 
> > The client is not meant to replace a full-featured bootsplash, but
> > rather to remove some complexity (and hopefully boot time) on small
> > embedded platforms or on systems with a limited scope (e.g: recovery
> > or manufacturing images).
> > 
> > The background color can be set either at build time from a dedicated
> > config option or at runtime through the drm_client_lib.splash_color
> > command line parameter. Any color in RGB888 format can be used.
> > 
> > If enabled, the static BMP image is loaded using the kernel firmware
> > infrastructure; a valid BMP image with 24bpp color and no compression
> > is expected. The name of the image can be set through the
> > drm_client_lib.splash_bmp kernel command line parameter, with the
> > default being 'drm_splash.bmp'.
> > 
> > Just like the existing DRM clients, the splash can be enabled from the
> > kernel command line using drm_client_lib.active=splash.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/gpu/drm/clients/Kconfig               |  79 ++-
> >  drivers/gpu/drm/clients/Makefile              |   1 +
> >  drivers/gpu/drm/clients/drm_client_internal.h |   9 +
> >  drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
> >  drivers/gpu/drm/clients/drm_splash.c          | 883 ++++++++++++++++++++++++++
> >  5 files changed, 979 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
> > index 6096c623d9d5b1a3d4a40d986c45aad2f8277767..dd8cd6cacd1166932eb3890dd816b9ae2d26330f 100644
> > --- a/drivers/gpu/drm/clients/Kconfig
> > +++ b/drivers/gpu/drm/clients/Kconfig
> > @@ -12,6 +12,7 @@ config DRM_CLIENT_LIB
> >  config DRM_CLIENT_SELECTION
> >  	tristate
> >  	depends on DRM
> > +	select DRM_CLIENT_LIB if DRM_CLIENT_SPLASH
> >  	select DRM_CLIENT_LIB if DRM_CLIENT_LOG
> >  	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
> >  	help
> > @@ -85,10 +86,79 @@ config DRM_CLIENT_LOG
> >  	  If you only need logs, but no terminal, or if you prefer userspace
> >  	  terminal, say "Y".
> >  
> > +config DRM_CLIENT_SPLASH
> > +	bool "Display graphic splash"
> > +	depends on DRM_CLIENT_SELECTION
> > +	select DRM_CLIENT
> > +	select DRM_CLIENT_SETUP
> > +	select DRM_DRAW
> > +	help
> > +	  This enables a splash drm client, able to display either a plain
> > +	  color or a static image until the userspace is ready to take over.
> > +	  The splash will be displayed on all screens available at boot, if
> > +	  any, or on the ones part of the first hotplug event.
> > +
> > +config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
> > +	hex "Splash background color"
> > +	depends on DRM_CLIENT_SPLASH
> > +	default 0x000000
> > +	help
> > +	  The default splash background color, in RGB888 format.
> > +
> > +	  The color can be overridden through the drm_client_lib.splash_color
> > +	  kernel command line parameter.
> > +
> > +config DRM_CLIENT_SPLASH_BMP_SUPPORT
> > +	bool
> > +
> > +choice
> > +	prompt "Splash source"
> > +	depends on DRM_CLIENT_SPLASH
> > +	default DRM_CLIENT_SPLASH_SRC_COLOR
> > +	help
> > +	  Selects the source for the splash graphic.
> > +
> > +config DRM_CLIENT_SPLASH_SRC_COLOR
> > +	bool "Solid color"
> > +	help
> > +	  Use a solid color as splash. The color is selected through the
> > +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option.
> > +
> > +	  The image will be loaded using the firmware loading facility the
> > +	  kernel provides.
> > +
> > +config DRM_CLIENT_SPLASH_SRC_BMP
> > +	bool "BMP image"
> > +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> > +	select FW_LOADER
> > +	help
> > +	  Use a BMP (bitmap) image as splash. If the image is smaller than the
> > +	  display(s), it will be centered and the color specified through the
> > +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option will be used as
> > +	  background.
> > +
> > +	  The image will be loaded using the firmware loading facility the
> > +	  kernel provides; it shall use 24 bits per pixel and shall not be
> > +	  compressed. The name of the file can be set through the
> > +	  drm_client_lib.splash_bmp command line parameter, with the default
> > +	  being 'drm_splash.bmp'.
> > +
> > +config DRM_CLIENT_SPLASH_SRC_BGRT
> > +	bool "EFI BGRT"
> > +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> > +	depends on EFI
> > +	help
> > +	  Use the BGRT image provided by the EFI bootloader. If the image is
> > +	  smaller than the display(s), it will be centered and the color
> > +	  specified through the DRM_CLIENT_SPLASH_BACKGROUND_COLOR config
> > +	  option will be used as background.
> > +
> > +endchoice
> 
> I'm not sure we should consider it a xor choice. If we do, that means
> that it's effectively unusable by distros, since you don't know ahead of
> time if the platform it's going to boot on will have a BGRT or not.
> 
> Trying BGRT, and then falling back to either an image or a solid
> background would be easier to work with.
>

Thanks for the feedback!

Also considering that BGRT requires some logic to work properly, which
is not present in this version (and here I am referring mostly to the
rotation/positioning quirks), I think I'll go down this very route for
the next version and get rid of the function pointer logic.
The idea was to avoid ifdefs _and_ be open for future expansions, but
in the end it would probably look ugly.

> Maxime

Regards,
Francesco

