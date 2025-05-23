Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D341993B9
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 20:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748030805; cv=pass; b=Z3zVlAk4VGsOtfkI0x04UPjJnLvPTxM/G97Bd99VL7xo7gLr7wgC9PW6iFsFGSty8B1S4SKKoJzYokggglLoCuvxSr4ykiM1LDJoV0uGaIqXSXDi8/lMYmMWiEAXzg8c1h4BPfa1DjBEYzqq/qurmXu6KvPe42giztiOiGnHYiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748030805; c=relaxed/simple;
	bh=C4CdUqKXMLzdoG3Q9RAgzGZPTC3YaPEUw4GeWvuHF/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arl4VyBJbHJp5t8PgE8kGUehaiIAf6AAjaDVV3fAjecNKuMT47KRuD92oDBYejRzMMQUKjt2PyvM7vM4etgEr9i+Ol/n3M8PQuCyrjRFbc7Gs2+QE5Q1ZHVxM23O4LKUNiV7yDwyvXSj2ACXw6PXwG1mFhG8xmDbIv2butz2d20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=dfhgdc6r; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="dfhgdc6r"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-zctz.prod.antispam.mailspamprotection.com; s=arckey; t=1748030803;
	 b=tCVTBaFX85DSBioivD6c60SUtq2/nkn/flrBfwMSYbc8L7hyeA1IRJMJsGZ0ibiHvwSvYT+wp+
	  nVMm75D8uYZ7PxgHq+Oq4nNCugci+2oCgLDTckIuqdyi57hdX5hynOiTqJWqN3+qYmHtCm3lcj
	  4aJt21nrANLig/mi+9kX/BnnoAsMLxFvrYMcidpppOF2AeyHhqnnOO0E9e6OeN4UAuFOHHClj1
	  /mgOy/HLoHR73bUiYqMo5L9v/+T4hO1ewnBQEVcFGNiCgKKc1Ue5IL7YsfPMij7DJitDVvNMab
	  5rfEJWXQuCNC0KAkscfQpbWv1qXMAkg/8mf9cG5e6dwljA==;
ARC-Authentication-Results: i=1; instance-europe-west4-zctz.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-zctz.prod.antispam.mailspamprotection.com; s=arckey; t=1748030803;
	bh=C4CdUqKXMLzdoG3Q9RAgzGZPTC3YaPEUw4GeWvuHF/Y=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=T57U5PRbrYnfhVyZAfrglioGHetRDSif118oYcRAMP08GO0apzkQWkAeBGgSnhhW0IIKFgkMEL
	  eEMqy66IvxdLDB7CyN3o0dR1xuKsQEx3LW8fOHajhF5LhzAtzmhAbwlMWui9uqivf/zHIGkHV/
	  cVJALmxgIwR+IQB9wHKdc8UyOv5W8jzKMZ+6PC1wmstU/d/kSiBVpq6lS39Dnx5voYd+GKHC8d
	  1O4CHUR1HTr2wqR5KcG6ZNBPlb6tXD5AQK0bl/lTZHxJkpZ0zRzneUrgFZr56Teb9hZ/rFm/6V
	  NOtaSdtBkkBPZJcTtc0mXwgYUWKTR1lfnoQmL0XPuMR+9Q==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-zctz.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIYf9-0000000G6Dz-1NME
	for linux-embedded@vger.kernel.org;
	Fri, 23 May 2025 20:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=mR0cTGh0qmckX/rHqtqdMguBSyQ7++AkoCBGfSpt510=; b=dfhgdc6rCKkfHJ5GAskJSuaVuI
	JNuHjd9sc6V052cSJvMog0LZhAu+OzGT/6aMzP70UQipdAarXxfuHIml0xBD/lhSpT6IW0fI/yufI
	FsNGT1DwkPXXLTLuMOFk2vCKYLX78fS6KVOWm77wsU7lYmtQOi2mAsY3K/YjesLk2DGc=;
Received: from [80.182.118.140] (port=60085 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIYf1-00000000FjB-3kRH;
	Fri, 23 May 2025 20:06:31 +0000
From: Francesco Valla <francesco@valla.it>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-embedded@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] Add driver for bootstage stash
Date: Fri, 23 May 2025 22:06:31 +0200
Message-ID: <22690048.4csPzL39Zc@fedora.fritz.box>
In-Reply-To:
 <CAMuHMdXqw9igYU-iPFbA-uP8-LrmZocUKT4k9cb8+py1gFp8tA@mail.gmail.com>
References:
 <20250522224223.358881-2-francesco@valla.it>
 <CAMuHMdXqw9igYU-iPFbA-uP8-LrmZocUKT4k9cb8+py1gFp8tA@mail.gmail.com>
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
X-SGantispam-id: 8dfd9315e30d895c7c2faf063e6ec691
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-zctz.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Geert,

On Friday, 23 May 2025 at 09:04:48 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > At U-Boot side, following configuration shall then be set:
> >
> >     CONFIG_BOOTSTAGE=y
> >     CONFIG_BOOTSTAGE_STASH_ADDR=0xa4300000
> >     CONFIG_BOOTSTAGE_STASH_SIZE=0x1000
> 
> I think this can be simplified further, using either of these two options:
>   1. If the bootstage@a4300000 node would already be present in the
>      DTB used by U-Boot, the two CONFIG_BOOTSTAGE_STASH_*
>      options would no longer be needed.
>   2. U-Boot could add the bootstage@a4300000 to the DTB that is
>      passed to the kernel, just like it already adds/updates the memory
>      nodes.
> 

The second option is probably the best one, as it aligns with other
similar usecases (e.g.: OP-TEE node [1]). Once it has been determined that
this driver is the right approach, it should be pretty simple to do.

[1] https://elixir.bootlin.com/u-boot/v2025.04/source/lib/optee/optee.c#L112

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 

Regards,

Francesco





