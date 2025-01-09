Received: from mout1.freenet.de (mout1.freenet.de [195.4.92.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816D216E37
	for <linux-embedded@vger.kernel.org>; Thu,  9 Jan 2025 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.4.92.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426953; cv=none; b=CD4uQoVG6gHa6kHY2X6zrgPDKdg0nbfKR9uGdx53PyjCOGvjvd+oGQh6tmAUsNieMMYdBuCxVHVcS8ZFVxOQT72kjCK5rG1xplGC0Tr2Vx7TgJJ00Tt7QfHtd7wMV1ZYsokMRxF0JfL2TGZxLiBEzSRpNSoqnPz7uKqRkNenwYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426953; c=relaxed/simple;
	bh=F8FCeL3q0zrv3n5N6ty65OUstyY0FzCHEKtb9/48ii8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c+dRfMUVfoOC+Y8ASP2kfOdEBR2vkxCB8fiu2ET86f6natLD3SGY/ezK5kGpVwRWRMrAdEK9Pik506IzxeA9aPcNepSbfKdAHxHh3kGlWEEkQl6uUmGw9P2zgHTEmHtq98pvaH9RkRkxt6Ha0Rm7u7PRZ4uBUrsI11ta2vqxxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=iIfSSqnZ; arc=none smtp.client-ip=195.4.92.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="iIfSSqnZ"
Received: from [195.4.92.119] (helo=sub0.freenet.de)
	by mout1.freenet.de with esmtpa (ID MarkoHoyer@freenet.de) (port 25) (Exim 4.94.2 #2)
	id 1tVrtE-00CuSt-Lh; Thu, 09 Jan 2025 13:43:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0L00pX8aSDb7y3GpBA7ye3Lsvu4eLMtyByD0Bs7I3Do=; b=iIfSSqnZ9P6ptesa2UmAw5kVJa
	D+TQu5NNTgXH/6lElhb4KYwWGTh7jxPH9m7r6uqkQSqY32C9FfT2ohGQEBfLLiGj2Yg0Pqt9R+5AS
	yBiffhUZ/aOAkjKTAcbLpJpz8sR5GhPgMX+EbCYBrH4eAJG5KD0c/+5A7ZOn0GAGcWw1uUd/5qaBa
	kaiCK6DJRy/xrpOV9Br6JjB8dZGV2MONgKlaOLRt6xWKBeRuebIshU4h9Ti/XKVJrKJ8aSeS4CH15
	n05E0PrVI/rVQDXnWRqc0KpvNo2Zv6aGnCCfmB0bg9GiqU/qycuTixO3H5g8v4aAQklifv6TU14NH
	yI+83l8w==;
Received: from [2a02:8071:7010:720:58dd:8299:920a:a0a] (port=37350)
	by sub0.freenet.de with esmtpsa (ID MarkoHoyer@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 587) (Exim 4.94.2 #2)
	id 1tVrtE-00C6TP-B7; Thu, 09 Jan 2025 13:43:56 +0100
Message-ID: <7f8a09dd-3d99-4028-bb70-77464eb0cf77@freenet.de>
Date: Thu, 9 Jan 2025 13:43:54 +0100
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
From: Marko Hoyer <Marko.Hoyer@freenet.de>
In-Reply-To: <MW5PR13MB5632E7FD9A5E76949625BA54FD122@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 173642663695EB36AA5EAFO
X-Originated-At: 2a02:8071:7010:720:58dd:8299:920a:a0a!37350
X-Scan-TS: Thu, 09 Jan 2025 13:43:56 +0100

Am 08.01.25 um 22:19 schrieb Bird, Tim:
>
>> -----Original Message-----
>> From: Marko Hoyer <mhoyer.oss-devel@freenet.de>
>> Am 08.01.25 um 19:33 schrieb Bird, Tim:
>>>> -----Original Message-----
>>>> From: Shankari <beingcap11@gmail.com>
>>>> Hi
>>>>
>>>> I wanted to provide an update on my recent contributions to the boot-time reduction project. I have recently started contributing
>> and
>>>> am working with the beagleplay. I have been analyzing the boot time of the init process. Below is the output from the system log:
>>>>
>>>> debian@BeaglePlay:~$ dmesg | grep "init process"
>>>> [    1.480490] Run /init as init process
>>>>
>>>> Moving forward, I plan to explore ways to modify the command line and further investigate the data used for SIG analysis. This will
>>>> help me gain a deeper understanding of the boot process and its performance characteristics.
>>>>
>>>> Please let me know if you have any suggestions or areas where I could focus my efforts.
>>> Hi Shankari,
>>>
>>> It sounds like you are off to a good start.  I have something that needs to be done, that I think
>>> you can help with, and that matches where I believe you are in your status with being able
>>> to evaluate the kernel.
>>>
>>> In general, there's a lot of information on the elinux wiki which is stale, which needs to be
>>> updated or archived, or maybe even just removed.
>>>
>>> This section of the Boot Time page has a lot of material in this category:
>>> https://elinux.org/Boot_Time#kernel_speedups
>>>
>>> Can you validate the information on these 2 pages:
>>>    * https://elinux.org/Disable_Console
>>>    * https://elinux.org/Preset_LPJ
>>>
>>> This would consist of reading through the material, and testing the
>>> described techniques on your machine.  This will involve booting the
>>> machine 2 ways, with a particular kernel command line option and without
>>> it, and then reporting back the final boot time for both.  You can use
>>> the timestamp for the "init process" string as your final boot time, for the
>>> purposes of this exercise.
>>>
>>> Helping me to update the elinux wiki material on boot time would be
>>> an immense help, and is one of my main goals for the boot time SIG in 2025.
>>>
>>> Don't hesitate to ask questions if you have any.
>>>
>>> BTW - you can just report your findings to me and linux-embedded list, but
>>> alternatively (and even better) would be if you could also update the wiki
>>> pages themselves with your information based on recent kernels and hardware.
>>> To do this, you will need an elinux wiki account, which you can make online on
>>> elinux wiki.org by going to this page: https://elinux.org/Special:CreateAccount
>>>
>>> Anyone else reading this who wants to also participate in this project to
>>> update the elinux wiki boot time information, please contact me.
>>> Thanks.
>>>     -- Tim
>>>
>> Hi Tim, all,
>>
>> first time I'm posting here so hopefully everything is fine w/ my mail
>> format / attachment and so on ... If not, please give me some feedback
>> and guidance.
> Marko,
>
> Thanks for this great data!
>
> In general, I don't see a lot of attachments on kernel mailing lists.
> They don't bother me, and we aren't CC'ing LKML (that's a separate
> issue we should discuss - developers outside of embedded might
> want to see this data).  I'll check later and see what lore does with this,
> but if no one complains, I don't see a problem with it.  If someone
> does complain, I can provide file hosting either on the elinux wiki
> or the boot-time wiki, and we can link attachments like you've
> provided on this message from one of those places (to avoid
> putting attachments on kernel mailing lists).
Ok sounds good. I  don't have really a place to publish data, so would 
be good if you can find a way ...
>   
>> To the "disable console" topic: I have some numbers in place for an RPI
>> Zero W, find dmesg dumps and systemd-analyze plots attached.
>>
>>
>> Environment:
>>
>> - RPi Zero W, kernel 5.15.24, systemd 247.3, customized debian
>>
>> - onboard UART used
>>
>>
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
> Wow from 1.7 seconds to 16.1 seconds.  That's a pretty huge
> difference.  I guess this particular technique is still
> very relevant!
>
>> Interpretation:
>>
>> * enabled serial console has significant impact in kernel boot time
>>
>> * reducing baud to 9600 induced some side effect, not sure what it is ...
> Did you see any other weird behavior besides the huge slowdown?
> I'll take a look at the amount of characters in your dmesg output and
> see if it can be linearly correlated to the baud rate, or if it seems something
> else is going on.

Take a look into the kmesg logs. Looks like there is a 8s delay at a 
certain point:

[    5.897018] input: C-Media Electronics Inc. USB Audio Device as 
/devices/platform/soc/20980000.usb/usb1/1-1/1-1:1.3/0003:0D8C:0014.0001/input/input1
[    6.016086] hid-generic 0003:0D8C:0014.0001: input,hidraw0: USB HID 
v1.00 Device [C-Media Electronics Inc. USB Audio Device] on 
usb-20980000.usb-1/input3[   14.012174] printk: console [ttyS0] enabled
[   14.064965] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[   14.142795] bcm2835-power bcm2835-power: Broadcom BCM2835 power 
domains driver
[   14.232013] mmc-bcm2835 20300000.mmcnr: mmc_debug:0 mmc_debug2:0

Not sure if it really makes sense to dig further into this issue. Might 
be something in the serial driver of the RPI. I don't see really a valid 
use case, 9600 baud is nothing you really need and in anyway pushing 
serial logs out via serial is nothing really needed in productive use 
cases, just for development (correct me if I'm wrong).

>
>> -  systemd startup
>>
>> * systemd drops 2 log lines per started unit to the console
>>
>> * seems serial output is not implemented asynchronously (see steps of
>> units in sd plot, ~10ms per unit w/ baud 115200, ~80ms per unit w/ baud9600
> I'm not sure what you're referring to here.  Is the 'unit' you are talking about
> the graphing grid size, or are you referring to systemd units?  The grid size
> seems to be 10ms per minor grid line in each plot.

unit -> systemd unit

* grid size per minor grid line is 100ms to me (1s per main grid line -> 
see top of plot)

* take two units "user.slice" and "remote-fs.target"

* they should have basically no delay between each other -> you can see 
it in quiet case

* w/ serial on, you see delays (10ms, 80ms) which in fact are caused 
just by dropping the log lines to serial kernel log

* overall delay in user space startup sums up significantly

>
>> Side notes:
>>
>> * I remember similar behavior w/ imx.6 SoCs
>>
>> * Maybe this issues is not seen on other SoCs (maybe w/ another hw
>> implementation of the UART)
>>
>> * Maybe this issues is only seen in single core machines (I can double
>> check w/ a PI3 or orange pi zero once)
>>
>> Hope this helps.
> It helps a lot.  Thanks for this data!
>
> I think the 'Disable Console' technique will continue to stay as one of the first
> things we recommend for developers working on their board's boot time.
Yes I agree. Let me check out other boards and especially multi-core 
systems if the issues is happening there as well ...
>
> To others developers - I'd like to see more data like this on other systems
> as well.  So please keep submitting your data to this list.
>
> Thanks,
>   -- Tim
>
Regards,

Marko

