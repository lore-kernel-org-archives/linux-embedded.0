Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109242;
	b=OGxDp943iv39IIQDT9yiD2P268r4jK5i1ZBNr6JDeZGfuJIDMTZNmgClJpuI69yEvYat
	 ILIoEBuYLLcGQoIsb7GXIW/LaA+5CJxqvHafwFOUmxbpqCXc5I0W720wEI/erpCtxqwlH
	 Yn60mxV8dnEJ495t34CcggCXQY9biBZFAtIhFn4nZrPmbQesrqCxuqnIEy06OlHJ97T/O
	 eZ8N9v54yL949WRkXG7jIr/6cmTcNa3+JY7VfTuoS1QS0ndETe9PXEl5mmzIP79cRhAuk
	 Nk33quUcFKeHUXOLfyIFG1N6OgIPXZVoWgTTZbQp+uPOboETyh68MsAMYk1WhPycVPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
	b=tXdQeioHE6bdq7MDZFtUcI2V7/JiIwMkVo+elzpLOnN48AYqeUDPXVDphil2f13Acbf8
	 kthqT4cJWzpTdjjldZa8VJXCU2jYYd1yqqpxi/f01J5d23GyJzRsb53dwajZ0UvE67pVX
	 iMmV4gHeL9l1uVOZQhCTucq2jhuwJX+LYrDt/AIURSRRkmO6vrrqVhRJA0Lrnz1VUGfXZ
	 UUOoQ7sDXOBn2PItBQuzNzlpm4EHfK2Z9vXrNRus0unThTpGXlFXWjKfGdy6lqUBw9vG7
	 XXy0IpJ7/5Z1D7Zj2fzPRaN0dNlKUQZ3cjV+j0BX6JvU5pjWGEnFZuUq492BG2ZgmqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oimiZnio;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE28F60A260E
	for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE28F60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oimiZnio
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2552320f8f.3
        for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109240; x=1793714040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
        b=oimiZnioitMUEnEBSrenFhRbAKwenXYmVyqgKmWsRYCXK/JKGbsa6e1hchO+K8E4AP
         aKqtDi+/aJJxJ/ZpulCQo0A0FFLFB/P4ruAZvVuMg/2UK5Qi5nmFDuEhOUZtyGtwcLe2
         Cy+j4nHDSbUeCVSFCVw+TcY43hi62SLj4fCqzF/nem7rtyWJ28BtO6lO/RiZua4Xss0f
         IIxPsaHdtd5IKWoq+iFATJQSwz14z2HjyaC167tn5z93TbWRuy2QukEXN6vuiDh6h7kH
         IjmyOEcbEQ6slNZxbs92lcTHtMkLRShklgeyiQ3bXndapKr3p3emUgxr1TirGAYeVUY0
         6x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109240; x=1793714040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
        b=YBve7VCaLg5mtcn6SwRvUWLCNbJ44R6TBwbekrr8pA07ycPyrZPZ5PX2cTCK7c8KYv
         GZIVkFv7De1yQYRCzLeYUNnCAVt84G6yfX59vFfDn4sw+Mkmve6P2UWZBHKq0ZhLtTNC
         zy8S8btNNFOq1s56sqLnTuOyIRvBR4cHcHGbIFeUIDOhBg2wVYxd9u5xEtmox4sakMKZ
         X+Tu+XfNqwbXiMjCeEh8qA542PFSFYayZdFKghbNz/DmIgZmDKh7kdH/UY7nNOLbB54q
         BdD4YOg+1/cAdfC+mAM5ISOu161U92N5JwQXhD8EMevlvJjp0FGOYVQ3S7Tk2+Wg+sQq
         ASgg==
X-Forwarded-Encrypted: i=1; AKwUvBxReP+Cb4+qLqJ5ZCpAfD2syyBH71JF9UqrVBf9VIwr8fWMT4nT8v8px1bBK/n5/7tbT6uJn5Asc8jp+hbTaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJSFZ1FGlVYfg8f04lTr8yZAjNXAbkggKJzFy1GvcAhh03PJM3q
	332OUFm6n9zlw+TDvbO/UdJULMRPyc8vSIjTqYyBZpDXjkMub6zQDGrP
X-Gm-Gg: AYBFou3WniI/Vhioo/UKVxdEfcUmwXO4KbXeFAZPzgJ5pQBOuihYZSKOmeMDnNqKY9H
	0QFIkbysP+pbF48jUFfk63dVB5ztnvTLiGJ3rV+XTicfD6MiJIOkkE6Q1+dz4Qfs5Ud6siT0R2O
	c981VXhrFAJ+nOZJRpJN+li/QXKKfJCzPF/KKKqnh+WhP9g9XMjJ0u21nVPr+5tw1wui4c51WkV
	WyR8TmDi9uvfPoZBDE2Z7LXQIFk0k1U5BIJ3+Ycrs//zydk5xaVKYCI9llpKEH6sFRItQBt/5Af
	eTyNU6hMB+ensXM0paYIhyk/5CEnRwBcp6iVqVlgwnvyqqPVPpgW5Dxx2fg2SJf02EMyO5oNTD5
	zYWARjvJyGd1p2VpA19ovAg9tifE+dDooQikrMEFGgkXVDiq42NZ2DtzkLP8qw6iGiBRbO2FC9t
	CBiUtjvFSMVr60FsTjxBdDMV1M2To46fHlzinzffUOkbyl6IDCdVkpzDW71qSHW0K4D3ply4Wvk
	wfdQgDHbBqI/sW080225A3MkfESjHRMSkHaH8i1iyLe53z7VyaNYUFph1vYJ/f8DPwE6ILDQ8JI
	+J+TLzzvbaUxlj1T3aYfxtwTz6BE
X-Received: by 2002:a5d:5e8a:0:b0:48d:f56d:be56 with SMTP id ffacd0b85a97d-48e3eb7642cmr19483905f8f.13.1793109240024;
        Tue, 27 Oct 2026 06:54:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:59 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
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
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/15] drm: docs: remove bootsplash from TODO
Date: Tue, 27 Oct 2026 14:53:33 +0100
Message-Id: <20261027135342.2003632-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
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

From: Francesco Valla <francesco@valla.it>

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..5e987e18bfcd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -756,23 +756,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
-Bootsplash
-==========
-
-There is support in place now for writing internal DRM clients making it
-possible to pick up the bootsplash work that was rejected because it was written
-for fbdev.
-
-- [v6,8/8] drm/client: Hack: Add bootsplash example
-  https://patchwork.freedesktop.org/patch/306579/
-
-- [RFC PATCH v2 00/13] Kernel based bootsplash
-  https://lore.kernel.org/r/20171213194755.3409-1-mstaudt@suse.de
-
-Contact: Sam Ravnborg
-
-Level: Advanced
-
 Brightness handling on devices with multiple internal panels
 ============================================================
 
-- 
2.39.5

