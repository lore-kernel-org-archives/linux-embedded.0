Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0E33C9
	for <linux-embedded@vger.kernel.org>; Mon, 30 Dec 2024 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735597368; cv=pass; b=ERU6tHR64shOG4v/Jt2GFOcSS0AiIEY1d/Wsele0APut1c1pQpNSL0qEtfxs/liGkRbuOZQR7cuN/a68mn5a920foS5a6r9dJWHji+pakkJEM2VjtTR1OyGwXY/VjRlxc408n8ZMaeKp34ZyMQAbpdhN1PBzk4GLy1iubIlS4eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735597368; c=relaxed/simple;
	bh=rDVgBlRJxpMLRUvBPfYzPITiZeWQ7R/1CtPxAQmXJkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDEgly/zcqn3y7CaTpr/UadFxKRt4k6U9QV9xcODlB+hhNSrL77PU9k5NXSNdWItoP+V9fJqbH1GqabAoHd8kBE5aD/Mt0kQtEWcUpScdMz9A39vNPUMzHhtSuV4DVdIh9cpNdLYars0elnXEGy/n4ppu67g2+nWpw1A7c+8JmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=p4aAvK8r; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="p4aAvK8r"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-qrbd.prod.antispam.mailspamprotection.com; s=arckey; t=1735597365;
	 b=eEneXtM6q1pTGeBkwNWPNy3FOs9cWUC5JMnNEPxhgEjRWIDTekmOOaNUn5wd/RvceM/tqPAGTk
	  grBe+uN1Nr8YaLt3kQiw2L3E/0mwAvISYOqNsnAf+/56BjWHJf2UeoIHL+JOOM28tOJ9oDEdcV
	  qx7rYPbxvwknyQVW2GnzJh1c3eoOF77zlhnrG4D1ezfEa+LDs4WPP/HlFwlbyeoDz2sj2u1yXr
	  YzpjPMsai4N+DPH8DcJcV1y4mGKBamQV55jZ+TSMOCfu/NUmTQIjeayq6rog0fHsXgEX1A+X8e
	  fZ1hOrPndtjdAGFwk13AKq2IjGpc1S6/dbDYtiS59XmbYQ==;
ARC-Authentication-Results: i=1; instance-europe-west4-qrbd.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-qrbd.prod.antispam.mailspamprotection.com; s=arckey; t=1735597365;
	bh=rDVgBlRJxpMLRUvBPfYzPITiZeWQ7R/1CtPxAQmXJkA=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=mWOp8JDAZAJW32aSbH7sqIlehdVcC8ow7dDXOda+0fpxxHjEQXKU5X8wY6xxrRh7eRa8dnSxoU
	  Md0+aVpvxFeOFE0Iae+Ea6PU/CeeJ0e1KvEVugpyt0mfhWZCH0dnCslcWEkCr7wiRzvU/qfSFl
	  g1DafhyRIWv8ITEW8en9/NnDiih8tFr3Ah5ZcVeUlgbjZ6tWyUCioy9iB0a+VEDLd6SVbcdhov
	  qPa+N2S0wJDV6M3zjjqrs9sVaIy6NNp4Pc8ic6lHz4hetdG2NuPiwt/hCfzYeIfbU7wrmNEibf
	  MNQ8Lp3wD1LUc+Z7iJtKZD5n7Ixvb4SxDQFbqDGnKUu7RA==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qrbd.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tSO9g-0000000FX3F-337j
	for linux-embedded@vger.kernel.org;
	Mon, 30 Dec 2024 22:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=dQUhMQ5u86m1Q/tFfDOSZPJXnB0SOKLjNGD2uYXz9G0=; b=p4aAvK8rNpYCE9r5UwskHnUUgv
	uAgPdd8+iyeoeq7qbHPY9iMmLR+r1YcOy21d53RjHfibZNdhZkL25TDUd7oo9R4qMfcA+w4AjPt4Y
	WlhI0lSN+psRvIUWaUR/KOwZCycMQFTZ+CMu7aDYP/G6jAffvZmf37segBkzN5ORcGlQ=;
