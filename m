Received: from buffalo.birch.relay.mailchannels.net (buffalo.birch.relay.mailchannels.net [23.83.209.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9E3AC1C
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748030469; cv=pass; b=iw9VyA8/xtJynqhHZ2QgvOOKwCw5Di7cV+O6mY7MWkdEOfj53GqufMnwkxEUy4OmN1bwODom5KrB3AJ5UG5m8l5B55McoslZZiPAJhM9f4AFx0bDqiqGTuz8olLYfYE6hRZkjPzmjdMe8gvQhebdC3zwPtOaNEE8ZcpBrLLtJ74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748030469; c=relaxed/simple;
	bh=xkUjea10sgSAdBleeYSwmE9zL8bPm99wzCT10I4A44I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GftNBmp5om1j8Kx8AzbA1mlcTK19jWuwIzggoGyC8J1R/Q4nIE/9VazpWolCTJcCDUnjL4prj30tC9plRLMpCD3VB9caI7GHNJ/C/w0GXNdLBY8272ksyxUYPnvzDGpK/j7D/GLPHW/nPwViOKpTql+UsQFJiJtJ0reNqFtx+ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=lWKOdrk8; arc=pass smtp.client-ip=23.83.209.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="lWKOdrk8"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F11144E4DA2
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 19:43:58 +0000 (UTC)
Received: from pdx1-sub0-mail-a206.dreamhost.com (trex-green-6.trex.outbound.svc.cluster.local [100.124.34.27])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7323F4E4E6F
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 19:43:58 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1748029438; a=rsa-sha256;
	cv=none;
	b=rJzE1rGXQokduYjytShyRzT1Iepn6Gx+xsawSjDD6rBKgDVaEcRWmkUu9PMhgwK4tVWSRf
	WwO2n+XZbg1n424cPKEVGa8E7YuP4PFNov+io692L5GSlL4FT6kjESY7CzWP9Qydd2FkF2
	sembcBI0AOaxIBBNu23CaFKN58uC8gZnundD4kgItb2EDd4AejnvHsjHsVNQ2ZmuctXL3G
	tOtn2cGPXynoG+5RviShblfZMWphm3n0pUsI/wSrSEUTWNpiAzJuDsPYAtBlqnWNFkv9uw
	HWrkw4HKcpE4YCW6/qDs21FTqJ/nBtMWMhUQnstHwiUjAAU98O+BI0bvLIKR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1748029438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ZwsxYZ3liJWwRe4YW0egCEgaIzoKnGNpQngnXcQLRKg=;
	b=1GcRYbvUXzA+/Bf/YeQDy09C+ePhRJ2CDCa4D9cdcV66oFIG0URBVODxBZCbOxP5QULVpb
	3tBFOcxX6SPnjDyj1ipjIyS+h4uk33vM4ud1BogTjpibqOMuqLohplrtwCdZIiAwWZJ1YN
	FX5eP0EEWXDCfQvxB2uXwRRd+MNfJ1aK1izZ+Hx+Ky5e57vviBtX1V3d9+MdLBDEx27uGZ
	wmoGiuHaBgSg5/EG5vX4XUe+0T0VnlWtyi8keLOlGJr7GztZbo+4RYlQ/xeMRTaOASS3Vq
	h0WPeXqOSagOWDmWlkd2PPlhnUWILpwbpszBv95RxF4v6eSqQLissm68wq/rQA==
ARC-Authentication-Results: i=1;
	rspamd-766f9cfddb-csmgf;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Whistle-Eight: 50f0f1c64dac7375_1748029438690_2849920673
X-MC-Loop-Signature: 1748029438689:1565425864
X-MC-Ingress-Time: 1748029438689
Received: from pdx1-sub0-mail-a206.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.34.27 (trex/7.0.3);
	Fri, 23 May 2025 19:43:58 +0000
Received: from [172.22.7.54] (unknown [198.232.126.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a206.dreamhost.com (Postfix) with ESMTPSA id 4b3wZk10qZz8H
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 12:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1748029438;
	bh=ZwsxYZ3liJWwRe4YW0egCEgaIzoKnGNpQngnXcQLRKg=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=lWKOdrk82gvUDpNjcwXvyKUoje0MKeL/H23AurE7Q3ZJqJpbER28dpLh1JoK/8Xmd
	 W2mBocJGKp/Qe7KfCEJryMiFQ3JewQK+uJKCjuuq6lKh7Ayxcz7orENaq96r/4PLc9
	 z5MZCkGcI7DibWj2pVfB5ZRfPcKIYI3dzXc7ns1tRdbXHrRD2ORJcCPgiroEgtJ+dO
	 iG9vFwbJ8o7jxNNCszVtd/Ge5M+U8wx0PcpI5ofNYzPm5b5xGSO6vaziw7W6hIoIHS
	 OV4Cq2YeuHB28JuvcryAa/NvD0nWF3uITkXcD1Q0WQcI0A8spqQAN5A9QF59dPcePy
	 wzW6p7j+CrXdA==
Message-ID: <5b8d51e8-92af-469d-9d05-253a63e31230@landley.net>
Date: Fri, 23 May 2025 14:43:57 -0500
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] Add driver for bootstage stash
To: linux-embedded@vger.kernel.org
References: <20250522224223.358881-2-francesco@valla.it>
 <PA4PR08MB604681FF6392B25A19926A11ED98A@PA4PR08MB6046.eurprd08.prod.outlook.com>
 <473a062e4f939bc58a5c0e636569b826@giovanardi.dev>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <473a062e4f939bc58a5c0e636569b826@giovanardi.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 02:34, Federico Giovanardi wrote:
> Hello,
> 
> The note about the data format also was my initial thought, by just 
> copying a C structure we might have issues as soon one party changes it, 
> and they might not be perfectly aligned.
> 
> To avoid inventing yet-another-data-format I've used msgpack in the past 
> for that (the format https://github.com/msgpack/msgpack/blob/master/ 
> spec.md, not the library ); because the specs are so simple they can be 
> implemented in a few lines, and it's something with a reference. But I 
> don't have a lot of experience in upstreaming stuff on the kernel, so I 
> don't know if it might cause someone to don't be happy. Anyway, I can 
> contribute the implementation if needed.

I note that if it has an external build-time dependency, I will not only 
never enable it, I will go to great lengths to _disable_ it. I maintain 
a patch to build x86-64 without that ridiculous fourth ELF library, for 
example:

https://landley.net/bin/mkroot/latest/linux-patches/0005-x86-64-elfcrap.patch

The traditional approach to exporting data was to have synthetic 
filesystems like /sys and /blah produce human readable ascii output that 
could be easily parsed, because unix is textual.

Ala "Write programs to handle text streams, because that is a universal 
interface." from https://en.wikipedia.org/wiki/Unix_philosophy (quoting 
Peter Salus's "a quarter century of unix" in 1994 which was itself 
quoting... I think Doug McIlroy?

Rob

P.S. The whole digression into Plan 9 muddied the waters, not because 
they backed off on it but because the original authors of unix doubled 
down on their sequel project, and then unix copied things like the 
concept of synthetic filesystems from that. The difference is Unix was 
published freely in 1974 and Plan 9 was closed source proprietary until 
2000, so the first changed the world and the second is a footnote must 
people weren't aware existed until it had basically died, and then mined 
it for ideas they could port to what they were using without ever 
touching the incompatibly licensed code...
