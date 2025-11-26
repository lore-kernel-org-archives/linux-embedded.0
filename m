Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3792D4B6D
	for <linux-embedded@vger.kernel.org>; Wed, 26 Nov 2025 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197730; cv=pass; b=X4jHwh0OQj7V1iJGomanfFYPH1FiFMk5arxLPj2/QpK9zo1DDdUyEqEOOjUV/lv/S0SjsGjkZFNFzq7HmLwiM3/0jKFFkV1w1VXSLQHfpfcrnonUaCjKv8vhRSKd2ilShnVk5ST5j7SJR6f/BrRxSKCS5OD+nSRORmzah+yAu/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197730; c=relaxed/simple;
	bh=uOxHFo69B38i2bVBfcP8sXDOss54ZUCWCg9EAr5/Dv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBqyBnPVGDd3nQHrKAmvBNdxn7akCw+7qm/V48ZfYmY6Hs7wBUtVfv7DzAd8zq5W21+5lRmAP+1wB/MhgGNymO6OgAUADVnTE2qjXQFSxiGmdAQQuJUulS6joPVjTOaqebkDiagHVHNbB5BQ/xCV7hp92hVRyCibBwWvk/34F8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=pSgpKAmv; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=qx6MkSWF; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="pSgpKAmv";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="qx6MkSWF"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; s=arckey; t=1764197728;
	 b=nuiifT95MvusSXRs3TQJeSSBoekE5OxJ5d0cVOUJnNuKSo4XiizqalNkFL//5JsrzVtS+eFK5B
	  e9keITV1VOTABb+LoKqzFg5TCnC5xA+vJiikv2s1Vev43F5Wm7dPnG5iwr5GR15tc4fBzfZeZj
	  8y+Ak0uusVhd9+p/7NeK0nuzUP4EpDNBWXlzResWolodxesvIhJ6SGE7aQ8fn57/0lVOauU5Di
	  ViFNgdpfFrM40DM0jStXz+Vxl7kdnAfmL4yHyL6SGY4Ix7qQhIlHW9ZZnziu69uuMeSouCFpAm
	  TRQByemSduGCpAWPOyI60L6uKcsy0qaZj2HpkLoWG9+qsQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com; s=arckey; t=1764197728;
	bh=uOxHFo69B38i2bVBfcP8sXDOss54ZUCWCg9EAr5/Dv0=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=mFKuhL6Y4wtSSZP4uNS5OnuL+DpBjJwDXtbzALeUvxl/9uh3HUR94q+2cuizak5HZUFJfE/uhY
	  5aAtmX9kgoceqAiNW5UcChPd944P8ZwryJby1hx0eCwyxtwuP2FK95g++hv8PhdhhPTlkxfE8X
	  2gw8ySzV4KhOYJMQoIYk3NJQSecc+gg23xgbXzaujgqgVAB+q3kfN7cUtzOHZnnvkBn9wALuzJ
	  WBIv8/7n+7j5acxM7Jb65GGe250ICO+z5yS+hJUrB3OgInT9rmL35+XSxZmqwiQEXOum3+0eha
	  lw5dIhnCgUKQjKsdxTYtIpFfH3PfoJecZlC/J10JiB7RDA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=QkUVfLg/U4PIGSATDzGM+r3b9WGiEi43awBhZIyNEpk=; b=pSgpKAmv5ZgxSozEBuWI1Jhjme
	ok0OOdOkyhKZaFY9FGCVQLTIaU9WKVU8Skr75hIo0CzjPsl1CRW7/6mH8tv+hjgnLqq+f8OsFGgaW
	BjytLgki+C4Tw7l5JUvR89oh/lTfzDdTq6nhu0NoyQtCloJYmQFVZHddCXyyZetq0FqU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ1-0000000DTkW-0dO8
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=QkUVfLg/U4PIGSATDzGM+r3b9WGiEi43awBhZIyNEpk=; b=qx6MkSWF9ObtNPIvuR1AkzTn6X
	nEufOpZ9Lz9uIT7LMnFRHc90q8KGtI3GpVN5zJZPewFamGmvlcY0CZW0RjYnb/jFyOGjcYWKd1nRg
	tXEdvU/4Z6sWj0xd7kknvMAzbAqNthtr5lqSZ56/Nzb5JGsnYblU3CsNwcogWmw75YTE=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPq-000000006mk-0oYm;
	Wed, 26 Nov 2025 22:55:14 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 26 Nov 2025 23:54:29 +0100
Subject: [PATCH DISCUSSION 1/8] of: property: fw_devlink: Add support for
 "mmc-pwrseq"
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-beagleplay-probes-v1-1-c833defd4c9b@valla.it>
References: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
In-Reply-To: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=francesco@valla.it;
 h=from:subject:message-id; bh=uOxHFo69B38i2bVBfcP8sXDOss54ZUCWCg9EAr5/Dv0=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrQE9Xb7CX6YqLLj35uKlzHVVT6pctLY25l/6VpIaf
 8pjYfObjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAil/4y/E95+9nkfPf+vr81
 4ov36BVfq1ES3Pnu7cSVBi7pFwU1TmczMrT2NF9cdWUfr1Wv+IK3d/eGKUX/bZmtYX3xZeHX9YX
 PXfgA
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
X-SGantispam-id: 511782b1898e9bf1e91dad8a5b0e002e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ1-0000000DTkW-0dO8-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4xtm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add support for parsing MMC power sequencing (pwrseq) binding so that
fw_devlink can enforce the dependency.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e3831d7d5ec23c606af31731bfc2f8b8..fcf10c4f02dcf879e1f25e4fa97b25152d58bacb 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1377,6 +1377,7 @@ DEFINE_SIMPLE_PROP(post_init_providers, "post-init-providers", NULL)
 DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller-cells")
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
+DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1524,6 +1525,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_msi_parent, },
 	{ .parse_prop = parse_pses, },
 	{ .parse_prop = parse_power_supplies, },
+	{ .parse_prop = parse_mmc_pwrseq, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },

-- 
2.52.0

