Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F311F12F8
	for <linux-embedded@vger.kernel.org>; Thu, 27 Nov 2025 02:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764210658; cv=pass; b=hrKl20As7NpyKGLicMRmrqgNUas1wGOTChwUcz3KheEy+hyGlsEOiFUHu6irq8W6G16kjmDlPz6qxV5mE2mMP3m9yp4tbmGFVRaZhw51VzxLC9roYid3D0kYgLkM0sk+vJ5jDrxjSXYinkKLz+d7GDDby4JlcalT1NqzIJW9Pjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764210658; c=relaxed/simple;
	bh=QI7D1fWJhBMEKjkjHt6Wn1hE0of5uUUXY5P6nd9quxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8NxY5X3RheTVIHXNFPrMo6Z61OGAQA1m2vtTEememL+dFVlE0Yp1uYV7Gmzy2AwKRN0EfsvdlRMk5pB7PGrJj9nX3eGElEdUx5TK357fBqYZ/zI6+w+jFZra9UHAT/N1ZPX/GKnEgDu9/07En2p7x+HK3Y4jqoO4j+M7LyJWBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=IZVuMqWz; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=YemJzZAJ; arc=pass smtp.client-ip=185.56.87.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="IZVuMqWz";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="YemJzZAJ"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; s=arckey; t=1764210656;
	 b=lGvwcv2qV0CbWmj9OQaLxmpbsEn2xnYrKwMTTPxMxfJ8aFaqP9EVq1Ru9YSMQFdgMFV/xSk/AA
	  oi4V/9WMPopjZIG8L9Ht0XopTCCm7X6RNFF03nVh7Prwyd8NEMj+H+y6BFkoXw0ygpO9jSLRoq
	  JenpHAmR3RDhEwjkn7PivS76XwGHKImMZol/IEBvPMgPhdP+Y3e4zXqW9zOgYeWqKtT6WXdyGL
	  BSX1AC2SpgnbpjdTlYFQVfyheQvoc8CaDEcOUB9U2EX2bYeKjgu9Hyst6HWcqCip9W5vzqQZmH
	  ZADNvSP0gZOqyOA0Y0LGA0+ALjj7nEucGvs2jM5fym4J/Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; s=arckey; t=1764210656;
	bh=QI7D1fWJhBMEKjkjHt6Wn1hE0of5uUUXY5P6nd9quxc=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=HmYAdloUHEYzzC5PLhfBCph4H07f6iMR1rTdeRKXd687AT1puoBMUS3sKJ1cgPBBtpfPeGXCU2
	  KgT7hyGd+AN9O6P5uaLyiKf3zJk8rYZrHEc89J12Suw4Sb5I1eJ/mMWdl+IbIineUYIBf7Y8Vd
	  Pv67vmJV9BI/qcprPw5gzqBJr2PXDxJKkpoi0VgeAcPRMF3zDGk8meBXTXsfOLRprEKltqbg/a
	  aBh3xBEx98mvxz6Q+k5TDkLDAVf6FT6yULUiaqd3IGObcf4ZxTlALG6L3NAEymXwEXnvihbK47
	  FysfEVG8FAqlft9fBUGf0ngrnwTmFwTG9T+di52pIdZb9g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=pB+Lvjgl3NpA60/eTcQQx10RfUFLHGz1Z2MHuivJRQM=; b=IZVuMqWzjzoVBoapQr2T/fVYna
	spfhI1U1pq8fS9tWpC/ap1UB8GD/LGFt3DjhhSeXJWGC3t1vwIw3NfCGascg5AIBVtz7uzRueHxYd
	OsR/Q7eaBOM/hzNI5Zi9F+dWYbbRKu7x/5rQOThD0Z4jt9iyeIlqpCgl5p0vPEBbvPLE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ2-0000000DTpY-3hY4
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=pB+Lvjgl3NpA60/eTcQQx10RfUFLHGz1Z2MHuivJRQM=; b=YemJzZAJEtGb3mQLzx1suA1Jiu
	J8A3uGNcNjBH9/QI7hfdqw4PrD8ERKIh/1HWXbPVU/6nKzvhtB0nBe/H+FS6RvBN3m6bMbgUOzidr
	ihv4OYMCCOHOQzFYoc7lnvkut/aoEL7gdQUbAJkLP9PgUqkj+3aXcCGdP646xinupxQ0=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPs-000000006mk-0qCc;
	Wed, 26 Nov 2025 22:55:16 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 26 Nov 2025 23:54:33 +0100
Subject: [PATCH DISCUSSION 5/8] gpio: davinci: reset initcall level
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-beagleplay-probes-v1-5-c833defd4c9b@valla.it>
References: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
In-Reply-To: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=francesco@valla.it;
 h=from:subject:message-id; bh=QI7D1fWJhBMEKjkjHt6Wn1hE0of5uUUXY5P6nd9quxc=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrQEPQxnSG3vWRPNMf7Xur7iF7RMbnfOcsn4xdy+qv
 bqxvZe1o5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZjIzTuMDDcfHQ2V6X9zK+X1
 3ddzXM+U7JVo1Y9YmNbGtyCiymrZdgGG//Vm91Ri1k+ZcFXzzekvC3b+lGmMqGTOyJ/L6fX4wkS
 +WDYA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: d4a6e3751a1d710c0450ccd88cb0eaaf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ2-0000000DTpY-3hY4-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

With the fw_devlink infrastracture in place, a custom initcall level is
doing more harm than good, especially in arm64 platforms that use the
(quite old) davinci gpio driver but relies on firmware for power
management and clock setup. Reset the initcall level to the default.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpio/gpio-davinci.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 538f27209ce718ae49820c6429e3ab9342006825..fd937b07bc52f7dac437ba0503e6013af3196a1b 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -663,22 +663,7 @@ static struct platform_driver davinci_gpio_driver = {
 		.of_match_table	= davinci_gpio_ids,
 	},
 };
-
-/*
- * GPIO driver registration needs to be done before machine_init functions
- * access GPIO. Hence davinci_gpio_drv_reg() is a postcore_initcall.
- */
-static int __init davinci_gpio_drv_reg(void)
-{
-	return platform_driver_register(&davinci_gpio_driver);
-}
-postcore_initcall(davinci_gpio_drv_reg);
-
-static void __exit davinci_gpio_exit(void)
-{
-	platform_driver_unregister(&davinci_gpio_driver);
-}
-module_exit(davinci_gpio_exit);
+module_platform_driver(davinci_gpio_driver);
 
 MODULE_AUTHOR("Jan Kotas <jank@cadence.com>");
 MODULE_DESCRIPTION("DAVINCI GPIO driver");

-- 
2.52.0

