Received: from shrimp.cherry.relay.mailchannels.net (shrimp.cherry.relay.mailchannels.net [23.83.223.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E324B24E
	for <linux-embedded@vger.kernel.org>; Fri, 10 Jan 2025 23:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736550954; cv=pass; b=CIbj1joNYa48w1/QF9XVy6ABh5xUOgL+IIKwnsXVTSou4gh9QG4u9si5W7z2VO90LfaysBILwFm36wxQa6ITFf3lEa+4GPdfyYcOxBX/KVRWuWRtLKhKCTXa5pEO6yqHSNmV9LKKKmcV5g/ztmd6Is4Z9KaEFyYBCn5R6/t8lHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736550954; c=relaxed/simple;
	bh=frvGVlfuPQEBh6y/CgWv2xNO/x8ns1MVakjpDlGxaYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rRg3iQQHer2fpWHGfrBc7h7bwEG+DhVmEGwl3BP6as38ou/4casdYvybfKSZSQINabLbGi7r2gcP4/KJz4jn1+WLeI6IS+5qh48dG93jd3qcgCyGNuNEQ4GQzi5e0K/RRa6D0dWO+ojZyOFYvJXx9JtYI8jg/vrUIFaNc4XtIzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=by3m2zaw; arc=pass smtp.client-ip=23.83.223.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="by3m2zaw"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9CED58A43F9;
	Fri, 10 Jan 2025 23:15:46 +0000 (UTC)
Received: from pdx1-sub0-mail-a295.dreamhost.com (trex-4.trex.outbound.svc.cluster.local [100.109.46.209])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3099C8A4155;
	Fri, 10 Jan 2025 23:15:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736550946; a=rsa-sha256;
	cv=none;
	b=htHRoZjbPNgxvExcu9uwBta0DoPXdPeo3ua3/P9rxRjEVJc7lHZxcA7ya9wcrnkZJGOiU1
	19RRLEV+sxhPZPXE4z47TqsDgi54+GAvB9kcq8v5cb73iGw5otPZW1S2WcQEzD99aulI+i
	Uj16oVDJCzgmzPoARtEk1SHY2w8c0tZDoKHm7rBEFjoeVO7t8jw/okn538dogliKQJb55+
	WOYds80ICVuh4qryOVw2HWAgYdc6j1nVHGnDZGKkaskB6w2CCTsK/dvY7NycAlAd+0qm2h
	h6LoRnW+7/hou3K57vpX8XVmTwyX1aSqZnRLFMncXzWnBINVOe4Fd1eT0+0XKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736550946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=l0umemCn6oRxOcnfh6nTswNahoK2Ys3FkUaUmSpkfc0=;
	b=guoKkKBCiZSdyWuzkmH6rxlTInokGUSiCZMqPBQvugRq/aoNNxfV21c6sQ3tzL8dCmYOYH
	Oe+ve3pgvGrtfj1rhuI3cnDVLECWwlhCSY6xx64DweObycNDb+4TRBqYoCHeTEiOOfcrC+
	EeS/Xh2q9wjTyuTyYOrFHJoabRkRHyfvXjc5DR1ZQdR29tCdPTQxV5udUjJ7sYMsHlKSGJ
	biOy8Ge1HPTOZnwN8fPLnNmbJZI9pKDqp6jZby/EpWG66E4bqh/YtvA9luUmu3cVLe38iL
	O4MqiSV24QiXGE78lbKsnzUnhcY/MN95Z4Z9WJ/7VCnGeAV4xmNvqoi117pBJA==
ARC-Authentication-Results: i=1;
	rspamd-b5645c5d4-7nhpg;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Arch-Lonely: 2ddf923b1b2af98b_1736550946441_1504750320
X-MC-Loop-Signature: 1736550946441:281979278
X-MC-Ingress-Time: 1736550946441
Received: from pdx1-sub0-mail-a295.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.46.209 (trex/7.0.2);
	Fri, 10 Jan 2025 23:15:46 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a295.dreamhost.com (Postfix) with ESMTPSA id 4YVHZT3TBMz3g;
	Fri, 10 Jan 2025 15:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736550945;
	bh=l0umemCn6oRxOcnfh6nTswNahoK2Ys3FkUaUmSpkfc0=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=by3m2zawvPcOLZQTNvU9sO6hX+4XjiB7hVbVE+KRo/Y8C+PhxBBRRVSG//7DUAV42
	 7A8sNNC65XYz9BPCG2Y5SBbfCmj184pQ0gDF4ky+9hi0btqGEIZDrKd9Nj8GVOP757
	 UcrtjhOIBBSoEn45x6HT+2v5U8BjcgNsS8RTcee7AxVGBrwq3EePhgoDgVXPRqJDy7
	 Hc3Jj8bfQRy2aU4gxpd97X/hzwck35Gn/qY9LPscVwyEBa8a7j38k8gdSaaJSJQFpO
	 MZYwJ+PhzuFwlDwcrI6lJuS1VbReJXNfFFucYwxnNqfhEBnTFsnW479ZvonEXDX0es
	 yCDDdQpkFnV0Q==
Message-ID: <c70841da-3fe6-4b58-a24f-579dc3cc5dbc@landley.net>
Date: Fri, 10 Jan 2025 17:15:44 -0600
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-time]
To: Marko Hoyer <mhoyer.oss-devel@freenet.de>, "Bird, Tim"
 <Tim.Bird@sony.com>, Shankari <beingcap11@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <1c232997-79cf-4153-9b1c-6fcbc42121a9@freenet.de>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <1c232997-79cf-4153-9b1c-6fcbc42121a9@freenet.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/25 16:46, Marko Hoyer wrote:
> So I think it is worth talking a bit about udev and options to deal with 
> it but adapting thinks a bit to todays world. I'm currently registering 
> for the wiki, maybe I can setup an initial page at some time ...

busybox mdev is a lot lighter weight, and can do pretty elaborate things.

https://wiki.alpinelinux.org/wiki/Mdev

https://github.com/fff7d1bc/mdev-like-a-boss

The theory these days is you mount devtmpfs and then use mdev to add 
scriptable behavior to device insertion/removal events via netlink 
notifications.

Rob
