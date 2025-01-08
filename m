Received: from crane.ash.relay.mailchannels.net (crane.ash.relay.mailchannels.net [23.83.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5069A202C4A
	for <linux-embedded@vger.kernel.org>; Wed,  8 Jan 2025 23:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377704; cv=pass; b=Y7CGH6JWqV/IizxoVgTNzd91IejTHTPyK2lfBasyh5nEl9ARvdg4268irbIoUrzcyGM07urlaXXSnm56aKfZOQFk90X21iO/9va7xnxLQqAFlJqCT1RQs2mGnfBZhZPCGxR5YeIc6MLntQBiLFEaHI22N0v2ZJpKZHrBleDlv3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377704; c=relaxed/simple;
	bh=GLXIShBHvHNq8n6FstVu3GLJYQ8ih+O9PJEDiWa0RxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dJDuP0nIo/FiZVrxzFg8rPjlwR7O9f9plK2LRMdTWDbVSJkoTTKa0NCIM9J3ecJrnNK054SN4+kgCZ1PhjwiZwq6yJSAp2ZweCHyt3R9yjnBz4P4Znjn4ExwJrFxZtIr0lqmNN0xrvRKiglHU7Sc9qDRXqPnTiek8Q2SaTj0Pfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=sbCkmVW3; arc=pass smtp.client-ip=23.83.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="sbCkmVW3"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BB7EF9036F2;
	Wed,  8 Jan 2025 23:00:35 +0000 (UTC)
Received: from pdx1-sub0-mail-a296.dreamhost.com (100-110-82-187.trex-nlb.outbound.svc.cluster.local [100.110.82.187])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 36865902AAB;
	Wed,  8 Jan 2025 23:00:35 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736377235; a=rsa-sha256;
	cv=none;
	b=cC5cTlSbjOWaKHJwR3p0Aw3/gI6gPTm3TJFiFoRYQ99gODiwVUfwPweO1fijtEzBN+V3oN
	pWdmeTNbcdKeahbyaWBoQIFxj5GijYVeh2dCyjWwGEzZF0lw6uUZnmUPgoA80pAtdB6WIT
	vlSQ/zp2y4BJ/docxS+B/ZivvxCCG1DQ7b0R0rdSiRknWR4tm8vTzxJqOftcAWPeTEQ9Zy
	ZFiH4p+aowFCRpz9lEA3Tt5rjUFFaUvCKf0KrWaIGdzJ0KbsxbAUFDVOlWfZv+iU484R57
	kq5zKWjlITBnIFhz0WGpcmGCRs6Igb+SK0xHso37gBcKVWny3Jtdfs6v39mtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736377235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=CRQjLkZqK0aELx9I/THvbb5r9tFBd7Zbge5TNtWzVss=;
	b=NN6djHaRO7Ox1aWuFl+mzs7MYEflXX8pCq2f+98YPL3ydBP05iIkILeOToEYAsDppfW9uo
	qjRx51OwiH2Z4LXpJHu6V83RCHxauDkfLTjxCdZtgj+aWq2R9TkIChHseWNSdoa5naenmY
	97LB7AQFreQsNXLCRZ/WQDxCe5Fmn8ugRaVcAo2/AnaIn+fD3HAhxSkpZqsLL4JyHgZVkC
	G4eBRgQlPaTp6I6zxJxu1UGGxSOXvp2bEsUeEdw4TnV9EPdpWPO+ja9aAqTykuCEgVWJFI
	xxkL2zCAx/exv+06ZvNryySXZ4ddLtLlqm3keXdlO6K2cbJa+8GHW/wORyyDTg==
ARC-Authentication-Results: i=1;
	rspamd-7df4dcbd86-b2l9f;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Illegal-Exultant: 59f12f8150f20755_1736377235496_1090195745
X-MC-Loop-Signature: 1736377235496:278108116
X-MC-Ingress-Time: 1736377235495
Received: from pdx1-sub0-mail-a296.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.110.82.187 (trex/7.0.2);
	Wed, 08 Jan 2025 23:00:35 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a296.dreamhost.com (Postfix) with ESMTPSA id 4YT3Kt57Xtz1h;
	Wed,  8 Jan 2025 15:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736377235;
	bh=CRQjLkZqK0aELx9I/THvbb5r9tFBd7Zbge5TNtWzVss=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=sbCkmVW38qKG50GsJvVhiGNcVSJpwHf9UoXGPwTZ1DNcQ4bFNvCuiNK6Fw2y0Auxl
	 r7ACJvIqJ7rZVm8NHcipeRNY+JxYtV3YMlVfAEM3fB0G+xK0FHNhGCP/kfI1TtU1gV
	 VzswKYHpuFtYrcTI5dqqSb5tdXOEy8lMD3OwAjuubSLzAtvb/MfH20W7n3bkoPFWty
	 HY1qGg0uI+gjhF7AWaDvqr9i50vkYk3G9MRsR6u8oGooxNehIYcKbNtFBaj80Mbti9
	 r0WFFfuHTEaZ7/2z3M87fXAX5ltE/O56ZGxLHYDT054tGF3lLDeR0UffeE/k21c51F
	 gZccdHVKIZCIg==
Message-ID: <7c4d8fa2-9b12-465a-9c23-0503cb086365@landley.net>
Date: Wed, 8 Jan 2025 17:00:33 -0600
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-time]
To: "Bird, Tim" <Tim.Bird@sony.com>, Shankari <beingcap11@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/25 12:33, Bird, Tim wrote:
> In general, there's a lot of information on the elinux wiki which is stale, which needs to be
> updated or archived, or maybe even just removed.
> 
> This section of the Boot Time page has a lot of material in this category:
> https://elinux.org/Boot_Time#kernel_speedups

That page says "grab-boot-data.sh - see 
http://birdcloud.org/boot-time/Boot-time_Tools" but the link is 404.

> Anyone else reading this who wants to also participate in this project to
> update the elinux wiki boot time information, please contact me.

Maybe? What do you need?

Rob
