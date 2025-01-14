Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FB514A4C1
	for <linux-embedded@vger.kernel.org>; Tue, 14 Jan 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867861; cv=none; b=UxUb2xTzpFdCgcu+QBmKucsPgeDiHH8lbSfuxA4TpWNt63EOZj5cx/A2pphwwXJcdETD5RGv85JwObhkzWXgsuYPMIENiFRXjcN+jCPb3rFvimgLGjjOI5Y9i1E3cbUUzM6dwDS1iTIWR+tIuoFIf9AiPbQVoBHiJXmLh2Nae2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867861; c=relaxed/simple;
	bh=NBuGmcOpqC4nWV/fEw3yrmiEGTLBlv95n0WO8ulRwJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgaS1X+jpS6QmRilaf6Z3t3+H5kXyogwuP+G0xCk+kn7aBP0UnajXPOtdU87rXSmw+JMyfKITYHKUkmLh31v7/FkbP0ptVRT3sfHcJS0HLBQ8gPm4EO+e6F7tg1wfd91QJatnHTH9TyTf0JzC4ZU3jDG2YJ3wksNGnZlBELQjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=cL5rFEaT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="cL5rFEaT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1015381666b.2
        for <linux-embedded@vger.kernel.org>; Tue, 14 Jan 2025 07:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736867858; x=1737472658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQWVZCzJjONf9MD2zqQKoSy7C5/tRi8G57MPvXxDJbk=;
        b=cL5rFEaThkN7DxUfy8mnUlBRhuICMySD7uhU2qEzQ2/uDoXQj7LYUmeQsXU2+3HupD
         ct8/Ww0iz6X9VMupBMPZihpPzfiWUe3VH0tkJo6Eo2URomUC00RjogL2Bl4+2Gd+4o5v
         jPDiDjBlSqpnOuGWtipolyrBg1J6Pv1EkPo9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736867858; x=1737472658;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQWVZCzJjONf9MD2zqQKoSy7C5/tRi8G57MPvXxDJbk=;
        b=KknYYyN0eP3ae+hg8BdHK/o+ZTyP03eC7yB0ie//6C8igZdXKpu7cIvPypmuysTxJJ
         7QecVfFtWecr5eNrz7sBZNyUd3zdxHhahDV4zleNg6Xd7b/Fv8d1lKGEKBTG54447bOm
         Iy1YwvTy7bD0uzNIQ8I8uv5U5PaL7pcomeKqFtIl+IBWbFjgeEQ4hJztEiJoxDHeOwhN
         4GBJKVg8ArprbIN8wvfC/H+VPi1DkEaCMjBTmi1ob1VLaa7oEitfDZ2APc9eJaLPLOm4
         gDeQUitQl1mhLixP+Zo2RUdpI85o5KUCvnITguY7Ak6mWpXKkV+eGuk8vHQpTn1h61U3
         xkMg==
X-Forwarded-Encrypted: i=1; AJvYcCWUjmtzTuY8T6H/kyiVVfFUx03ugeeoTNm16rHUvtRDPje3OVRN/Lr8IeserGQAjbQt/TiRd1tjtdH7bcwYyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwApSocY2/mT2/yQsEZxyFhbJhdE5m0pH4ngQJzXXra0uMx2h3+
	3jtoyjltK8HNj4WEaQ6Nj/NyT3Q/i171pFLXIVY9O0XiFy6XaWrJP9dcEjbpTd4=
X-Gm-Gg: ASbGncsYsXer8gS+dQOT3Zz43UpqW7LiXVJltfNcQmT8Ou23xBE4XFTBzrnBmBySaH/
	hVUISaC+9eAB6TQgs7tSqkHGgWxAVkVvxpf2KrkWCllmvIjDcJCJLHy8Msd7pBsrGCKRTQ+7MCl
	0sqwAKDjXtBXjOTuVFxEsnINTi2/WntQ/qIaAxC0+Yf+lSU1q4e/yxCGehfxVB1BqJyCEI7pidh
	MvXPe537pKu3LlQ0k7tpzB5KDuTs3fnO63OiAwId2S6q2JKPkEnkFkXkLZGAZ5ZVmWx
