Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E52D9481
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197730; cv=pass; b=ekZ9pek2qCfXtPRfcJMP/VeDj/PwntboibdyawVR6t0ME2SO7XvtjtE2DF52AKNUF8XbPWdjHSVRCfDRxTV3JBOIC9ImwG3e18ZYRv5hK9Ma5g0bFELJoXQj7IMFGRMsILHol/eomN45Mcrb4n3/Nkz+6jP1jPqxjGnCL6eGOg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197730; c=relaxed/simple;
	bh=yHYZ/X1d3QhoPsxLwGtGC3eXaCqqCILLQa11Kyk06M4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMx3z/Q3pbiPOTdfWJeo1drqnBU3PjzMB3xL2VtG0SIGxh8feG/z0mrUEirjkbOMs24xu4KiDSnQgaQmmlFJz5XIrBv558SigN0n7yrGp+VNpcp1GboEtzgLX97P6A0ujtsEs6jUF5EsbwvR4GAfwKo6rJQmCeRi8KPRGhrboFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=suRKDgAG; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=nkpcsISh; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="suRKDgAG";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="nkpcsISh"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com; s=arckey; t=1764197728;
	 b=A5pMkKWFY/LYrKWAc7XlCc1cbqi57rY8UqV+CqcfsBpmZFOC1krN90sMmIK9C2fBLlYdia6FBP
	  bh8Xhc3NvmMAxWEbyRlwvQvrg8jHmN0C/TAbK7Fx/zypV6ssI+RX9hglhmN32IgikODtXC6250
	  qw9diz/8364/bZ0e3UD0d3oPooC91xeCyCMMOts3gtjJIEm2274YsrfjJRMxN86uZblX6qaH+U
	  mClcDkQpjeQD2HwWDGTCZA/U+Ddepfg6KGYo9msgWT2fvlukrvtn+NeUiCgvhx8bi3I+PSM1LB
	  T6vzqHkoB3SLC+iX2srSZzd7Io1c0Dy2T0VE+UHpz8HLnQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com; s=arckey; t=1764197728;
	bh=yHYZ/X1d3QhoPsxLwGtGC3eXaCqqCILLQa11Kyk06M4=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=WU1BVl1mmzXg8ULki4OiURnEBNiq06bjCzxwY2XvMlhj0SykMDp38cOEQuZHK5TL8HsG4jdWNg
	  2fs+3VOUTTF681QyPAhCvGTGMzyRFe7TOqhINzXOWssfkkQ/5aurcFEuYCR7lSJsPF1Tr0Mf7Y
	  DCwdsRqfPRUMv+Z8WybYP5UGt2W3CkbvKBbr771DH0Zc/02AbSQDnieDOseT0g5grptZ1cK+s+
	  EnlOnz3/C81SHmz/A/XIp7KuCs+K3JY77c4IZE6W5IhR2hHcyaT7EElfkpW+etoJOHGU46ULEF
	  jTDJW9hUkd21Ao6HLH6Cw5LaJGanhuclwWFlMPB/cPrfJw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=VUN1iGwv2qwaxTKk0/woAZkyUrTYL9/rXxZ4A8Awb5M=; b=suRKDgAGMYdvRy4+Uft5hnNeXf
	ze9O727ksPw1mmFeBm1OK+710x0PvI6Myw4bclpvFMoV/ogIAwT6cXkgCEo75uVgGNAMsXJKHZ1fX
	hqxS7X5uE/okQwciXoHDHIuDami/fJvZDKTeyyIO3Y3FtabYAo5xlq5eP6S9kMgjcOxQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ1-00000003yQQ-1MLV
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=VUN1iGwv2qwaxTKk0/woAZkyUrTYL9/rXxZ4A8Awb5M=; b=nkpcsIShxDU/I2U/uhsSQqwHJv
	NF+hHTsnjPUZtu6DjNLsoIeI8+x998ekAkfqOl6NmJfUnWK4WDVAS7c9dyn0G6WlUQI/ahXjsCbpj
	qB+wx4gP5ZsrCMLuyliGOEy5TglwJBKqVK8OUrXm3z+ex139qrrUDbOOmDsf98vBthc4=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPq-000000006mk-2yXw;
	Wed, 26 Nov 2025 22:55:14 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 26 Nov 2025 23:54:30 +0100
