Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6741F2C36
	for <linux-embedded@vger.kernel.org>; Sat, 21 Dec 2024 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734792495; cv=pass; b=ssgnikjFD7SAtlbhc5hgHthn7wtgjm1cMC7KmG1Ph895c1Qlt0DdXluQp5oVnOzWehO22iNY1MRZemuzQC/LjmIixyE3uerOqidJqhS0GaDaZw1NUCQInnFJSSa7TJyjpVfx/47gpFwiaE76bK4/HHvT35BoH0xMWmjWphbbzzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734792495; c=relaxed/simple;
	bh=vsiFGQWxhvSIn1r0HXQZoYs4HMPiW+OKS4gHNopV0n0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dcd5UlKrC4709Bf9n5ORqM2VNooCI6M7Nmg5cKfh4q2mLxszuACn+DLYsQRZUGVvkI6jvBe95c1CBhatf/l8fcPpY0usKgw65InopSehnpo0Ncbqz728fwKEOPiIAcxiBkXcOWd0KVe0H36d8z6MhUREBKZTzINXKlqp0zIRllc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=ac0bq+rp; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="ac0bq+rp"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-qd5w.prod.antispam.mailspamprotection.com; s=arckey; t=1734792492;
	 b=P6RS2sx4aFYomFapr/IJjPYnDQFNHFV8XhAQVmQEG+cdPEMDxGtzansan+nInCnJ77iNCByRH7
	  hgY7rAFM1TvRAuZhP+zrb4o3WkzHn9EDzPb7SpyFnG65TmWTHkkx0qGDas2GXyC0W8NyU5jxhE
	  K77Ak4IVDOtcgl02cbGGTA8QTinNtQQzHXHqh9JT0/IK3frqEEdw8/DVsXPtcGbuZtZ42hLPTo
	  xr3cATSH44jXJMHvd4kXQDyMcEirN1/I3Kv1INykQ0wO7m84QJtNPief8sKqKitnb0aFSA8Kpq
	  4HD8ba+IRQFl/vkVXrBaZzKWzIqH4O7AvHhN0eV6977xDg==;
ARC-Authentication-Results: i=1; instance-europe-west4-qd5w.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-qd5w.prod.antispam.mailspamprotection.com; s=arckey; t=1734792492;
	bh=vsiFGQWxhvSIn1r0HXQZoYs4HMPiW+OKS4gHNopV0n0=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:To:From:DKIM-Signature;
	b=dWyCuxb3OrEtv4mAIWB+rAVX8u0TxZmYNeMahX0eRVTP5eJsK5pRgH4lzLVyuvtQipsHqvRx1+
	  4DkX6dDlab36rDKkOU5c/UEjAbV+i2XZ3UzYtRi39rjIxqcYwPKTdi43j7Ibn3tCYVEim7vh3W
	  TLw8oBHr12TCK32ea8Unh4MqAIxYQZKbeJvtbEUyTKhI/0BP/yhToZ3pVnCl3IhxJmWQzE1T5n
	  vMMUacJqGD3l/bN47l2eiDaHVT213GpWZR5uj6/CGAfYRe364pfwMKLz4EQ8U9X2X0jhSSCSoK
	  MhifSemH9Ad4LkK3HToMM/wD90L7xvIkxTl5n7X+ZWdkew==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qd5w.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tP0lu-00000008PXz-1jWp
	for linux-embedded@vger.kernel.org;
	Sat, 21 Dec 2024 14:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=mbR27qAVcB4mbEfIr7l/Lt/ZqT+nLtoZtz3l1IhpSI8=; b=ac0bq+rpOQg6G0Zi4seLkHJeZU
	92nLJsl3vVffc05TTQquZLJj0P93Fj1ZRD8XgfzO/pOqLGyzrp4o9gPSvzoE7ZfWg2Yil9k/Dx5hw
	n3k1XwzstXitfW1ca2WQVo26f7XVwRMqbeZFFY6zkvw3kgE2rS2+idbDLupcqdbLjB/Y=;
