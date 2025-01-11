Received: from glass.ash.relay.mailchannels.net (glass.ash.relay.mailchannels.net [23.83.222.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D543C1494CC
	for <linux-embedded@vger.kernel.org>; Sat, 11 Jan 2025 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736618624; cv=pass; b=EvTtEGzw9Y8h2Bdpgs1jXxsLj5PhZQSZxUxt5DV/qvxHfxFsjdJJDLLpRUvzebeXwXqqW+kBV27M9JAMDSLhA008QJNVm85ZOn5TpoL8Pk1zvXRtnBM74kMAGrMxFIBLExkNB6VNjxL3zeoTeYsSv3uCdcGhYcAejc4YbI9ubHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736618624; c=relaxed/simple;
	bh=Ui16VZ1CkTaGGBUC6t2DtVila8mehCSrYudEcsXUbio=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=W1w6AicGbR+bMcPV7iWLVaBrhRRy4xSqNp3fIcUAMs3Ki3KToKRwUWEA7DaNVMimN8+hVaFwkYCmC87gdK9GYRdhsyBCpoQhn9JT7DDovhtBFsbeLMcJyhTXu2zisWHDIP+XBBFT3l749wh3hP/wPWvXyjQVU9VfBrsO/SDUVhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=IUe3F2Jq; arc=pass smtp.client-ip=23.83.222.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="IUe3F2Jq"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0A5CF163B7B;
	Sat, 11 Jan 2025 17:56:19 +0000 (UTC)
Received: from pdx1-sub0-mail-a206.dreamhost.com (trex-1.trex.outbound.svc.cluster.local [100.109.49.178])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 96469164504;
	Sat, 11 Jan 2025 17:56:18 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736618178; a=rsa-sha256;
	cv=none;
	b=PIZrwBpVM4xXiQtpy6d+c0/q9Hv4j8i+axvW1Bacrq07tOFxT2lnFv+dY6ktnnhTEeddBx
	Ev2Vkmf7ou5z3KprOeBcDHRbc2b9NswbfvBouSke+BzZuvVatotJL7pjKQSRv+FpUkbDKW
	G67vRKlS1pD2ruXa/Z5prU0NPqDQJRbKEubymzEp9JzY92LBat74eqXMCcPHka/xo+wOfG
	uPExk5PPsjOT/nPuk97XZssJLmzAYdWnUN+wOTFxnGA5JXSpGooHO8PBiv0DGkE1WyzcUb
	kPw0vtMUsGg5gurbTrjxd6fhhYwtxSAn3us8aOg4Ofzvn8fjoI4V7Lu/uFYWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736618178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=BaxCg7UmceLdEdJDsmYSJmh3NUlJ5lZU15wzegbb9AA=;
	b=rMK+DPmkSsA5dQApj/V9IdsvxKs3DBPq9r6g500kbKJb2uSexcawDfat3fiy7fnsMwIEXZ
	QOfXDWdL6WTp+Q6e2LVtC1D38RRPT3nu4NdpFFGG3fvGYepl/7QOWbC55R4zSHQI8goiQ4
	lFcQRd+EPPUcE5I3dO76uzg+JbLIrs7huY0n7z9D7O5yHdETSiD4K7edgQoObbLCR2FeZg
	yHTDfLPibfXoWbSii93a1dnByGeSkbOGr7lVAUQWwdxsDfIhMpiP2UMZ2fpxpOsgWM3yxK
	oVu4ij9rhB5KWFQ6YGqHvckIxx03pcdOHbgOYzEwr3pM/ScWT0dhK3bxeuC3ZQ==
ARC-Authentication-Results: i=1;
	rspamd-b5645c5d4-rwdfv;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Skirt-Trail: 718d8fca509c18ae_1736618178847_2139350993
X-MC-Loop-Signature: 1736618178847:2706584668
X-MC-Ingress-Time: 1736618178847
Received: from pdx1-sub0-mail-a206.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.49.178 (trex/7.0.2);
	Sat, 11 Jan 2025 17:56:18 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a206.dreamhost.com (Postfix) with ESMTPSA id 4YVmRQ0bT2zJk;
	Sat, 11 Jan 2025 09:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736618178;
	bh=BaxCg7UmceLdEdJDsmYSJmh3NUlJ5lZU15wzegbb9AA=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=IUe3F2JqHTqrMq72A1KTIhO5S5dsjXrRXGCwmF9FC5Ja871KFG4vREBegpCeXNZX0
	 sypo+PNETNBlaOI/lItqvQCZkTMoC/pDA5akM599FXZ4SfGrzBxvkN50MleCOAPsxV
	 AopmE71Gr+yw0rqDjhyVNilDsvLcON2pycH2GeysmuSoPV09PhTl3gwks7dHigFyfv
	 XZ3CURqYJODgZZP8F/oBgcIMNkbEPpMaox0nxgof5/e6MMiy3DSuJdMKtQgQcgw5I1
	 Xgq0Avk4wylNMPlI1fn1oYkl5TjStKIVhXSvzaKxpRX9nps2X9ccp43h8IsdQaSHTK
	 Z8vOpy1/oXc+Q==
Message-ID: <98ae21b7-43bb-4a72-bd50-0b13f9700734@landley.net>
Date: Sat, 11 Jan 2025 11:56:17 -0600
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
 <c70841da-3fe6-4b58-a24f-579dc3cc5dbc@landley.net>
 <1b6e380d-000d-420a-b198-ecb68c356d34@freenet.de>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <1b6e380d-000d-420a-b198-ecb68c356d34@freenet.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/25 02:40, Marko Hoyer wrote:
> 
> Am 11.01.25 um 00:15 schrieb Rob Landley:
>> On 1/10/25 16:46, Marko Hoyer wrote:
>>> So I think it is worth talking a bit about udev and options to deal 
>>> with it but adapting thinks a bit to todays world. I'm currently 
>>> registering for the wiki, maybe I can setup an initial page at some 
>>> time ...
>>
>> busybox mdev is a lot lighter weight, and can do pretty elaborate things.
>>
>> https://wiki.alpinelinux.org/wiki/Mdev
>>
>> https://github.com/fff7d1bc/mdev-like-a-boss
>>
>> The theory these days is you mount devtmpfs and then use mdev to add 
>> scriptable behavior to device insertion/removal events via netlink 
>> notifications.
>>
>> Rob
> 
> Hey Rob,
> 
> thx for the hint. Sounds good!
> 
> How is the enumeration of cold plugged devices realized in mdev? Is it 
> similar to udev triggering all devices in the complete device tree?

mdev -s will scan /sys for current devices, it can be run as a hotplug 
helper, and there's netlink support somewhere but I've never used it.

https://busybox.net/downloads/BusyBox.html#mdev

The hotplug helper doesn't require a persistent demon like netlink does 
(or udev), at boot time you "mdev -s" to scan, then when you register a 
hotplug helper the kernel spawns a new process with environment 
variables whenever there's something new to do. The downside is if a lot 
of events come in rapidly it can spawn a lot of processes in parallel 
which makes sequencing difficult, which is why the netlink API exists as 
an alternative, but that doesn't really happen in systems I've put 
together, so...

I wrote some introductory documentation about this back in 2007. It's a 
bit stale, and never REALLY got finished, but...

https://landley.net/kdocs/local/hotplug2.html

That's the context within which sysfs happened.

/dev and /sys serve different purposes: /dev shows the device drivers' 
view of the system, full of devices that don't actually exist like
/dev/null, or five devices for one piece of hardware (partitions), 
meanwhile a device that shows up but doesn't have a driver bound to it 
yet won't be in /dev at all. This is half the reason the old 
demon-managed "devfs" failed, it was CONCEPTUALLY wrong. (The other half 
was it used crazy solaris names for everything so people looking for 
/dev/hda1 couldn't find it and had to deal with some 9 character long 
monstrosity instead. Plus Linux isn't a microkernel so expecting a 
userspace demon to be necessary for /dev to _exist_ was just silly, and 
also led to some problems booting the system because were does that 
demon get its information from, eh?)

sysfs is a hardware view of the system, where /sys/devices/pci0000:00 is 
full of what bus probing found, and  /sys/block/sda/dev contains "8:0" 
(major and minor number) when a driver binds to something and goes 
"mine", but something still had to mknod that.

devtmpfs is a synthetic filesystem that just DOES that, when a new "dev" 
node shows up under /sys/class or /sys/block it creates the apropriate 
char or block device under dev with that major/minor and the same name 
the directory uses (which is provided by the driver).

Oh, "synthetic" filesystem is one of the four times of filesystem: block 
backed, char/pipe backed, ram backed, and synthetic. I wrote 
documentation about that a very long time ago...

https://landley.net/toybox/doc/mount.html

Rob
