Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241621B0F22
	for <linux-embedded@vger.kernel.org>; Thu,  5 Dec 2024 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733410059; cv=pass; b=iMJcjkh00CaSJzQLe43O/cf/ApbLeofRzkfwPBu6bZnJT8Y1Kse2te4ug4aZBrwzbMP94w9AVbSN2Ly5Rz9TNXABpPn0biNJKEMNDt1CF1SuGY3ppTcIGk5tNRwZdSe8pU9wFhZG62V3BayXIQPqfD7iixC3sDiTO+Ifg6w0/J4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733410059; c=relaxed/simple;
	bh=p10y1Nre8H9JKT8LJQjBm3Cf0WrSAfSvU/wNmc95C5I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7AoCz4NfGljNfVa0aCmpP8oyxiSkJtHEkL+IQ6ymZPbvC1urfeIyIaUAxeJfHIeDz3NDh2jgo+HnjlI1D2GjO30dNBl/Aobs2iAydxQWbl4uQqTzUfKTbkdmm6KgSUfhv3lEWnwI0psbCb+J0pvmv4emjoySyDs8qURAER4nAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=cgWs17y8; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="cgWs17y8"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-zjs6.prod.antispam.mailspamprotection.com; s=arckey; t=1733410056;
	 b=B8CJYV8v+SHbSmqLUcdDO+fy4TxNr+pz+Q5d133vPUdS+LjFswFoEyZfaewHBfDxUvMwSLLSGx
	  TqeAz4TPDJV9zRgNJjC/uALMFwmxwD/cac4tgTCUaNR8bAxKdMOeqZAxgGp3g95RuTt/H2vmsq
	  TKRmU+56zQAgGZP2NNY1yqafNRGFsQz5NTyQxPtCjvvJfomuHkTyzJbrAbqCytjLXmah7Gr324
	  llYHRI8hkFM26iR5IBwWa09pzoKQcc/MSq6mR47jyulaUoG0lcQP83RGSWYE2rCySNd9RrzPa4
	  jkAsQQZV6s2JIUyUQ1Z73EbHaikeAQORdteUQqd2yWUIzA==;
ARC-Authentication-Results: i=1; instance-europe-west4-zjs6.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-zjs6.prod.antispam.mailspamprotection.com; s=arckey; t=1733410056;
	bh=p10y1Nre8H9JKT8LJQjBm3Cf0WrSAfSvU/wNmc95C5I=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:To:From:DKIM-Signature;
	b=MFoAuE8uDy8uIxdbtZPImJ0MSqZTamI3FGd0I19cvMC3zZPsrzFFOeaS54VJbNOP2+weOaRa0I
	  4dJkMCNipOXdyyQ6rbJ2Ijx4OfkoRJeqTQPfnEOXpnKXu6wfrqaVS9aHimaXoZxMz3/eXLZzAG
	  POd/a+4VKLgsEpgqTbZ4WTgqqLzwrB9SMpuZWo/oL/7e9z24LZl2IfPC55XxE8nkSUeW94WhjO
	  wvb+kKB1+qHLJVIKnX+c+tPjoN2mCOpCFWxp49qMX6Xtr9U6+bm5Pzw7zlRmklOvCJ3BuXd0N/
	  CZbusp64WOwJHwpDfDeNjgXEGwJ0ngnec4nrgLPblnOQpg==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-zjs6.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tJBQ2-00000004YXe-0LEz
	for linux-embedded@vger.kernel.org;
	Thu, 05 Dec 2024 12:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=ghjoe1IxFA95gYyn7pMwiL0vycsHG75jEVQLeWya5T0=; b=cgWs17y8sDIEzJASIv+Ib7+7DR
	4KiEH4CFeMRRmoq3lcodsucrBChSoilHYJOiGjHhAjxS6FzdcwZiSRKWqG4dfD5OgsDwFPxBXu4j4
	iMoRnj2f+gedZDH9kRienO6un7qTIWd0Tgqh7XzJOl43OANP/1313+gldBMkc9Ujj5P4=;
Received: from [176.200.182.84] (port=6445 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tJBPx-00000000788-0q81;
	Thu, 05 Dec 2024 12:57:17 +0000
From: Francesco Valla <francesco@valla.it>
To: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] [RFC] analyze-initcall-debug.py - a tool to analyze the
 initcall debug output
Date: Thu, 05 Dec 2024 13:57:17 +0100
Message-ID: <2281836.vFx2qVVIhK@fedora>
In-Reply-To:
 <MW5PR13MB563207AD3DB4415E5A1678A6FD362@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box>
 <MW5PR13MB563207AD3DB4415E5A1678A6FD362@MW5PR13MB5632.namprd13.prod.outlook.com>
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
X-SGantispam-id: 699eeb5c7cff772580a5b80aca9210c3
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-zjs6.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Tim,

thank you for taking the time to review the tool. My reply too will be splitted in two parts.

On Tuesday, 3 December 2024 at 21:33:06 Bird, Tim <Tim.Bird@sony.com> wrote:
> Hey Francesco,
> 
> I appreciate the new tool, and have some feedback below.
> 
> I'll separate my response and ideas into 2 categories:
>  - issues raised from your sample report
>  - feedback on the tool itself
> 
> and send them as separate emails.
> 
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
> 
> This call, and a lot of the others are missing function names.  Did you compile the kernel with
> CONFIG_KALLSYMS=y?
> 
> If that's the case, is there a way to use the System.map file for the kernel (used on
> the machine where the dmesg was obtained from) to map these addresses
> to their respective  function names?
> 

These are not in fact addresses, but rather device names. In my understanding, they are printed
when a probe happens outside of the initialization function for their driver. I still don't have an idea
on how to match probes with their original initcall, in order to present the user the complete picture.

> >  * deferred_probe_initcall -> 487483us
> 
> I feel like this function is interfering with the ability to correctly assign
> boot time delays to the correct initcall.
> 
> I would really like to see someone tackle this issue, by studying the deferred_probe_initcall
> function, to see if there's a way to instrument it so that the cost of each
> probe can be reported and then associated with corresponding initcall, when initcall_debug
> is used.
> 
> Does anyone want to look into this issue?

I can take a look, but probably toward the end of the year. Another similar area I'd like to investigate
is related to initcall time vs actual probe time: for drivers instantiated multiple time, I'd like to know
how much time each probe took rather than the overall time.


Regards,
Francesco