Received: from [80.181.39.139] (port=64314 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tP0lp-00000000MLs-0XCq;
	Sat, 21 Dec 2024 14:47:57 +0000
From: Francesco Valla <francesco@valla.it>
To: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject: Re: [RFC PATCH] boot-time: instrument probes more
Date: Sat, 21 Dec 2024 15:47:54 +0100
Message-ID: <26696081.1r3eYUQgxm@fedora>
In-Reply-To:
 <MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box> <2281836.vFx2qVVIhK@fedora>
 <MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: db394cb2b3614ad57f8ca017c4034145
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-qd5w.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

On Monday, 9 December 2024 at 04:10:04 Bird, Tim <Tim.Bird@sony.com> wrote:
> ----
> Below is the patch that adds the extra instrumentation.  My quick question is, does this look useful?
> Can it be used to find the more problematic (ie long-duration) probe functions or drivers initializations?
> 

Yes, it looks useful to me. While an experienced developer _might_ be able to match
device names and drivers at a quick glance, that's not the case for everyone, in
particular on certain SoCs which are modelled at devicetree level with an exceptionally
high number of "generic" device nodes.

> ----
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 0c3725c3eefa..5e19079b0a2b 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -28,6 +28,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/pinctrl/devinfo.h>
>  #include <linux/slab.h>
> +#include <linux/kallsyms.h>
>  
>  #include "base.h"
>  #include "power/power.h"
> @@ -732,8 +733,16 @@ static int really_probe(struct device *dev, struct device_driver *drv)
>  static int really_probe_debug(struct device *dev, struct device_driver *drv)
>  {
>  	ktime_t calltime, rettime;
> +	char fn_name[KSYM_SYMBOL_LEN];
> +	unsigned long addr = 0;
>  	int ret;
>  
> +	if (dev->bus->probe)
> +		addr = (unsigned long)dev->bus->probe;
> +	else if (drv->probe)
> +		addr = (unsigned long)drv->probe;
> +	sprint_symbol_no_offset(fn_name, addr);
> +
>  	calltime = ktime_get();
>  	ret = really_probe(dev, drv);
>  	rettime = ktime_get();
> @@ -742,8 +751,8 @@ static int really_probe_debug(struct device *dev, struct device_driver *drv)
>  	 * CONFIG_DYNAMIC_DEBUG and we want a simple 'initcall_debug' on the
>  	 * kernel commandline to print this all the time at the debug level.
>  	 */
> -	printk(KERN_DEBUG "probe of %s returned %d after %lld usecs\n",
> -		 dev_name(dev), ret, ktime_us_delta(rettime, calltime));
> +	printk(KERN_DEBUG "probe %s in driver %s for device %s returned %d after %lld usecs\n",
> +		 fn_name, drv->name, dev_name(dev), ret, ktime_us_delta(rettime, calltime));
>  	return ret;
>  }
>  
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 76bfcba25003..ae15969c483a 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -32,6 +32,7 @@
>  #include <linux/types.h>
>  #include <linux/iommu.h>
>  #include <linux/dma-map-ops.h>
> +#include <linux/kallsyms.h>
>  
>  #include "base.h"
>  #include "power/power.h"
> @@ -1381,6 +1382,9 @@ static int platform_probe(struct device *_dev)
>  	struct platform_driver *drv = to_platform_driver(_dev->driver);
>  	struct platform_device *dev = to_platform_device(_dev);
>  	int ret;
> +	char fn_name[KSYM_SYMBOL_LEN];
> +	unsigned long addr = 0;
> +
>  
>  	/*
>  	 * A driver registered using platform_driver_probe() cannot be bound
> @@ -1401,6 +1405,13 @@ static int platform_probe(struct device *_dev)
>  		goto out;
>  
>  	if (drv->probe) {
> +		if (initcall_debug) {
> +			addr = (unsigned long)drv->probe;
> +			sprint_symbol_no_offset(fn_name, addr);
> +
> +			printk(KERN_DEBUG "platform probe %s is being called\n", fn_name);
> +		}
> +
>  		ret = drv->probe(dev);
>  		if (ret)
>  			dev_pm_domain_detach(_dev, true);

Does this really belong here? Why not add a print inside really_probe_debug(), just
before the call to really_probe()? That approach would catch all probe types (not just
platform_probe) while containing the initcall_debug instrumentation inside dd.c

Regards,
Francesco