X-Google-Smtp-Source: AGHT+IGT2QdUEExo3ZYiHoJHmXJJ/EkUrorLws5bU4PVtJoU0zzZ/jzA8NZO5j2BZKS0oNyTy74E/g==
X-Received: by 2002:a17:907:6d04:b0:aa6:9ee2:f4c9 with SMTP id a640c23a62f3a-ab2ab6c6dffmr2382002566b.23.1736867858477;
        Tue, 14 Jan 2025 07:17:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d9ae0sm648358966b.68.2025.01.14.07.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 07:17:38 -0800 (PST)
Date: Tue, 14 Jan 2025 16:17:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Hector Martin <marcan@marcan.st>
Cc: devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-usb@vger.kernel.org, linux-embedded@vger.kernel.org,
	Asahi Linux <asahi@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: Re: Unified Type C PHYs and top-level port management
Message-ID: <Z4aAEA6Kmc4R-Wlb@phenom.ffwll.local>
Mail-Followup-To: Hector Martin <marcan@marcan.st>,
	devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-usb@vger.kernel.org, linux-embedded@vger.kernel.org,
	Asahi Linux <asahi@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
References: <fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marcan.st>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marcan.st>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Tue, Jan 14, 2025 at 09:32:11PM +0900, Hector Martin wrote:
> - On the DP/display side, we haven't implemented this yet, but in the
> future the single "apple,display-subsystem" driver (which actually
> provides the top-level DRM device for all the underlying discrete
> display controllers, and is already its own virtual device in the DT)
> will present virtual ports for the different PHYs, and handle the
> muxing/assignment between them and the display controllers on its side
> (there is potentially complex policy here too, since not all display
> controllers are equal and there may be a need to reassign a display for
> a lower-spec screen to a lower-spec display controller to free up a
> higher-spec controller for a higher-spec screen, but we need a
> controller assigned to a port to even read EDID to figure that out, so
> it's going to be messy).

Just on the DP/drm side I think the pieces are there, but might need some
polish:

- with drm_connector_helepr_funcs->detect_ctx and ->mode_valid_ctx you can
  temporarily steal a crtc for probing, and as long as you don't hold
  unrelated modeset locks userspace shouldn't notice. This goes back to
  crt/vga load detection where some hw needed drivers to light up a full
  crtc. There's also the entire drmGetConnector vs drmGetConnectorCurrent
  to avoid such potentially expensive probe steps and just reuse cached
  values.

- if you can't get a crtc for probing there's the "unknown" connector
  status. We could perhaps sharpen the semantics of this (like officially
  documenting that reprobing with all other crtc switched off sometimes
  helps), but it's there. I'm also not super worried about this case
  because we don't have any available crtc anymore, so even if we can
  probe there's no way to light it up without disabling some other stuff.
  And as soon as you disable other stuff you can probe everything again
  (with the fixed locking of the ->detect/mode_valid_ctx callbacks)

- for the crtc assignment issue there's either drivers virtualizing them,
  or userspace doing combinatorial probes. Personally I'm leaning towards
  drivers having to virtualize crtcs (and then you can peak the least one
  that works, which I think should sort this out), but it's an open and
  getting discussed in other areas (like having to steal crtc for
  dual-pipe outputs). We might get a proper documentation patch with an
  actual kernel/compositor api contract here.

> But I'm not happy at all with the weird, load-bearing intermingling of
> tipd/atcphy/dwc3 there. There's bound to be places where the
> abstractions leak and we end up with more and more horrible workarounds,
> or layering violations.
> 
> A further question is how all this should be represented in the device
> tree. That might drive the software architecture to a point, or vice versa.
> 
> Any ideas?

For the larger issue my only uninformed take is ... smells like too much
midlayer.

Like you'll certainly get some raised eyebrows if you submit a DP driver
without using dp helpers since that's a proper standard. But if your hw
has half the DP stack in firmware and just can't be smashed into the drm
dp helpers we have then I think even that would make sense.

Plus we already have like 3 different generations of dp helpers anyway,
because getting helpers right is kinda hard.

> Some further reading here:
> https://social.treehouse.systems/@marcan/113821266231103150

I dropped some unstructured replies with the same stuff on there too
first.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
