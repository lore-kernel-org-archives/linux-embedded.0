Received: from fuchsia.ash.relay.mailchannels.net (fuchsia.ash.relay.mailchannels.net [23.83.222.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB83FEC2
	for <linux-embedded@vger.kernel.org>; Sat, 24 May 2025 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748052896; cv=pass; b=oCIuXlDvdcqP5rj+/IdloDzugheGIgOkaynaljqcaT8RPG4X+twT3zGfx7LGd4IrmbBNI5vktHX20eJtLdj/7a/C8Gafv0DifmStAyoHM+FlYZIs8YFW6dEoqnxUB0ZjHEGNK2YAr1/UOBfWVYYXBe9dC2sU/Fs8WPqkyJkkTyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748052896; c=relaxed/simple;
	bh=mKomMSOMRnjgBbaa6Ydqlv4dPQOtHFlLzXJk6Qu8StY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g0YpKuErOtekMDRSNGXxjffvuRCSPamMHJIXDB/pGYqoU3JBDYtre3PyP3wOten5ifpbXWbxl/5iXI7xmna4JNSASNDNl1D3LyggtzCMVFvJ15HVc1CjJCkqbc+SVhoa1C6Tcjb3KsGh2sRuHMMvId3tY/HbXRuppKpFkC12Ano=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=D7OeIHIi; arc=pass smtp.client-ip=23.83.222.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="D7OeIHIi"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 11BE01C1710
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 19:31:02 +0000 (UTC)
Received: from pdx1-sub0-mail-a206.dreamhost.com (100-117-67-29.trex-nlb.outbound.svc.cluster.local [100.117.67.29])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 993F51C34D0
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 19:31:01 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1748028661; a=rsa-sha256;
	cv=none;
	b=gJcH9F3NAEMxyKPH9H//TuMTdqDBXuRTxhYpGQkmWn4EyuaIE7+MqZYYGvzmc+dvznBkrY
	YCZoPhPQMI+pCiOjqTSgUMCak/dVUdUUOLrfr80PFZxSofHkPq2/4UItjadcMKxpQh2OFm
	y0mYPgGdqGmKnrJk4KdmIJ85Jpi6N1Pcnq6GeThJu+HSpUYOyjMrxxKH3gZUNMcLmFY589
	mE2HpkzagizW74Vj1rITmoo2i7iSLk0omyHa3Pt6DYFLBCggsL/EYG8tMjb3iaBlKIZ57q
	5YFuEjtVcysDSgvwSciUB+ytNDB0NYeo9nKeo6f4eaOz62XFJNvKOr47oROu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1748028661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Q1BtmmhdISRFKy/5N/1yY/ngfRWalFvaEAI5s8RRUXg=;
	b=jazJCCgtjh08PVsH3sNijLlfrLqLxrMhT8K/IFAkg70h5ZlNvS0PFuMZ6RTJTQzyQI+Z0r
	5HOIcpcvC5w3ztWxLiJtVoGo4W52M13MncbMgNMFiTPgRGyCmRnBSdVBTXzyp1lEoqXSz+
	Gknuy/7QokR8jUHx+PM0FWhnBiuvFpV2u2Qrp5rNIDSWnjAsBjlcHkMp29KnqCnjEsZMq9
	YbmaT7eelRU4BeU6Ha2cb2AIh+s5xZlAFv2GQ1I0oFr2NAZihQVzOef57dF5QaTQ6Nmqos
	yjo0HtrR/AVITanFxKYyUU6hCmf3dQvMW6lSw6v5tq0+96fR1YXwslIDQzkgrQ==
ARC-Authentication-Results: i=1;
	rspamd-5b49d78d5-mlmxg;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Cooing-Harbor: 0ff326212c4718e9_1748028661863_1151911573
X-MC-Loop-Signature: 1748028661863:1942173175
X-MC-Ingress-Time: 1748028661863
Received: from pdx1-sub0-mail-a206.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.67.29 (trex/7.0.3);
	Fri, 23 May 2025 19:31:01 +0000
Received: from [172.22.7.54] (unknown [198.232.126.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a206.dreamhost.com (Postfix) with ESMTPSA id 4b3wHn1KXPz28
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 12:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1748028661;
	bh=Q1BtmmhdISRFKy/5N/1yY/ngfRWalFvaEAI5s8RRUXg=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=D7OeIHIi2RbvgQoXMHnYlA4VPPEBXaLS8k6qC/Lg77RXmZWaWpT5pPzMuo6CrTRiC
	 /rGq9Ov4E72N7d5fbFtejy3OaGFBNlg3yX+ifs+5JFc4TPEMYUeb2jIdEwxwhj2lio
	 a9ssO0CYe4+urgpwqKC6Kc2qbetvJl7/2C4pOTi64n0APtjLUt8LppWE96YViEzxX7
	 7022HFGq/uAU84M1vhDLgYswIYqjIxILeUB5V2qVdUuJlqDj04EfdJcX7LoPQEH2K1
	 SiT7WQm4pptZuQFBfsCs1oWRBkRKrK1R56nDI7IX6v4vnWDJ+Gnc/mfeJTjBa9EwRy
	 ssKM6hneqf2RA==
Message-ID: <bbe54e14-86d3-490a-aff1-3011c2cb351b@landley.net>
Date: Fri, 23 May 2025 14:31:00 -0500
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reminder of Boot-Time SIG meeting - May 27
To: Linux Embedded <linux-embedded@vger.kernel.org>
References: <MW5PR13MB5632B8EE9EC410B617304A3BFD99A@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <MW5PR13MB5632B8EE9EC410B617304A3BFD99A@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/25 18:33, Bird, Tim wrote:
> Hey Linux Boot-Time SIG interested parties (and other interested Linux kernel developers),
> 
> Here is the information for the next Linux Boot-Time SIG conference call.

Is there a git for 
https://birdcloud.org/boot-time-files/grab-boot-data.sh or just a 
snapshot of the file with no history?

> The meeting will be held via the Jitsi online meeting platform.
> To Join the meeting via web, click on:
> https://meet.jit.si/LinuxBootTimeSIG

I keep forgetting the project web page(s) and having to dig for them, 
and modern google does _not_ find them.

Also, https://elinux.org/Unified_Boot_Log does not link to 
https://elinux.org/Boot_Time and the only link back the other way is the 
"special topic meeting" note...

Rob
