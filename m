Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E51B6CE9
	for <linux-embedded@vger.kernel.org>; Sun, 12 Jan 2025 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689202; cv=pass; b=rrBRrc0xyiWWnBIJERgQN1WKGec5FuE4MsgscOwc5TPqKm0GMAJRP63mQ6ycNnyOdSiCMBML1BKevuJbtdZ1phMhqR6J2OHzyo7ZXmBjCX4MmtLEBIDBjsDYLG3dL9w4mx/OzJvAJ0uRYQg7Y6YHcxYqCmQpSmegGLm5Z3Dz3m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689202; c=relaxed/simple;
	bh=NGm2CSEg9yEqQ1MiracOcCtYCumUs3XM8FBSMkALRaU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nKPo1Z2GnFAGylISP2wCzk6Bm2avXKEaGwvocoOrFGLI9CQCl4ElUepw+s218Qy3jzBh87jqFdpQB3zQvJuntaOjAl/rjcVjgya3g0gprEQMHlSVG8d8Wp6Rt1UxJv6D4iLH5X4c9VG9bCT4XsTMmYEpyvtQ8VdvLD1Qa20YV+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=KtufqVPe; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="KtufqVPe"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-4n9n.prod.antispam.mailspamprotection.com; s=arckey; t=1736689200;
	 b=BwHAN8d432bQC51GN7/ZEUQYqH5qgZrZCpoJyqc3aH+dvTGCCoKYA7dSkyS1rIANIE/eId8CeB
	  3+WpEzQYb6oH5UvxFZFcijH5OcWsxP3OZnOyNqc3lxRAoL7yIm8eGubEZN8iUQni1sWTx0ibqe
	  p2IeQhBOloMYD2XgGZPLJkwSv4VWG7WkdaiU+9Ten23deP9Dqc9ZpqxgOwhzakXbB+dCp40X6T
	  x3P1Jdcq4NwyZE+8yLqthU9QA8uqWfhepN0rAdI23pu058sFbHexXl1BhJRgXpzU+17QB7RmDB
	  X6OeTnCtY3s6A4y9rC9gvRHHQCMck191TaO2RgIcgaJT+A==;
ARC-Authentication-Results: i=1; instance-europe-west4-4n9n.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-4n9n.prod.antispam.mailspamprotection.com; s=arckey; t=1736689200;
	bh=NGm2CSEg9yEqQ1MiracOcCtYCumUs3XM8FBSMkALRaU=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:To:From:DKIM-Signature;
	b=NqsDIOk2R8Tdya4l9p+dfFdm74oQ9bFYvH4dQT9bWOMV2JB0ZsMOL/cEjJgEfrdX7KiSjKQAi9
	  Pewsw0bxDDt6PFq6JrBWdXLtFgcjIzO6+wx5V3yUGTSJw/Cb6XFUpY2IChaXeoqP00mTqQZgOw
	  r3eQmMafcHB0rI2SwC70ck8cxh8fEwkbUJJc0TVomOP1ZQuWzYqyWrNIYSsl+Q1Wyt2tHAaKbJ
	  UmCRRnbESVeVT4P4w9+d3vAw1trQqBLN34JOSuTyrFUryIOMckyXEGNmAbepPg3b2TY5WeSOYa
	  seec4wt2pczxnXN3donvag9jv8f5vM0yLrEmS5YbWLvyxg==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4n9n.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tWyBy-00000004aqo-45dl
	for linux-embedded@vger.kernel.org;
	Sun, 12 Jan 2025 13:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=lMnBIG/Ssm98gjyHBPB/eac8IEJMt9IfYu6R3SV9WQQ=; b=KtufqVPelDUTudHcF3JBBfhcFf
	0R7SdXL/SRHOMXuPhvYWPrY6Tre4yxdosDPIMqUIHWnoow1OghTWZv4Tkh150oUFs8l8YLiXITCQL
	Zj+iNt484LZ4us1+q2xVYVHrEdrDnMVirixT6gSvD4k7qzNPtnOihWLVkaVPgKmEvKQs=;
