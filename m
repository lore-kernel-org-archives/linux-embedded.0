Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B0426A1C4
	for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637431; cv=none; b=VLFR62IqhdxMdt19Zq5i9TsVPkRtzROPUzJtxoViIbF0p7QYcMy5RlQeLBw6ePyDDFQOhO/xHgoQjJQiT7ljBqrIymLV7fU2eCPfIb//QfTPK32Sc55jOhqJMuN94Cl5n8zNN6ji+dhFFLSvDEVCODmK2JyGoqTaFQ2E8b94a54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637431; c=relaxed/simple;
	bh=jxzMnNt9PoGsyeSpliFAt5pK+4UL6pVMC7vHurGi4Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=M8y1cbxpLBu1972rIObYHSuwxEJgQc7PIc0wltU+2a7uoC41bNoCQ2uHRN3cEW7Y07hfyvtlM1Uy9Qc2wwf6CUse7lqy7GzeAFsJVJLFWKUMv/qh+gkahborh8OcaQxiYPL9GnySog92vZXhcMwV4k/NUn3sZV5ZZvKikN59iL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=br9YB2xy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="br9YB2xy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee1317b1f7so2805488f8f.2
        for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758637427; x=1759242227; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpLvwD1nJBNJm1yNSTf/jjBxsm9tZgokc69bdW09Rcc=;
        b=br9YB2xylTPpal28nuIqHRTPt5gw300OXmVuijBmbzQQFin9UPAK6sa3WYaiTmCQQA
         JjhlJUobq9YmI+y8ejM0lh0zYCll6Xh/QCQ8r7faTnQpzul02XpTxZ2JSliOtMzpk16n
         5/F9CXTuI7TGzDfmtBSd9KDl2IgTKPIclKZf0eeX47A5XtnKNQ3A2bKGacb5RR3F4M49
         h8/ZDD8zC6oDcWBQ2K/nAN14IaNoVeaq97FodDCU+7SBt0lv770FBS5s0+ZDx4u7S59H
         jRkZwBtIcOq8a14gi6IttOeAXPRsAs1XDOwbUoWlqbH/Myk6H4uyFbwBghXyq7WHKCou
         84/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637427; x=1759242227;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpLvwD1nJBNJm1yNSTf/jjBxsm9tZgokc69bdW09Rcc=;
        b=MrqeqEo9v2blv7Rjv0AqhWJc9+yLeHAk/Veu9U7AcsYQy+h31B8JhQ4G9u1nWgZye1
         J2BCpkEdV4DoBKVDtmtSUDcqsJ9JUEM1mXfwJlh1VFv37cTGp1gEmQMN3GCXWZWD6t3M
         kH5YCO64BN/VVhFlFoKk+0qIgEc+IBnLXmC/jBNBzXhud8kqsXldaMeVtkRVEk+wRzp9
         WZGHKZN9tPra2lK3PKN9G7MXQVANoWIPM2S8tRkNJP2IX4N68k6ld2RfvhoQan8RGbJA
         d2+Q8T/U5FpnaF81KVveCwc3xeDwRCRY6bSj+wm31SjEIeWYgNATeBYUsPnNiDjGcpep
         8yXA==
X-Gm-Message-State: AOJu0Yx5AWLlAvOEOiddZ0LAVejir6AJRsd3Ldk4nilXK8q32ftekO8g
	atihKBwHzwz7LeaqFAsV/QLJD3Jj3UfRoGmoYmJlDxsht86n8S2tMvkN1i+63+EWP0/+/xDPxyg
	EKd3f1/s=
X-Gm-Gg: ASbGnct+j9IXuxU0jDe2xyEdL9stU9m5UPtC2PHDvtMmliEakiinJJbcxvhMKyWnyHB
	a2PwsnvnxM3xG2hXcNXqTr4e4f63n7STZw0phhdF58K4GJmGlC6Sj6sTQdbZTVY7wY2Q0XhhQyf
	a08muLxGHIFcCQ3Ls0QnmvobPdcLI3YcdBdeHVftV1faDRQtVTVIdwByJobCugg/rP7UCmPSEkW
	2kPM6IADpBeZrueSrbvYzMhGBMw8ogN/O+3aVJeY1vtPwunyyzwqgdynM9L0Qiqu+CVbRb22asQ
	8lqqi7iWoeh5TDkAYMaldy1zce2DzrAr1nX2Usqr/hY9wIezb8JJWLBmCDpQBcSQolaY6Wb31uV
	0nHZJHRvenCCql47PJ4kCL05+JUJiCsN/s6cwLYH2dthlD9ae4wNUBzTO+cAt2tB4IZs7MDuO39
	DtVJd63QnEbCvBPULe0cCs0Egv2y3v7Q==
