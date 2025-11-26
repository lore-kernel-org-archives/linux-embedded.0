Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A222DC772
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 22:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197732; cv=pass; b=F1cKSbksk+rNjUjQ1xBfVkhnEfY08KlAmG6/SQW4682NmQ7WRXz1v91WbHEUyxpZOBa6Rb2qz8flN8pMRiiPV8wo++Sm/I3S0JvKZRgJT1NacY3pmchyEGnX42Y6Agar+XipR9g/CL/fQLUIiUruAhH0kuLBWlEAmxbHYBq8kn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197732; c=relaxed/simple;
	bh=unlIOh/vh4xYksKATnCVo9g+NkZJU+CC8BpFaNdf4pM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q19vz2+eZsapvZpy2OMg3T6m0mSzf3vNFBKvrGgQqE+3HtinBAJieAnsvY5jooa3iX4ON8Su9x5gvD7ro7ydd11JColascCi+VivCw/Zt8DhA1p9Y1aX64rOJ9mfwwl7MsED7U7770JBo+k25XjBNeAwSdXzs/6OrvYTrwM/0so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=kK83RWWt; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=ND23l5wu; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="kK83RWWt";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="ND23l5wu"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; s=arckey; t=1764197730;
	 b=gPHe8PCgP3bElbKbkCW6kWQO9aujTETN1PtnsiyJqJQOCo7DGsZ4gBFFRPHCXbfhrw4BS19wuC
	  WqewZIsWrkGZNeLFSzxfkw20A3ZDNcAz6q9DRyS1qpflrRLZbNm4NqpwFLnbM7VXWKRE8TLCqH
	  EUR7eM4nyzf0WmhI4F1rfjdBbtsddoquiLO+fFSNv2+oAaKMG2wkPINbUScCz44MuA+81bFQjQ
	  kY75YSSVD9xB309vtQFctNrHW1tSgT464IgqwI3ntmM5pNyCiCdcCbdK2Hv3oAWiPQL/dWwuIb
	  GmNuNSnuRCCZHsLuxFjaYubUzla4PcEHF/9ppvVnsRlW7w==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; s=arckey; t=1764197730;
	bh=unlIOh/vh4xYksKATnCVo9g+NkZJU+CC8BpFaNdf4pM=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=QRak7Ot9+vzjrgt9q5whNOXiTLtc5+TwIoilPGTowNEDHGsndVe2YSPBIpTKBhpm2FrXUcCYko
	  Umzj01W4Rsm+pDukFy91SlUaOtLTBEIRkV/g8c/8p1wJ9hQYBh+244uVUvL5IfjBID3xfRglVD
	  SF94DjlD8R4u48hmsAPUArhGFxFJY4tLE1pfWlhtJXDORwT7K3IV4Zw+B3hVbuYuR8WmkH3Ppz
	  jhPElAqPxg662LqCHetYGGqIRT7EHlqLzl7opKg3gUpPuoNh5jh5u4QSy+dODkEi0bTjZlKB+w
	  yPW3WLmKGBhY0DzteXcuXl2fHjBj4lpLLW5yj/bLlhsJiQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=fgvOn0VrwMv01w8f464p1fOd3kfjaqbNbl5mNbwtRJ0=; b=kK83RWWtN0cYcBFzz8mTGSXU2D
	OTH8tM6avuB/Yx98RdPqkgd23J5hXgUK9B+nloaTKKrPosHimAbPJpb7BzvAj6AP2pFhvVSKdjTZI
	ToqpdRKOLTHKQzKac1pzqbT2/uh8jo6FlXH0GEl1jiu8D2JT9u5uwirgWYuUI+2E/6cw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ2-0000000DToS-2p7a
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=fgvOn0VrwMv01w8f464p1fOd3kfjaqbNbl5mNbwtRJ0=; b=ND23l5wuEKvylQM5oY3Z0WUFUt
	K8Nis0TA5Ihm6isITVAk9v0NV80XPW7cm+X9H0p8aO9rbEisZzIy5bxrby077du/ml0KjcGxUNDfR
	2Z3lkvtV+WWF+ofJ2yDPOMIjl3sWOZZNuR6d6+Ey9jpIgnElEFOCEsgiEW5tNNaeDFVY=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPr-000000006mk-2xQy;
	Wed, 26 Nov 2025 22:55:15 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 26 Nov 2025 23:54:32 +0100
Subject: [PATCH DISCUSSION 4/8] arm64: defconfig: compile reset-gpio as
 built-in
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-beagleplay-probes-v1-4-c833defd4c9b@valla.it>
References: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
In-Reply-To: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=francesco@valla.it;
 h=from:subject:message-id; bh=unlIOh/vh4xYksKATnCVo9g+NkZJU+CC8BpFaNdf4pM=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrQEPLpeactsIT1XRNHinsmpn7sz339dxxNYe9c/Xt
 7Tb4TC7o5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZjInViG/0XLZi6IWKvRLru5
 xd3Aj+MaR3okt1V2b+q9/wpplZ9X6TAyXHM6yROb0qGw+X3A3VtuE2/OrEjd55/73Szn29WZB8S
 OsQEA
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
X-SGantispam-id: 834405a7beaa4c588e8eb49afdbe085e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ2-0000000DToS-2p7a-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Having the reset-gpio driver as module interferes with the fw_devlink
mechanism, since all reset-gpios appears to probe correctly but cannot
then be used right away because the underlying reset controller is not
yet registered. This leads to wasted probe time, as fw_devlink cannot
really prevent the probe due to a missing supplier.

On a Beagleplay, this leads to multiple non-negligible probe deferrals
before userspace:

[    0.878651] probe of sdio-pwrseq returned 517 after 1726 usecds
[    0.891927] probe of sdio-pwrseq returned 517 after 238 usecs
[    0.897796] probe of sdio-pwrseq returned 517 after 234 usecs
[    0.933930] probe of sdio-pwrseq returned 517 after 277 usecs
[    0.979049] probe of sdio-pwrseq returned 517 after 252 usecs

Set CONFIG_RESET_GPIO=y to have the driver built-in.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1a48faad2473a9b8f1c87567f38fedc7b703b44d..4879aec0b2d70e3b8fe6636c14e68ecdf023e625 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1607,7 +1607,7 @@ CONFIG_QCOM_PDC=y
 CONFIG_QCOM_MPM=y
 CONFIG_TI_SCI_INTR_IRQCHIP=y
 CONFIG_TI_SCI_INTA_IRQCHIP=y
-CONFIG_RESET_GPIO=m
+CONFIG_RESET_GPIO=y
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m

-- 
2.52.0

