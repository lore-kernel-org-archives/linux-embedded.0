Received: from cyan.elm.relay.mailchannels.net (cyan.elm.relay.mailchannels.net [23.83.212.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FED1547D2
	for <linux-embedded@vger.kernel.org>; Mon,  4 Aug 2025 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337642; cv=pass; b=CiR5pz9t0t76vf1CwGCCowuVmJVGMB0fxJmbkiHU2+3CkbTF/QDWBmOqUDByUVn4ZR+krbukn49hKW8wwKhw6R4d95u9B6VJ9KKw5ST4i9HfsnvGi2zfe7H0ydSQbLSoexpn+x9pCpNbq+TaoQ486Lpx7hUlytNkIM2OuTwXALo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337642; c=relaxed/simple;
	bh=VI/c3bl8CO+jm20EKzye8WyLzGnuJNpWltKL23E3gOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=crJawQhXGzk3GxhK3SQa3MoalOMaKmle7+SKW+UGMtBm7My9J45wYbJz6/SlfxJxun02ramez2GoKj41Ot9a5gEX4oFEeZV+g2/W/39eWITkNM7npOHhnnN4ikS/tI6x1elhyDG/h76PB5Mo/oK6igtCoj1umUPiuPIdRldA+Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=u9TO5V2o; arc=pass smtp.client-ip=23.83.212.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="u9TO5V2o"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3FCD02C362C;
	Mon,  4 Aug 2025 18:05:44 +0000 (UTC)
Received: from pdx1-sub0-mail-a238.dreamhost.com (trex-blue-2.trex.outbound.svc.cluster.local [100.123.72.252])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id DABA92C18DF;
	Mon,  4 Aug 2025 18:05:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1754330743; a=rsa-sha256;
	cv=none;
	b=KYghZZwjO9FWnxQLEifs2/DTLEJve4XC60Ku2cYmF3X4O3RiAhXSODB15mMvZuKjPeTAIm
	cAkwwQMqRQR9Jj7M0Y58f6DKR+OuaRYDAwQjb1oGlE3CioUKlczbgYpaTai8WsFJ+IqzVH
	PZ/d2njw4h1H4IpYET/uFsZ5YP84zJUpw/lwDLxP28YsctO9zD/c0ZN5Jky8O8DED8sXxj
	iFCJxFFvr1qct4Z+YGyjSCK8MfCOHP6zNrdJZCP6Y8CM286SGTazPdMOdyJ7Hg/eJAf2Ux
	7Ni5vK3QtaDH81Z6Ilk5AMG4JGR7U/v7YFfp8Z4iL1HCtG+PN8kwWW2r7Y1Npg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1754330743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=8duUZwHrNpwdJSW7mTRGeSKSPKGGeQI5febvpZ+Etb0=;
	b=iPdK8yVBdrfrpjvhtwAr0iAaMhoOtEBwc4iFiZiNo2baUwugq5BDpcwxKwSo5R6w5zvD4h
	esCbJbFLmbhh1y7KGPp3MlmDUKTM4ofTfbr5r4siWt4CqWT7aTt500cWkO5m8le3/od4hR
	qbwYFoREyqMgHIwTBG3GUwW5gDac3CsA+tIQZQrvOjc+8cwvuz6NGLPe4ga5HicDaUPhBy
	1XIsaHWc9Br6Mg6ssQZMxNTERDmH/+QJMHAYuw7wzhIF9zApJ9QlJlaBJnF4rAaDQB/Jki
	V7UTjPAkkcnpZTYv9MLTSbpup62H7VkQTyV9kL6SFmWK8cFWTQm0TRxk3B5hUw==
ARC-Authentication-Results: i=1;
	rspamd-6dd66c5bf5-5jxgw;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Imminent-Illustrious: 0dacef507af0a66b_1754330744117_1672062302
X-MC-Loop-Signature: 1754330744117:2473097617
X-MC-Ingress-Time: 1754330744117
Received: from pdx1-sub0-mail-a238.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.72.252 (trex/7.1.3);
	Mon, 04 Aug 2025 18:05:44 +0000
Received: from [192.168.88.7] (unknown [209.81.127.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a238.dreamhost.com (Postfix) with ESMTPSA id 4bwkxg3Z25zHd;
	Mon,  4 Aug 2025 11:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1754330743;
	bh=8duUZwHrNpwdJSW7mTRGeSKSPKGGeQI5febvpZ+Etb0=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=u9TO5V2owhAp2ArjSvapVKzYo4g0fHI9N94lpx4dRbd+dFsyoTB62Of/pcBpHbkC4
	 B3bnhojxmvLaWeseDDiutHZruy7IsU4wSjDzwupgshBocMY3z36C9oYyiAWyILC8t6
	 nVh4UoA2BsYGWcTurLEKOUIAEf0HtZeGcMuR8g86JvkhdEJPtGSxTDPGQX/AQjrS0t
	 G0hKVHrqnu9dH1q0puuwQq2HujdeOWHB45yrj9qRZw2msmfp8cUgLDkT9DP3ISD+RB
	 115F0KH+T60nDnfGmuMqdSXkT6zWoJpsqwGYrknIGPEuTfnnVzaySneqAQKgnWP3R+
	 3E82g+EyBDZMw==
Message-ID: <56e24313-cb40-445e-b2e2-900fe7e27b33@landley.net>
Date: Mon, 4 Aug 2025 13:05:42 -0500
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-time] New page for tracking boot-time activities
To: "Bird, Tim" <Tim.Bird@sony.com>,
 Linux Embedded <linux-embedded@vger.kernel.org>
References: <MW5PR13MB5632D3415109C228182DF2F3FD7DA@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <MW5PR13MB5632D3415109C228182DF2F3FD7DA@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 14:06, Bird, Tim wrote:
> Hey kernel boot-time developers,
> 
> This month, I'm replacing our regular Boot-time SIG meeting (which normally
> happens on the 4th Tuesday of every month), with a Birds-of-a-Feather (BoF)
> session at Open Source Summit North America, as part of the Embedded
> Linux Conference track.
> 
> Tthe BOF is Tuesday, June 24.
> See here for session details: https://ossna2025.sched.com/event/1zfle?iframe=no

Was there a recording or minutes of this meeting for those who couldn't 
attend?

Rob
