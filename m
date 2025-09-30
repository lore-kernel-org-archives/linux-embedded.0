Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B239E222564
	for <linux-embedded@vger.kernel.org>; Tue, 30 Sep 2025 12:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.254
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759236552; cv=pass; b=gs259FJpPqjMk0SV8uQ1BcC9CJpLLiyiEn+1tbS7abQ5D2TyOyPDedO9fthrUDvcEzQ3DTfJduiObdU/jzzeNOh4BR299nVscFxWW+EO4zNzTKDhBlFA0JNCR1R6P62/9x6wMJo9HHSuN7EiPORf1Qe9nCy9nzP8fvky2uWYBFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759236552; c=relaxed/simple;
	bh=6lpnK6WHhiowndmoLcjX8fzBUh6tdH0z7vRVzbQjipE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fUvKY5+aXk6ZX8oNtreiFZnBdBJZMam5V/o5/RXf/6feSkyCtksrcF1yo0hAiIL7Q1yStQe+EBcFbvHhaWH2aYoLey2/LWGYebZH2djNZlLJ0FWq4lKnkE0nEFACG3N2dLuBCTDps6p22B9K2egM8IY2wz9B2L+/8YaZFc5CYw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=GHARh49c; arc=pass smtp.client-ip=23.83.218.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="GHARh49c"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F103D1009C2;
	Tue, 30 Sep 2025 12:49:08 +0000 (UTC)
Received: from pdx1-sub0-mail-a208.dreamhost.com (100-111-81-141.trex-nlb.outbound.svc.cluster.local [100.111.81.141])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9677710033E;
	Tue, 30 Sep 2025 12:49:07 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1759236547; a=rsa-sha256;
	cv=none;
	b=4BhbD6jDE/M0I+TydlLZfXAsF7NGYnof1NfiSM0nnJRqy1sTq3Otzqu8qHAbU21VjrGgIe
	vD8wXZ6qNyBlhiNCJg286JkmE8mQhYtfGINxDkKkm0vwpnXYiJMHOAQQLwgKWQKMmyROAY
	/1/LM/8DaLjm6vAVfY+iqbf62nRq+dSA62Tm/fpMPMR66VVVZ0ifWtlXRNNxfvgdRPQ6OY
	tkvOlLPQwqCfS1SG3sc5Tx9tWtWp/ZHJHb1raZM/+P7AkJEq+U8sWnGANK06ephs1lLFx7
	qDkcFpv8Dm4TfkZOryNc1b6kPp6TzeLb4C2XgZeNGYw+atV8x7g4v2CjxP6/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1759236547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=LtL6L7IIdnBx8goCDfLYfw8aI6qnYWBd32yW7LgDcYA=;
	b=B88wSLFXkWEXpJW9i8Uk959T6tc1W3JR9AITovlcwwvZh9e4K5kHmg7nW71OkQ08MVKSdi
	6gIQku45ifT3zKMfg2EDrH4OWA3JEBVJKZclLyR0ogxgSm0tvag8KJ4wSUxmn5fT/ssWKs
	WM/9UiwDdZNg2pkA69HhlGMVGxlxDW0M8WqEf4Qt9hLMgtAGewb3Lcgs43H9mQGI9HF8xu
	uzr7HxNgS+tNXaoVSFkw8nn1ArWjMc7qpfoXt6XqoW6jZPu7+mO1fy8Uflzlam57D+jCyR
	EHwqGK8vg6ZptZFyfbl0YzJBpotALY9aYXc0/3ay6hyDGXXqxJU6IFxw/CHkKw==
ARC-Authentication-Results: i=1;
	rspamd-867694b6c6-ff9rm;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Wipe-Tasty: 399d32051630e5fe_1759236548725_3430784300
X-MC-Loop-Signature: 1759236548725:1129643077
X-MC-Ingress-Time: 1759236548725
Received: from pdx1-sub0-mail-a208.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.81.141 (trex/7.1.3);
	Tue, 30 Sep 2025 12:49:08 +0000
Received: from [192.168.88.7] (unknown [209.81.127.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a208.dreamhost.com (Postfix) with ESMTPSA id 4cbdD31cX5zF0;
	Tue, 30 Sep 2025 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1759236547;
	bh=LtL6L7IIdnBx8goCDfLYfw8aI6qnYWBd32yW7LgDcYA=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=GHARh49cmT39wxQO/YE+yHeKqwWwbximiSHu1JGP3SnWe9o89+sf/h5JE0tkohZzO
	 QepWapxbZtNJbhIcNxo7pdC/WCYUhngJYqDjkzcJUTT/gK3Q+yYIbWQiKZe4j3IgD5
	 tjVqrkL9kuASz1LuNEToeEKle2UpFDlkCQYuBHX2Xy4epiQE5jbcdA9z4jDMNjSph2
	 9aICt1UpcrP8rd/6g9QIq4dfrg8+ukT2UhGbsHEdThG9kVYaBXPnLHyB3MLj2CPag5
	 ZEqoN6Ik13MN1Mpt4KOcHN5QulaaZdenq/lZRDovUB0uPQ2LRw8x2KMhkYFOtWQckF
	 s9dxmmHqqRoFA==
Message-ID: <5100686d-0921-49b6-947d-b75209595e59@landley.net>
Date: Tue, 30 Sep 2025 07:49:06 -0500
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PREVIEW RFC 0/6] Add support for boot-time caching
To: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>,
 linux-embedded@vger.kernel.org
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/25 09:23, acampanella-thegoodpenguin wrote:
> This patch series provides a simple key-value cache for storing boot-time
> configuration data. The goal is to allow kernel components and drivers to
> cache time-consuming-to-compute values during boot, enabling faster
> subsequent boots by avoiding redundant initialization work.

Does the vmlinux build use --gc-sections yet so this sort of thing can 
drop out when it's not needed? (Marking it _init still eats early boot 
and flash space.)

The kernel build is a giant complicated thing using linker scripts so I 
don't want to blindly throw -ffunction-sections -fdata-sections in there 
but this plumbing strikes me as something that will penalize systems 
that _don't_ calculate expensive things and refer to them multiple times 
(or would rather eat the CPU than eat the RAM to do it). And adding more 
kconfig nonsense to have the build manually pull it in seems silly when 
the tools have been able to do this automatically for over 20 years...

Rob
