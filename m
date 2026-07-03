Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824A3A0EA5;
	Fri,  3 Jul 2026 15:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091446; cv=pass; b=SZmhLiXH1nJxprqcdNkCm8wVh+9mB/Eaxm+LfX+YlILKiE8+8JB0DeHjz15GRlZxm6cW/aQTf19RxCxJLMzsYHb03kfrtC1hvYhqGIDtGht56dvDm4TpRcQRLrFaBZpdW+yVcYGsPkDBMil80LomT07aqBSiOU34s4Qo7+H56Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091446; c=relaxed/simple;
	bh=G6Pf3mgY1S4W2K39kRAToS1LLVLjwfbB2kluzQSYPfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S3Y1glFR/iAXMxM/tqsa+aQ9da3+lABtRm36s+3PZvgW3ZExsYQqh/emxPjJwFyuPqRTNHhu9YdnIX4arhiPAGA8MCtjABDoV0/BngA8wPtd9jN+HTm3yXztjktXIK9O4CiGBMgWavo57Gy+JW8nVaZDgXbmdLNZrxgGOpNU8KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=HbrTvyFc; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=JgvG2Ci6; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="HbrTvyFc";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="JgvG2Ci6"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-rkp2.prod.antispam.mailspamprotection.com; s=arckey; t=1783091444;
	 b=i2isLNY1nfKvmbF/E3Iuqr4mzSIqnmWFR/3dDfqgcBspDQljfz801byIgDIY6crqLO7kbCCzx4
	  TtqeaTLgVPwEPQKYiIYPkZhW/LQ5y0QBTjytE113oX1POLUTLKhkOBBbNhD2swFSuYXaRE4rYl
	  ek0OlE/MMNB/7W3vgf5hEzMutXe5GBYULymzvwT9HT4MByWKBupbkpdQpQzMJI8RgoTlIkDqMs
	  Aj0ITe81ZjRUM5iN9ucnCxFrb4s7PJYEiJZAV5H0tfC0VbCqO5TZZc6Bu1jx9R5196NR1vKXPG
	  IiUFGjyyAJJODJtZ5GvLeNuhvmN4jJdroYCesrCUvV5c+g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-rkp2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-rkp2.prod.antispam.mailspamprotection.com; s=arckey; t=1783091444;
	bh=G6Pf3mgY1S4W2K39kRAToS1LLVLjwfbB2kluzQSYPfU=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=B2e8JLv4nLVVBkSi2bTA0XSK790iZWMGPGo2S/nHmby2ng0qdC2PREMm9OcNyJs903gB7XFMYy
	  w5ovvS81S6qyTR13J/Pk6Ffra09Efsr+e8Zpy0Q6AVFwHmm8Jpf/dTtxDD7qihPyhWz54LkQ71
	  Au5uI85ogRqDJ3gzY3msbNL1lIhOm/oKvsHvFnRv6lLpB4GJbRO3MqRcM/gKvoiKPV6GOey263
	  KLGLvsHw78tqmpgNUW5hlwuL1OlAAslxrE7H7JjU2GsjLEhF8L8SJ599JAwZz9nkt3T4VDRuus
	  1Admv9+QmviNb1VCiDpJPm7dRF2ikEYMDCqEwoekjWsuLg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=UlTfmGa9qEJ6fhD2naLl7A0zdxE+fu1XrClUZXCpJqY=; b=HbrTvyFcEE3zcbQi1Yu9HJYUNw
	zfR1aF4nv7KU+uFDdpxo1zQW2XRB7TLytQcdK1Hq5OCfxQoUd+G6Ivqj6/B0Stp+OwtSXJF9jO7GZ
	fTz3j1fmlK0zvOpQ0ux3dTBVoell0QGMYyWtX9Svxi5jjM77yvJiC/p2SB9JrEu8eNzo=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-rkp2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1wffXG-00000004Lc7-49wr;
	Fri, 03 Jul 2026 15:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=UlTfmGa9qEJ6fhD2naLl7A0zdxE+fu1XrClUZXCpJqY=; b=JgvG2Ci6ii73IGkkkMTBizzI4N
	lOvOPyMKmNLeRqP7jlWSdIa99L6iy2HYMqNrLsfq/YUv7X3ntDuKP1cX2ie1uyqrCvz9VxFq1kTag
	6Udvtp6wHuPeM9hZOb2dedDNXaQuqf+4YBG7ZmknHHpmQlvDjhYekfrwtaRl1op8wp0k=;
