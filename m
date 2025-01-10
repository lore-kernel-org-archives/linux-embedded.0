Received: from mout3.freenet.de (mout3.freenet.de [195.4.92.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15C2144CF
	for <linux-embedded@vger.kernel.org>; Fri, 10 Jan 2025 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.4.92.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736549193; cv=none; b=f+6HsbV4iTiTYX6Ba80GRqNj3o2RlXnKR5vdh6Wf9vpuvpL3/Qz7Yu7lyOUVzK0vNqPI9gh1HGvJJKehH8QbcuVuFgLnxw4bv5+VxULoLQbX3aiLWbBy1HXwoKtUcI7GczRu43dtNj3cBpX1sI2lFOSHDM/vTD0imcmUBv22AUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736549193; c=relaxed/simple;
	bh=onJwHpg7L/f1K9jnATkIRdh4+FiqmSQ+QZCFcMWrlac=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HV2sMZhV22pSAZATe8bo1vTLbngNGcnOUhX1dJzPE1+IzaHaH+/rV2F2TynlsHd8mjXrbhib70/Xzq1vUlOVql6DcWdT4hrWGdbDXhoGxy8u54XkLc/N5b90uCAUPcEHK3KS/Qw4U4l61vj8bURi8Fj8nM/gdCmjFfgKUYriAkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=MKC5qQZ7; arc=none smtp.client-ip=195.4.92.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="MKC5qQZ7"
Received: from [195.4.92.121] (helo=sub2.freenet.de)
	by mout3.freenet.de with esmtpa (ID MarkoHoyer@freenet.de) (port 25) (Exim 4.94.2 #2)
	id 1tWNlj-00GqFX-E2; Fri, 10 Jan 2025 23:46:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OKzsuCN9uc9fZV0SKdbxwH+VSpf7jp9EQiJXCudpics=; b=MKC5qQZ7BWs6pg0Ok0pUUdWYs5
	D4xG7+bBCtWQ99kIQ6T9yuqkf44z03mxx740Lujyuqh8cBpIaqny2rrGnWGVYdHk88Q2BTvZwViKI
	Flp9gFqPRXmv7E7J9g8ChPa64VF+4E2PHMSUSdCuTU8cGhzMKL1a3p5cvMyHLg5SqcF/5iqrKPbzQ
	o7qS6JKVfOidNlx7owJbeRuO16Yh2CCd/55gpy1laE4xjMgXK7NToSMORkp1KlkipeGYMVD1In1g2
	3EusiokFlES/v9k5OBA1mKEYWosZIt7pQtUdVwixQniMiJ+nGBW59lD5a8ww7VmFokcGelSBIr073
	xfSduogw==;
Received: from [2a02:8071:7010:720:67d:2069:b775:1979] (port=52188)
	by sub2.freenet.de with esmtpsa (ID MarkoHoyer@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 587) (Exim 4.94.2 #2)
	id 1tWNlj-00CXUm-4A; Fri, 10 Jan 2025 23:46:19 +0100
Message-ID: <1c232997-79cf-4153-9b1c-6fcbc42121a9@freenet.de>
Date: Fri, 10 Jan 2025 23:46:16 +0100
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
From: Marko Hoyer <mhoyer.oss-devel@freenet.de>
In-Reply-To: <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 17365491797F9310FE6302O
X-Originated-At: 2a02:8071:7010:720:67d:2069:b775:1979!52188
X-Scan-TS: Fri, 10 Jan 2025 23:46:19 +0100

Hello Tim, all,

Am 08.01.25 um 19:33 schrieb Bird, Tim:
>> -----Original Message-----
>> From: Shankari <beingcap11@gmail.com>
>> Hi
>>
>> I wanted to provide an update on my recent contributions to the boot-time reduction project. I have recently started contributing and
>> am working with the beagleplay. I have been analyzing the boot time of the init process. Below is the output from the system log:
>>
>> debian@BeaglePlay:~$ dmesg | grep "init process"
>> [    1.480490] Run /init as init process
>>
>> Moving forward, I plan to explore ways to modify the command line and further investigate the data used for SIG analysis. This will
>> help me gain a deeper understanding of the boot process and its performance characteristics.
>>
>> Please let me know if you have any suggestions or areas where I could focus my efforts.
> Hi Shankari,
>
> It sounds like you are off to a good start.  I have something that needs to be done, that I think
> you can help with, and that matches where I believe you are in your status with being able
> to evaluate the kernel.
>
> In general, there's a lot of information on the elinux wiki which is stale, which needs to be
> updated or archived, or maybe even just removed.
>
> This section of the Boot Time page has a lot of material in this category:
> https://elinux.org/Boot_Time#kernel_speedups
>
> Can you validate the information on these 2 pages:
>   * https://elinux.org/Disable_Console
>   * https://elinux.org/Preset_LPJ
>
> This would consist of reading through the material, and testing the
> described techniques on your machine.  This will involve booting the
> machine 2 ways, with a particular kernel command line option and without
> it, and then reporting back the final boot time for both.  You can use
> the timestamp for the "init process" string as your final boot time, for the
> purposes of this exercise.
>
> Helping me to update the elinux wiki material on boot time would be
> an immense help, and is one of my main goals for the boot time SIG in 2025.
>
> Don't hesitate to ask questions if you have any.
>
> BTW - you can just report your findings to me and linux-embedded list, but
> alternatively (and even better) would be if you could also update the wiki
> pages themselves with your information based on recent kernels and hardware.
> To do this, you will need an elinux wiki account, which you can make online on
> elinux wiki.org by going to this page: https://elinux.org/Special:CreateAccount
>
> Anyone else reading this who wants to also participate in this project to
> update the elinux wiki boot time information, please contact me.

I'm just going through the "userspace application speed-up" parts in the 
wiki.


To the udev stuff ("Avoid udev, it takes ..." and "If you still like udev"):

* both hints seem to be a bit old fashioned to me taking the kernels 
devtmpfs into account

* In my experience, device nodes are created by the kernel today, I 
never needed to use any kind of mknod call anymore

* udevs job today is mostly about

     - setup of access rights and user and group ids of device nodes

     - creating symlinks (e.g. for partitions named w/ their UUIDs, ...)

     - loading kernel modules

     - annotating metadata to uevents for interested userspace applications

* In any way, udev is still very expensive when used the conventional way

     - Once udev is started, a trigger is send (by 
systemd-udev-trigger.service or udevadm trigger, for those who don't 
like systemd ;)) through the whole device tree to let all devices sent 
uevents again so that udev can work on each device. This causes massive 
CPU load for e few seconds you don't want to spend so early in the morning.

* There are options like selective triggering or moving the trigger back 
in time and do the setup manuelly ...

So I think it is worth talking a bit about udev and options to deal with 
it but adapting thinks a bit to todays world. I'm currently registering 
for the wiki, maybe I can setup an initial page at some time ...

Btw: If I'm wrong with my experiene about devtmpf and mknode, please 
correct me. And feel free to add other ideas to cope w/ udev in context 
of startup time critical systems ...

Regards,

Marko