X-Google-Smtp-Source: AGHT+IHwGkxjSIQVAok9gUmo93tTlg82FyU6veaAAtm0fhJHZ9PpoDxnx9p95kPq8OAqH/Mfn6Mf0Q==
X-Received: by 2002:a05:6000:310f:b0:3e7:458e:f69 with SMTP id ffacd0b85a97d-405cc9ed0eamr3148550f8f.56.1758637427334;
        Tue, 23 Sep 2025 07:23:47 -0700 (PDT)
Received: from [127.0.1.1] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad1b0sm278986535e9.21.2025.09.23.07.23.46
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:23:47 -0700 (PDT)
From: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
Date: Tue, 23 Sep 2025 15:23:43 +0100
Subject: [PATCH PREVIEW RFC 6/6] dt-bindings: bootcache: Add bindings for
 bootcache backend
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-bootcache-v1-6-4f86fdc38b4e@thegoodpenguin.co.uk>
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
In-Reply-To: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
To: linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758637422; l=3307;
 i=acampanella@thegoodpenguin.co.uk; s=20250829; h=from:subject:message-id;
 bh=220B4D8vbi4Lk9EO6IMNxgnidFDBlD88/7DcwNhf5Go=;
 b=1FEhiOh1eKVot0Gq+T8p3AmKSpLRFRnRgH7cEN/rKAscJBfzYXUHEJt0WSUUz1DCIMZHuhgHE
 qn9U2bepmNjB3kt/rlpfBamEtoWQS3mKRFIv3WWZ+sWn7sWk596v1WQ
X-Developer-Key: i=acampanella@thegoodpenguin.co.uk; a=ed25519;
 pk=qruBFipuvuZJTNm9XzFhMz42Q9F+xwyW1On3NgZHwzg=

From: Marc Kelly <mkelly@thegoodpenguin.co.uk>

Add device tree bindings for the bootcache_backend_memory.

Signed-off-by: Marc Kelly <mkelly@thegoodpenguin.co.uk>
---
 .../bootcache/linux,bootcache-backend-memory.yaml  | 67 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/bootcache/linux,bootcache-backend-memory.yaml b/Documentation/devicetree/bindings/bootcache/linux,bootcache-backend-memory.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cf46bf4c513e263f67cdf2323349fa16837c8d22
--- /dev/null
+++ b/Documentation/devicetree/bindings/bootcache/linux,bootcache-backend-memory.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bootcache/linux,bootcache-backend-memory.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bootcache Framework reserved memory backend
+
+maintainers:
+  - Marc Kelly <mkelly@thegoodpenguin.co.uk>
+  - Andrea Campenella <acampenella@thegoodpenguin.co.uk>
+
+description:
+  This bootcache backend adds support for using reserved memory
+  for the storage location for bootcache data. On initialization this
+  memory is read and any bootcache entries found are added to the
+  bootcache framework.
+  Data is inserted into these memory locations via the bootloader
+  or other means before the kernel boots.
+
+properties:
+  compatible:
+    enum:
+      - linux,backend-backend-memory
+
+  reg:
+    maxItems: 2
+
+  memory-region:
+    maxItems: 1
+    description:
+      Contains the bootcache reserved memory.
+      Data format is a binary block of packed cache data consisting
+      of a selection of key and value pairs, along with size indicators.
+      The format should be considered private to the driver and should
+      not be interpreted outside of the drivers context.
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /*
+     * The bootcache-backend is placed in the in the main domain
+     * of the SOC, with the reserved memory location defined as
+     * follows.
+     * This defines 64kBytes in the upper 2GBytes.
+     *
+     * The size
+     * reserved-memory {
+     *     bootcache_reserved: bootcache-reserved@BFFF0000 {
+     *         no-map;
+     *         reg = <0x00 0xBFFF0000 0x00 0x10000>;
+     *         label = "bootcache_backend_memory";
+     *     };
+     * }
+     */
+
+    bootcache-backend@BFFF0000 {
+        compatible = "linux,backend-backend-memory";
+        reg = <0x00 0xBFFF0000 0x00 0x10000>;
+        memory-region = <&bootcache_reserved>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 73679686d49ac653382ecb32b9b3b500a4509383..d547fe2fa77f6fabdd19be3c0a68526d2f6d2d4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4422,6 +4422,7 @@ BOOT CACHE
 M:	Andrea Campanella <acampanella@thegoodpenguin.co.uk>
 M:	Marc Kelly <mkelly@thegoodpenguin.co.uk>
 S:	Maintained
+F:	Documentation/devicetree/bindings/bootcache/linux,bootcache-backend-memory.yaml
 F:	drivers/base/bootcache.c
 F:	drivers/base/bootcache_*
 F:	include/linux/bootcache.h

-- 
2.48.1

