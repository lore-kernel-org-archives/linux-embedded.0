Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E018A921;
	Wed,  7 Jan 2026 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767753649; cv=none; b=hRl4PIhpYJ+tPmX676bwV43ty89EUpsNam18WKl30npg+Wdw+USOvJVdv9kDnjiPtK2/WQ//u0GG/cIhxfdtum8ElU13kMQAQ98/NzJFvCAkXGAIP76Ki9Bld8rFKx2o5WKm/rUqXyWznJSCkvNiM5/Mkc9wO4Ni6aohM8LGf6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767753649; c=relaxed/simple;
	bh=qP0pTeKUriG2/L9LxZppVuDsYebvRXZq6TKw7CjpZF4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YXsJQGOTVIcVxI0aHLv26sQWh6DZJzvy9ktzQ4JjXKqI7kmV4U0iyh9spBlTm7DQRfeomo9qfSbBOGzhRw8ybbDtlDmFevLSMCaBAIyf1lCMfLXzX5SX6Kmf8jaiFmCiYsHiT9NQD3lkY33R6Mb5ESh7sAoUdM+8fQ11FyhWxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDzPTVZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDzPTVZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893E7C116C6;
	Wed,  7 Jan 2026 02:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767753649;
	bh=qP0pTeKUriG2/L9LxZppVuDsYebvRXZq6TKw7CjpZF4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=kDzPTVZUrtHErqpNoei13hdQ4Niojt0x4jHkZULcTw+Ft/TirZSnwhBx/kja6PyPt
	 EfzXEbRforxo7D9wKh50PB+4iiMC1rLF22oUyzJ3kXT0w4sGH4a/Ppk1kwwd2RbzBs
	 Zn9Mo2nq8xolQb0HUsCfqtaP4rkdowIuEudJ31ChG0mub9iIuWrJrdd+rZ4Deqs+Fl
	 g2bF+xbqsfVLz2TBcP/AUfOdw57Jy+r8gDJTgcZSdnmjVcR/SeQ8MCtCZqv0VSOEVx
	 oZhJCXdu/ammLyrpp/egOXpLY4l+Zd77V0v6bfSMWYz2yH5xVh1cq//ibuRgzagOEt
	 gtJKTPAbr/9sg==
Message-ID: <12c72476-a4e8-4b00-80ae-b8eed0b6f7a7@kernel.org>
Date: Tue, 6 Jan 2026 20:40:46 -0600
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
 <894581a9-2a30-428d-ab94-34697147d68e@kernel.org> <aV1xe09kYUwj4ocm@bywater>
 <dedc1825-26ca-4976-b174-8d7a740e25e3@kernel.org>
Content-Language: en-US
In-Reply-To: <dedc1825-26ca-4976-b174-8d7a740e25e3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Yes, that's the idea. I am still searching a EFI-enabled platform I can
>> perform some proper tests on, as I'm not really familiar with EFI.
>> This version was tested with OVMF on QEMU, but without a real userspace.
> 
> Almost any modern x86 platform except for a chromebook uses EFI.
> 
> I'll add them to my local dev tree and test too and see if I can get you 
> some feedback if I run into any problems.
> 
 From my side when testing I hit this during kernel build:

ERROR: modpost: "bgrt_tab" [drivers/gpu/drm/clients/drm_client_lib.ko] 
undefined!
ERROR: modpost: "bgrt_image_size" 
[drivers/gpu/drm/clients/drm_client_lib.ko] undefined!
