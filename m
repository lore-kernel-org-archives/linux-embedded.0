Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536611;
	b=2vyXnrgHlTXJCmsf7xbVeUOp0+DMSi0yy+FbxZ3uDRAwkYoiggx5y9NnyO78O5TwAUo/
	 CThUZdRNY85NNyMz2hp5SOG7fWzlaiN7q5Flq5QvGcmmEBtDMVTNHxKx8F6yP9Wot6J5C
	 +tvuiJ/a8HNghGMqwCMT9ZNKrAa64EpfTGLAZL0afDBesU5VH0VhwROIt0acjyqKfIZTn
	 8JI/X+ln7wTQgS15rXzPVahx6+PKf2TmQ3SqQBJQlrCLSxjq6McwLEvIvJ0l6+rJZppxp
	 A5linVl6L7OkkOvgC7Wxg8yKzY5MdYfzt+ug8ap5y8jJ04yn1GlvP2XZXQDCVCGV/cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
	b=hm0LWQeKek6mV2nsKw2EKsGLCLjbJRN0z8RxSwoYXGJirw7ZgBg9g4FzSr4JTtrQNqgU
	 3RcwWM9Jii5Rop9eCUbZNJBOwoo2gPgbT53qeEk5q0zEaqL0Hbz6f/EjS+nxMy2bIpBT/
	 DmXs+LviIJ3aSG4TkerIkvGC90aJPB+QMKEDENk1sDIgDxVSU0sI8dA+IbsoI4LmElPGC
	 y8iWfHON8Y32nfPymrCSstzN2LGufl/PHS2pFqbtQlJagNGAHBO13IWXB9CV3F8cPAv1G
	 T7fAuVFeGTdKEbW4joDZJ71gi//FdQ/pQVL9+D/mt7TWvuOMEmoHOFnvA77u2usKIMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oMGtStFf;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6EC606A31A
	for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 22:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oMGtStFf
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so720585e9.0
        for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536610; x=1793141410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
        b=oMGtStFfhGsL+mBjIIOXSVYiVGOUixhfa02bRsi991TkgCyk0GIcCTt75OwAWONrt3
         XyxUVpHQ6hS5K1bIte6yGRRfPJrwKq/BdNHY4/MKwW98pomtO8eR32TcUmg5eRs3vT0j
         4vfj4Qati0/E+qbSKz2TDX3+AUdBzroKUb9HFKxqMw8GIyTxIZfMV18nnUmzSg5hXoWw
         By4JWTOxBRV/qp54N78Use+YIBtMTyBYI2FcGlVPxD5AjWw10AE1hZ7OeZPBF9JSBynK
         LIMboApvT8TOGuMsl/r9aUKdQNAAF7XKW/RY7q74qIswfthHsRlqDyb2ZzjsqPp/ZYRr
         s8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536610; x=1793141410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTuhXEhm4uQNNaPcVdFpwpAupMps3PVyoq78rLHpKEo=;
        b=aAb9OCbWLtWjoJw5MK+0Dger4LNTdfg1XzBmOCUaPk8xJvMLK366TtcIhANGopzsfA
         +ssFJbRmul1kwB0wy6cpeZHkqgSqNOdeDIs1sioE2FSNi4DQSn5XiKpuBbwBsQc+J37B
         RBlemOxvbjHzhFuKhYk3eZXf/ch7hx6IlMyYqndNmmJ4152tuLRn5RY7Wi1clG0yr/KJ
         p8WsbkQ7cNwPHKxbjvfDms/tA775MN4JiW/5HJ+B94JkP0t4mx0ljukhpgjsTcEf05VH
         YKWio05+wYDvf4rVJQWSSFZzeNKcTr33xrwoK82Yze/8YIqTCWjDreDAjiNdHGKNeTqq
         1Tiw==
X-Forwarded-Encrypted: i=1; AKwUvBxNRaZmiUjFkYV1PR8pXMFOX++tbA61WcAW5JiRATTSjMz5Dd9xTJtpFShjCelp0NRG4fUHESXGbzT978qHHg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIyDNuBRfUehJb6h6vkQ+5OfMWHBFqb9nVgp3Cp1xzNOMlzRTuu
	5de9gNjmYjYAN88kfZDNO3UuVm+Ky5rok+RV0IZvh5KgQQydOPKbdsHl
X-Gm-Gg: AYBFou1gYYWxbowLpeltex585XxUIUwebzUxBdB+/SLHuV6DlAqnw13OsJ/HWKcd9q4
	Rfu5ow8x/E1pqVzozgjy0TEuCWlF63Y5lEx1ZrbktdNfZzkJ66fpD433CYLzTJ2Wz6YZLNlvX5v
	M2juLrLfGxtJpjChmg2hnwV1Mcab1OloKw0PG1f+jr7HZCSD2wQc3wniOfIK2JBm/V536PAnTOZ
	wf3oI2f1JifZv+GbddkCsjkRcHDkrAFn4SHT0TbUf4dGzbrMQRTI7lgD/aNsZcRNwUCTQ4iyH/a
	eiXrNMq9qa5Bw/uEc/o6Wz3q6wuHeYpH5K07ih3lQtY4XqOVkvWx/b1Gnnc7MBrS/d4fR5gEJNA
	oHetzUDRidjl0R2ZK131BHjjHhG7UOu5b1qiV8kyO7XRnkBVhgQK/iABCHghXuapt+ScDOjxj8M
	F/SSWNlgJD7168dGZq8lmIkfYnV+/IUy73W2Fl32hcScTcaSUbearYrkIW1y4x0CPfo0ZI/vT8j
	mHYzYZRhudMzDqNIt60ck5a
X-Received: by 2002:a05:600d:82c1:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a1fdd20c2amr2908965e9.8.1792536609700;
        Tue, 20 Oct 2026 15:50:09 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:09 -0700 (PDT)
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
Subject: Re: [PATCH v5 02/13] efi: bgrt: add accessors for the boot graphics
Date: Wed, 21 Oct 2026 02:50:00 +0200
Message-Id: <20261021005006.2341200-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1d3aecdb-2537-4f08-a4d2-22c81ebaca03@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-3-maximpedraza@gmail.com> <1d3aecdb-2537-4f08-a4d2-22c81ebaca03@suse.de>
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

Am 20.10.26 um 11:13 schrieb Thomas Zimmermann:
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! One change since v5, so you know before I carry the tag:
efi_bgrt_has_image() now also checks that the image address, a u64 in
the table, fits in phys_addr_t. On 32-bit kernels without PAE an image
above 4 GiB would otherwise be reported as there, and
efi_bgrt_image_address() would return the truncated address. I'll keep
your Reviewed-by unless you object.

Best regards,
Màxim
