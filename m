Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260ED1DA23;
	Tue,  6 Jan 2026 20:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767730971; cv=pass; b=i0AtpWli3KegdOODX3GiW0HrUqMRie6JVk7sYUCTML0V7R+mdNz8+zpo+mb2x0qcRTFleFp2Ynbd7wP12rp1Yw4I/JVpsiMKQTjosoSaEHFnamxaxUsFurBdV8gO1pSri9wbFDFA8bpolCCuJRwc7SJ4ekFhq1NJoFNDPAIVIT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767730971; c=relaxed/simple;
	bh=xFfuh+sKr/gblK4bi+Y9pT+roZCiRJQay4kPG4+F1wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnjtIVknw2bqm9YbIDQTHZPIZztHCJz3KLhi6gDRjmx3Z1E3F4Lg/eT7jwIJYOfv1LLW/X9/T6RvzvhFtPKRvKRHs99E1GUzI/20PMOxuAjiLNIMMk5lIhIc9EA6y3wPZjcdzAQgEOHa/07n/1uI6rS9yY7gq2wHfA35PPSL4UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=nSBO/4jo; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=itu4/rge; arc=pass smtp.client-ip=185.56.87.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="nSBO/4jo";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="itu4/rge"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com; s=arckey; t=1767730969;
	 b=A93AbnU//5jBv8IA7p9BbNGeLoH3ryTyqK4Nfb4JS7Kt3/i/3H7zaEKchDwjfEUUO4drdZ8Au6
	  q+1AoqsTo3a7hcw8DCJah8VdwZsmu0a+0P66mzU/uyXUIwCqH/vslBnanLL8/7Uahk9IN39jtM
	  re0/K+YWgxFW7RjHBHHxjx28q0AgxVYGwz2QgOVRU2EA7I61oC+A3BDsruCo+YsjQ8ZwHV2jLM
	  OlXMjfjXBV0GxKFtex2gT0kmr7AmVppSDlZdANMPmbMlDc02rqs+0eHEYbwvHcRRAKCMynynrc
	  T9fGF2QDNzZccYxsyowY1qxTewr9xp9HkzR3P0d9ffnzEQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com; s=arckey; t=1767730969;
	bh=xFfuh+sKr/gblK4bi+Y9pT+roZCiRJQay4kPG4+F1wQ=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=fP9dvm/t1U7WtC1o3DfJTyjOogo4ZdO+k9v6Ea3tdbN98w5x8rF9UU5u4m7mPhPVI8py1gJZUK
	  O9ukD47/xpO8itJ5gX6Okx4auuocgMQZIsNGLbx051FSG0ovpSUW5gVWRdSw30AoX7Z/IOwUKB
	  D4CtmaAhC6fBVeVl8GXElrgaOpN8LpA9crNdG6FRXRuG+tyEHjRJbhnd0LvgHa6nHlv7IuKzis
	  0tH/qDU9ksChZux3JUdl0tfuijHR+XG8bh6hIGZ5L1fk2RkU/fjObk2V0bmQHt0FAob41GDDUL
	  ZrzqrbmK1xCY7Ie1WCmDL48z9WAsyC2vxQ17TADAZY8lWQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=UiTrcBdtbQDlRNy2NR9I0n40HqJp4rOp82+eaVbqqJU=; b=nSBO/4jonySyvHu1gOKa6BE2Ru
	sXD8BUaZNX/qUWhAouC3sJcWJkDDNebkBIFeesg8oNrr9+IQKqro0p/6A8eDSOE3j5sYwkwZrfg68
	Pk3BGtLg+OsEMfaf2Td9Gfgf1s65NoAZHGbwi3Ox6aTApuN7Gqe55TXR6cYhG2L5MB7A=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vdDZf-0000000EtZP-14O0;
	Tue, 06 Jan 2026 20:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=UiTrcBdtbQDlRNy2NR9I0n40HqJp4rOp82+eaVbqqJU=; b=itu4/rge2gUT/OtuxyXIk1iOld
	i3yiUJPnG5C6kovEpiu8XsOs1b1ag2rYXmpsB+w9/4mlAPEh9+hTz7nkrrFZ5QLlsMzPd965nGzUA
	p2FKri/K4oyhpzVljChq7To0F1sswBIjbT4WDadRnPyXFpmp7ZwQ5nc9SN2xgofFRBLY=;
Received: from [95.248.141.113] (port=61851 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vdDZH-000000004u2-1hq5;
	Tue, 06 Jan 2026 20:22:15 +0000
Date: Tue, 6 Jan 2026 21:22:13 +0100
From: Francesco Valla <francesco@valla.it>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
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
Message-ID: <aV1u9QBxfWyDcqKB@bywater>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
 <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 90cfa2c2116e2fd882e48eae592b53ca
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vdDZf-0000000EtZP-14O0-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Geert,

On Tue, Jan 06, 2026 at 03:47:49PM +0100, Geert Uytterhoeven wrote:
> Hi Franceso,
> 
> On Tue, 6 Jan 2026 at 15:26, Francesco Valla <francesco@valla.it> wrote:
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
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/drivers/gpu/drm/clients/drm_splash.c
> 
> > +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)
> 
> There is no need to protect this block with #if, as it does not generate
> any code.
> 

This was left here when I moved some code along - I'll remove the
guards.

> > +#define BMP_FILE_MAGIC_ID 0x4d42
> > +
> > +/* BMP header structures copied from drivers/video/fbdev/efifb.c */
> > +struct bmp_file_header {
> > +       u16 id;
> > +       u32 file_size;
> > +       u32 reserved;
> > +       u32 bitmap_offset;
> > +} __packed;
> > +
> > +struct bmp_dib_header {
> > +       u32 dib_header_size;
> > +       s32 width;
> > +       s32 height;
> > +       u16 planes;
> > +       u16 bpp;
> > +       u32 compression;
> > +       u32 bitmap_size;
> > +       u32 horz_resolution;
> > +       u32 vert_resolution;
> > +       u32 colors_used;
> > +       u32 colors_important;
> > +} __packed;
> > +#endif // CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT
> 
> As per [1], all these values are little-endian.  Hence they should
> be declared as such using le16 or le32, and accessed using
> get_unalined_le{16,32}().
> 
> [1] https://en.wikipedia.org/wiki/BMP_file_format#File_structure
> 

This is obviously right, I'll use proper accessors in next version.

I wonder why this is done precisely this way inside the efifb driver,
but that's maybe because all EFI platforms are little-endian? 

> Gr{oetje,eeting}s,
> 
>                         Geert
>

Thank you!

Reagrds,
Francesco

