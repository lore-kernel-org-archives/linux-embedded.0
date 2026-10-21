Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536623;
	b=25FJeup9+IOOcoVcW27+KJDa+RUuDTDC7qmrkiyVvPfrZ8ndm6Fui4ZnqSjXREud5lqd
	 2cCkbEOc2v7zUcXco1Xnc2uIEqwhgv2X4Ku9/B0rx+x6CmfV0xMZgzFDeLb40MvpFZ+q5
	 wUSkAMq2WEkWyD82GufHD2+SBFk2hKKGjJPeaV23zhZJ6393hVn/SXQepiiFizLDjcvS2
	 wDHhwH0yztNcrqZgeRkuDDxUXswChHgkX2LMo//lyOukjRkyL+KcBtQSFHBtisL+gEU0O
	 fOMa6lI2cqae9Etu1pI+wSy4XJ3dd8qXC340KSb88rcFMTEFkrZuJ3uaLwpIFUZ0Zzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
	b=ATpDesy1MT0HK8RMrAVYgG82AUwRfjF7k9fHRNC6JzWQOZPyw52S7Dl0Fj2IZESsoYvz
	 kKl7hm1NK9vz7vGdaNc22cVmkxj5by+NSzlDx0740pug8Z79iSdJWR+oyY4fq83nDqxlY
	 430SqZsuSWkx/86aAZL0nWVnuLvnA2sm+Ze3G5f+2JCoXUdF3oqB3G4MxU/hczhfTTYIR
	 vWnJMDaAUnVxMgzhdX/gSeVfjeyMv7PVCoSHccuKrY+cv3ltqCUt4rvkxTbqRShfSUEUW
	 SHtVB2EBHgfn3hk3aJBjLhhkaAIrFCYDLVSa7OvbB+Ai3ggCU1XJz8JD507diYfYYzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuL01yBC;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FC060A3821
	for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34FC060A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuL01yBC
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so573385e9.1
        for <linux-embedded@vger.kernel.org>; Tue, 20 Oct 2026 15:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536622; x=1793141422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
        b=fuL01yBCCOgff8Fcjtg40uzwGWns4yu2K79aOgLmuvLPTIqIq6xfOwGY+eNrV9NxYB
         NuLHXc6OKmZrjivF7l9UL8tnxGToPClQgFvUmKZMSX9ccJDpurVRWobpNkBCtnmcNdUB
         aQBh1L8VU/HjBgiGcJVCFs8z60tJMgw0CIfCS3TebzUjoMpedcSRCxPnL46oPTfekM/r
         EAtK3JGq6+2HquC1sETYjEiKdU2nyybu/oRxBP5t5d+kfuC6EVRuAOXmVBxFkmGmxVXv
         ZKdQvz79m7F99pOrPsWabv9/wRorRrzeQu6l+DP8GgJvbkNo/joMAomOB14jA7mMTEOo
         rlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536622; x=1793141422;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
        b=MAOZMsxe3RwuygkHCeqGdQnprrI8Bk+e8QkFsFG6BwXxavgOwYM+b6C2+ac3h3YW6R
         uYRGgz8sImlHjB7yxSxcQFVrL3BKbuiCMkyZAiolSyjOusNjplwKbttUM59xPfn8oAi6
         9XdsA9P6EWU/o3Ae5P2TskTSIY21ZZoIVKnp2Z7ieOu6h2qsbypdndqWaMkEt10AEjkj
         LZ0c93i+Arxduz8osYNwpNoVEgCiviRjKKSAyl6LnpmLVGImFDQtC46VYpSDzwIqta0h
         F7fH9D6Bi9nmfHdwlEw7uXHNZVdLIBfeDrRTyvL94M4o1zwS0J3ONTqsHF33Bz2dFx+H
         vxtg==
X-Forwarded-Encrypted: i=1; AKwUvBySOxCFuMw+eTs0KpJqUMGrqPqFo0gGIZm8f9a4YMGprUq0HQiCxPoafJHaRl+TrCax15fSoxb5BIt8+FJgrg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL79CwZagC8SHo6sKLHVoRpIqfpMZ+o9XL2DZOOoxhK06ZVW+LS
	q+plbSlU34ZK8w+joWR3AkDHxhTXC9YhioVR2rbMmA8xWMRQJwBW4sny
X-Gm-Gg: AYBFou122uhUCremsqRujhp9PHUKlEBhU6WgXEx54X3CwD2ezep5Vuc48cUNtySqbEH
	s45yGlThxLPLxPtZQaVDhDvBxkwgwIaZE5uIdrZ36S2Dnrc7PGMgDpv5a1T4mqkcmzIaoEE1LYB
	/7MD9c6NuBLpw/dbx1tb+tLZME6B51AwdSsAc24zOLLkUHz8llYkP1Mxq4g/ckU7WHFNjcUXL26
	VRGA66j1a9CbtEVrsx/5OKk2rVtJnbsup+FNKHm/V1ZLGi6zSloIRofwqTqD/LzV/07itoxt6C5
	4Uwp6uNBl45NDHAaskeLEtSWqEOmU9LEVmTtuBlHUD+aDusdFXMZzUhoVwNjTlxsMw/qWMDdFzw
	t/wiyZUKOcL0TWv9MBRFRYVAfzu2Ue3oh2qGMZasBVJwFlYkNd1AsJXs3O+2NasDiRBJoacceio
	AJ3FBIOfqWsfEBhQrutQksAIb5Sx1RrL1JYHXV0C8nHbBP0gZb75zeh+DJI2TONzmZ7z2E/tGS2
	U7LWhCDLznk96qac2XYM06V
X-Received: by 2002:a05:600d:8646:20b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a1fdd5b101mr1644285e9.31.1792536621644;
        Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
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
Subject: Re: [PATCH v5 12/13] drm/client: splash: prefer what the command line asks for
Date: Wed, 21 Oct 2026 02:50:06 +0200
Message-Id: <20261021005006.2341200-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <45b55f94-0cd2-425b-b985-ba3958502b06@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-13-maximpedraza@gmail.com> <45b55f94-0cd2-425b-b985-ba3958502b06@suse.de>
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

Am 20.10.26 um 13:26 schrieb Thomas Zimmermann:
> Please see my earlier comments on module parameters.

Same here: my reasons for keeping these are in my reply on patch 3. If
the command line is not wanted, this patch goes away in v6.

Best regards,
Màxim
