Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241DBA45;
	Mon, 29 Jun 2026 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782770221; cv=pass; b=gWGPbDsa0gbeNIvNxWZPyVMe+mTazSZOgqvlpPpg8rGFB1+z7Ex8DYwJMAxFKkZ6SeqELQ/Qs2URNB7t0kdfho9Si6YVubfR80ecZx+2fn/BgsPGVHPaR3v0w0dtmrur7W5P3T8HCRYWabfdVtny9wgPLJGRzTx+5vX5o8AKkDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782770221; c=relaxed/simple;
	bh=qtnaHBPGPDOJwFsboPE+NQ3zOJ3KprdbQXKhemfaVVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G7sk8PMW8R2m98xNHeki9Y6zYl+si1iHV2qK2SJc808V/7lJNgyc83EIYPHTeE3M6zlQdf4iwFitpn+VvVE72ZxzY6AwEZtpW9yXYf8hyNRSOUXcfPGuLNrM2hRD+ugh1/fWmYdPIt0wAM5hfV+jJKmghYJNexADUYwUhbZbUVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=QH5jmB0M; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=AkUH6VO7; arc=pass smtp.client-ip=185.56.87.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="QH5jmB0M";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="AkUH6VO7"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-n44s.prod.antispam.mailspamprotection.com; s=arckey; t=1782770219;
	 b=bxo7MN7l4U9rrkFdALiRYt+FVOWGGvvVOl95tioBMQTS+3v/qyaBqsvKBtcB7Ao5PbEkg2fXyl
	  hh1NOu00iag817mCwB5uUGQM1Qf8v8jSHrW07pK/0+F1mI7Dk+JzMhqPE4+m/zKQwam9VpV+8e
	  /QtuyS22wjw/phCGPt42IACANlYB/C6rv9JiX43ID6VgIcEeWTJoVZpS0J8/s3CMDbWyzM2LOA
	  L1n/Hxe9bHjC9QaF0A3kmDDT/g0NfT/80YmPduJ3l4ouuPWiQV8mPXLiCFPvc+1eCB4IWI/l6T
	  rGM5cK1FtC2F7qMEZkrVMQjums1B8Nh7+l8pSTMt/7mQVQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-n44s.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-n44s.prod.antispam.mailspamprotection.com; s=arckey; t=1782770219;
	bh=qtnaHBPGPDOJwFsboPE+NQ3zOJ3KprdbQXKhemfaVVg=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=svxb1qzTYGQXy3GPpURh1FnB5R/Qm3farM6sWxxo7h9xKE3da/26zscdSYyxUvcP9oesB0GOWS
	  GXLiOhESFbn547F1BQn1OkxouWs3UYQK1Va2lJg/jyfHWnxFuqs/E72KCabiG2KUZTb1pkiJJZ
	  wtJCQDG/8WJR8PYZt+orJe5l+nz/dTgzlDK+MEoTtjqg1owLe0jY7HwceSs4JtbJcqgxxhM9C5
	  UZe7l7To6NEtCpPi7jPd8IZmVPJWanHmKRBrRdAYQmwbowt737gi0Jpfx3GfilI7c2r8+MMiBT
	  SwVTFEaLPRukVNXciKQn1P7koH6OQjegQeoMKgv3E9yOyA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=s6djsBb/23trtHIWrDZW4lrcPuWsGtUEMlycMJEVwEk=; b=QH5jmB0MwVQuth1majqMxYZAOl
	+aqSvjfq5AEclSW+yDlqyZwUeiGhWPaUAKVMQAR4edoGUXD0ORvBhfvtBr1nHflsO/YBrY2mQ0hLb
	3M5HINLLzJ+xn1kRuhBIPLw6dcTTVrGSRmjfUXYP/vh/TsEE5eWwb1fmvvmGiZoeWMa4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-n44s.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1weJt3-00000006ym1-05hI;
	Mon, 29 Jun 2026 21:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=s6djsBb/23trtHIWrDZW4lrcPuWsGtUEMlycMJEVwEk=; b=AkUH6VO78JDod/x2Mmy2JLNr9O
	SvvtlWLeQGgbyzyUhsbX1gtOKOAUQLqiQQsBhlw1M6bqH2U10tdHE5O+G2a3qx+j8KER2B6a4/fZA
	LhnlmDuYOjsa9LdIiW5IFQP3SbRyjMlUts3db/NECXFrMRemBp5+oge1MvS2zgT5LfpQ=;
Received: from [87.14.44.248] (port=60818 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1weJst-000000004eB-3wAr;
	Mon, 29 Jun 2026 21:51:19 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 29 Jun 2026 23:51:18 +0200
Subject: [PATCH] driver core: add driver name to probe debug print
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-probe_driver-v1-1-fc58117581b5@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyML3YKi/KTU+JSizLLUIl3jNEOTVEsTU3PjNDMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAQ+D3mnAAAAA=
X-Change-ID: 20260628-probe_driver-3f14e94573f6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348; i=francesco@valla.it;
 h=from:subject:message-id; bh=qtnaHBPGPDOJwFsboPE+NQ3zOJ3KprdbQXKhemfaVVg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFlOL64bxr7seZ/X9OyNj1KGwQcRizkdL2a4f2bULku9V
 /XYJp2no5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZhI4GWG/47eFm9Zg7pXGF8/
 fKM61r9ke6Ta7HMHlQ74uKXfapk69R8jw5voGFXB2A9pTlMnm1lP5Mw7rSX5bav41Nxyfd5bYpd
 38wAA
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
X-SGantispam-id: e33acd543fbe70b1aaf5b0d6a54e343b
X-AntiAbuse: ID - e33acd543fbe70b1aaf5b0d6a54e343b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1weJt3-00000006ym1-05hI-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-n44s.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The initcall_debug command line option is a useful tool while debugging
and optimizing the initialization of a new system, mainly because it
allows to see probe failures and deferrals without recompiling the
kernel (e.g., with CONFIG_DEBUG_DRIVER). However, matching a device
with the driver it is being probed with can become difficult, since
some devices use names that are not explicit, at least at a first sight
(e.g.: '1-0:1.0' or '1-0060').

Add an additional debug print to inform the user which driver is being
used for a device, allowing for a quick match. The print is inserted in
the same really_probe_debug() wrapper that is already used to report
the result of the probe, and is thus not affecting executions not using
the initcall_debug option.

Suggested-by: Tim Bird <tim.bird@sony.com>
Signed-off-by: Francesco Valla <francesco@valla.it>
---
Hello,

this very small patch comes from a discussion started at the end of
2024 after a Boot Time SIG meeting [1]; I decided to reduce the patch
proposed there by Tim to the bare minimum, as this should already be
enough information for a developer to work with.

I was unsure on whether to add information to the existing print or
introduce a new one; while IMO technically worse, I opted for this
second solution, since the existing print *might* be viewed as
userspace-facing ABI. I'll be happy to do otherwise if there is
consensus.

Thank you!

Regards,
Francesco

[1] https://lore.kernel.org/linux-embedded/MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com/
---
 drivers/base/dd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223844..3c0930020050 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -782,6 +782,9 @@ static int really_probe_debug(struct device *dev, const struct device_driver *dr
 	ktime_t calltime, rettime;
 	int ret;
 
+	/* Don't change this to pr_debug() - see comment below. */
+	printk(KERN_DEBUG "probing %s with driver %s\n", dev_name(dev), drv->name);
+
 	calltime = ktime_get();
 	ret = really_probe(dev, drv);
 	rettime = ktime_get();

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260628-probe_driver-3f14e94573f6

Best regards,
--  
Francesco Valla <francesco@valla.it>

