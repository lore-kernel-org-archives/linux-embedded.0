Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B4B2E266C
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197739; cv=pass; b=EOXWjt3OfSH3d8pARICgSjPdEV+0HB4jkJoRt49PJBCB2t2+zUY/JkOv5t1kpEWqQ2YE0BIh/ogValIzNYVo36nB8WQ1XaYTXnKDfmhEvB/IcfUBy4Kyjw+08la+8afMDwXJCzfqkczvbwpqLXfK64oOyenfbC3EELpd7RKWQ0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197739; c=relaxed/simple;
	bh=9iokAD7zLrGHlnXXdBkreYLBuy501XBS/E+gpuC9x0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cSXp8Y1UhNC12A9VOZ0ozi8CQ19hzpzONtURwPeMMmBdsHuSVtcDceZiBolSESwOZVJwCcbebRd2g8HrKJnMXBZr/zBcaZPEccIuPZkJOTBYuc6ID2NWQzTLrYWD3A4gmL/vzNlQlEbpeBiYu3U+g21MIh9h2Kg67OKCppq+CW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=orS/xPwc; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=Bja4xG5i; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="orS/xPwc";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="Bja4xG5i"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; s=arckey; t=1764197738;
	 b=HT3Vq7/oSBoyjdQHIlO48mJm2dXz7OqpQEXrbvFBqkrS+wuuGcO8KQV9KnUOvN++PMT2HavgS/
	  e+ecWu1hh942ODmaKYG/FH4jZBJtV3hP5eAwN+m+tKTLY0wvhF+dNJce9VaZUqs80UT8nA/Ct3
	  rkbh6EQZ51GY1RPDQSzPcmbuObdqIfEPe3sf8HAhD1RYjtbMzLjoMKxygQ4z1h/PE+BFG89a/b
	  j3xD1p4Ce4dIyvGSlyp3sURup4VIFHu/4VMXj4l/IgzxU+V0CHZ/6cEKjTQzD9f/lKrE3z0cQy
	  rEZHoCY/Zq/rWqBJ2//HFD57T1ZxYFJckemAMLydnbVQgg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; s=arckey; t=1764197738;
	bh=9iokAD7zLrGHlnXXdBkreYLBuy501XBS/E+gpuC9x0o=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=HSGy0npHA7QjAVLP9o/BbOEt6vdutENsfRTyFP2EjSCrlINhmvvh2UlmGXia2R6Vfpx2AimS9q
	  xVgUJSCwy2jqXZ+ntNG0TD50YV/3+4c7cGmeP1CYNa9i/yTeaXVBsBcCCfuiQivO15J56FimqD
	  s350XvEABELJ6+RM0bHAMSyRraUp+2Pkx+jLag1GiVe0SizmqwpmSmpmYBek+MiqNNJxUIfs9J
	  MVkwmpzXIPZgR5qbF7esFffIhLm70e/6JV7t37+1Be6t714t0uOfCRtaI2F0MXm2vxu9GwkErU
	  RbVRXVhZr7uA8ZoH3kW80bOhvjTTuKpqnQWKRnfO63mtpQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=dbucX8XXtCAez6GwAeWZhV3m4vVS02H60HNiEaOu4Vo=; b=orS/xPwcUnImPHSz1HGAtest/a
	oGkV14qFmjt/jN863kt0iWkXDAtZmHus2lO4/EZSuu6YNFSjXaWKPUgE/bIPP9INVQY/b81eE9A0q
	h9XFbNCjN9M9egLs5BnJToc2Y9c6QYEJQ1nP4mbhra+vTo8gipyImAqkrNpTVI/EcMZM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4l43.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ4-00000009wyA-2ko0
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=dbucX8XXtCAez6GwAeWZhV3m4vVS02H60HNiEaOu4Vo=; b=Bja4xG5i7Ht2T4gethLE2A6QOz
	bvptGEkyN6Ca4R6XFx5PmUbwOKdBTfRJe7L8LcQ73pxaE79RBAHGmJof7OqfzE/tULneTQKloz4sf
	ZGr9BfZcpX2pLuiphboepSNiZMP+ATv6434Uia0lJ4XkwzJDOwxX9H9yryrIopxMLRu0=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPt-000000006mk-2tHi;
	Wed, 26 Nov 2025 22:55:17 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 26 Nov 2025 23:54:36 +0100
