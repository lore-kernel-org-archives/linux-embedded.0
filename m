Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CDC1E52D
	for <linux-embedded@vger.kernel.org>; Sun, 29 Dec 2024 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735494691; cv=pass; b=orplTF9+bRV1tjoQmvU1VSNZUpqh9aKt2ay2FHdAU+1EM5x78xzHAE+g+Melsq4vimm7JPs4xlmAfbfoVk6agQudrXI2Y1smQaVA30UdUZkGjweaibCtUoECzUEys2/wYiSzY+HQ7rUldmirw37vmy+p4dLzXHMgwgSCL/+iVts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735494691; c=relaxed/simple;
	bh=2NreAB/eXbqMQo5Zl93ew2QjEW0MDrPazvzJDH7Mt1o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dp7EZHk9cgrQ4jWhatiTDUNSP4oXS9j/5gxofstcDNQWJg5qvUGcaMpFd7yIoiFnBWRK5gEfX+B2gABz5AYyTMTtT4aZYNw41ZBPXrNHDD2mLbH31jHo4AACFLkRLvI6RSNC5VSjMiP/KShMJxhcRo+FAA4/FEcv0FN4+C/wBPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=LPmaKPlb; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="LPmaKPlb"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-z826.prod.antispam.mailspamprotection.com; s=arckey; t=1735494689;
	 b=diYccVIHx7SYCnbeGQ4bGVq2DEuXi8eXbUCStzBsGwrBDaaLQyJTtrZJuPul0pnGNdBQzoCLfV
	  yuov2EwKOgiLOTPrEkFekJEJYM7Twvjfub1RLG/BUxGgpegsr22Z/Q0Ki+NfRlNYx/+YskxfsV
	  9WnXtqaN5PQDAWh4Yodkc7j5Aq2UDGbJwCAg93VV/sLVLkesyzzB3eNXfMYFO/1CwfNQ6baFPi
	  9vtPbz1saqCPnYbF47aJQF2qDtM1LeK5zQ5XrB1o/wXzfGIENjv4Tr8TEYHszib2IydENhWxNo
	  2vvy2l+FdLsExp6rkmuzwpBomrhA62hsa2GFw6MG3mCmsg==;
ARC-Authentication-Results: i=1; instance-europe-west4-z826.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-z826.prod.antispam.mailspamprotection.com; s=arckey; t=1735494689;
	bh=2NreAB/eXbqMQo5Zl93ew2QjEW0MDrPazvzJDH7Mt1o=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:To:From:DKIM-Signature;
	b=TgGINUC9MAW+OAinqiHbi+V89uyNvk4eaivfhu13+ra9Vp61L03IL5ia0NOZpEPEvaDeLMnB73
	  RpNdPhOVoZP6DIFkixm1USR4O3n0roN/2drXdM7H2LwppLCUh+vDVZjimRTzZkSmK+8FqAG9Al
	  S3xg9J3Re9s7rVZ/rSWm2CmI+AawtjSndo7vsgWQOlRQIbJeRrl2+GQGDzLR4xMv356cV76PIU
	  Op4F6f3S3ZbkMQ/I4HxZpEDBrMwTZRjTuW3VnksnmM75ZEC0e8r+wJaaVAGMIcF+A7GbVP71bH
	  v4PgA6Bj7sqG/9NkQBLqHPWceAtTpAlteQdMITvMFPxvfw==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-z826.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tRxLh-0000000AvSP-3UFT
	for linux-embedded@vger.kernel.org;
	Sun, 29 Dec 2024 17:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=dhldKMNpBWOWM69Mlt9oAivkrAvXLaCzyJe/bxSh2so=; b=LPmaKPlbqPl17a2FfkXqwxJJ93
	QgWjwTO6SowGAlMgyqiY0vFWI7bv/nL2AwEz9xRb2mHJnDaLCCuB4dEBO0n4OIydkyAxlY8yZqP30
	ljBMhDjnpdpJA0IV8Apd6GjhnVI/cT8etd1PrXGdHfnh+ZOq7UCvmjhIOw01nYykQ3Zg=;
