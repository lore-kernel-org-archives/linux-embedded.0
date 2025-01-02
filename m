Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C8195F0D
	for <linux-embedded@vger.kernel.org>; Thu,  2 Jan 2025 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735814005; cv=pass; b=esnJW9lJJzrvwq50BGuNrS5xWBzJUr0uACznjO+waDkEEoESrh698tc8Zwv7rm43nYYcjCz8L+XFy77Bcot/MXClp4BJw8ZQ4kIwf+W6z4cnnTXTb+ueFRffTi+Q8+nBsYy4ILl0KnV5OjijjKdYMV5dqTj6biKFtejq3Um0Dqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735814005; c=relaxed/simple;
	bh=RUttpl+5zH9ZmNfJRD392aKhb1X37k+pz+KCbrR9DtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bw5MVlzUT+t4xh5/c+Sunbc/Dk8SpnZnsCo8l4N8a0DgsbVu6e82YSeeDrqabFUTnNfWQl/m3XIuzm5BRmJZLUxPRgVAMpI0Nk9vb2P4QG1zbhGgvedkznGqRXHZOq3rtG84m5fKrRaR5SCLZWoZdrb/PvY3Bo4zkEFmXPenMpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=Day1tOd/; arc=pass smtp.client-ip=185.56.87.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="Day1tOd/"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-kq8l.prod.antispam.mailspamprotection.com; s=arckey; t=1735814003;
	 b=FagQduah81A8mGt7cR6R+lvo7UYq2vw/2pKlWQ8W4+ye0GMt4JRXhpW+/zk/xGgsocHnoMKzk1
	  LoF+MA21fSqBMcWmcEyargbF5T6p6EXwQv9Yw1UpqCXi5t99E8+zdZmoqZNQE+9/nwL2veq9jr
	  G95nJWV6lEoZZA+xzaC1ldykIud0NqjKlOjcRto+DufwL+U9UOqytQrJ9L5XwgPTs5HL24foLZ
	  Ts2hGO30/3o3h1X9NiLZ8zYJN4msmBkhvTgas3P+EVaW0Zp+wpaYjf8egKaf/MN9iAQEaNTzax
	  KFXYhn+YDZlMBXyEvKd8YqMWuwJMGM+PB+Kv554JeiiKgQ==;
ARC-Authentication-Results: i=1; instance-europe-west4-kq8l.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-kq8l.prod.antispam.mailspamprotection.com; s=arckey; t=1735814003;
	bh=RUttpl+5zH9ZmNfJRD392aKhb1X37k+pz+KCbrR9DtM=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=IDBP9V7YHAWa8mvR7+4gKmqTIQsqrd2kpVFQskN3WAZewX5F+ZjIO2yZ8PsteUYSNJzQrvX1Uq
	  oLap3xEwgy00w7u7o3hnJ1DQoSCj0tEr5jXDUk2dB2b9r4QBA7eFJn8cjywGA4qt2ISY8QHoB3
	  NojB0qljvQaAiGFm4maRKR59H2uXVGs9Y8tENj51VecKybXud21zUIVaLThgY6jpIa5rW+qQj5
	  e83SZPipEGcnL96R0P10Ayhss270uAKTLuLTyIbYsPlQxtWqOkt20Wp2L1Z1905f6t2I5R32uw
	  R51mZqy/2W3BFeHkllP5S6EAsHYDgvRGS2MjOgXLHxDKTg==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-kq8l.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tTIVt-00000000uUK-3irW
	for linux-embedded@vger.kernel.org;
	Thu, 02 Jan 2025 10:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=1MLKuHhU9Hlb+EGrSTABZRu6xswTzcrHiD5iul+J2ZM=; b=Day1tOd/n2HxChiNVBK8/RGfYm
	7f5WAnzWSHaURXlA8bFWsnpij/tl8gEcnCvBzw1v5FZZLxsE/Mcui0A5yOlkLLXIlhV5KGatmYMIt
	8/LCaKTfDt3G0MkjxBJKSSDIQr1Boynp2k0vKqemuOjcgd5WvY7tEyF2YbFpUAh1ccD8=;
Received: from [87.11.41.26] (port=63449 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tTIVo-000000005HF-4BRM;
	Thu, 02 Jan 2025 10:33:09 +0000
From: Francesco Valla <francesco@valla.it>
To: Shankari <beingcap11@gmail.com>, Stephan Mueller <smueller@chronox.de>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Thu, 02 Jan 2025 11:33:08 +0100
Message-ID: <2736774.vuYhMxLoTh@fedora.fritz.box>
In-Reply-To: <3346275.44csPzL39Z@tauon>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box> <2285043.vFx2qVVIhK@fedora.fritz.box>
 <3346275.44csPzL39Z@tauon>
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
X-SGantispam-id: 4433921e0c2fbb0aa2018027de81fd13
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-kq8l.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Stephan,

On Thursday, 2 January 2025 at 10:06:25 Stephan Mueller <smueller@chronox.de> wrote:
> Am Dienstag, 31. Dezember 2024, 15:42:16 CET schrieb Francesco Valla:
> 
> Hi Francesco,
> 
> > The ultimate goal here is reducing the boot time to the minimum possible
> > without removing functionalities. The purpose is educational, but on the
> > long term it will probably be beneficial to my work too (as I work in the
> > automotive industry, where each millisecond counts).
> > 
> > There isn't anything inherently wrong, at the moment I am trying to
> > determine what is real initialization time and what instead is an actual
> > waste of time (e.g.: excessive probe deferral). The aforementioned
> > jent_mod_init (on which Tim I think is working on some level) is one of the
> > longest single inits, but to be honest I don't know much about all the
> > entropy stuff.
> > 
> > Wishing you the best for the new year,
> 
> Same to you!
> 
> Thanks for your answer. With that, if you desire it, I can try to help you 
> lowering the boot time at least in light of the Jitter RNG. This, however, 
> requires a bit of analysis which you need to help me with as I do not have a 
> board you discuss. But the Jitter RNG has some turning knobs that can be used.
> 
> Ciao
> Stephan
> 

That would be wonderful! Whenever you have the time, please let me know what
analysis you need.

Regards,
Francesco