Subject: [PATCH DISCUSSION 2/8] arm64: dts: ti: k3-am625-beagleplay: set
 post-init-providers
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-beagleplay-probes-v1-2-c833defd4c9b@valla.it>
References: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
In-Reply-To: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=francesco@valla.it;
 h=from:subject:message-id; bh=yHYZ/X1d3QhoPsxLwGtGC3eXaCqqCILLQa11Kyk06M4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrQGMC5u1S7We7thx+syaF9PffHfi/r079ka1xwbl9
 QFvu9NkOkpZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJ+O1g+Cume/D5p6CttnNC
 M1OmzKkNv3zq0uepLAfdnmd1M+71cI1k+J+QtVDjxqo0hxeNK/qWXq0pupN713DF8zlbncO35d5
 5uYgDAA==
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
X-SGantispam-id: c88971eb1b7038afc29588f9481b544e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ1-00000003yQQ-1MLV-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-mkbs.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add the post-init-providers property where reasonable:

  - the gic500 is depending on itself, but that is taken care during
    probe;
  - the TPS65219 PMIC is depending on one of its regulators, but also
    that is considered during probe;
  - the DRM endpoints causes mutual dependencies between componets, but
    only one way is an actual init dependency for each couple.

This solves the following cycles found by the fw_devlink infrastructure
during initialization:

[    0.056895] /bus@f0000/interrupt-controller@1800000: Fixed dependency cycle(s) with /bus@f0000/interrupt-controller@1800000
[    0.057072] /bus@f0000/i2c@20020000/bridge-hdmi@4c: Fixed dependency cycle(s) with /bus@f0000/dss@30200000
[    0.057218] /bus@f0000/dss@30200000: Fixed dependency cycle(s) with /bus@f0000/i2c@20020000/bridge-hdmi@4c
[    0.073755] /bus@f0000/i2c@20020000/bridge-hdmi@4c: Fixed dependency cycle(s) with /bus@f0000/dss@30200000
[    0.079458] /bus@f0000/i2c@20020000/bridge-hdmi@4c: Fixed dependency cycle(s) with /bus@f0000/dss@30200000
[    0.079567] /bus@f0000/dss@30200000: Fixed dependency cycle(s) with /bus@f0000/i2c@20020000/bridge-hdmi@4c
[    0.086984] /bus@f0000/i2c@20020000/bridge-hdmi@4c: Fixed dependency cycle(s) with /connector-hdmi
[    0.087088] /connector-hdmi: Fixed dependency cycle(s) with /bus@f0000/i2c@20020000/bridge-hdmi@4c
[    0.573947] /bus@f0000/i2c@20000000/pmic@30: Fixed dependency cycle(s) with /bus@f0000/i2c@20000000/pmic@30/regulators/buck2
[    0.598398] /connector-hdmi: Fixed dependency cycle(s) with /bus@f0000/i2c@20020000/bridge-hdmi@4c
[    0.598494] /bus@f0000/dss@30200000: Fixed dependency cycle(s) with /bus@f0000/i2c@20020000/bridge-hdmi@4c
[    0.598675] /bus@f0000/i2c@20020000/bridge-hdmi@4c: Fixed dependency cycle(s) with /connector-hdmi
[    0.598734] /bus@f0000/i2c@20020000/bridge-hdmi@4c: Fixed dependency cycle(s) with /bus@f0000/dss@30200000

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 7028d9835c4a89cc3f5ca17543b18d3419751f0a..60e2c86ab197e348bf941e30c2641a26cd940d82 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -211,6 +211,9 @@ hdmi0: connector-hdmi {
 		compatible = "hdmi-connector";
 		label = "hdmi";
 		type = "a";
+
+		post-init-providers = <&it66121>;
+
 		port {
 			hdmi_connector_in: endpoint {
 				remote-endpoint = <&it66121_out>;
@@ -622,6 +625,10 @@ cpsw3g_phy1: ethernet-phy@1 {
 	};
 };
 
+&gic500 {
+	post-init-providers = <&gic500>;
+};
+
 &main_gpio0 {
 	bootph-all;
 	pinctrl-names = "default";
@@ -701,6 +708,8 @@ tps65219: pmic@30 {
 		system-power-controller;
 		ti,power-button;
 
+		post-init-providers = <&buck2_reg>;
+
 		regulators {
 			buck1_reg: buck1 {
 				regulator-name = "VDD_CORE";
@@ -793,6 +802,8 @@ it66121: bridge-hdmi@4c {
 		interrupts = <36 IRQ_TYPE_EDGE_FALLING>;
 		#sound-dai-cells = <0>;
 
+		post-init-providers = <&dss>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.52.0