Received: from [87.18.41.29] (port=59642 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1wffXA-00000000Bfh-0tG4;
	Fri, 03 Jul 2026 15:10:28 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 03 Jul 2026 17:10:21 +0200
Subject: [PATCH v2] driver core: add driver name to probe debug print
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-probe_driver-v2-1-b6060559f33b@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNzQqDMBCEX0X23BQTjX+nvkeRYnRTt4jKxoYW8
 d0bLT30MvDBzDcrOGRCB1W0AqMnR9MYQJ0iaPtmvKOgLjCoWGVxpgox82Tw1jF5ZJFYmWKZ6jy
 xGYTJzGjpdeiu9Zfd0zywXXbH3ujJLRO/jz8v995PXf6rvRRS2FYXUuYhjL74ZhiaMy1Qb9v2A
 fyDvB65AAAA
X-Change-ID: 20260628-probe_driver-3f14e94573f6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449; i=francesco@valla.it;
 h=from:subject:message-id; bh=G6Pf3mgY1S4W2K39kRAToS1LLVLjwfbB2kluzQSYPfU=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnuF+7PNp88US/++acdckyLbXZNWSkTveH2e4M7a1rOu
 iywMxXj7ihlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmIn6N4X+9S0Rz9sUZQb/2
 31xy6lHIDmPPyXsKPH8o9fN9jhBIXsvIyHBnxlSd+rmf2W9yFbrsKjl+Ktvq6+MTPlf61RYsUTJ
 +/4cNAA==
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
X-SGantispam-id: 98afb715bf982e37635cc8b472003dbf
X-AntiAbuse: ID - 98afb715bf982e37635cc8b472003dbf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wffXG-00000004Lc7-49wr-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-rkp2.prod.antispam.mailspamprotection.com;
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

Add the driver name alongside the device name, to allow for an immediate
match between the two.

Suggested-by: Tim Bird <tim.bird@sony.com>
Signed-off-by: Francesco Valla <francesco@valla.it>
---
Hello,

this very small patch comes from a discussion started at the end of
2024 after a Boot Time SIG meeting [1]; I decided to reduce the patch
proposed there by Tim to the bare minimum, as this should already be
enough information for a developer to work with.

Thank you!

Regards,
Francesco

[1] https://lore.kernel.org/linux-embedded/MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com/
---
Changes in v2:
- Moved driver name in the existent print instead of introducing a new
  one.
- Link to v1: https://patch.msgid.link/20260629-probe_driver-v1-1-fc58117581b5@valla.it

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/base/dd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223844..f6525a7ee8c5 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -790,8 +790,8 @@ static int really_probe_debug(struct device *dev, const struct device_driver *dr
 	 * CONFIG_DYNAMIC_DEBUG and we want a simple 'initcall_debug' on the
 	 * kernel commandline to print this all the time at the debug level.
 	 */
-	printk(KERN_DEBUG "probe of %s returned %d after %lld usecs\n",
-		 dev_name(dev), ret, ktime_us_delta(rettime, calltime));
+	printk(KERN_DEBUG "probe of %s with driver %s returned %d after %lld usecs\n",
+	       dev_name(dev), drv->name, ret, ktime_us_delta(rettime, calltime));
 	return ret;
 }
 

---
base-commit: d2c9a99135da931377240942d44f3dea104cedb8
change-id: 20260628-probe_driver-3f14e94573f6

Best regards,
--  
Francesco Valla <francesco@valla.it>