Received: from [87.11.41.26] (port=63424 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tWyBn-00000000LX4-36dW;
	Sun, 12 Jan 2025 13:39:39 +0000
From: Francesco Valla <francesco@valla.it>
To: Rob Landley <rob@landley.net>, "Bird, Tim" <Tim.Bird@sony.com>,
 Marko Hoyer <mhoyer.oss-devel@freenet.de>, Shankari <beingcap11@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: Re: [boot-time]
Date: Sun, 12 Jan 2025 14:39:39 +0100
Message-ID: <2786677.lGaqSPkdTl@fedora.fritz.box>
In-Reply-To: <32c4e5f1-7ba4-40b0-ae7d-a9fe9dd65d6b@freenet.de>
References:
 <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <0947e977-879b-495f-8225-534e38bc034b@landley.net>
 <32c4e5f1-7ba4-40b0-ae7d-a9fe9dd65d6b@freenet.de>
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
X-SGantispam-id: c71bb10274bc85e58aa7c79737220e59
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-4n9n.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Sunday, 12 January 2025 at 11:11:44 Marko Hoyer <mhoyer.oss-devel@freenet.de> wrote:
> 
> Am 12.01.25 um 02:03 schrieb Rob Landley:
> > On 1/11/25 12:57, Bird, Tim wrote:
> >> Hey Rob, This is a great review of /dev, /sys and the different
> >> ways that /dev gets populated.
> >
> > Feel free to link stuff from wikis or some such. The newest of those 
> > documents was written in 2007.
> >
> >> For a lot of embedded Linux devices, the only bus where
> >> new items can show up dynamically is USB.
> 
> SDCARD readers connected via MMC are common in automtove head units as 
> well ...
> 
> 
> >
> > Yup, /sys/bus/usb/devices is in there too and when a driver binds to 
> > them, they wind up in /sys/block and such as well. (you USED to have 
> > to seprately mount a usbfs under /sys but they finally acknowledged 
> > that was silly about 5 years ago, hence 
> > https://askubuntu.com/questions/1218321/if-usbfs-has-been-deprecated-then-why-is-sys-bus-usb-drivers-usbfs-directory-p)
> >
> > When a driver DOESN'T automatically bind to them it gets a bit 
> > complicated, and one of the things mdev can be configured to do is act 
> > as a firmware loader! Which is just... Ahem, there are YEARS of poor 
> > design decisions the kernel guys made, where they ignored a mechanism 
> > they already had an implemented something more complicated. The 
> > mechanism whereby the kernel opens a firmware file and read it 
> > directly out of the filesystem instead of calling a hotplug helper 
> > was... I'm just going to gloss over that.
> 
> WIFI & Bluetooth devices often use this firmware mechanism. And yes I 
> agree, it looks a bit ** ugly** seeing the kernel loading a firmware 
> file from /lib/firmware  searching it in the root file system w/o 
> knowing the state of it during boot ... For WIFI and bluetooth I do not 
> see a big issue here since I'd prevent putting such features on a 
> critical chain by system design in any way since bringing them up and 
> (re)connecting external devices is time consuming by nature. Nothing you 
> shall need to wait for ...
> 

The whole "try to access the rootfs during boot" domain is an area worth
investigating, as it *should* be simple to track the actual init state
and directly skip the accesses that aren't going to succeed. I recently
stumbled for example on the Ethernet PHY core trying to load modules
during init [1], but the firmware loading is another of such examples.


> To summarize from my point of view:
> 
> * It's worth talking a bit about the effect of udev and about alternatives
> 
> * "mdev" is surely worth being named as an potential option besides 
> "selective triggering" and "static setup and moving triggers back in time"
> 
> * I wouldn't regard mknode as an real alternative in todays system
> 

Another approach that in my opinion is worth mentioning is: no udev/mdev at all.
In a couple of embedded products with a very limited scope I simply decided to
use devtmpfs + manual insmod + a simple bash script for USB automounting
registered as hotplug handler. Very few dependencies, no boot time parsing of
configuration files. It took a bit to configure the init sequence, but the
result was/is very satisfying.

> * In addition I can imagine is "modules loading" vs. "compiling in 
> drivers" something which is worth mentioning
> 
> * Once I've access to the wiki, I can try to put these ideas into an 
> initial structure filled up w/ info we discussed in this thread
> 
> Marko
> 
> 
> 

[1] https://lore.kernel.org/netdev/SJ0PR18MB5216A8D227B2B3651DB9AC0DDB152@SJ0PR18MB5216.namprd18.prod.outlook.com/T/

---

Regards,
Francesco




