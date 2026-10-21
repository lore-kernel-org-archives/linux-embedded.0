Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536626;
	b=XdbOR6Ujzwszy/H45xxoa1qtLvxMj9z0FFjBwv25MKzShWUEPS4bnNdhByCm/vJYG2Zf
	 LWSigx6+q6NBRTN+DpgcKPTLpsQ0+MP6CIHmhtJ2CdBwVK7c/zS2TRRAEaQCaxmrlxY50
	 2iXslfzMP0wBUoJw7+A6GdRuxOhTIcayCsAxdBF20vXPXH/Drw3Hi5zOofZ69HRca0OYk
	 u3k2s4YXRRU5I2HxxvLv3BkQ1LwmSdQ9smnuEPw41RiIZ6aVbJFZVJvdpYeLvIKWY4vyG
	 DWgE1KZEwSQG3pndU1YMw1hm9n+R7v1l7QbLsoXSjV+UVfURbG3xzV2N2YKbuDIFvVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
	b=qU1zHck0DQ41/lBrK5x2sJpHOHaFqk6d/IJThXoSELEFyUdGflfWJIC3jTBRSVxf4UrX
	 AZhwsJmLnp0Aq9Vja7cFAjHKVDpqcDLyxKYxPU2OZc58ZHdxsJvx3ZDH1B/+vZxYqn0Yo
	 USmWk2iC4Ug5mrgYoL6r4nTsY0JXwgflV7gAaRz6kcUO4Tdsd/72dQlVdtzpfEq7IgD3Q
	 r72FWgqq6N6O9QPWcGzpIK1JRpIC1LuyOv1Ir47VKCDKUO7tH7Keg8AA8R5iDZ6xMWSs4
	 RqE/vmhpb9SmVMvE53zLg6ZqLAiTsi/GgVeCzFzq1Y3I0fr9FJTRmE0+b17cbh2mTQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSWdVIml;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0C360A380F
	for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 22:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C0C360A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSWdVIml
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso664235e9.2
        for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536620; x=1793141420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
        b=XSWdVImlnN+o8KKG+n8FdqZKnJyuYzxymErOsSI8I+mbWj1WKZ6nzidsmjFU9HSrR+
         vqgDumIJaVanwgvDvCQZpDc1+Q+1Yu/ZQdO1TGAiSn7zcJ/EIXO9TapoqBvCQUeYh55v
         WMTSIU2/6hQWr/tKz6eoFUaAalDBOhpk+YSsWqwpACa/+ZoegBs50VCzkKidvsFNvIFA
         8b8xC9l3L0kISRpEfSfybZGw+SDyya9x5tRhhllwkNu3mXQxPtTTTCyYvUWq8HNKxR4k
         1BIjXTFJWfVyxgol7fAchZytRgSIxAlcYIjRkPsePysYOFssUU9c1tnMeQqsBVaXZh7F
         zevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536620; x=1793141420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGix8b+4rEGPx1vlWyRM//jxrhYNPw7VId0i+fn4vP0=;
        b=I8GVUSiSUjZ/68I1Bs6G66cdCd5gDlJc7XzI7sdqI1EGqHYqVVYb8OLnYzzyYl6XXY
         UYhSa4bL+nIllRPmm/4+LGmwAkIRfNbtXSibkxSzoM9GUDACmlNG5X94xXZWXWe4SxGp
         VIatAxRRNQ0y9dwjrtu3jnoW5j+hNc8UD9N88e7CxLD9KLRucP+/BdRVWkmlOXiUl74x
         hn9+QHAwOxWqNzv0ayrg7QRUUT7Rch7Jyxl5bia/3ZwGEZv3e7o7b7TC/FpAwIKLyVt0
         lw00tBrfeV4+zTuUONaBSb4pt+iZYDBeDRMk8d6QlMRpNX8ZyB8Jws1HxBmtLMt5HvD8
         Znkg==
X-Forwarded-Encrypted: i=1; AKwUvByJv2lBmf4udi4JX8e37OqL2IWxG7UUM0pGqq1m4+7uQZAisuPFN+NE4FWa/iwHL8bzvlHD5iP7cykRAUHRCQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKD03pEJo3/xCs332oLX9zUlhYdYg+fUs+9Qu927PQj1cqWK5te
	l8p2ZMjY0O/CYNohnhUJmebhOVvo9AZJFbamUZrW5wu9cgvXHX9UFbBo
X-Gm-Gg: AYBFou2JYCbI3lilXRyOK67LmVbXtX4RIw5nWcdCrjElB4hhauVxejXiv/oD33e0WXz
	2ZauFbRFVLP30uk9u/znZtjlOhxpP9drfWgREKFv74V/zjKg9EFzGz2fYfeRDgicQ/OMH2JQd+0
	CdzuYagBdEJ+zOPznzHcveXWPGIgNSS5FfGzfjTPCETlSnaNBr5o8HsHPam1dcWF5sDAeTwvys4
	qZAoFABX5WVCYvA4EMb9EHIk524mw1Y6T1O1HMF4b3v/IDeTEkP/WZGQHyjTxfryc4iNImOSygi
	Ho6bKDalwVNXCpUY21cCfeXzoHbFFQl9Ys/7Vo/uP1IVEH/XLENPSddf+MpivY4H7e1A1ZxQAFj
	ceIwBqbDlpqwHJPtTTATq8MrlQcfsHlpPYUhacBLnzZn3iMN2GjJyCKPJkfr3xL/8lVyPIoH4oM
	C5rT03ni/tKFXghu75JOBboshPv5Fhutr5qjm0vVUT/06O/iXU7FWj7AtpDdYi5TYPIraP+W3WS
	c/YVsiB3XlrHbiI8sMfVM2pRg==
X-Received: by 2002:a05:600c:3b01:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4a1fdb04f88mr2783945e9.13.1792536619814;
        Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
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
Subject: Re: [PATCH v5 10/13] drm/client: splash: take the background colour from the image source
Date: Wed, 21 Oct 2026 02:50:05 +0200
Message-Id: <20261021005006.2341200-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ad6a04b7-cf57-4b22-9c22-85a61af29f1f@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-11-maximpedraza@gmail.com> <ad6a04b7-cf57-4b22-9c22-85a61af29f1f@suse.de>
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

Am 20.10.26 um 13:19 schrieb Thomas Zimmermann:
> Please see my earlier comment in module parameters.

I answered on patch 3: I would like to keep splash_color as an override
for one boot, for a bootloader that wants to show a boot state, with
the default from Kconfig or the device tree. If you still prefer none,
v6 takes the colour from the node or from Kconfig only.

Best regards,
Màxim
