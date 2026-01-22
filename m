Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83325A2C9;
	Thu, 22 Jan 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089020; cv=none; b=ilbrRc0rhTUTxsxgkPHYlUbTcjWCz9T5L/4/eS8M0Qk3ahZ1bbP8+wsoGLdsK+u94DHa/K/6jGWXx9+0nqE8sqLdzVCLE2RpwG14CyBlS63okSoKt3SCMj2ehdXCS393edrCMroK/VRESo9bgjcc89AZ25MEafo2zpX8wTwsbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089020; c=relaxed/simple;
	bh=2FDnlfFR2kuk4iGcDnZBPalyMLv3KJKOEs4Wqxxlk8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETEErslF04DMSIglbjhclohjP6Q4uXr3sO/UZXA+1upKFOfCW1NmCl3VOgpoOhZQmRlS6rRbryoMxSo+6YwRFeVK9ld3lVkGz/jN7YvaVYiY9JuU8aQ8YpExtDgwgwxEVLWGyNDOv4A9sWOxkh12N2tGwq1PLYtgrAMA8iChJps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjYMTE/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjYMTE/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A39C116C6;
	Thu, 22 Jan 2026 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769089019;
	bh=2FDnlfFR2kuk4iGcDnZBPalyMLv3KJKOEs4Wqxxlk8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjYMTE/FBf92snO8Su/XNGJ1Hw4o9A3MYD/9s/TDdRZXHVy25Orqaif7WyFkJJtEp
	 AwZXELH1wGDOk97JrJIv6S76n8cPsbFwE1zqmDR1S2QfMdArfx+k/e/Y6zpp4tcigr
	 BuPpmiFS5dw1gMa7VOCo0VvJbCH00555zmo04XyJT0HWVDkFsSdl3QAaMvht2JwWua
	 vmar0f5lDV5ISqAnfQ6+v06TR7Erkn0d9jTZRoaIdvRMHLCQJGyA60d/WRyaL2ecaM
	 TXkOWerCs1ZfzjokKZ+vOqvWvUqfaMk0+IBABBFS/qs39afeGHD277SYyP0l2W80r+
	 YrucdFWraLT9A==
Date: Thu, 22 Jan 2026 14:36:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Jocelyn Falempe <jfalempe@redhat.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Mario Limonciello <mario.limonciello@amd.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
Message-ID: <20260122-scallop-of-original-domination-3a554a@houat>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nyep2vueegdcpefg"
Content-Disposition: inline
In-Reply-To: <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>


--nyep2vueegdcpefg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
MIME-Version: 1.0

Hi,

