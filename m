Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091339;
	b=MqR7w5x3Fmu0o9Rrrlh1jkyldkxadeYis2jWv7ust0TRSeGSEfJmVFdsNr14ZZQ9w8ES
	 4SELlW0G5vH+AA8nqjwLSsizoBrlkNEwfW4ViehsBHaelWVMtKLTUC8sETHQTg+Hc9xI1
	 iFG3bdTwLaKB90fR3WQwRXNGSWxQ+zPq7g1WJTghJNsy3OjViQyfu+TUr3b9pwz1MwOMd
	 vWfLG3fP+oa0S1A9KFHQknS59TswYvXanGm6iecImLlhQmoyFDPtDrBuIjtagusyzpLVR
	 RaN1zT8yex/ISqgn7t41ZQxuVL3bMeLzcSnhpLAtyMAtSfX9fIB4kN/0Bq8deyhQMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
	b=WWXzhRLOc4DYLMrERrne/c9OVcFnoezS/ebW+OlTrYXihzwzer2zZLVX60LeG47sP4Cp
	 TPoWLE0gPearfeP1ene2pnQ20uMWZ/MaRvdbLTlJrfeV2QFDrsTbfMw+gR0FgSWt7sPwu
	 uzsTCqjTgKDtC69iWPIa2gsOvK0YTgi7xJVaYSTxABqMybKgMICiZkQmHdI4pyPKrO8sB
	 lqMSh4eDiUYNMzqlyucrvPab9gtlV8wsgvPedM5yz27uJFqlFsTYXTRx4mOoGL3OHUiJQ
	 jSNP3AV8yUtO3+n3PoBwRwfbVvy6qeEqcaE48JYIPRjjMktlu0owBddjbqimKAmG9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="b/So7K6S";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A35606A31D
	for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A35606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b/So7K6S
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26231185e9.1
        for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091337; x=1793696137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
        b=b/So7K6SlEFKsKvpppdb0hN7X3ShpUHrDkEGpm+hdOpeXxye9etaE6J4sCSorRx3kM
         czfbxf05jtinPI2aiL8CJUaJjly9emI8ccsoyRnDlB0y/utbspCSYppB1MNcHPV9jGyh
         FUJyQwkeHy7tPIlYCOPYwSwuqAcKiYnb9p8e4vO6DoqVrdAoCSc8LHdqe5Fz5/Ajdid0
         HHXRDz1KMi6u1gdWUd1XyLiRq7erydGtwKm5Bus73oAdaLIEOf6z0IMjI+GLbqBKLZzv
         /pT74T2RTSe8g24UmLOQvAI9UqpdneqrpOjG/H42u4dI8pkQIqf3tFf6jrRXs9jtgNpq
         /q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091337; x=1793696137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
        b=j8seYP7+jF7XjjO/7291FSUOebjS1LBrDPh9swK02GqN3IbCYn8qJ8UHrXgNUaFfH6
         h1xDBVY9Wu5ZBbRY2MTiWlGbDsAnEUNC4C6ZhO4tT9lpUPg16L/RRTbx+Tr+qz1MB+1m
         UjcxQ/Nj0e1fYTKS8oh3IlP/yHaSzc2B9FqQnK7zfc0X/gRhpUMA8uNOcsPuTAmHr1yi
         8azPUjgNnEIsj/Hb9vNWALnolKj1etsTwjZTRQ4usWK7kSPJIrBxRWpKaujjYGGHuqct
         QtZQsrg7Pe3SvQZ2IfVjJdJ8PfcUXAjuRcV6QydMdWZiji4/fr9nypXxa7au6c4vW07V
         tzSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlpHE0bdKang13rhLaXqYsaABY4ShXuZtGQsQNRwje9PiUM/EltYJXVc4khFcWhC89pbljsnNMV32Phngm8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLiPSKZuN8fqG9QlIExG+hCcy6NOFuTc+jPi0yJeq63v0AX2cYP
	6iCU8FU3OKQpd+221Xpo/vVWMot+PSl1HevKj8dLYSVs5YiKYtyzErNw
X-Gm-Gg: AYBFou14l7wiI7ALWoIb6yY5eYMmegKoP/6JexHLrGHMFU5ZfWubM8I4Np7SllNtfvZ
	fi4tD/nXqDNIz0Mt99oT8GSv9CvmnazNLQyPD7NEKYJG30PEP0NEOulZeX4W3yVVwKr084sRJgc
	949oBW3uyUAmCkSbIiSgpR8W/ipaT2NTDqoXs7L1Hs4Q2nDtGRa7mzo7irxxYVNaGQ4d5AfisH/
	su/yY36UOzbbCBLhANu9YHP3Wdh+vXYcRv8mDt9QimUBoTgjeDgVvXb+4dbjKQa2Ew6HV4Fl0II
	iP9Q5x0sDRc4RIUnMOD0XiBGuMphpzwKlxEjF76b6lYwdKAmrry70Rqs9tmCL9yWUg4HtoIiZLr
	qqsU0BugZJ6udB5DI2F/lfL2dT1L4lFTKUBS/Mvj117RFDNYI0A4WA+ibLWHRIN8fPpCtMN3Jh5
	NCebYNLvPt8au3IC7Ym/hrvLwEvmreEE9UbyJvx/fXaeGLZBR4U3Fh7Q+k3XjhGYfle5pxO8Hy2
	34TPlNSCSyEPs/OlkgYgUjB0tsDHX+eEMsNzBtFo4I+JRSGQDayuWtkOaUvTowOOD0E4FV87t2E
	mgURduvc
X-Received: by 2002:a05:600c:3544:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a35acc6b74mr187900455e9.34.1793091336983;
        Tue, 27 Oct 2026 01:55:36 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a09434esm249835425e9.0.2026.10.27.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:55:36 -0700 (PDT)
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
Subject: Re: [PATCH v5 03/13] drm: client: add splash client
Date: Tue, 27 Oct 2026 09:55:34 +0100
Message-Id: <20261027085534.1746021-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <645c1c2b-9aa8-44b4-8a67-dcd7bfbe8fbd@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-4-maximpedraza@gmail.com> <fafa7327-e624-49f2-98b2-83fd602a0ad7@suse.de> <20261021005006.2341200-2-maximpedraza@gmail.com> <645c1c2b-9aa8-44b4-8a67-dcd7bfbe8fbd@suse.de>
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

Am 23.10.26 um 13:26 schrieb Thomas Zimmermann:
> Please drop the parameters for now. If we want to give status messages
> from boot loader to kernel, we should first evaluate how to do that
> correctly.

Fair enough. They are all gone in v6: the colour and the BMP's name
are set in Kconfig only, and the patch that let the command line win
over the device tree is dropped.

> Oh, I just noticed that my comment got truncated. I meant to that "i
> should likely by unsigned int as well".

It is in v6.

> At some point I'd like to have a nice, shared drawing interface that all
> the clients can use easily.

The image is drawn in two steps in v6, as you suggested on patch 9:
the BMP into an XRGB8888 buffer, then that into the framebuffer's
format. The second step should move onto such an interface without
much change once there is one.

> It's probably ok to address things in small steps.

Thanks. v6 rebuilds the scanouts on every hotplug and keeps the old
ones on screen until the new ones are committed. I will send it
shortly.

Best regards,
Màxim
