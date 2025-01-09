Received: from mout0.freenet.de (mout0.freenet.de [195.4.92.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FB2215F5F
	for <linux-embedded@vger.kernel.org>; Thu,  9 Jan 2025 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.4.92.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428057; cv=none; b=DyB/LDl9LezPkjT5ff8EDBIgHDewHW52Q3NPYnhrOSWR5hapKwEMISjDbyPpbqbf4IM5a5hzS+yCjwt+9sFcaOO/RzejUTUu71zeSLxa9yun2JcmMU6obcBpGWCVNCGo8VlVDsaglppWgCgEVBmWUG4JwCrZxE85z1c/Ak3txyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428057; c=relaxed/simple;
	bh=Jhy4acn4d1yLAn65qrdO2x3ccHDcDSF/T8lsPx8Ei6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bU+pgHBaLSzMZO+KSffSDodeickc6BZvWShnOo8jLZYTAHFlttfT1GtzCJdi8yCZoL3NUvIIL1oedTFq/MefHHGQ38OPEsRczgvWd6H3tJgx/R0WIsAwTHk4bqPrSYc1yt/kWd8FWdN5YXJf1g7cw1GUtBjhuCvhddpQfzW/4xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=Zt9qGzBq; arc=none smtp.client-ip=195.4.92.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="Zt9qGzBq"
Received: from [195.4.92.120] (helo=sub1.freenet.de)
	by mout0.freenet.de with esmtpa (ID MarkoHoyer@freenet.de) (port 25) (Exim 4.94.2 #2)
	id 1tVsAq-00019a-7M; Thu, 09 Jan 2025 14:02:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nd4O6qNunUrjv+FusGCfbdBc4T1EXab3WoF/p2DkLzM=; b=Zt9qGzBqKcwwwXtJovPpUH5D04
	rOq4byywWPYTke/kpTZCXzQeZyrPDQTmwszwWz6saONLX6cJ/CyEDwnfCw/QFa/bpViEQ+aF35AdQ
	7ngJys2XHm/Z1GPnTZYfQUGmhxGx6YsxIQlCKh6cjSU8h40LrmexxScQHp5xrnTYdhefLh5lM5y5J
	pI1r3dYgUTiSel0oJvmoC+69TOchhXgDxahSY4vSsSaNiRTl233nWA26PMdgy/KUcGbKvScxXn/ru
	krW6eATXDEDjqq+SHh+9KTJGC4MlAHO8k3LuHYhckzLqf4XgFx9O+GN0TyT7b0ACf7A5rCsM8QUe7
	PcOQnUxA==;
Received: from [2a02:8071:7010:720:58dd:8299:920a:a0a] (port=53268)
	by sub1.freenet.de with esmtpsa (ID MarkoHoyer@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 587) (Exim 4.94.2 #2)
	id 1tVsAp-00B2g8-UG; Thu, 09 Jan 2025 14:02:07 +0100
Message-ID: <04614509-675d-43b4-82f8-d3b16797f559@freenet.de>
Date: Thu, 9 Jan 2025 14:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-time]
To: Rob Landley <rob@landley.net>, "Bird, Tim" <Tim.Bird@sony.com>,
 Marko Hoyer <mhoyer.oss-devel@freenet.de>, Shankari <beingcap11@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <b0dd83c8-eb23-494b-8f23-ea8c084405a6@freenet.de>
 <MW5PR13MB5632E7FD9A5E76949625BA54FD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <ca1212ef-4d60-4947-9180-d2b3f127e0fb@landley.net>
Content-Language: en-US
From: Marko Hoyer <Marko.Hoyer@freenet.de>
In-Reply-To: <ca1212ef-4d60-4947-9180-d2b3f127e0fb@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 1736427727632C16819A92O
X-Originated-At: 2a02:8071:7010:720:58dd:8299:920a:a0a!53268
X-Scan-TS: Thu, 09 Jan 2025 14:02:07 +0100

Am 09.01.25 um 00:26 schrieb Rob Landley:
> On 1/8/25 15:19, Bird, Tim wrote:
>>> Cases:
>>>
>>> - #1 quiet: cmdline w/ quiet, no kernel or userspace output up to the
>>> serial login console
>>>
>>> - #2 normal: cmdline w/o quiet, serial console @115200 baud
>>>
>>> - #3 normal_baud9600: cmdline w/o quiet, serial console @9600 baud
>>>
>>>
>>> Main outcomes:
>>>
>>> - kernel timestamps "Run /sbin/init as init process"
>>>
>>> #1: "1.714458", #2: "3.011701", #3: "16.108101"
>>
>> Wow from 1.7 seconds to 16.1 seconds.  That's a pretty huge
>> difference.  I guess this particular technique is still
>> very relevant!
>
> CONFIG_EARLY_PRINTK output is emitted before interrupts are enabled 
> (last I checked they didn't kick in until RIGHT before PID 1 gets 
> forked off), so the early output drivers spin waiting for the next 
> character to go into the buffer (the memory mapped register ones look 
> something like "while (MASK&*status); *output = *data++;" in a for 
> loop) and the printk() call can't return until all the data has been 
> queued to the serial hardware, so you spend a lot of time blocked in 
> printk().

Hi Rob,

thx for the explanation, helps further!

* This implementation would explain the observed behavior.

* What I'm not understanding yet: logs from systemd delay systemd the 
same way as seen in the kernel. Looks like the issue is not solved even 
when PID 1 is started.  As said, It can be something specific to single 
core SoCs or even just to RPI Zero W. I'll check ...

>
> With 9600 baud 8n1 output, 9600/9 = 1066 characters per second, or 
> approximately a 1ms wait between each character, blocking in printk 
> when the hardware FIFO buffer fills up, so 16k of output data takes 16 
> seconds to write if the rest of the boot is doing NOTHING. Even a 1k 
> hardware FIFO is only 1 second of output, and that's assuming all 1k 
> is outgoing rather than split between in/out.
>
> Your options are:
>
> 1) disable early printk so it all goes into a malloced buffer until 
> interrupts are enabled and it can be asynchronously flushed (meaning 
> if something DOES go wrong in early boot you can't see it)
> 2) set your FIFO speed as fast as possible
> 3) have your default boot use the "quiet" option (similar to disabling 
> EARLY_PRINTK but at least you have the option to yank quiet from your 
> bootloader args without rebuilding the kernel.)
>
> Faster UART speeds mean shorter serial cables (although there's also 3 
> volt vs 5 volt, wire thickness/capacitance, and some other stuff, Jeff 
> Dionne walked me through the math last year but I don't have my notes 
> in front of me). Modern hardware can do up to 4 megabits/second but 
> outside "this serial chip immediately talks to a USB chip and then 
> it's transported as USB with the funky noise-cancelling signaling over 
> VERY twisted pair to actually leave the board"), I wouldn't trust that 
> over any real length of cable.
>
> Alas 
> https://tldp.org/HOWTO/Remote-Serial-Console-HOWTO/serial-distance.html 
> is from the dawn of time and only goes up to 56k over wires made from 
> recycled drainpipes. 
> https://novatel.com/support/known-solutions/maximum-cable-length-vs-data-rate 
> says 115200 is 2.5 meters. It LOOKS like it scales linearly with twice 
> the speed being half the cable, so a megabit would be about 1 foot of 
> serial cable before the bits get all mushy.
>
As said in another mail: I do not know a valid (production) use case in 
which kernel logs need to be dumped to a serial console. I regard this 
mechanism only as useful for development purposes (in which fast boot is 
probably not so relevant). Please correct me if I'm wrong, would be 
happy to learn about such use cases.

Based on that I think option 3) is the best options for most cases.


> Rob


Marko

