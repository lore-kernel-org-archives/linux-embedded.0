Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CEB23B609
	for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637427; cv=none; b=mnqr4JTSZYPkV3LXfUtFa+G8JP1Xl6/GftsUGB8/rEs6mHnuLMNb3o2uN2zPP8tD1sgG/rkYchTj25fh3jl92t2H3FQrdFSgjx1acsiEkbIFOVHEHuFVj9jvYnx0zg1zD11to9y6A4uNnMu/HL7bPjkvP7oCSndGLIiuAPgQd1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637427; c=relaxed/simple;
	bh=6FO8a+198L0yCZHP/LeEkg85hrjVLC6HuaHtKTj90SU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=Px2cYu8J3qeXVqTjGiqBWyJ2WhZYrw27jZwd6tbo7V8nXOagDxuC1kBztjcLbAm6OqCfnEeTFbxslh7M48q/vVUuQfKMhMwk8Z5AaJPXQNZnwe//9kqBIO4JLv5jU611dPMnYJyRcB6H4EgxjAweXG4lu6d6326yJVK9qamWkSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=XEWo6NZ0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="XEWo6NZ0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46b303f755aso28239995e9.1
        for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758637423; x=1759242223; darn=vger.kernel.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SA4KEYuWYqnqxZOpuOy5s964Az6vi7/7luAhH2FtIQA=;
        b=XEWo6NZ0EaxspLm05XUOkoL2H1rDDY0KauzyDDFto1qXODfDY2AtPYXjb8wZz6Hh/T
         AkQDXWSM7eV1Jaxt6ai+thEqjUAhM2cn4h5knO5yYH2zYJl0x4sOhpza31iUXtFRO/rJ
         gw/12rkdLSl2+yHflG/lIysqTBiFESiA9rET/ZnuZzuIz2k7f1k8DU5TRo7xz1NruUd3
         zMM+9gJxW2VAkVbCMqbH3sAA+jfWKfMQXAgyHuScTEgj/76PQLGMiEy3I61Tnp1wMZEJ
         Ai3Mxqr+DWLU+aO+KhgZx07Ef0RhAGlgcy4Ff06wmi3PkaFPWTFLKdrxW18aMXF1pLDI
         HdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637423; x=1759242223;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SA4KEYuWYqnqxZOpuOy5s964Az6vi7/7luAhH2FtIQA=;
        b=aNUhVeCF8hsqRLJ8m9dvad1cGUuhHEIAZSAHgIiqP/OCEHnCSVpgUojrKR4mwXIUTC
         7za37BaD987j7xTqT9dTS4g3FTU3dY2tau6C3kX9O5SFG4VG0PU1NGfxsQhG9q8zocpB
         DMTMP1dm0OT6jjBNGmTytAsTaQbYqcYTDpe28p/nEGQ+dlrRqM/htEmy/65ZDpQ7mkh/
         ex4mGp2cJTl1Gro1aCz3yPEBGTrE5bmINMl33Z64+TeSgLL4IxMKBh0KXhfJzw0eUJVq
         JrYd0Tmpv0ZdfCsL4ngfm5vILvV3gQbhorLyzIiIWQBQadpjZfALUqnSduDX6d93fyh/
         +Lgw==
X-Gm-Message-State: AOJu0YzV3uu5HE+rlrT7jQitEAisHkECOBmdfJCDCUyO2Lo7i8vIHXvl
	5zCPThfwHVj/HjtzQ6rl2d1wbf9ToJuDToEIpsFWYEnFQjZ01Xbq8EKi2RLYg7+mUScu5+9KH8N
	X4wsg+n0=
