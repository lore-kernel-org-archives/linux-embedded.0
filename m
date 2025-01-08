Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113722611
	for <linux-embedded@vger.kernel.org>; Wed,  8 Jan 2025 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379129; cv=pass; b=lwIZZA52gQhwycoKGSUPse6Gr4XmZlaiYjGsXx1P73B6F42dCs21rxdfk9qKZpToFPHvdMgV9yk7MKa8crFPEYmlOeuZa+7i0Nfimryxow6QEDORywZkaseRwR+vJN/YZ2WoqcOARG0+QyTc4Ex6vIHEqu9JmxrIzP7C79YiwpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379129; c=relaxed/simple;
	bh=PL0/+MI90vuQhayK4TWt4JaziInd1qTjR5E8Pf9ibHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jO8lIPT6922LlfVnoEIHh4YQlJaxctKsaSBJC6XxKe2JODIQH2p3H48wUJWuT2WIPG3o4pADmXOMb7a7+SHnrQyO7/YM/s8Lar8PYHWCVsJxllVyH+NGfvYcTtJKmlxnzNgV4y+q/iBl2VykCNkPI/wRDvFSPei0ILg+KP5gI+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=hu5WfPAg; arc=pass smtp.client-ip=23.83.218.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="hu5WfPAg"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D5F12783979;
	Wed,  8 Jan 2025 23:26:27 +0000 (UTC)
Received: from pdx1-sub0-mail-a296.dreamhost.com (100-109-30-103.trex-nlb.outbound.svc.cluster.local [100.109.30.103])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6F2EF784707;
	Wed,  8 Jan 2025 23:26:27 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736378787; a=rsa-sha256;
	cv=none;
	b=Ala9Tod1763tyRkAj+z7+ac2TC93JMNrcMBLAzNdlOEDUB1WS9AwAmX+X2xIcaUeylg06V
	9uTN+nAeqGEgPwuZvSHQsq8RfRR2X+2P2EtTOfqOAVad5CSqhd0rJXt3UgI28SSOduBNix
	luCGan0ux99WA0K+zSHjigaOg28hfFEnRDHayBjGgkQ+4tBiGuMO12+dDHvTm42prNqASR
	HHKECSgjHeIt5qpZ4ALIoyXLHp+gxUTL+Yhoo6gZeNdLMZ+F1gUCoYozR6j1iID97V8SYk
	bR4woDdecSoroRQ0t8MQaW+duBPMX/fxXgR3yYzlH+Sz2UaOSTwvX6B6P6T4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736378787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=cYTAue8yJn+5kCUPbB518FArNHYS0WX6lEUK22PZ5Nw=;
	b=eVHgtLbJ5Cwlg7eSllHXbxuKZFo09Wd8dhWk8kAQ/+sN8Dj23tk6nvxviG80JNe7MEeiGL
	xYsZJla5DVp5rChq6WK3pzRCDqJuc6fNR1M3+ZY5CI1/SW2YyAjm313318EmSMDa23U0J2
	d7UgowSO47TY2RB40yCNNnTsa7IT875ZtE0eKOdFbR5jmoQhLY1h+p/MeM4p1Yb/OXqiHI
	rnzzxlKoELIPk3IpcCgqQuP3/9kmx9SzZer82lGJPdXbJn2JBvGDW2S2as4hqT3l149XdN
	k7fYveq3oqDqSf0lkIpxcitHNK+247qMachI2ThdKW85cGsaKGPAWRuM9Um/iQ==
ARC-Authentication-Results: i=1;
	rspamd-7df4dcbd86-c7g8z;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-White-Interest: 015da39f64af7400_1736378787695_3363432801
