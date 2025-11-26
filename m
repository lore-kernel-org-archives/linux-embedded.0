Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624962FD69F
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 22:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197733; cv=pass; b=X7TGvGPWtIpJ2yAqABuNGUrsPkaqMiGYjNwzgTLjXytVL0oTBAUodQWc58s9BJZMvjuAdFqiduxNLSeSnHhNl+EzNJMgM0jkhipqUsiSmOV/UN+X1ZpJ/Kx6w2hBGvjnWg3Tn8rYTXuwdP1rNLozWG7Dp6LPUR30BhGFO6aFjoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197733; c=relaxed/simple;
	bh=LeTjeHVhqBLcNDhMz8zK+jMt83gtHqCkS76/4263FAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaNZxSIeuArxUlg48idfO8WYoXqMvBz+CDdpPnSrIrT4Zp9Bsr2ofuInzUMmmNlbblXPqjb2IrZXgjfX1zUCIoCgUFepoqhKFhAjYa/BTBghH0tOLChliMMy95WjiosdLO7oRDweBoUVBb+cMfTh0Cq+4mnmEzl4rejqg3N5hEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=dhkhQS/J; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=uOQxERNs; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="dhkhQS/J";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="uOQxERNs"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com; s=arckey; t=1764197731;
	 b=dRCJlnCExCUWokUQmI2eI6bl3S3SMk9GgrZRE3e/VfHYMu1HElyIgIHk9Qa21SPKwDrJbQeZcZ
	  OB8XUFV2g1pVYTsRBG6FlJSathl4e2TB+riB/kBJB/VFDaGRgGAE/nEvBF86UYIRRvvb9efLhe
	  O7OV/sgQlb34MRgUFLFa3f4smJI+LrT6jb+h/LLbZ5+yCGcaEwl/Qo02G8i1okeDC1fe103HJR
	  bXewEH2bsAMvKeCp2r861CLmFwEKHCnrDeI51IbRZn0I3UwzZCdOYKQU1vdlap9pV3TqT46XAM
	  bgwnhXzUBMbsRwK5mhJKU+slnou8cR9Wn4BP+pewD4rHRQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com; s=arckey; t=1764197731;
	bh=LeTjeHVhqBLcNDhMz8zK+jMt83gtHqCkS76/4263FAI=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=R6XgwAr4F2stD5sjGXbuifCvpEVPh86k1TJH5LK/x0uhLaPtcaJPCKYteo7vJRN0pZTPLas9M4
	  hdIX1KA2wkFV3J+2UnnGPhEuy5YxBfWgcvSxIef+8WGo/hrTIWKeVBTmK4EkNq0pFnoGRS497H
	  driOFZbbqPq6ialaXBP1j8nAmZ+t6IBT+57ahegMusiMMQS2KPatVRKQNA0aaW7n5Qrrnm8xnv
	  SncmGmDt0LmkNm2Zugq6xr7cNeHvcBCSSgXFYt4NJIV4O89symVWhSIycDbW5wC66ISBDhz3h7
	  Nxk1F7T3mHMyR/0jGExFXLwZ+L3fNKPPfbFUMCk/fx9RSA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=WEizM6SoXjupItcLSvJYlBbKhky9CnYORkmWIiPPKXQ=; b=dhkhQS/JIeJ+LWbpwHz3PKD7Tp
	BDl3oW/mEz8HaI8Wup7VGUSXHLCHgw+nAZjx8Zx09araS0fz20AMylTM8d4RNvbRKCZigQZLdA6X8
	OUj/Urc9jbYzbhh/DkRYGEtfbtPUWP7ObTNGq0lQ+4q8sKMlUe5TTdyzbQXaoCDBBTMk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ3-00000003yUK-3FEk
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=WEizM6SoXjupItcLSvJYlBbKhky9CnYORkmWIiPPKXQ=; b=uOQxERNstzkQMal7ubFA2/UoUm
	480o9oeDgILArpuLHPFHVkMDvGvxjazuqoUOg6Y7Bw7har2FYFhdByMAKO39B+Ia6SzMJSYVvKRzt
	beMbPgEr+1fiEhJWjrzzA6q794Kf3Y1OYNJ4bNcqFHkVQDQWgaSwiAID+zjXJBnPgz88=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPt-000000006mk-0o3j;
	Wed, 26 Nov 2025 22:55:17 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 26 Nov 2025 23:54:35 +0100
Subject: [PATCH DISCUSSION 7/8] regulator: fixed: reset initcall level
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-beagleplay-probes-v1-7-c833defd4c9b@valla.it>
References: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
In-Reply-To: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332; i=francesco@valla.it;
 h=from:subject:message-id; bh=LeTjeHVhqBLcNDhMz8zK+jMt83gtHqCkS76/4263FAI=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrYGiYQH3F34sXGJnfXClsv2OTzM0JFaEPj/mH3+fx
 5HzSfiUjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAiDf6MDLcvhHFFOOb1z76c
 tX3usSl2bPz73x1um17hMuOJUaKoCD8jw2GdSit/uycyIUkCF4MNnZRZr1T9fea6ma894+7M7M1
 /2QA=
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
X-SGantispam-id: 2ec0f7539e8a3b8094bbbc59d2104e4c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ3-00000003yUK-3FEk-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

With the fw_devlink infrastracture in place, a custom initcall level is
doing more harm than good, especially in arm64 platforms that relies on
firmware for power management and clock setup.

Reset the initcall level to the default.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/regulator/fixed.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index a2d16e9abfb58dc3ebd1c1c612fe699ae3487d95..36e70e70ab2d19818b90d9ca72e615bd6cdfe800 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -390,18 +390,7 @@ static struct platform_driver regulator_fixed_voltage_driver = {
 		.of_match_table = of_match_ptr(fixed_of_match),
 	},
 };
-
-static int __init regulator_fixed_voltage_init(void)
-{
-	return platform_driver_register(&regulator_fixed_voltage_driver);
-}
-subsys_initcall(regulator_fixed_voltage_init);
-
-static void __exit regulator_fixed_voltage_exit(void)
-{
-	platform_driver_unregister(&regulator_fixed_voltage_driver);
-}
-module_exit(regulator_fixed_voltage_exit);
+module_platform_driver(regulator_fixed_voltage_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("Fixed voltage regulator");

-- 
2.52.0