X-Gm-Gg: ASbGncvTLjeAsMzzRm/DPwNoSah2k+hKizHPubHjP3jqR24+CrCWty65Ru3mmdQ6Qn4
	Vg5fTe5/bOMzUQq2bSpH9WxSx0lNR8feavnQEu6sJjBvFqjC9wEhcsuh/UT23kvCOf4cQpV5KnA
	f2e7ge1xSd5J6J09yoUCzxo2AeJ9KQwOTi87eQ0mZG77wX3qVxvpJgGnUJ2IeDB7xhexLBSTlZi
	s51b9G2CD6sdKZ1Wv27lDsP65OatZ2D9kHuI3VtF0p9H3ciXGBgUM59+HlY+zY7F8jwtu8eMadD
	DCZFVNB/VRxT9gAPu0duSZhldroNOMZuUC8flPBFR1oGieVa8Y3pmPTJVSQ1hpOzpODqC9+2lnc
	MlkFglyH0HdwBV4uwo2MKh9zx1luW54yLeHs6M1AIkrFVZnOc5JACBI5UMWk28Z2T4BsrRtlflC
	T5RnvqI2PsJat/kbcMVbM=
X-Google-Smtp-Source: AGHT+IG9AOfrcw91Ek5bPvhmcJr+q0UX7e1lQaj8TJ9al8nmf3d2akJkxEPF6SieTD1vKHTpeFZGYA==
X-Received: by 2002:a05:600c:3145:b0:46e:1d01:11dd with SMTP id 5b1f17b1804b1-46e1d9745c1mr24218315e9.2.1758637423518;
        Tue, 23 Sep 2025 07:23:43 -0700 (PDT)
Received: from [127.0.1.1] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad1b0sm278986535e9.21.2025.09.23.07.23.42
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:23:43 -0700 (PDT)
From: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
Subject: [PATCH PREVIEW RFC 0/6] Add support for boot-time caching
Date: Tue, 23 Sep 2025 15:23:37 +0100
Message-Id: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmt0mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0NT3aT8/JLkxOSMVF3DpOQ0g9RUgxTzJAMloPqCotS0zAqwWdFKQW7
 OSrG1tQCmNeFGYAAAAA==
X-Change-ID: 20250915-bootcache-1bcf0ee0d7b0
To: linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758637422; l=2010;
 i=acampanella@thegoodpenguin.co.uk; s=20250829; h=from:subject:message-id;
 bh=6FO8a+198L0yCZHP/LeEkg85hrjVLC6HuaHtKTj90SU=;
 b=y7d9aaoXKRdZhlG2csw9s5KoNnN2jEyw3vSa6QGlVFaAPWHtUGWy45ZHXWfLtcC7OkbIP36pG
 yALbev6iwj/DIsM/rrU9244zaQVK70k356g9n6VlFIuWI4omEKPP2Xe
X-Developer-Key: i=acampanella@thegoodpenguin.co.uk; a=ed25519;
 pk=qruBFipuvuZJTNm9XzFhMz42Q9F+xwyW1On3NgZHwzg=

This patch series provides a simple key-value cache for storing boot-time
configuration data. The goal is to allow kernel components and drivers to
cache time-consuming-to-compute values during boot, enabling faster
subsequent boots by avoiding redundant initialization work.

During kernel boot, many subsystems perform expensive operations like:

- Hardware detection and configuration
- Performance tuning calculations
- Resource allocation decisions
- Driver initialization parameters

These operations often produce the same results across boots on the same
hardware, making them good candidates for caching.

Signed-off-by: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
---
Andrew Murray (1):
      crypto: use bootcache to cache fastest algorithm

Marc Kelly (3):
      base: bootcache: Add bootcache test backend
      base: bootcache: Add bootcache memory backend
      dt-bindings: bootcache: Add bindings for bootcache backend

acampanella-thegoodpenguin (2):
      base: bootcache: initial commit
      raid6: Add bootcache

 .../bootcache/linux,bootcache-backend-memory.yaml  |  67 +++++++
 MAINTAINERS                                        |   9 +
 crypto/xor.c                                       |  29 ++-
 drivers/base/Kconfig                               |  32 +++
 drivers/base/Makefile                              |   3 +
 drivers/base/bootcache.c                           | 179 +++++++++++++++++
 drivers/base/bootcache_backend_memory.c            | 220 +++++++++++++++++++++
 drivers/base/bootcache_backend_test.c              | 119 +++++++++++
 include/linux/bootcache.h                          | 219 ++++++++++++++++++++
 lib/raid6/algos.c                                  |  21 ++
 10 files changed, 897 insertions(+), 1 deletion(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250915-bootcache-1bcf0ee0d7b0

Best regards,
-- 
acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>

