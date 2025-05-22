Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBDE13AD1C
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 00:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959898; cv=pass; b=tiDIa2suWKT+GahotTa/Ju4izi9QA6S76JDaD7s9FBxCq9BXnBMoiOYkhfm0WCmBk42X0uiKpHX7rGXO0vaBntUv4fYuF8xw5irAfdm4ukmdhjZiU4LK9QsC1Tz5kiAZN2/6CRXNpMbSlqnDc01nHOnm0fRl/DDtc0Et3E8BFu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959898; c=relaxed/simple;
	bh=HDsvgCAL9L30ksM/v8bCRw2EvJoow8FwWLkGGJdCbbs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cLviWhYVRpjtsHVZ2WpCIwRaHCs6WExSQh4MCzhr75BT7e/iLe3bByuw1mqRVIrb+UZTyJyE/vP4ZPQLPNmVJArVAB9/29ZbEQ6cwBe2EsKCz01JDwQGb47RJesDkPKYKOv9XY6qdp4UJnbcX5zRzu95zqDoBIAlBQX2ScuaTMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=ljFZjGlB; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="ljFZjGlB"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-bq1l.prod.antispam.mailspamprotection.com; s=arckey; t=1747959895;
	 b=mYUMZvepSHKs9VmIIUaXJUrPi3uWCjWFudHmlp0pTmHXR362zGQ7cPm4E/Scaa4a7/HpjsIc1O
	  MJsb+Ko1MWYCpNM6UdnQC44EH/Cu4fUNbdNyHyAXIrth5xjHwwqaBJiJCe593so34TOydY/Grp
	  oKX/40ho8V8P1rNSjenf+9pvOP6b+A4sXgyFFxKWT3fB+pkK2dm7JNboSaYfmBkOL0oAEjMu7T
	  mqb9CPqy020wRJkzp1d849hz+v97YXZxUSgbCIS5+Du6+MEZ/nRYjXfhSsx3Oe5B6B0jqub/IC
	  kHTiZFqwUf3iuH1wE/PJ4EvU9FvH60pTQeXFrfS4nVXuiw==;
ARC-Authentication-Results: i=1; instance-europe-west4-bq1l.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-bq1l.prod.antispam.mailspamprotection.com; s=arckey; t=1747959895;
	bh=HDsvgCAL9L30ksM/v8bCRw2EvJoow8FwWLkGGJdCbbs=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	  DKIM-Signature;
	b=cM2DB8/wJLKWdPyAb3C+yudDAu/BPzvqf/a4vmLulmo1J0++/5pFa0YKP8IjccMRkO8k1w15jo
	  T3hq+adVjf8rHRiP3wodlf8BI16YMWxqwqC4ThUB0aPQTqUPqL6rHDvv3waKZ+SE+mO2wxXFDm
	  f00Kq31JoiTQeE5A5lP8aYxK7nLqOla6uSLcI8Jp6cCG0eKvxdqRCfj8ObdLYYSRqSrUFSF9yF
	  +EyVAaLPzasXA+japveeND5qhYflVlnxU+jlFDhKazcaUZ4XTQyKpwE75g3FohbjPFpZjGEd6t
	  ybCXu7Y1GNXSgkXEoq1azh3eHbF66iIc9mZQ/5abXesgAw==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-bq1l.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIEdD-00000002kFj-1xBy
	for linux-embedded@vger.kernel.org;
	Thu, 22 May 2025 22:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=jhIt3L/nHG92nir7SomFcH4h9DFyVlqJE99GxjYFmhI=; b=ljFZjGlB9/iWH1kPQk2jA9yz2B
	6nzwnAUWggjXvLeoFEzaVj4ynitB8fUeJzOAUfXchX7usZni8c97bH8IX41BkK3cTTsZ8ZwFJBHOU
	s4grSM/5cIwJuFTjuyGOtfJk+wVBz8A3FRWE4Snf1coLFdPuPTrJ7EhUVnU9oUENYkXw=;
Received: from [80.182.118.140] (port=63630 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIEd7-000000000KG-15kN
	for linux-embedded@vger.kernel.org;
	Thu, 22 May 2025 22:43:13 +0000
From: Francesco Valla <francesco@valla.it>
To: linux-embedded@vger.kernel.org
Subject: [RFC PATCH 0/1] Add driver for bootstage stash
Date: Fri, 23 May 2025 00:42:23 +0200
Message-ID: <20250522224223.358881-2-francesco@valla.it>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: faf4e3c967e6b45557e18d3eb2ddb5db
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-bq1l.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

after the discussion on the "Unified Boot Log" topic during the latest
Boot Time SIG special meeting [1], I tried to mock up a driver that
reads a bootstage stash saved by the U-Boot bootloader in a given memory
area and exposes the data in a user- and machine- friendly through both
sysfs and debugfs attributes. Details on the interfaces, as well as
example output for the debugfs interfaces, can be found on the
documentation that is part of the patchset.

To use this driver, a memory area shall be reserved inside the Linux
kernel devicetree as follows (possibly changing the address and the size
of the memory area):

    bootstage@a4300000 {
        compatible = "bootstage";
        reg = <0 0xa4300000 0 0x1000>;
        no-map;
    };

At U-Boot side, following configuration shall then be set:

    CONFIG_BOOTSTAGE=y
    CONFIG_BOOTSTAGE_STASH_ADDR=0xa4300000
    CONFIG_BOOTSTAGE_STASH_SIZE=0x1000

Once booted, the bootstage data can will be found at:

    - /sys/devices/platform/a4300000.bootstage/
    - /sys/kernel/debug/bootstage/a4300000.bootstage/

The device name is purposely part of the sysfs and debugfs paths to
support multiple bootstage areas, as this _might_ then be used for
multiple bootstage sources, e.g. bootloaders running on different
cores inside a SoC with different architectures.

Note that this is not really meant to be integrated as-is, not only
because it's a single patch including code, documentation and devicetree
bindings, but also because the bootstage stash format itself may need to
be touched up a bit. In particular, fixed data type should probably be
evaluated for the bootstage record, in order to increase compatibility
with different data sources.


Comments are of course welcome.

Regards,

Francesco

[1] https://lore.kernel.org/linux-embedded/MW5PR13MB5632B8FA3279D77F2F9217BBFD9CA@MW5PR13MB5632.namprd13.prod.outlook.com/

Francesco Valla (1):
  drivers: misc: add driver for bootstage stash

 .../bindings/reserved-memory/bootstage.yaml   |  44 +++
 Documentation/misc-devices/bootstage.rst      |  53 ++++
 Documentation/misc-devices/index.rst          |   1 +
 MAINTAINERS                                   |   7 +
 drivers/misc/Kconfig                          |  10 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/bootstage.c                      | 292 ++++++++++++++++++
 drivers/of/platform.c                         |   1 +
 8 files changed, 409 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/bootstage.yaml
 create mode 100644 Documentation/misc-devices/bootstage.rst
 create mode 100644 drivers/misc/bootstage.c

-- 
2.49.0

