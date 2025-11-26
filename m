Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449E02DE71A
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 22:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197738; cv=pass; b=ow/b9FjTfSds6r9+MplcGBG43naWIUZOK9FycP+LkiCit66CnU9BjGI/3e7xwBjOdm5niDrK2P8mz1FypjdJ5xK3jhJFNdkFeFgz7gSbhEqKhfBzagrNRjW6ab6N30/jEqkLSh3BD+TPVEGya5Cmq5IBLm/WXefTvO4/LLHLFh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197738; c=relaxed/simple;
	bh=usTL0n7qQhee1SENvcPhRxPrMYfaZrscfEmjtjMc8RA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mb/ep0JI2+D8ZMgn4/44WNDDQ4fY+m6IUgx6KqUuYdC4WSV/xGyrtyaEHwXL1j+Z6fmdlLC8SiQWAIlcUhrpKrREKBgSNIJIzGIvcurHhZLD5wsB61rmExFynaQblNyWjjCRY7DkdGPCCNmuqIVlehe+/4V7yyHwl8V6bqcpWLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=pyUwrxMX; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=kesUYiDb; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="pyUwrxMX";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="kesUYiDb"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; s=arckey; t=1764197736;
	 b=em1q72Z76eFi8slGBLGHWZQcSNaXlby1wVERx0aYHyvMCS257PG3jWVvKaJw1JI2Z2fE6aVbso
	  vqndlmGOVFTk4QHFj/acxHEDFJ/0YCdTespqy2CPViK6oBu+BwuqTW4tVRB09K0qtw86WSN9VE
	  r0S4FEJWalLLu270mtcW9/DEIrHcYq2IyJRbf6DaMGQ1taeK637/C+WExO00pQiWKm666Lefxk
	  /EOAAdA5E8+aRxzcO2W3Tq+VRs5OWF5/T6u4A6lbSUacFFplHeof+BkISYvHalNKpAGuJmQYT8
	  FNFVQo1n0PwgFNgtdyOoDr5+GuJACpOpfaw/vm/ATv9B9Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; s=arckey; t=1764197736;
	bh=usTL0n7qQhee1SENvcPhRxPrMYfaZrscfEmjtjMc8RA=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=KTs0bh5nOHzd4RIZ33nni7wggt3k5T1ncqzq/u8WofkCUcGHaT/kuKJYMsH7D9RBkoYXMUSCvd
	  EzTI3bX/eDlCK/YLc5n8KVT/wLbiiwFXrM2TUXsgRvgwTG/YCJkvJRG2cJ3/tIsC/klSc08T/Z
	  mgm3gSnlcwO20d5gKfqZo67J6rj4vwJrfmrZp3lY+9/Cid/OUw+Oddyv+a6HhFbUGvOFGBggqD
	  iwpP2MSw/hFc5bgQnYSS2VwdLcw5VMDeiWUN1Lk/b9lL49D8fzjcWCsozOA1IBSff6FWTXES1y
	  JfRnqXL7EUtVz7Ru4IfsbF9hYO5OQA7IugmxF3yVBaHPnw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=DHWtVldokMUgQw1oT2G53dkgV2GwFzOgqic7YUfZ1fE=; b=pyUwrxMXVgBaBoZNUfwkJukOn/
	JZH6AYSk1qiS7jrwVa0UhlpjkrhOGiYn2Log9nj2HSZujWjfd5NRPLDIuLAXTUvIx7zM7RxP5Edwv
	zPC9EFy5+KJHWsCrWUxbFFYuLY7oM6Gqx2mUCxg3K3MFp3O1j7KwNYbbaX+wox+r8mX4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4l43.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ3-00000009wvx-28OZ
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=DHWtVldokMUgQw1oT2G53dkgV2GwFzOgqic7YUfZ1fE=; b=kesUYiDb4hDk1WCsrOAELirjik
	kQYq6Lg9gcyn9rDDUMUMvfEsoj0qOt6SzZiBzIzYc4zpfq53Q5mCQ09iy1Zm3gkghn4QE7/MhJ2hW
	x6Kmcyt967R5JPUMjK1Fe9EXzMjLNtc2JMO4nlPdlH2IR/NRGtR/vmrzqnWgqM9TYADo=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPs-000000006mk-2v6O;
	Wed, 26 Nov 2025 22:55:16 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 26 Nov 2025 23:54:34 +0100
Subject: [PATCH DISCUSSION 6/8] i2c: omap: reset initcall level
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-beagleplay-probes-v1-6-c833defd4c9b@valla.it>
References: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
In-Reply-To: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349; i=francesco@valla.it;
 h=from:subject:message-id; bh=usTL0n7qQhee1SENvcPhRxPrMYfaZrscfEmjtjMc8RA=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrQHsNu816zMqnz64VWLfVt3wvidkQn+ry0fmwLkV7
 NNjrrF0lLIwiHExyIopsoSsu3Fvz1zzb2kbGB/BzGFlAhnCwMUpABNZ+5Phn5KFE+uV3RtSnr74
 EC2tKu0gG7qvZJ5G6b7/5SIsPY17eBgZ9q9JWfvzyvZT1jnf2v9dT1dokDZwLFoYtfuqpP6BUPs
 VvAA=
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
X-SGantispam-id: e50f86c7b31b7b90e875fb533f2bebef
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ3-00000009wvx-28OZ-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

With the fw_devlink infrastracture in place, a custom initcall level is
doing more harm than good, especially in arm64 platforms that use the
(quite old) omap i2c driver but relies on firmware for power management
and clock setup. Reset the initcall level to the default.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/i2c/busses/i2c-omap.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384340dd31308bdf9ed0cb1a1a2ba8b..081b472ec99a271521cbbbc21b8462c3a69d13cf 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1625,20 +1625,7 @@ static struct platform_driver omap_i2c_driver = {
 		.of_match_table = of_match_ptr(omap_i2c_of_match),
 	},
 };
-
-/* I2C may be needed to bring up other drivers */
-static int __init
-omap_i2c_init_driver(void)
-{
-	return platform_driver_register(&omap_i2c_driver);
-}
-subsys_initcall(omap_i2c_init_driver);
-
-static void __exit omap_i2c_exit_driver(void)
-{
-	platform_driver_unregister(&omap_i2c_driver);
-}
-module_exit(omap_i2c_exit_driver);
+module_platform_driver(omap_i2c_driver);
 
 MODULE_AUTHOR("MontaVista Software, Inc. (and others)");
 MODULE_DESCRIPTION("TI OMAP I2C bus adapter");

-- 
2.52.0