On Tue, Jan 06, 2026 at 03:25:40PM +0100, Francesco Valla wrote:
> Add a DRM client that draws a simple splash, with possibility to show:
>=20
>   - a colored background;
>   - a static BMP image (loaded as firmware);
>   - the logo provided by EFI BGRT.
>=20
> The client is not meant to replace a full-featured bootsplash, but
> rather to remove some complexity (and hopefully boot time) on small
> embedded platforms or on systems with a limited scope (e.g: recovery
> or manufacturing images).
>=20
> The background color can be set either at build time from a dedicated
> config option or at runtime through the drm_client_lib.splash_color
> command line parameter. Any color in RGB888 format can be used.
>=20
> If enabled, the static BMP image is loaded using the kernel firmware
> infrastructure; a valid BMP image with 24bpp color and no compression
> is expected. The name of the image can be set through the
> drm_client_lib.splash_bmp kernel command line parameter, with the
> default being 'drm_splash.bmp'.
>=20
> Just like the existing DRM clients, the splash can be enabled from the
> kernel command line using drm_client_lib.active=3Dsplash.
>=20
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/gpu/drm/clients/Kconfig               |  79 ++-
>  drivers/gpu/drm/clients/Makefile              |   1 +
>  drivers/gpu/drm/clients/drm_client_internal.h |   9 +
>  drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
>  drivers/gpu/drm/clients/drm_splash.c          | 883 ++++++++++++++++++++=
++++++
>  5 files changed, 979 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kc=
onfig
> index 6096c623d9d5b1a3d4a40d986c45aad2f8277767..dd8cd6cacd1166932eb3890dd=
816b9ae2d26330f 100644
> --- a/drivers/gpu/drm/clients/Kconfig
> +++ b/drivers/gpu/drm/clients/Kconfig
> @@ -12,6 +12,7 @@ config DRM_CLIENT_LIB
>  config DRM_CLIENT_SELECTION
>  	tristate
>  	depends on DRM
> +	select DRM_CLIENT_LIB if DRM_CLIENT_SPLASH
>  	select DRM_CLIENT_LIB if DRM_CLIENT_LOG
>  	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
>  	help
> @@ -85,10 +86,79 @@ config DRM_CLIENT_LOG
>  	  If you only need logs, but no terminal, or if you prefer userspace
>  	  terminal, say "Y".
> =20
> +config DRM_CLIENT_SPLASH
> +	bool "Display graphic splash"
> +	depends on DRM_CLIENT_SELECTION
> +	select DRM_CLIENT
> +	select DRM_CLIENT_SETUP
> +	select DRM_DRAW
> +	help
> +	  This enables a splash drm client, able to display either a plain
> +	  color or a static image until the userspace is ready to take over.
> +	  The splash will be displayed on all screens available at boot, if
> +	  any, or on the ones part of the first hotplug event.
> +
> +config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
> +	hex "Splash background color"
> +	depends on DRM_CLIENT_SPLASH
> +	default 0x000000
> +	help
> +	  The default splash background color, in RGB888 format.
> +
> +	  The color can be overridden through the drm_client_lib.splash_color
> +	  kernel command line parameter.
> +
> +config DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	bool
> +
> +choice
> +	prompt "Splash source"
> +	depends on DRM_CLIENT_SPLASH
> +	default DRM_CLIENT_SPLASH_SRC_COLOR
> +	help
> +	  Selects the source for the splash graphic.
> +
> +config DRM_CLIENT_SPLASH_SRC_COLOR
> +	bool "Solid color"
> +	help
> +	  Use a solid color as splash. The color is selected through the
> +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option.
> +
> +	  The image will be loaded using the firmware loading facility the
> +	  kernel provides.
> +
> +config DRM_CLIENT_SPLASH_SRC_BMP
> +	bool "BMP image"
> +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	select FW_LOADER
> +	help
> +	  Use a BMP (bitmap) image as splash. If the image is smaller than the
> +	  display(s), it will be centered and the color specified through the
> +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option will be used as
> +	  background.
> +
> +	  The image will be loaded using the firmware loading facility the
> +	  kernel provides; it shall use 24 bits per pixel and shall not be
> +	  compressed. The name of the file can be set through the
> +	  drm_client_lib.splash_bmp command line parameter, with the default
> +	  being 'drm_splash.bmp'.
> +
> +config DRM_CLIENT_SPLASH_SRC_BGRT
> +	bool "EFI BGRT"
> +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	depends on EFI
> +	help
> +	  Use the BGRT image provided by the EFI bootloader. If the image is
> +	  smaller than the display(s), it will be centered and the color
> +	  specified through the DRM_CLIENT_SPLASH_BACKGROUND_COLOR config
> +	  option will be used as background.
> +
> +endchoice

I'm not sure we should consider it a xor choice. If we do, that means
that it's effectively unusable by distros, since you don't know ahead of
time if the platform it's going to boot on will have a BGRT or not.

Trying BGRT, and then falling back to either an image or a solid
background would be easier to work with.

Maxime

--nyep2vueegdcpefg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXIn8wAKCRAnX84Zoj2+
dm5TAX4qxeetIbWWZPq42N6AH0KKAMadyxwoFv2Cdm6BkpV0rxZb5cqi8e/79tsr
B+XVCnMBgJtLQ4XFJfQG13Ux502kUTUFkyNj/6ADaAvxxxnlnBVttXPNNHAKSi5t
6hfcHl9UYQ==
=JdxG
-----END PGP SIGNATURE-----

--nyep2vueegdcpefg--
