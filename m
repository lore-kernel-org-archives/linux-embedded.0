Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B2246778
	for <linux-embedded@vger.kernel.org>; Sat, 27 Dec 2025 11:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836392; cv=none; b=d8Do7l9OV1euYcGhsD3gl+wpfCGUhJZOokdhKnBXgYmZx205mL3qHA0oZUp2Kik99/gy9+QjMhHeITlWM4PQhiLr/20JkbatjLoOMmHQexO3guLRkDYyDDO1m8yA6nPSgFZ+JMJ+2sRuus4mgTu80EUQU0HhaoaDS0rQr5wOnT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836392; c=relaxed/simple;
	bh=HDarlI08PpPof82Phl+y/6hMiCXilYN2H3bdcZndQxo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UXELg5Bu1mWWdUAo/aqH5As3NzMqfCgycQqbBZPHL9nYIemOvjlFhazoh4oNGWnpvJIFpuyWAZ/gcclN5Eh5C2ImQlvpRuq4oJNAPuCz4xbSTh6CcKnx0i1fFC8Ug4mLE/zGuBhPsfUCuQT5pbF+UZfe7LZzbJCdb2k6Ls2BxHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqZ9Op0a; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqZ9Op0a"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5eae7bb8018so3011224137.2
        for <linux-embedded@vger.kernel.org>; Sat, 27 Dec 2025 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766836388; x=1767441188; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HDarlI08PpPof82Phl+y/6hMiCXilYN2H3bdcZndQxo=;
        b=dqZ9Op0aqjcXO4UtRewZTlUn8ugmogrfIDKwPnL7z4gBScQzeqFlgS91tk+1ckWsU6
         /U1B5Ah5d1+JCNCWiW6XJxTKOt5k9EXyHf1MvcyrO3W/l1a3bCAvKvNr/AHU9Y2VT8As
         inJTyYZ0U4xu1AgkroCFf1jxvmadXqaUapBpFRKpMGLC9AP4X693lUgSzV17TMyDPT6n
         /OSXk7rWu13qcXt0gB76kRZ3jmYPNMVTRK3KOuc7lC5uuHyqVMyMjwYRoiH+O/mkT0JU
         Uid5KZOzuRBtCdI/i19vDxAQJwx5wO9OEz4WeTmiHhXpYEhw4/EDK5eis0awoKFy3/a1
         AdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766836388; x=1767441188;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDarlI08PpPof82Phl+y/6hMiCXilYN2H3bdcZndQxo=;
        b=s+33Za8XJjjYLNfZyM84++BxxzMd8aX8mPlCprdRdxqq1qV1/74QmwdCF7vkahWQsf
         v4+T3neBkTkq4ucOBjnn20OIbtXyOauev0JxGjoOzEGwhkyeonfVOz+VWjQNjSnU9VKs
         pK3l7QOKSS9UhYEsL5s9t0QD1q9/YXU+8ZBvPsEEIOoBL2dlHSN28ug68yyRHcy6AGBK
         2sJXge+4Q4y7uz1hi/aGaLAb0vtiC5UYxUVRD0wZfSrGheXoyaY0tkgT6Myn83te5ldZ
         MnHAEAdPNjr5a9am0UKVBxvXqr0MtSFSMdiyYMyZ9f0UhR1wbkBG2h1Ndt1zZvsA+R1Q
         bKoA==
X-Gm-Message-State: AOJu0YzG4lAOLxBJ07o5YZJ4K4Q7TX1tsetxacxBOnIii64BUda2wNth
	e7oczG6999Bsx4ULPTy8WlClAkdkQAxiLBiVyX98dqGBbkwZ1E42G4YLYAsB8MgcWj27HTMZbYX
	7invr9oVLoX7NZZbrDjB6ur+e2qpCK3+yO6a4cpk=
X-Gm-Gg: AY/fxX7AF0KiXI2Q1Oan906miS7Fy89xQLPH2TyZeAtuQwCoLp1lHAVXf20gzmQBPqb
	BOpCPoynO0JEocNTNwQ8H3Qoj+psOQ2MvE9972m1a1JR8RP9iHTA8wt4AYW4EI2r83k2fUY82rA
	mq9YeG9++oZuEftfQmQ3nhLf0LabpC+JkgCPctWVfpyYTkwE6N+e7D/EpStssylAbueskcKZ0uZ
	YLgCUbbd7Z9l0ZeT6CVKrxApo4muEtJ4KTBOW4Alk32I3azlJJaS26FcCBRqCOs2XWocE9g
X-Google-Smtp-Source: AGHT+IHRizrSIRYm5hjZErLQj5Ua+pkpA66/R4F1YPTDxzunUhKnxLhNgZNBpZ8izbb5MqaJ/ZG2Og2VfkvgAiq5ctQ=
X-Received: by 2002:a67:e706:0:b0:5de:8e5:222d with SMTP id
 ada2fe7eead31-5eb1a7d0050mr7118813137.22.1766836388677; Sat, 27 Dec 2025
 03:53:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: zh yon <liumtv@gmail.com>
Date: Sat, 27 Dec 2025 19:52:57 +0800
X-Gm-Features: AQt7F2plo_PL2BJkQeNomjgHrfZkrz5zGfLvRZRc98Lw5lmFHKlD4-vNLZ115HI
Message-ID: <CAB1xeK5Hwiv8JqcGZboqVh3GLMcPJsPoJUK3g813buo_yUTU_w@mail.gmail.com>
Subject: hello
To: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

subscrube linux-embedded
