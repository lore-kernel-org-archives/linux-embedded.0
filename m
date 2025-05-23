Received: from silver.cherry.relay.mailchannels.net (silver.cherry.relay.mailchannels.net [23.83.223.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008D299952
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748028886; cv=pass; b=kjXTFpgGBQbIU22Cqq5P+QtuXFturIrNYJCrTNIBuoIBEqrzR99QD+QsK+1QOjfuIPEyEtFU2mTqkaF9BFlLXv0C/JU6hkWTrhbOEcQFjoTxV4R7rXaiuGLx26lkaw+R5hsWtvD5BATBil/OIUsh1CztKCgfVtB4rn6Fchd9Dts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748028886; c=relaxed/simple;
	bh=ZymaNPzjZ8aAgDPlRmXjUElM34PxTb5HQOhImHt/zw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DSECC35OZr0v0CTSV2YSvL9H2e/bpN13XhlZHFBrWM7kL/G6VrhT350W6eOL7oe5CzKBp7k5Fhn4ZrNpyOKNOv3VOkW/ESy1I51yNfLROEGUoSRZapc30mEEKATTbP/EmF3TJDMAzItzWPphnnnR+26Z2mH3PcH3MEOGfjk47CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=kU4/YgXK; arc=pass smtp.client-ip=23.83.223.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="kU4/YgXK"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2D0438A5461;
	Fri, 23 May 2025 19:34:43 +0000 (UTC)
Received: from pdx1-sub0-mail-a206.dreamhost.com (trex-green-9.trex.outbound.svc.cluster.local [100.120.70.190])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A11EF8A50EF;
	Fri, 23 May 2025 19:34:42 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1748028882; a=rsa-sha256;
	cv=none;
	b=NEFcKdjgrFYmO9e+vUIcZfh3CfNDXUYJKTc5/7lJY8HTbDH10Vpgr4DIit00PkHsQjkroL
	t4tODRodGRAeSxp6oAdF9t1d67KfKz1kxYN2PRhPT7qIDvfVpd/Zmoxyy4wUzLvjymgYQ2
	b8ST+MACjbv5xJExsBalMEKDh9/Wxa0TvIKTyAhrmV/S/JGsHBuzGF1EFa6m0094/QdYar
	ISvBq43aEFBtGOT2EyW+y73v45+J7Z8wHz4GR3fx1GaCM4ZCuOsZwBLwJc/HFfV23mIdhB
	uKEhFam0iLvovYUa9Ehr93TVdCaFWd9k5X5ykCcZSZZ5vIf0NyUH0hrfhpujZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1748028882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=6CxVWUagOmD4uO3grxyeaqjZ8bQ9qdUCbIr8g3+SiWY=;
	b=qS+v0ppKQsX0UfUXkN09csujweWf1bUH12ikcJAgEb/2HSmBZcomEiSKcsw0zBc4hHor9u
	VRIjQbN33UPBi4IxlmrOUzeRLOGpZFfHV62G57njMk3H/UtktU5pZCzB16qlplK2CtnMv1
	EY/7sN6W13CmwsAenl6XJTCNFbfENtffKw5w0n1ggUlg686rdbA4cqKFZpfCYCennw5IL+
	draTP3UqYgaWqYQjiLvpoTk4ypZ7OgnpbrFKx4c5CW0y296VK2realpiztdg/sNSR4kMMq
	pVdsOcPRhNAljlbb21EuyUT6xHcAx2eWMHgoLK/Vqxx6/cXErlZipPENo1T3kQ==
ARC-Authentication-Results: i=1;
	rspamd-766f9cfddb-dqk96;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Absorbed-Spot: 0677f2982f26f06c_1748028882907_3024690519
X-MC-Loop-Signature: 1748028882907:3116410234
X-MC-Ingress-Time: 1748028882907
Received: from pdx1-sub0-mail-a206.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.70.190 (trex/7.0.3);
	Fri, 23 May 2025 19:34:42 +0000
Received: from [172.22.7.54] (unknown [198.232.126.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a206.dreamhost.com (Postfix) with ESMTPSA id 4b3wN212Hqz28;
	Fri, 23 May 2025 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1748028882;
	bh=6CxVWUagOmD4uO3grxyeaqjZ8bQ9qdUCbIr8g3+SiWY=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=kU4/YgXKJnnweqVDcPqBtgaCNcnZzoAx6jZcbUSWJI6mOtoFY689hHBPcCLnfYzrs
	 YOpH9K8g3Cc6cGLsBA2DJrA659sC/He0354rlaZNme36SQvAJMyQOlpz5GnZW0Jp/A
	 zQ9TtxSvAlePLXUJefIXJrWt2woHNrcqPE5WJnQ3Si7XOd5dQKvdE7TLORh3HjNwrt
	 LWH96CjX32ile1Hy5VoGLKwRGZ79eM3oOORk4eOWsjFR0ZFOh1Q97sSW80NQ6s7dMK
	 OhQ3QuUCjFkk86yAFNdNaeS7RXuu7o/Qxpyzvjx/4P7Obwajn8cXMjSRlJ3gskmLX6
	 bjJhF3cPAzvLg==
Message-ID: <ad98c8d5-dc2e-4f52-9835-e15d9f3a94fd@landley.net>
Date: Fri, 23 May 2025 14:34:41 -0500
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drivers: misc: add driver for bootstage stash
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Francesco Valla <francesco@valla.it>, linux-embedded@vger.kernel.org
References: <20250522224223.358881-2-francesco@valla.it>
 <20250522224223.358881-3-francesco@valla.it>
 <f1673d75-e951-4cdd-8414-f1e9d7d6e6aa@kernel.org>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <f1673d75-e951-4cdd-8414-f1e9d7d6e6aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 01:29, Krzysztof Kozlowski wrote:
> On 23/05/2025 00:42, Francesco Valla wrote:
>> Add support for bootstage stash areas containing boot time data
>> created by some bootloader (e.g. U-Boot). The driver provides generic
>> time information through sysfs and platform-specific one through
>> debugfs.
>>
>> Signed-off-by: Francesco Valla <francesco@valla.it>
> 
> Your Cc list is so incomplete I really do not understand which project
> you target and this popped up in my lei filters. If this is not for
> Linux kernel, please ignore the rest.

The discussion is happening on the linux-embedded list you cc'd in your 
reply.

https://www.spinics.net/lists/linux-embedded/msg04429.html

https://www.spinics.net/lists/linux-embedded/msg04435.html

Rob
