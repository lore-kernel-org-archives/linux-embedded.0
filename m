Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC0926A1C4
	for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637428; cv=none; b=p1opTioDT5VrCAwakwUJLWMHqdvd6NVvvJZy2JmZQdtsqVoKK7bElUIgSJzH0OUS2B37fvucKllVR5xgPbwXlUe2FM0ExDeg0IPXSk+bLewowtrMjXlxh0FlF9PL9llfx1bchv2y5BfLt0FdkAJYaRw2Z5znGbN9ay9GNjGP9H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637428; c=relaxed/simple;
	bh=qtpxFzF9TEagavgF+PepjCUoOkOD92N7fcs3YB4bbGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=sIWbHDpHpdcnImSApKDcKBsgGZjsZzayUUQdo7LkAr1u4M2nuVELdfrVUJkXu16gRjJdUhAUPIlJ9BNhvZCPxUbjxQEPlRN9Ays7JX9AViBxmyAIKbJdWrEGjFrnCRWAF8uNU8RGe/TILhHU8GJjQoc+OEVYsucYqnOOJQZZoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=C/J972qK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="C/J972qK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso42859555e9.2
        for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758637425; x=1759242225; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4hEl0zfIH1rtpn6jnrW3lO/OtUGin5mfgFn3YhGFcU=;
        b=C/J972qK55/zBHopGHkUq1WK1LuTiTqWUFvnRUD525EutkbsFp2+Tg4FXwoVsZnUlw
         pUVMxnJVUeovejJMraL5R2IzlZykM/Yq8EwwGVuY3gtdJzF6Z+0bagCpRcEN/nVYIwPz
         cu4pEFcljM+LfZa53+fL4jryeknXovWuTEXzTu98QNTHI5BN4llXRBmzzZFzPr0GDYDs
         3sfvRi1XX3zJyDy4wOAFZklBn04Id5vEG59kDdQ7VEvJmZ8+lQZOFZjiWkzKXMyGUeH5
         /Bkh9F7u5rTz6tgympuMQEBkzY+q8/5hWpM+ayP6rLbBqRn2/S0hXc6WjFmNPDO4zUhU
         2dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637425; x=1759242225;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4hEl0zfIH1rtpn6jnrW3lO/OtUGin5mfgFn3YhGFcU=;
        b=uDyMbNHvrUVFMa1w6BDAMjNGJZ7xVFxN7v98yw6MDKL0r3VELFku2wJjipHKBARS+A
         +jSJKW/iJQBrxio05+DPToBKCXnFNHaiIqLt8NHUrMBVg0VZft3tZvnBA/AL+56wwt5n
         Z1V+5uvYFehEH4RpDw3YNuSk0Pn5mUcCZXPCHKf5oE58i7P8CoLvUXgs+wXLlHbCpqXA
         I2wixU1ecaNJ7yI5J20J0LzaywJyh/yETacCnWjmMQl21Zwg+7KQG76nGovNIWhbTuBV
         VASFHf190AvNu39wqJBdhfl9y3n9GLZJSH/xglYM3mOYoNGKFJuNuUspi3v1pB7D2f2Y
         EwLw==
X-Gm-Message-State: AOJu0YzgmsaKWh8hBFZEKvQm17lGZEUdnMYiIiEZJjcMzHryBnfp2vU0
	kBHPqmfAmOA0tOFn3yuUWZLQ2+YFmdLbRnJY6eVee2Cos8Xn8UvBvIkcVhiEHbkctn9oN0NVcuV
	P0cGfrkg=
X-Gm-Gg: ASbGncudjQe2Yz75idaMof/W48W33DqeU7m1MDXQPEHQpDMfQmGD+HEWfMIuzQRCX7q
	VUOAySdjn76F6xzg/0Ak1tqd8/qo/KzMN0O7SCEzrSxK7HXMxARXymBL7VgQ4l1ekl5sAAXbrC4
	78zjH9y2ZhJI8YM0MA4Y0uAHDG5ASkFjDa9oUgtdedmmBRcXTVkJX8o5Gby91AKQx4soOKADwXo
	b1ou3SCMLzzFu15oVKc3ktge98wwgMThBtiWLl+SVRHrosLUgnilHgYXcfUd7lmxS91Crrd1mlI
	joLMm9Qyn/reMKUYsghs08/k0hsVf1g09VH4IFWngEXQ/s7etlWX4ARcnZC4vuE8Tmtp3JA6hLw
	S69iV7vgPvCj3CL0G/oVaypfuNLt11RiCiaWGTeMDtDWScJx69PXBR+Qsv6SWKtDWOQ17IsDZbT
	ZndwhhWCkG3gdK7yU2M5Y=