Received: from [87.11.41.26] (port=61146 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tSO9b-00000000GAz-3NAL;
	Mon, 30 Dec 2024 22:22:27 +0000
From: Francesco Valla <francesco@valla.it>
To: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Cc: "smueller@chronox.de" <smueller@chronox.de>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Mon, 30 Dec 2024 23:22:27 +0100
Message-ID: <27104545.1r3eYUQgxm@fedora.fritz.box>
In-Reply-To:
 <MW5PR13MB5632D5A1AE2D16F53FA2391FFD362@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box>
 <MW5PR13MB5632D5A1AE2D16F53FA2391FFD362@MW5PR13MB5632.namprd13.prod.outlook.com>
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
X-SGantispam-id: e3dd87867647bbab02ddbb2c5d838278
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-qrbd.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tuesday, 3 December 2024 at 22:24:28 Bird, Tim <Tim.Bird@sony.com> wrote:
> > -----Original Message-----
> > From: Francesco Valla <francesco@valla.it>
> > Dear fellow boot time optimizers,
> > 
> > following the first boot time SIG meeting, which I lurked with much pleasure
> > (but didn't participate to, as I was a bit in awe among such authorities), I'd
> > like to introduce myself with code rather than a presentation or resume.
> > 
> > Here is a python script which can analyze a dmesg output with initcall_debug
> > option enabled and extract some useful information. It can for example be used
> > to analyze the output of the grab-boot-data.sh tool that Tim presented on this
> > list [1] just a few days ago.
> > 
> > Usage is very simple, as the output of dmesg can be piped directly to it:
> > 
> >     dmesg | analyze-initcall-debug.py
> > 
> > If no option is specified, it outputs a brief summary, like the following one
> > (obtained on my Beagleplay):
> > 
> > 1758 drivers has been initialized, of which 1758 before userspace
> > 119 probes happened outside of the init of their driver
> > 0 deferred probes pending
> > ---
> > Top 10 init/probes durations:
> >  * 30200000.dss -> 523002us
> >  * deferred_probe_initcall -> 487483us
> >  * fd00000.gpu -> 162859us
> >  * 8000f00.mdio -> 142521us
> >  * 44043000.system-controller -> 71390us
> >  * 2-004c -> 71178us
> >  * 40900000.crypto -> 59350us
> >  * 8000000.ethernet -> 58419us
> >  * 44043000.system-controller:clock-controller -> 56599us
> >  * jent_mod_init -> 52140us
> 
> This is odd.  On my beagleplay board, jent_mod_init only took 32326us.
> (see https://birdcloud.org/boot-time-files/boot-data-timslab-bp1-241203-134136.txt)
> 
> I'm assuming that we have similar hardware, but possibly different configs,
> kernel cmdlines or kernel versions.  I'll take a look at this and see if I can
> figure out what the difference is between our systems, that causes the
> difference in the duration for this function.
> 
> This initcall (jent_mod_init) is on my list of initcalls to research to see if they
> can be improved or deferred.  I haven't seen any degradation in system
> behavior by deferring this initcall on my system, but that could be from
> lack of my system doing some related operation that needs the RNG data, or my
> own ignorance of the effects of this call.
> 
> Can someone comment on what items or operations might depend on jent_mod_init
> in early boot?  In particular, would we expect any cryptographic problems if
> the initcall was deferred to a few seconds after booting?
> 
> It can be configured as a module, which makes me think that maybe loading
> it sometime in very late boot (or even later) is OK.
> 
> jent_mod_init is defined in crypto/jitterentropy-kcapi.c, and controlled by 
> CONFIG_CRYPTO_JITTERENTROPY (See crypto/Kconfig)
> 
> It appears to do some random number generator seeding by measuring
> the jitter of a compressiong operation in the kernel. I assume some of the cryptography
> configs affect the duration of the operations.  The initcall duration results on
> my beagleplay seem to be relatively consistent (in the 32ms range consistently),
> and from bobs_lab, on machine sam1, the duration range is also consistent
> (at between 4800 and 5200 usecs).
> 
> I'd be interested to see if the range is consistent between runs on other machines
> 
> Francesco - Can you submit another boot-data file (or 2 or 3) for francsecoslab-beagleplay, to
> provide some data on this?
> 

I actually lost this request and only found it this morning when reviewing past
emails. My apologies.

Anyway: I just uploaded another boot-data file (of a kernel with some
optimizations), but can confirm that the time spent inside jent_mod_init across
multiple runs appears consistent - or should I say fixed? - at 52ms.

Francesco




