Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536615;
	b=E+/xm4v76WrycSGPJlUgS5CgYVUh9Xxv+Eq0yMZLjNUCfymODAB9V6cAHc4jS3f/bApO
	 GyxV7LObqKA94r5DZ9pFDwekIzr2XNkwlPefsYP+Ho9Ev9NIh5qdVqwbtEfetM1W/wwYe
	 WpBvKwUklN5c2vyH8BqEwlk+41m2d0LHSTQCETQ9v9Q4W0+ukxmGtszh40vZH8p0jgVz9
	 3TDkdy+UrKG03fbcC2Az7VroK7W8IoftB1/n526QEFNY0YJ1veLDPgKEiFLK7MIvX2o9g
	 djEccsIC2YAe0kx/9DyyOx4hbXFBywBBg+GwFEu1XgyVQ9uSeOqMMu7h6yY/WZVDQQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
	b=EvnnpoorzdWJjzBT7JI1l1vxMMMjsyT10sQwVnnIWZ2dFetd1Le6kSi+r3cw8ETz4QiY
	 RvoOvzLEWJpjod1IOTESJsrSN88T5i2UnXHex1bDlm5beUacTg58Du1W0A1CBhgcMfnxD
	 7t90OHiIT0eZZws9T3YinWTr+wR56iFDnCQvjGJiwEfu21TINrEUxmPTZVRUbIk8GY7MX
	 wbWVHflxkf93Hmo1eLVAwi0HkSZodZrPLcia+qMaItL3xakcFtgrXBGlUgbUSsCcQcvjc
	 +WgG0PSREnit0sFyFZsxzJb34lqOqbgP+l7onmfJ+jKMJKoVqmrBDjCUFIZB3nYH4jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ngk54pFO;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4560A2619
	for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 22:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E4560A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ngk54pFO
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so658975e9.0
        for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536614; x=1793141414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
        b=ngk54pFOLWmfm72DmBQbR5ZFvu/68E0HsE/I5p7qjLhDU68EtREzXUUkOe1KdJtoJF
         CO8uj2ApOXtd4ggTGsgelwDkrse81BoWG6/B8j7zHrKz29Y2YVJtiMU8XsQ1V0rAN5ED
         74xyNd7xAR5wHmIF/hEm+j2q+/US/PxSOYg26nizg/eq0n0Qf+hcc88A4bVej//jOAhU
         JIN+3z8//MTou4wGoqrqTvmO519jPRA4rOt6hJlK3RntWR9pJpMGmWggWPbEV0Prwgh9
         KdomzFgOtRvIUay295YGeWpwSdA91x8jdDi30+Wild3BZCh6AF/DiaeZ2Opb6ZO5IZd4
         mehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536614; x=1793141414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
        b=J88mDJgn1hUJpmxPZdrblp4o9L7Q+HykmG+cDGc8G1JKTTjpX5eUS0pvF6XAMAPaBI
         yLhik5Vep5ysTEIUuG40+99ckVdcsZUuJQtBkru8fDniGEww4APPlvhoNlkV6y4LuaRy
         FqTbnb1Q4sxXEnFWc9cr54/pXMmHkuodnamZz2zg6w/flyy+j9p+KkbAKYaXSYQkwR24
         AZcbul8sDf0oqcnvYFqVyzdIMNTk37rHN9DUSuz0hOg9/1MYulHBnjjFsXSzV8Zvxnaz
         NSuUy6WAqyLVGQP45Id6PE8TZx+ckEizhr4G/XKopqKFHcX4trl+UoC0Sxqpm6TOFXuE
         2o/g==
X-Forwarded-Encrypted: i=1; AKwUvByUvHXI/rl/uYy2NvCq02vNMZcPZVik2+hBB7349NdypwNrPCFk44IYIt7fRQsuwTAekasWiLmRsquh9DlqaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/qgsKcF/WfNdorNI8IJmXsNnRNwrCwqkOG2Awpa4yG4EPHshU
	g03Ld2kJJ+FM/escn3Y0zwb/+flZ9TsdxG/Leb1+WiVWomy9LHsMENNN
X-Gm-Gg: AYBFou3pw/tvTSLVp4AoiMJRltWYBOccTWRhRsehl8JjIdRaTBvKcj/a3IO3N47GA22
	q7n3TRRIJZ9yZZJVRAYYRSs5uOlldJVAcmSLHvzOFXSlycI6hs3RImHRNNG7fdWJE4RrvTPJ9n5
	y6EM5TSg0OoBDQumqGZBe5AGOrH6+SlEp6QDc18Cq/sxl6wGlz1MFGsIFjIudmrlN4NAiqALuiN
	XznFhjahr5WDd7D+nTgHp4g5W+mTzG1XF7RlOU12djR/irORDKP0gHwBezKueQzlbUpxLjbPQKw
	HVDNJEq1uBBj6nfB4jYMKyORhIGkpJKVqw+009yEMrtBkuB8b5k8D2v3hsJ0okOAMn7Yjhgqom0
	z8QWjoSkkgRhFmBSL4unqkwiBJAZuxhLH1f7SU0mOo/FnHzEIDzOlZ9i6Y/Wk9HrNzrgKpkflqE
	5nmt8koopoeerxCRUcXvCm/9fo31n5KxmYKcRSHkn77S5k5sgZ6O8pPGXpTwpKJnFPJMawINl4h
	uf2TrgrJpDfqdn6y1fY/WmpqQ==
X-Received: by 2002:a05:600c:a0b:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1fdd245bcmr2271955e9.9.1792536613728;
        Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [PATCH v5 06/13] dt-bindings: display: add a boot logo node under /chosen
Date: Wed, 21 Oct 2026 02:50:02 +0200
Message-Id: <20261021005006.2341200-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261020164651.GA4017884-robh@kernel.org>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-7-maximpedraza@gmail.com> <20261020164651.GA4017884-robh@kernel.org>
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

Hi Rob,

On Tue, Oct 20, 2026 at 11:46:51AM -0500, Rob Herring wrote:
>> +  image:
> A bit too generic for me. How about logo-image for consistency.

Sure, logo-image it is, in line with logo-position and logo-offset.

> This property is already defined in panel-common.yaml, so you need a ref
> to it. You probably don't want everything from there, so just 'rotation:
> true' here. Though keeping the description here is probably worthwhile.

OK, v6 will reference panel-common.yaml and list 'rotation: true',
keeping the description, as it turns the image rather than describe
how a panel is mounted.

Thanks,
Màxim