Received: from [87.11.41.26] (port=60132 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tRxLc-00000000ADT-2At0;
	Sun, 29 Dec 2024 17:45:04 +0000
From: Francesco Valla <francesco@valla.it>
To: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject: Re: [RFC PATCH] boot-time: instrument probes more
Date: Sun, 29 Dec 2024 18:45:01 +0100
Message-ID: <2904921.vuYhMxLoTh@fedora.fritz.box>
In-Reply-To: <26696081.1r3eYUQgxm@fedora>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box>
 <MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <26696081.1r3eYUQgxm@fedora>
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
X-SGantispam-id: 3cbd1b33fe898e187abbf9ac1ab25e20
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-z826.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Tim,

On Saturday, 21 December 2024 15:47:54 CET you wrote:
> Hello,
> 
> On Monday, 9 December 2024 at 04:10:04 Bird, Tim <Tim.Bird@sony.com> wrote:
> > ----
> > Below is the patch that adds the extra instrumentation.  My quick question is, does this look useful?
> > Can it be used to find the more problematic (ie long-duration) probe functions or drivers initializations?
> > 
> 
> Yes, it looks useful to me. While an experienced developer _might_ be able to match
> device names and drivers at a quick glance, that's not the case for everyone, in
> particular on certain SoCs which are modelled at devicetree level with an exceptionally
> high number of "generic" device nodes.
> 
> > ----
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 0c3725c3eefa..5e19079b0a2b 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/pinctrl/devinfo.h>
> >  #include <linux/slab.h>
> > +#include <linux/kallsyms.h>
> >  
> >  #include "base.h"
> >  #include "power/power.h"
> > @@ -732,8 +733,16 @@ static int really_probe(struct device *dev, struct device_driver *drv)
> >  static int really_probe_debug(struct device *dev, struct device_driver *drv)
> >  {
> >  	ktime_t calltime, rettime;
> > +	char fn_name[KSYM_SYMBOL_LEN];
> > +	unsigned long addr = 0;
> >  	int ret;
> >  
> > +	if (dev->bus->probe)
> > +		addr = (unsigned long)dev->bus->probe;
> > +	else if (drv->probe)
> > +		addr = (unsigned long)drv->probe;
> > +	sprint_symbol_no_offset(fn_name, addr);
> > +
> >  	calltime = ktime_get();
> >  	ret = really_probe(dev, drv);
> >  	rettime = ktime_get();
> > @@ -742,8 +751,8 @@ static int really_probe_debug(struct device *dev, struct device_driver *drv)
> >  	 * CONFIG_DYNAMIC_DEBUG and we want a simple 'initcall_debug' on the
> >  	 * kernel commandline to print this all the time at the debug level.
> >  	 */
> > -	printk(KERN_DEBUG "probe of %s returned %d after %lld usecs\n",
> > -		 dev_name(dev), ret, ktime_us_delta(rettime, calltime));
> > +	printk(KERN_DEBUG "probe %s in driver %s for device %s returned %d after %lld usecs\n",
> > +		 fn_name, drv->name, dev_name(dev), ret, ktime_us_delta(rettime, calltime));
> >  	return ret;
> >  }
> >  
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 76bfcba25003..ae15969c483a 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/types.h>
> >  #include <linux/iommu.h>
> >  #include <linux/dma-map-ops.h>
> > +#include <linux/kallsyms.h>
> >  
> >  #include "base.h"
> >  #include "power/power.h"
> > @@ -1381,6 +1382,9 @@ static int platform_probe(struct device *_dev)
> >  	struct platform_driver *drv = to_platform_driver(_dev->driver);
> >  	struct platform_device *dev = to_platform_device(_dev);
> >  	int ret;
> > +	char fn_name[KSYM_SYMBOL_LEN];
> > +	unsigned long addr = 0;
> > +
> >  
> >  	/*
> >  	 * A driver registered using platform_driver_probe() cannot be bound
> > @@ -1401,6 +1405,13 @@ static int platform_probe(struct device *_dev)
> >  		goto out;
> >  
> >  	if (drv->probe) {
> > +		if (initcall_debug) {
> > +			addr = (unsigned long)drv->probe;
> > +			sprint_symbol_no_offset(fn_name, addr);
> > +
> > +			printk(KERN_DEBUG "platform probe %s is being called\n", fn_name);
> > +		}
> > +
> >  		ret = drv->probe(dev);
> >  		if (ret)
> >  			dev_pm_domain_detach(_dev, true);
> 
> Does this really belong here? Why not add a print inside really_probe_debug(), just
> before the call to really_probe()? That approach would catch all probe types (not just
> platform_probe) while containing the initcall_debug instrumentation inside dd.c
> 

I had some spare time and I tried to write a patch that maintains the format
of the "return" message (because of backward compatibility) while adding the
details you inserted just before the probe in dd.c.

I then used it on the Beagleplay and I can confirm this helps a lot.

Thank you!


Regards,

Francesco

---
 drivers/base/dd.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f0e4b4aba885..e33ae82064ed 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -28,6 +28,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/slab.h>
+#include <linux/kallsyms.h>
 
 #include "base.h"
 #include "power/power.h"
@@ -732,16 +733,28 @@ static int really_probe(struct device *dev, const struct device_driver *drv)
 static int really_probe_debug(struct device *dev, const struct device_driver *drv)
 {
 	ktime_t calltime, rettime;
+	char fn_name[KSYM_SYMBOL_LEN];
+	unsigned long addr = 0;
 	int ret;
 
-	calltime = ktime_get();
-	ret = really_probe(dev, drv);
-	rettime = ktime_get();
+	if (dev->bus->probe)
+		addr = (unsigned long)dev->bus->probe;
+	else if (drv->probe)
+		addr = (unsigned long)drv->probe;
+	sprint_symbol_no_offset(fn_name, addr);
+
 	/*
-	 * Don't change this to pr_debug() because that requires
+	 * Don't change this or the one below to pr_debug() because that requires
 	 * CONFIG_DYNAMIC_DEBUG and we want a simple 'initcall_debug' on the
 	 * kernel commandline to print this all the time at the debug level.
 	 */
+	printk(KERN_DEBUG "calling probe %s in driver %s for device %s\n",
+	       fn_name, drv->name, dev_name(dev));
+
+	calltime = ktime_get();
+	ret = really_probe(dev, drv);
+	rettime = ktime_get();
+
 	printk(KERN_DEBUG "probe of %s returned %d after %lld usecs\n",
 		 dev_name(dev), ret, ktime_us_delta(rettime, calltime));
 	return ret;
-- 
2.47.1




