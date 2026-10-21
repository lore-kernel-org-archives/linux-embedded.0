Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536617;
	b=SPkqRLnKTiVJ2IRLvyKGxvutmwnjOz02vcGRNOQVGZHq4tb4ik8mx8Wb5XiLdt0CNxSG
	 AekLSGSc/gksqR+0l6ECx7PVysURb/II2oN8IIGbR7T7uXYySwPjKLEVxkshBPEs1mZde
	 Rm3zb025ES4L46m0qq5MvFuxPWL5L5Sy3upBEFRAfLGR2QrGbgZLyhNqQrbfDTbv39/Cs
	 u4sMYNzOeruu7XpneSDEcyKC1RGWEhknbpss0UcKl/haCBWHEBE6hut57beqWjxgMH2my
	 UVimkkwO/SyvGqK8YhdcWt+waJIrKhl+2K7/WWceZxs6BwiqvPtuIYqLCcCk5ypScVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
	b=0Ce3hQD1FpLxEqWTa4u/oVAJHSZxpDhKHRa5em6R/Wgr7RyZTTRHuCDBc7gLOxfi181q
	 7llPxLDN9x4uit0UCuVAvrNUkvJZ4U2B3b0fXGg0S6CstDaS116CE4I5AX+zyPUaez4s7
	 eG7/ANcx8wkqtOsjgRfaGdfb2lWsuncDuyzAFCSPXApsfxhjediBjZNnxT3OpwrF8JNKE
	 /c9meMchQB/yeQWEc1gG2L22CJR/DG59at7bltNpB6etwSfCsBcFNOjZAJS/8AvD3dagC
	 m21SlCXJafgItZNVUvS05x6/HJrxFdI5j7KfcGVn5VnnC51L94d5AapnqE0GReuf6DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xgg4e8g9;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1DE60A2633
	for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 22:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1DE60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xgg4e8g9
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so467625e9.3
        for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 15:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536616; x=1793141416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
        b=Xgg4e8g9l9wuL+uMK94dlj39wYD58bkokWU6IXHDrEqFjEn1wX0v4SrdzIFkhDzWZS
         8ouLkCKjKUZhm8g3VXnnGB3Etyxv8xCqkfAeJDb0dGKAZP9yAXPMjkQx3/FaJgfIyIOL
         qd5cIi57sU8hx5/MQRqevp6bGulBcsGqthmrkWG2GnRAec+eZ8oaYylyX89FagTpVYMf
         i5XxQ886ba8N3uWHz2nMLm7yRybHqEdszfjY7kRWiInnMb5VAUR3sg/ovWvtn/Ke37lG
         xdVqDCJkXAiksSuvlFGP4vkc3RX2FntaW9vBtB9eEDJQGH/8iYUwbx74DfSSLvJ4SD99
         MFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536616; x=1793141416;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
        b=VeRVKZqBn7vgL/XGtKa0LokCZ+Wv9wTk7BrYWHUn12XyoOqYw5NiZtGyM2yaPdl9As
         L7h8D+er+s9j39ubUY9gOiMQWnAdjoyg7z1gtslzd4n4omzLQVTAlJS8oYLQvjWCLuxz
         Oc5L65TxUdsBcWBDQRy5GPy95fcwvj5xVsxQ7uSCpofnHsAQ3oLe8/cIjgqrQiC7umQs
         2A0k/SVWH4evPLV87MDpXC0y9I95Gu/WUJgHoMBTT3/NNTznOxNJQVLztN7ExGScAIJa
         9GPcvgF7LaDcXLHq7IRBVyQra5pj+Fh4HSMiNXwL3Ag+aWAcnCdIm0cvRCZG5T06tAEl
         GGEg==
X-Forwarded-Encrypted: i=1; AKwUvBxlhONMaTcpfUD/XC/pUSlwcSqKsmM4Tb1xivhA5n7w+8ad33xhZXYkhY2ZKPJ3TS89SRIVX9AhwAF8vpQVQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL53g0PrK7HRkpsjSVwYZQCehY8e2TlAc4Lu30RHQ5rGT7r2DqU
	V4jLDReXSzEvsvH8GEUr6y32zGWHhTAGBh/yPwuQd8LasP1jks9yJBFu
X-Gm-Gg: AYBFou3Wfqn5abzbYJoqXQW8KIjXmo/fXMUIGRplyixq48WjMSo+YkyyKDNUEiTm5Kp
	4h57THqEJ9QyqtVTzLVXHmjXxgUmw8Mj2FQSGLK4xOTEjmOK+in8IM7nnyY/1MkwmNI6ICfEi4/
	9/3dL8nsSF2s8zyVHaEyPjhVDmj/pT8p/8uzzfTfTOrJS3+B64u1Xi1ynoj3gdkbaHhFJDDwzvS
	+75WnpLH9tRYmQA3WcxdJkZ23wG/29veqivtj5KAGVQ+JgJM6ZNFNs3Xa88GyFq5Ic/GwYrzXni
	ZcjI273U2n9vBFBooz/LZqQuie/sE8HVRTd1q4rvUOQz/Zm6JbettOlZ9P/6SlmFjS8csCaTHB5
	Xp4NKHMzyjGMV4vcZU+J+t7cNURE/EybUrBvbi7msdxMA0A/WMZZ/hbo/oLkQOXjqscD7Vy4fzx
	LA1TJSVeq7K0Nkk5DAR3x72fGSBwZCAr4ER7jp5iJ8/l8Q5vM6t0N0clcpk9+11WJz0a4AXHNr5
	10KsyfSHjjlQNC8udvaXLhX
X-Received: by 2002:a05:600c:3d92:b0:4a1:c646:3edc with SMTP id 5b1f17b1804b1-4a1fdd0b082mr2686075e9.11.1792536615591;
        Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/13] drm/client: splash: add a device tree image source
Date: Wed, 21 Oct 2026 02:50:03 +0200
Message-Id: <20261021005006.2341200-4-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <9834b569-935c-484b-befb-b913acead9c1@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-8-maximpedraza@gmail.com> <9834b569-935c-484b-befb-b913acead9c1@suse.de>
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Post: <mailto:linux-embedded@vger.kernel.org>
List-Help: <mailto:linux-embedded+help@vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-embedded+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 20.10.26 um 13:04 schrieb Thomas Zimmermann:
>> +/* Where the image comes from, in order of preference */
>> +enum drm_splash_source {
> The logic behind this enum deserves a separate patch, I think.

Agreed. In v6 a patch of its own will bring in the enum and the choice
of source for the two the client already has, the BGRT and the BMP
loaded as firmware, and the device tree patch will then only add its
entry.

Best regards,
Màxim
