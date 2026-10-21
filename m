Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536619;
	b=vteY3JprC3x4ksoZnY/Of+GJ+FK4fwxDVvamXY2Pa7RobeNwzVzG4H68jOWQhss+nZCJ
	 OjhGsNw0lTtRf4A4U6HUW0OCOEjgkgJlWaBw6uX7Di4o71U6gHVpUYuwVjsbVzQ+8cMoT
	 jTWADbr1PZx8LsHno9mw0DnnV/QR1sU/6ZVU/2Cns9TdoikftEmGIpOYFh88awbTRFz/+
	 IFk+kXh98Hfd7RtokMge0chTwFhrfpJq2jxTpTPxRO9Qyyn+ZjAQo4rcL9O4tHAEg5NtM
	 ALsOIC6nvIL5cJqG7O6L2Bfxvssg4PRq1XT/GRyBtx1l5N80P/eSjPf+jlE4eZEgtng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
	b=19nBB11HKslmsD6ZusLXQPmZcu/1hCdPL2gDZIzUmokvhw2vDTVicIpLasd37UayHgpC
	 S44HVWrKmKjS40mx19CL+JCcjFbi15b7U1NP5cCuOeB47AiWqQv6ATQjOVZtkNWPk5gi4
	 oigGxL7UR78oYK0GECY1gviL9+lRyGKp5Ie6rXRlte0UB8NgGnYQB1WTyCZBhIAQRCpR1
	 CSup/3VShthI/KJVq+xXE5qMw8DFqUHChmgK/tH3szKbIY5xpoZg8NFY0kll15DTGzwwY
	 E3uTRSHfBfX8qPhRBq4cnY/QdTBSxF1ifUVKkg2M8rh6ptUod9RaISoCQN/XKH2VGLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y9FIbqDR;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1C60A2634
	for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 22:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A1C60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y9FIbqDR
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1346945e9.0
        for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536618; x=1793141418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
        b=Y9FIbqDRFsiHCh6wCMx/lGXYMzbEMpcYPExHRKo8kxmfRwSdsbHKcVN6b2o3fsfWmS
         EMfNStvVEXtwQlwGFhTspCN6Iy8LsIslmTQJZArs9croRUFFsg9a0R2Wmowm78fCGk+p
         qoMRAjWrlWyjvmo/cv+QOkjio/QCUym29eIrZxNWbZgTO868C5tZQiYnBcrDy/y+qYxV
         AxXCy+jIbfVSYNWbB6SaV+1+cus75rqPWlO2twcCFTqCAqrzmVEb5SQPuQ0TN5KrYxQd
         MNdNYIr9ltemS55NjRHUaTPPPJnI8hAvgtgmCV7T01bNB3UVCcpT2l7+0a9cI5hk20GK
         EuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536618; x=1793141418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
        b=Jj6x3Ort/H7m2YDxTEOfKQ/INPkH3t+Rsice6Fw62d8X+gL7Zbs8uucuLuL8Y0Ntln
         m4+Sse+Aax2JD+87wUimoHFT1Ri5bNRwTqQc0yzGTMt6iaRBXRSvNfOJhEH1DT3XMbxG
         ubItCEmzZfmKmWGaKNaNWHzotTAc46BAj9HsLQ2o30KOWFuBRr2w6aIj4jjVUCrCNv1D
         bKY9i2OmvUjNClndw+dfUz3qyAdvUuBbQR9t/9vg28vj2qkJ17KztqhZT/fZssb0KxU2
         UiKORW0L1amgA5cd5/OljtRhE2tGLEhcK3zIpzsOqd8NsCfHKKGBSkGVCmjG2Eo5X3lq
         0VRA==
X-Forwarded-Encrypted: i=1; AKwUvByr0qVbZDtkuMB6PwCPP/x9t4LW6J4hPYxmi2ctvGsyPFhmv6VqzFSDF/cbATGuaTXKWWOqw8Jrl5QjLAMX1g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdhP2Klokr14LgAjU/9go7YCCEorZPWKlK2z76mG2nPjICKPR0
	Xz7IzXUGkx5DZjMP6Y8bqm6yPoztRzdqyR6Qz8LkbLPCc/AsxKdIQJfk
X-Gm-Gg: AYBFou00j8K2K+ank26XH8eDWZ95Ri8XLZ+6qg2yVQMWsFmvQWbfGpeGdNvfyV2O1XX
	sEBeZC7nRGmJFkX5fqOEDMTwEeTy0V51qsSUUNnjcZcSs2bgvsNV0yvBayXL+8sbzDrsBDWLiSU
	5gPjBPPoCPMnc7AQqegH9mZhDmwHH3d0jQf+KetHaYMKCeSgsD0kMAeIcdJm4IbmvaQfHEaoHX8
	loAIXn4wjI1YAaOoNYTSrdyaDJB1oHxWPZ+q3PMvag52VMsk2aeZ2StHk1AGwHbtx6IfTCFfInZ
	aTB4+8+e/nul6noO38SmtyrXrIEPcRP/FghVVpAdeTmlk3iAVudLZRqi2R2D113LW3CwLpwHt6Y
	Eqv7InZLSc/JxlVrdFX20Mcd92aukE97g5RLd9joaB+/MugFcMD4kh1qrqUknQTM45VguW6gB2q
	EwQc4kSk7pYN9rd/xaqVOdazc1/irtUVK2OWhwRQ0qz3+NNvNyaGxMa6YyWVYOMJ8SjaD7kZBOj
	oOJjwSBRH9uPAw711CLUdhs
X-Received: by 2002:a05:600c:b8d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1fdb165d8mr2576335e9.5.1792536618009;
        Tue, 20 Oct 2026 15:50:18 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:17 -0700 (PDT)
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
Subject: Re: [PATCH v5 09/13] drm/client: splash: turn the device tree image as it asks
Date: Wed, 21 Oct 2026 02:50:04 +0200
Message-Id: <20261021005006.2341200-5-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <350adc03-dd7f-4120-ac9c-b6d04ff44faf@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-10-maximpedraza@gmail.com> <350adc03-dd7f-4120-ac9c-b6d04ff44faf@suse.de>
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

Am 20.10.26 um 13:16 schrieb Thomas Zimmermann:
> Reading the code below, may I suggest to do this in two steps: first
> read the image data into a temporary buffer, invert height and rotate as
> needed.  Second, copy the temporary image into the graphics buffer and
> adjust the color format.
>
> Eventually we want to have a useful and flexible drawing/blitting API
> for the DRM clients. Keeping drawing steps separate will help a lot in
> the long run.

Makes sense. v6 will do it that way: the first step turns and flips
the BMP into an XRGB8888 buffer, and the second converts that into the
framebuffer's format. The buffer is as large as the image in
XRGB8888, up to 8 MB for a full screen 1080p splash, and it goes once
the image is drawn. If there is a helper you would like the second
step to go through, or a shape you have in mind for the API, I am happy
to follow it.

Best regards,
Màxim