X-Google-Smtp-Source: AGHT+IFFhMcVPHcIPzY0gJQXf/UILzf5O7KftuEWZNLCw8LsRcsDlTznptzbvSj/eAa7h0gH/bsj6Q==
X-Received: by 2002:a05:600c:358f:b0:46d:7fa2:757c with SMTP id 5b1f17b1804b1-46e1dab7c93mr29822465e9.19.1758637424820;
        Tue, 23 Sep 2025 07:23:44 -0700 (PDT)
Received: from [127.0.1.1] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad1b0sm278986535e9.21.2025.09.23.07.23.44
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:23:44 -0700 (PDT)
From: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
Date: Tue, 23 Sep 2025 15:23:39 +0100
Subject: [PATCH PREVIEW RFC 2/6] raid6: Add bootcache
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-bootcache-v1-2-4f86fdc38b4e@thegoodpenguin.co.uk>
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
In-Reply-To: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
To: linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758637422; l=1758;
 i=acampanella@thegoodpenguin.co.uk; s=20250829; h=from:subject:message-id;
 bh=qtpxFzF9TEagavgF+PepjCUoOkOD92N7fcs3YB4bbGw=;
 b=9f2mZPlUDn0TcSAfrpUYnKmGKWXKJySv5+DOChlKsAyb5Ssq8POFs+hfBn3ssil11aR0asKqS
 KWhPtnkU+PmD4Oa4N+4k+eABuzEZgyIP36QCbALmtKuQp5U4dDtlXoa
X-Developer-Key: i=acampanella@thegoodpenguin.co.uk; a=ed25519;
 pk=qruBFipuvuZJTNm9XzFhMz42Q9F+xwyW1On3NgZHwzg=

Check for previously cached results before benchmark

Signed-off-by: Andrea Campanella <acampanella@thegoodpenguin.co.uk>
---
 lib/raid6/algos.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index 799e0e5eac26db3d10c07e79f46537af4ec6f182..fc69d94afdb4fc153626a3e21c506eda57540618 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/gfp.h>
 #endif
+#include <linux/bootcache.h>
 
 struct raid6_calls raid6_call;
 EXPORT_SYMBOL_GPL(raid6_call);
@@ -159,6 +160,24 @@ static inline const struct raid6_calls *raid6_choose_gen(
 	int start = (disks>>1)-1, stop = disks-3;	/* work on the second half of the disks */
 	const struct raid6_calls *const *algo;
 	const struct raid6_calls *best;
+	char cached_algo_name[32];
+
+	/* Try to get cached algorithm by name */
+	if (bootcache_get_string("raid6_best_algo", cached_algo_name,
+		sizeof(cached_algo_name)) == 0) {
+		/* Find algorithm by name */
+		for (algo = raid6_algos; *algo; algo++) {
+			if (strcmp((*algo)->name, cached_algo_name) == 0) {
+				if (!(*algo)->valid || (*algo)->valid()) {
+					raid6_call = *algo;
+					pr_info("raid6: using algorithm %s (from cache)\n",
+						(*algo)->name);
+					return best;
+				}
+				break;
+			}
+		}
+	}
 
 	for (bestgenperf = 0, best = NULL, algo = raid6_algos; *algo; algo++) {
 		if (!best || (*algo)->priority >= best->priority) {
@@ -198,6 +217,8 @@ static inline const struct raid6_calls *raid6_choose_gen(
 		goto out;
 	}
 
+	bootcache_set_string("raid6_best_algo", best->name);
+
 	raid6_call = *best;
 
 	if (!IS_ENABLED(CONFIG_RAID6_PQ_BENCHMARK)) {

-- 
2.48.1

