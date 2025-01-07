Received: from black.elm.relay.mailchannels.net (black.elm.relay.mailchannels.net [23.83.212.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E331F37C0
	for <linux-embedded@vger.kernel.org>; Tue,  7 Jan 2025 23:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736293219; cv=pass; b=Fgc5RW2VnDfTWCnaFxmtcQb2NxPu+GtGc0hKe77lZCH5fwQVGJjDJCf0OezqkY4Hf+Qf0HNRm6xKnQv7B79SlrG9dGLsy809y9PElj20EkeTzDl5n07+7RmO6UsYviH7pSYvHhmOKNc5ZMZYMzIo6g0QvHe8eB0sTPZcDk4piwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736293219; c=relaxed/simple;
	bh=MAb+9a7TE99H30NoIz1KuxBrk+OVCRMx4Q+OYWsN5Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9q7yLtYZxERkDxmrv7FSYslJUQKlxCrHVqHKz5GovpX3Nkoyo1YmqTANgAlPvt970Ofx89y64gbNDxQUyYG3oQ6yiWkjVTh6kLxzfjAWQeT+KB/jkeUqoQcJB7UkhozLAKWrCB6gQ2wMCib1bkGs2MAqP54gJfFKpFbQ+OjtVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=jO7QwvW1; arc=pass smtp.client-ip=23.83.212.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="jO7QwvW1"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1F4D481DB5;
	Tue,  7 Jan 2025 23:40:16 +0000 (UTC)
Received: from pdx1-sub0-mail-a234.dreamhost.com (100-111-29-79.trex-nlb.outbound.svc.cluster.local [100.111.29.79])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A183E82695;
	Tue,  7 Jan 2025 23:40:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736293215; a=rsa-sha256;
	cv=none;
	b=2LtDTjrC99l82OgXLpIR/qF4Wm6197Q6gBeR42sj+oFA3GSuq+nBF8SQUGaHsIL0Y1Br59
	ldsQhI+a2iFUbfnZWP4SeI5h6AVttI02GHbuWB/jOpSMvuids203i+7EHkfbIa7Q0iHCMz
	5wPr4omoUt23AAxvKP+X4zu2wiXmz94Sw8NeX5BbC5gpOFV+kZGiTMwJvaJ8hFQBfcXuOs
	EOw8qqrufSiDn7CWqsOuGqKt/aCX1rKbeAInrOvFCvTPyXw/sfd7UGGd0BzYsuAty9ulmK
	rnviVMOEaJKGRhGdzL+8lQIG1DTQ83yWKHFI0FJ/lCdQ7qsOTtevYuZ1Ne/uEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736293215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=MzZVLt/froHNJpqS/hnTr0WcD2TA71IY/I10TjTbdLM=;
	b=4EPKu0BUSK6OuzOQ+YCVMXvmn/kMKIvm06k8RRxaXfTZy6BA6zCXzWubdNpSupXgcOHBOF
	KKFOsodNpAZh2tniiXzq/lOr4rcrLGmr0skbjj54Ek0sTVuROcIH57ST/2ATfR7mTjYwN/
	TGZumoSUSFMsNoJaiNlJHBW8Y8GFOa2meaJGdjtrGUZ81e1feaXIcmxCU1K1nWNyZw8JRc
	CutGx5O0KnSav/L8SMwdEAeOzkYyjntVGvRsGtB0l0/UO9QAQDpsWyFPzEFvcxZRRzuwFf
	58gdriq3cp7RV0aMn2QkehiLDap3it66c5ahSXIMn1zn95kVIocP68Z0ljnH0g==
ARC-Authentication-Results: i=1;
	rspamd-7df4dcbd86-ljw2p;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Illustrious-Eight: 6a8b43d01e04a5f0_1736293215903_3241086808
X-MC-Loop-Signature: 1736293215903:3622484467
X-MC-Ingress-Time: 1736293215902
Received: from pdx1-sub0-mail-a234.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.29.79 (trex/7.0.2);
	Tue, 07 Jan 2025 23:40:15 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a234.dreamhost.com (Postfix) with ESMTPSA id 4YSSG70Ghxz67;
	Tue,  7 Jan 2025 15:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736293215;
	bh=MzZVLt/froHNJpqS/hnTr0WcD2TA71IY/I10TjTbdLM=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=jO7QwvW1L8oZSqv0r9LB0yzBQV68joLMa5DO67oItlIopYi6cGwVRvRaOqquycLtY
	 SfOGpHxvpCqBU8Xehbj0KdYtFy6VXAVjlzhb6xSh5g8nG/OdGdVD9tby9ufmmUj46V
	 UT4IoGgkWrVyTHuod3NF95GQMvzuRg+J1/5lMCp0JQf0B7CMxbbb0MXGWaxoCGKMRT
	 kFI+jzKnts8l3cAEGWfPjN02jhJzNoo3t2nVS7wzABdt8E+duLgWe0ZwvU31MY75oU
	 AAnoHfSZANki0Ar+YBTScUPduPymGARvCCBvjTb6uu9+ktUueFPpbp0j/WXmmYJEoS
	 USEm+HyRaar0g==
Message-ID: <211b015d-44e5-4e64-9e44-5968d86dfac4@landley.net>
Date: Tue, 7 Jan 2025 17:40:13 -0600
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: boot markers ideas (was RE: [boot-time] jent_mod_init on
 beagleplay)
To: "Bird, Tim" <Tim.Bird@sony.com>, Francesco Valla <francesco@valla.it>,
 Stephan Mueller <smueller@chronox.de>, Shankari <beingcap11@gmail.com>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>
References: <1964175.7Z3S40VBb9@fedora.fritz.box>
 <4095066.UUX0tPYDPe@tauon.atsec.com>
 <CAORPcfUfgNnQb6m0baW9qEGnrGYsnbpvwUUmF5Y9Byh9_iMAZw@mail.gmail.com>
 <22372644.4csPzL39Zc@fedora.fritz.box>
 <MW5PR13MB5632780514DC36D18EE9AC33FD112@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <MW5PR13MB5632780514DC36D18EE9AC33FD112@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/25 15:42, Bird, Tim wrote:
> 
> 
>> -----Original Message-----
>> From: Francesco Valla <francesco@valla.it>
> ...
>>> I wanted to provide an update on my recent contributions to the BeaglePlay
>>> project. I have recently started contributing and have been analyzing the
>>> boot time of the init process. Below is the output from the system log:
>>>
>>> debian@BeaglePlay:~$ dmesg | grep "init process"
>>> [    1.480490] Run /init as init process
>>>
> ...
> 
>>
>> I started the same journey around a week ago, and it's proving a valuable
>> experience.
>>
>> After some trimming, I reached a (reported) init startup time of around 0.6s:
>>
>> root@beagleplay-ti:~# dmesg|grep /sbin
>> [    0.630046] Run /sbin/init as init process
> 
> 
> I'm starting to think that we should be using this particular kernel message
> as a consistent "boot marker" for kernel startup time.  It's certainly not the
> end of when the kernel is doing stuff on startup, but I do believe it marks
> one of the important transition points (start of user space activity), and
> it seems to be ubiquitously reported.
> 
> At Plumbers, I had proposed to introduce a set of specific instrumentation
> points in the kernel and use those as key checkpoints.  But IMHO it's good
> to use existing printk messages where possible, since they're already present - no
> additional instrumentation needed.

Is there a place to get this measuring script other than fishing it out 
of a webmail archive?

https://www.spinics.net/lists/linux-embedded/msg04363.html

The most recent wiki mention in the archive subject lines was 
https://www.spinics.net/lists/linux-embedded/msg04336.html and trying to 
find this effort in elinux.org's top right search bar found 
https://elinux.org/Boot-up_Time_Reduction_Howto which "view history" 
says was last touched in 2010...

Rob

P.S. Meanwhile, python 3 goes in quite the opposite direction: 
https://landley.net/notes-2024.html#09-04-2024