Subject: [PATCH DISCUSSION 8/8] drivers: Makefile: reorder driver
 initialization
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-beagleplay-probes-v1-8-c833defd4c9b@valla.it>
References: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
In-Reply-To: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578; i=francesco@valla.it;
 h=from:subject:message-id; bh=9iokAD7zLrGHlnXXdBkreYLBuy501XBS/E+gpuC9x0o=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrYEezScU7h9iX/upNyRYSuXDToP3+7K/HJepfhm0d
 dn2r2sUOkpZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJsH1n+O9xpUL0cd9McUbh
 2uMWV2PU57E/abIz0ZDTZL48c5GS+1pGhs8iy74y5Ha93zVlfjJLwapspuKZVl9+b/bO+5N7snT
 qQX4A
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
X-SGantispam-id: 7d8646abcd9c54036eb15cc6c55f032f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ4-00000009wyA-2ko0-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Reorder drivers at Makefile level to have the critical ones (fot the
platform in exam, i.e. AM62x) to ptobe and initialize early. This avoids
useless deferrals and saves some milliseconds.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/Makefile | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index 8e1ffa4358d5f1aadb0b1559ba3b41b44de6daa4..7dccffff7a126e2b1983467875d6b24ae7156075 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -7,14 +7,30 @@
 #
 
 obj-y				+= cache/
+obj-$(CONFIG_MAILBOX)		+= mailbox/
+obj-y				+= firmware/
 obj-y				+= irqchip/
 obj-y				+= bus/
 
 obj-$(CONFIG_GENERIC_PHY)	+= phy/
 
+# SOC specific infrastructure drivers.
+obj-y				+= soc/
+obj-$(CONFIG_PM_GENERIC_DOMAINS)	+= pmdomain/
+
+obj-y				+= clk/
+# Many drivers will want to use DMA so this has to be made available
+# really early.
+obj-$(CONFIG_DMADEVICES)	+= dma/
+
+
 # GPIO must come after pinctrl as gpios may need to mux pins etc
 obj-$(CONFIG_PINCTRL)		+= pinctrl/
 obj-$(CONFIG_GPIOLIB)		+= gpio/
+
+# regulators early, since some subsystems rely on them to initialize
+obj-$(CONFIG_REGULATOR)		+= regulator/
+
 obj-y				+= pwm/
 
 # LEDs must come before PCI, it is needed by NPEM driver
@@ -37,22 +53,10 @@ obj-$(CONFIG_ACPI)		+= acpi/
 obj-$(CONFIG_PNP)		+= pnp/
 obj-y				+= amba/
 
-obj-y				+= clk/
-# Many drivers will want to use DMA so this has to be made available
-# really early.
-obj-$(CONFIG_DMADEVICES)	+= dma/
-
-# SOC specific infrastructure drivers.
-obj-y				+= soc/
-obj-$(CONFIG_PM_GENERIC_DOMAINS)	+= pmdomain/
-
 obj-y				+= virtio/
 obj-$(CONFIG_VDPA)		+= vdpa/
 obj-$(CONFIG_XEN)		+= xen/
 
-# regulators early, since some subsystems rely on them to initialize
-obj-$(CONFIG_REGULATOR)		+= regulator/
-
 # reset controllers early, since gpu drivers might rely on them to initialize
 obj-$(CONFIG_RESET_CONTROLLER)	+= reset/
 
@@ -134,7 +138,6 @@ obj-y				+= mmc/
 obj-y				+= ufs/
 obj-$(CONFIG_MEMSTICK)		+= memstick/
 obj-$(CONFIG_INFINIBAND)	+= infiniband/
-obj-y				+= firmware/
 obj-$(CONFIG_FWCTL)		+= fwctl/
 obj-$(CONFIG_CRYPTO)		+= crypto/
 obj-$(CONFIG_SUPERH)		+= sh/
@@ -153,7 +156,6 @@ obj-$(CONFIG_COMEDI)		+= comedi/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
 
-obj-$(CONFIG_MAILBOX)		+= mailbox/
 obj-$(CONFIG_HWSPINLOCK)	+= hwspinlock/
 obj-$(CONFIG_REMOTEPROC)	+= remoteproc/
 obj-$(CONFIG_RPMSG)		+= rpmsg/

-- 
2.52.0

