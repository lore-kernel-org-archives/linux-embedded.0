Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9B227BB5;
	Wed,  7 Jan 2026 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767824959; cv=pass; b=Axd9EAdHpwMntQ8EPcWCNYRV7Xz9859XvhJBAmgICh/85L93HF9vxOD78DCYHwlm2egX3QL1cH83nJWACylaFw6nFbABGZD7jivYSVZCiwd5KTibLwuVUueinr1dYGWLarTwXIANBK44BNFbBHd90hUO5DSo/TdHOHU/Jnev090=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767824959; c=relaxed/simple;
	bh=vUJ0BbrXYh7mZy663ljqfYIed37Fm7MXEIH9GYaQaRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuLoja8Cfi3NXQssW25cnhPlz1Bx9UWkV+9jM46LnVYEODK1XC7qYufdMbCexEtYNulw1F1eteLJNOOhvcbgNRHuKWe/1i15mrjrwlYyXP6ci5DRGbjvDugvkrSi5QkRjlHg7J/x9UTfVw3izeLdPZxa0tXLfI/0rwg7KNPCfR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=IQ6lGfLE; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=PBQACCoT; arc=pass smtp.client-ip=185.56.87.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="IQ6lGfLE";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="PBQACCoT"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-6qs6.prod.antispam.mailspamprotection.com; s=arckey; t=1767824956;
	 b=LHnUqGPHNPowcOV8CxKxvoW6b3Uzta9DS8TnhLg1CPzG/nSzRYivlLH8Gc9k0XZQKZyNPyN374
	  d+2WUmYR/RBxf8/1u7kOFK+ZhzxvTlzXXSu6PePLsJNgk/THNKlqP0tn0i2nNsg8YI32EKx/1N
	  MtGYyyKBXSqLNMdHXxO3wV77yVlXubqE1YmevPOBeFo2CxOspwy8t9pcbYKJqoNAZ8nL8fOnn/
	  EftPIewyBL2FP/tHN8RkAc0b90DPo3jjbs43GcurtYCA7ppSuYnZKqyGeHgDlBQfqM9yf7m1aI
	  l0TKKCbxdXq7/ttadxmLChV0hqaOQU2hEUC0mO2HVqit2A==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-6qs6.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-6qs6.prod.antispam.mailspamprotection.com; s=arckey; t=1767824956;
	bh=vUJ0BbrXYh7mZy663ljqfYIed37Fm7MXEIH9GYaQaRw=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=FWi+F5RTCiveSAONaMzz4SlgORMyBE0mmkH1NruJe48rP5aGqhW/bfRsph+sGDqdRrCnV/hyAN
	  EMA+gHVwGwxInSgHAne+JmZydYmi+GCo85mI1cx8LAKhPM7H9msRYaMtl/vOHekme7sDB1asTF
	  jd8VoDCtvihzZYNM0gj+f6xSq7mT7jQfbyzOaCHJuFoVUK3UZ8GooP1xGBCWhZNfF4k+epT2IT
	  w0rBiPYAnun7iiPQ2nW7YQOoYAklitAKQsluFzluJyfps5+6n2X9jA8Me4uLGWn+Yds4vRZWW/
	  9nZlHKyeJlCHR8aNmFLzmWMiaWz7fBJLFEqxbkU4Iup7yg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=yVpw/AFuECU04xueC/YGj/KVCIxCNmuJWWOG1YRA/ns=; b=IQ6lGfLE57n/ONvNZyf960yOSU
	dYcikvUgVhaNhcwDSF7DGdJnU6NGm3YN1qKUqviVYe0LrNsxVEVS6Z23QqiBRMIp/bR+CfzbSCn1v
	nwfhZGJB7NK/sAs8fLuVbY4A9+50h7CXtS19dC/Kr4u+LmpY2JhuT64yFtnbDV9bDvrA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-6qs6.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vdc1Z-0000000Ggzw-2ssP;
	Wed, 07 Jan 2026 22:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=yVpw/AFuECU04xueC/YGj/KVCIxCNmuJWWOG1YRA/ns=; b=PBQACCoT+6hh/NZcgoOJuQrlyl
	AwyX7RM6fS0wUTl/N2m4KlG8PIsV41d4736N+derKRY6gvBkcko+zzKriqABXlCcdZmZGzc9nGXYw
	/WLBORKPx8Y/mpxbzSH+lrc9RAjfdxnntlULWjn8oAamIcupVWU6xjI7Z0iE5hvzIF9Y=;
Received: from [95.248.141.113] (port=63495 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vdc1B-00000000BOX-0u1s;
	Wed, 07 Jan 2026 22:28:41 +0000
Date: Wed, 7 Jan 2026 23:28:39 +0100
From: Francesco Valla <francesco@valla.it>
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
Message-ID: <aV7eF5C_yUGAfdRe@bywater>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
 <894581a9-2a30-428d-ab94-34697147d68e@kernel.org>
 <aV1xe09kYUwj4ocm@bywater>
 <dedc1825-26ca-4976-b174-8d7a740e25e3@kernel.org>
 <12c72476-a4e8-4b00-80ae-b8eed0b6f7a7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12c72476-a4e8-4b00-80ae-b8eed0b6f7a7@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: f59ea43727b9503e245a7c191050347c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vdc1Z-0000000Ggzw-2ssP-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-6qs6.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tue, Jan 06, 2026 at 08:40:46PM -0600, Mario Limonciello (AMD) (kernel.org) wrote:
> > > Yes, that's the idea. I am still searching a EFI-enabled platform I can
> > > perform some proper tests on, as I'm not really familiar with EFI.
> > > This version was tested with OVMF on QEMU, but without a real userspace.
> > 
> > Almost any modern x86 platform except for a chromebook uses EFI.
> > 
> > I'll add them to my local dev tree and test too and see if I can get you
> > some feedback if I run into any problems.
> > 
> From my side when testing I hit this during kernel build:
> 
> ERROR: modpost: "bgrt_tab" [drivers/gpu/drm/clients/drm_client_lib.ko]
> undefined!
> ERROR: modpost: "bgrt_image_size"
> [drivers/gpu/drm/clients/drm_client_lib.ko] undefined!
>

I got the dependency wrong there, mistrusting the efifb driver (but I
should have checked). I made CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT dependent
on CONFIG_EFI, while it should depend on CONFIG_ACPI_BGRT (which in turn
depends on CONFIG_EFI). I'll fix in the next revision (if the overall
work is deemed useful).

Also, please note that the current version is not considering the x/y
offset provided by the BGRT, nor the associated quirks and sanity
checks.

Thank you

Regards,
Francesco

