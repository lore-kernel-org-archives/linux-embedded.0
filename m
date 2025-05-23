Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE231F874F
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 20:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748032798; cv=pass; b=LzA8+6F4SAlwqB1d7xfXJlyStzFOBDpc7R8oVHDry8QbjuC4LT6MeaAvrtlaQef8NdYwP9FM30lItW7+wTaGB1rjTJEsOLdhFWg4Ke7R/xh11oUQGYTDF+4vSQLl8j6ERwGVJG9MwLcE3edefmh/WAhjQ9xgRNb0IyRBQ+ICCRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748032798; c=relaxed/simple;
	bh=Vt5zg/JvOLbfaEU1yL+Q3XV3vmy0h+MPvGaIex6Lpbs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRFht56k+nuws5n4/r3rgI6xVmToWXj275mlh+o7CKSiRAwG67wFQYmDf2HExAbhd+iUBRNbQ+928nga5Gup5/a2dWvuMK05wnVHfuUbQYoM2KSCJk+JV8EKhh7V6rrn6/jNP8yUudAKAF3wmJJomkWbqr/dVpryiz6mvrODNeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=m3l0tWp8; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="m3l0tWp8"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-p73s.prod.antispam.mailspamprotection.com; s=arckey; t=1748032796;
	 b=mShqgSIhtQ6Q6G4QtIt/r2zLMVwfS7MDUa/L4whtaeA/NG8EGd+3Ol7mlfYWF9Yj6ZsUV8NpjG
	  nvPvx9dPcuDEeYPWr+acnax3wS9hymyj+ng6RLmKUPnTtEpWKUBqkcluoyDUL7nfvS4QJ3+8XR
	  yVY/qz0mE86rU2vzvPlLZy4NFyyi/9fRo6hHMNVjCsJ5gGcnEGMBu3EvQ4xJJfbQL9kZ1dJO4X
	  9nsLzOg/IFbbRf65/JWL0jCu2cEeuhC+iLb9l+h4GD1bNltFxLcO6twoviAdtBcuth+FZ6r4JZ
	  JZnQT1JPcchl7xTmzxAqOWHxt3fQiGbZ47dFlQDu2iw6lw==;
ARC-Authentication-Results: i=1; instance-europe-west4-p73s.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-p73s.prod.antispam.mailspamprotection.com; s=arckey; t=1748032796;
	bh=Vt5zg/JvOLbfaEU1yL+Q3XV3vmy0h+MPvGaIex6Lpbs=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:To:From:DKIM-Signature;
	b=ceHjuvMkNedxWCLpyIxPsLi0XMXjneV2RIi23fCe13NUNd6vRbeFjf1ST7P8QWJhsT6xri0K2z
	  vmhsLz798ixfHr/5Pno3ggnSDG6JYvATlY04uxqCYs3we/drAkTsN2ekZayhZia/DI/7D+6SIr
	  CksnDmg8IsrdyHblcLdh8oarEOd7N8UA4hEXX909x4smZtpRucwkN5g57yLGIAtcekUVl9keCJ
	  1Qh0mpFLzlpNCiPixt8z7cVCzjDU+kA9wjG8tXDmrREOIKyVQm2Foo5DHow88rRL8PzojDtbmH
	  hDMx0IWs3igSChDo085u6Abv1l+dDoKqwd2nNd6nXL62KA==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-p73s.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIYk3-00000000C1R-2gL1
	for linux-embedded@vger.kernel.org;
	Fri, 23 May 2025 20:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=KU/k1dtzqXAJToorGAbNLIFyoBodezc2GqWs5Ne6Y8c=; b=m3l0tWp8Ko/+LgF5BcZAxK6iHm
	ovyXZp1tko0euzJWGBB2igrpdE7ijyWRPzgfVhasBKmtcM1vQY0hoStqEHcxR+24irrjr8CgmvizQ
	Dtxvnm/A9GqN1bsxuUNFzBp8QUfY4yFQoOWesZzJT2untUGsFXzMhFKA6QMdci5GuF2g=;
Received: from [80.182.118.140] (port=62933 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIYjw-00000000Hg0-085F;
	Fri, 23 May 2025 20:11:36 +0000
From: Francesco Valla <francesco@valla.it>
To: linux-embedded@vger.kernel.org,
 Federico Giovanardi <fede.dev@giovanardi.dev>
Subject: Re: [RFC PATCH 0/1] Add driver for bootstage stash
Date: Fri, 23 May 2025 22:11:35 +0200
Message-ID: <2664074.YKUYFuaPT4@fedora.fritz.box>
In-Reply-To: <473a062e4f939bc58a5c0e636569b826@giovanardi.dev>
References:
 <20250522224223.358881-2-francesco@valla.it>
 <PA4PR08MB604681FF6392B25A19926A11ED98A@PA4PR08MB6046.eurprd08.prod.outlook.com>
 <473a062e4f939bc58a5c0e636569b826@giovanardi.dev>
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
X-SGantispam-id: 843291273a26c3bc9137403eb978abdd
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-p73s.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Federico,

On Friday, 23 May 2025 at 09:34:09 Federico Giovanardi <fede.dev@giovanardi.dev> wrote:
> Hello,
> 
> The note about the data format also was my initial thought, by just 
> copying a C structure we might have issues as soon one party changes it, 
> and they might not be perfectly aligned.
> 

Definitely - before a proper implementation, a formal specification with
a versioning should probably be defined.

> To avoid inventing yet-another-data-format I've used msgpack in the past 
> for that (the format 
> https://github.com/msgpack/msgpack/blob/master/spec.md, not the library  
> ); because the specs are so simple they can be implemented in a few 
> lines, and it's something with a reference. But I don't have a lot of 
> experience in upstreaming stuff on the kernel, so I don't know if it 
> might cause someone to don't be happy. Anyway, I can contribute the 
> implementation if needed.
> 

I'd avoid a serialization technology here, as it would be another
(somewhat costly) step before booting, while re-using the memory area
that the bootloader itself uses as stash is basically free.


Regards,
Francesco




