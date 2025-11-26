Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD37217F24
	for <linux-embedded@vger.kernel.org>; Thu, 27 Nov 2025 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764207544; cv=pass; b=q2wqjA6fZBjz+I1cQ4ii1GuB11onI/rzM11tq//44e43Wtzavy9guwLj8TNF+laCA13KbI2tj1qmJeNfhnfbu6/VuEXHJSeuHLO8VS8GyU8SpuEYLy8EhDFGumTQ1c/N0MevZsTJ+H2aG+DJHjW+QcToQDZXYIyxCTfs2S+YHjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764207544; c=relaxed/simple;
	bh=ED6emQgHl3SaTCF3IR5l3ZdfpJRNkRaOSEgPiN98wss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6uZ/LjL4YxiZBdqkGD+o40KIlho6amtoZSkLpslNjuzI4/NHYn/rXctBsqriIpH7anoMmm49ktP6pKd2AyY++QP3Vcm+UPCcGoJgGLmnyqOwF1W360fD8JB8gYUl9TdpJ/tDxMnboqQ8JA/StaNOHH2gauuSFmnI43pqI2mtZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=EMuQ2bmH; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=B7V4hB8u; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="EMuQ2bmH";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="B7V4hB8u"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; s=arckey; t=1764207541;
	 b=K4jldgWMxg42r/rjfVB6lOkF6NusE0EmwIzTYe27vf0j+PNTJ47wFxCTxTtPGYTHoumSOm1zZu
	  LNOmETU5E+Vgj/yx8re6/Z2FcB0Ilysdnd/RqKsu76oeL5TYMw5vEZeYEjR6BaUJi42WH20sL4
	  iI0PGPVZqIzpg3KvdkcXPwTuIGvIgTPQU2NQ/A5CS7cZDhG5ob8tuPSKWMIwTtGPwxX3nDRbWT
	  mqbVZoY+ru3fUIkxfCMaO/jKwXEQjhapV8T6LZ9YIcLC0syo/1OdpR+r+MzycLWBaCJ57cWEJ4
	  cJ12QGi+8tv1vQZXmsUKsVYJC5ZNg0wRNr67oVpAqYVWkQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; s=arckey; t=1764207541;
	bh=ED6emQgHl3SaTCF3IR5l3ZdfpJRNkRaOSEgPiN98wss=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=ibrrYGPdXOUolX6fgfKLIHZZRb4nCNggI+FPYgArmgh+BB/WSXsaqpeVInfBoWjJ3Yse+zhODu
	  FVfCbD73M4NRK0TB9x6ISUJctRttIGhugF2SDNn+I5j9PeW66fWHO8J7RRvGU3kyMSr4bLUj9c
	  HFy/7Fx4QJZAVJyYekEgavvtHn26KkPSmIMFOHzLVypeWwhUE2goqU9+V586hqo5FFlhI5mOrf
	  hlcNr2JG2L92T1mVbi53J7Z5kAD1jS1Yq9TAMt9L3Kc2fIgXpfuzbFDXHxxEWp7WwRGvGRf2On
	  ZxGc9az1vXSUGxlzSIn5w95LAkkdFDh67mVR942Rhk/LaA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=BzGrfLg15spZfp6rIVjSqtnSD1rRRITHVgO9lY0/8tE=; b=EMuQ2bmHQ4hwxbN/cgr+iDxhXR
	7QsJ/mf+hAUqt2isNboANvlirFj7duQqLNtqkOnmjLTGYXPyO23RVo0iZMObZFeJi40sRJU5JCn+u
	n8XDuwyepoXtRC2hZD/1GXaUPRwR8aWglHb6JJpnI9XeHuKFwcl5BYd4t+LvufQLuSBE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ1-0000000DTmz-42OI
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=BzGrfLg15spZfp6rIVjSqtnSD1rRRITHVgO9lY0/8tE=; b=B7V4hB8uc2qlb/B4dl+E25Y32r
	Vg3MrgZ/OQjBaafEQvHM0bdtsz5HVh0jRHjcBz86KG6qSbQ+z1ATCrzGb2PxOAA3oJ24ooy8ZsqvT
	F+ONWZGznPniTHs6yHvo50UtQv+lJbcq+G3dB7X2ci39GmufleV7gYS+phw98zgG9sGk=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPr-000000006mk-0skQ;
	Wed, 26 Nov 2025 22:55:15 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 26 Nov 2025 23:54:31 +0100
Subject: [PATCH DISCUSSION 3/8] arm64: dts: ti: k3-am625-beagleplay: remove
 inter-regulator dependency
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-beagleplay-probes-v1-3-c833defd4c9b@valla.it>
References: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
In-Reply-To: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=francesco@valla.it;
 h=from:subject:message-id; bh=ED6emQgHl3SaTCF3IR5l3ZdfpJRNkRaOSEgPiN98wss=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrQFXSycue8DDefrUSo7m/lm85/tPByx1rzKofLf8z
 4HA+MykjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAiEh4Mf/i/XuSSfe7zJXtl
 mrfQ1P/LDC6x/0xzn/fwZ9lhxfUTJeoYGbYf/+VTEKR8LVupaOHFvbefJcWqVVdf5T2jk7GMrcz
 lBysA
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
X-SGantispam-id: 5f8171ac6a125e522b4c288cb7190d83
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ1-0000000DTmz-42OI-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The dependency between vsys_5v0 (supplier) and vdd_3v3 (consumer)
describes the hardware well, but causes delays during boot, since
the kernel is trying to probe vdd_3v3 before vsys_5v0, causing a
boot deferral chain for it and all the dependent devices.

The dependency is not functionally required, as both regulators are
fixed, not controllable and always ON, and is thus removed.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 60e2c86ab197e348bf941e30c2641a26cd940d82..3a96d76db0fbf7be68884c130ecb9e5c1c06d834 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -118,7 +118,6 @@ vdd_3v3: regulator-2 {
 		regulator-name = "vdd_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vsys_5v0>;
 		regulator-always-on;
 		regulator-boot-on;
 	};

-- 
2.52.0