X-MC-Loop-Signature: 1736378787695:3232842358
X-MC-Ingress-Time: 1736378787695
Received: from pdx1-sub0-mail-a296.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.30.103 (trex/7.0.2);
	Wed, 08 Jan 2025 23:26:27 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a296.dreamhost.com (Postfix) with ESMTPSA id 4YT3vk6Yrrz8l;
	Wed,  8 Jan 2025 15:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736378787;
	bh=cYTAue8yJn+5kCUPbB518FArNHYS0WX6lEUK22PZ5Nw=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=hu5WfPAgwnhlUOir4jHvbYcDJZt4dHvmw6+Dizz/J8B0KoDnVKHF7LHxrPQJvtbpS
	 9Ob5PAuDLVXb7VxYKm9AtahJN8yWp9o63DNkjkPTmY3pOdgcuffgqx5ip1QmMOagIs
	 HGDrCY7fZRn7GN2j5u/PfwkcGY5ccvZs9I71C8ypgea8NiLrQl9ktS2eeiAFmofirw
	 2Byyb31O6ZI1pkt0bYp0y9SaoUmuxu1pJwYkgvogtwJZDDi0TMpK3FH0RYAzZ+zOIn
	 lP1zF+TERjtUuEXImVW4fyjkP+jY8030OLJdiiXlKOZZBQam8a2ZMWhbULrziFE8RW
	 xivg1t3DTNCBQ==
Message-ID: <ca1212ef-4d60-4947-9180-d2b3f127e0fb@landley.net>
Date: Wed, 8 Jan 2025 17:26:25 -0600
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-time]
To: "Bird, Tim" <Tim.Bird@sony.com>, Marko Hoyer
 <mhoyer.oss-devel@freenet.de>, Shankari <beingcap11@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <b0dd83c8-eb23-494b-8f23-ea8c084405a6@freenet.de>
 <MW5PR13MB5632E7FD9A5E76949625BA54FD122@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <MW5PR13MB5632E7FD9A5E76949625BA54FD122@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/25 15:19, Bird, Tim wrote:
>> Cases:
>>
>> - #1 quiet: cmdline w/ quiet, no kernel or userspace output up to the
>> serial login console
>>
>> - #2 normal: cmdline w/o quiet, serial console @115200 baud
>>
>> - #3 normal_baud9600: cmdline w/o quiet, serial console @9600 baud
>>
>>
>> Main outcomes:
>>
>> - kernel timestamps "Run /sbin/init as init process"
>>
>> #1: "1.714458", #2: "3.011701", #3: "16.108101"
> 
> Wow from 1.7 seconds to 16.1 seconds.  That's a pretty huge
> difference.  I guess this particular technique is still
> very relevant!

CONFIG_EARLY_PRINTK output is emitted before interrupts are enabled 
(last I checked they didn't kick in until RIGHT before PID 1 gets forked 
off), so the early output drivers spin waiting for the next character to 
go into the buffer (the memory mapped register ones look something like 
"while (MASK&*status); *output = *data++;" in a for loop) and the 
printk() call can't return until all the data has been queued to the 
serial hardware, so you spend a lot of time blocked in printk().

With 9600 baud 8n1 output, 9600/9 = 1066 characters per second, or 
approximately a 1ms wait between each character, blocking in printk when 
the hardware FIFO buffer fills up, so 16k of output data takes 16 
seconds to write if the rest of the boot is doing NOTHING. Even a 1k 
hardware FIFO is only 1 second of output, and that's assuming all 1k is 
outgoing rather than split between in/out.

Your options are:

1) disable early printk so it all goes into a malloced buffer until 
interrupts are enabled and it can be asynchronously flushed (meaning if 
something DOES go wrong in early boot you can't see it)
2) set your FIFO speed as fast as possible
3) have your default boot use the "quiet" option (similar to disabling 
EARLY_PRINTK but at least you have the option to yank quiet from your 
bootloader args without rebuilding the kernel.)

Faster UART speeds mean shorter serial cables (although there's also 3 
volt vs 5 volt, wire thickness/capacitance, and some other stuff, Jeff 
Dionne walked me through the math last year but I don't have my notes in 
front of me). Modern hardware can do up to 4 megabits/second but outside 
"this serial chip immediately talks to a USB chip and then it's 
transported as USB with the funky noise-cancelling signaling over VERY 
twisted pair to actually leave the board"), I wouldn't trust that over 
any real length of cable.

Alas 
https://tldp.org/HOWTO/Remote-Serial-Console-HOWTO/serial-distance.html 
is from the dawn of time and only goes up to 56k over wires made from 
recycled drainpipes. 
https://novatel.com/support/known-solutions/maximum-cable-length-vs-data-rate 
says 115200 is 2.5 meters. It LOOKS like it scales linearly with twice 
the speed being half the cable, so a megabit would be about 1 foot of 
serial cable before the bits get all mushy.

Rob
