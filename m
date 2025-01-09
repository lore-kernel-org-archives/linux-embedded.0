Received: from mout0.freenet.de (mout0.freenet.de [195.4.92.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884A813B2B8
	for <linux-embedded@vger.kernel.org>; Thu,  9 Jan 2025 21:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.4.92.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458552; cv=none; b=kuitTKau2YYQhGJdBBdVOJJDnuoDpopdrLFjlUSBqxinsMiMiiyRWQ4pSyczEhuaY8UNH5rQBJSrw538xo9dGfVFH+DmtmTn5jU8w/7/EtcE+p66qHgsbPITacKvMwn1PKylcS6fNcJuuTFxxKtT8qvyd4t3UOmlbEpk4vfLeb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458552; c=relaxed/simple;
	bh=84W+VLus3iAFg2av8T/3XgX8ty/5dO/YRZxwpGwBhdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UqrtgnLP7If6bQsNyDVnAhq4srmqYSz1nxPJInR9SUiIE2Mr7qeKQuruNtplNS38hFZiF07nzkBthI+UmmGWCPebQ1C0gKofFa9THZ9TDypky0oUnKa8SDwbFPkYTTavEOhHOltyKYSlGxyl8ASg0T3kqAff6rsBH8QiNBBrwhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=qw4qK38v; arc=none smtp.client-ip=195.4.92.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="qw4qK38v"
Received: from [195.4.92.125] (helo=sub6.freenet.de)
	by mout0.freenet.de with esmtpa (ID MarkoHoyer@freenet.de) (port 25) (Exim 4.94.2 #2)
	id 1tW0Br-00CTou-UA; Thu, 09 Jan 2025 22:35:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8K6fpwJ6D5htyNBpvZ0n3lkLQVgfj+aMlVJfQqvNdgY=; b=qw4qK38vYWSi7TOvibVQQV5IV4
	hJwhkAYLi78n0HQdBf2R3Dr1USZqUwRV2Lmmvkm0/AYIDD4Abk/8HUiqOrHTkvVZ3Ux56ghdaYTTH
	sO13XQlLgJMKGUAldQfOp1RXl184Rg/cCqkCCHBS0/GgSyCFT7jWztqLFRTuq5NYMHZuHHKefT09x
	k2q+TJYDNH2hpj4mjxTpqzMPrHel0Wl+iUkWcirpgJ7vRY/wwvOV7LAQhOPPRurC9StPYx79gRLVf
	lX5FR/oIBImBLm38GOxA1kWNMOCtk32AQcWiW0o//HUWxaqI7kHvVAMsYwztXzb7JhsbxuJ0NgPOV
	GK8bx2Qg==;
Received: from [2a02:8071:7010:720:a611:d472:7a6a:d54] (port=43526)
	by sub6.freenet.de with esmtpsa (ID MarkoHoyer@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 587) (Exim 4.94.2 #2)
	id 1tW0Br-00BBIv-JW; Thu, 09 Jan 2025 22:35:43 +0100
Message-ID: <e772b530-234e-4b5c-94b4-085cb03689bd@freenet.de>
Date: Thu, 9 Jan 2025 22:35:42 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-time]
To: Rob Landley <rob@landley.net>, "Bird, Tim" <Tim.Bird@sony.com>,
 Shankari <beingcap11@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <b0dd83c8-eb23-494b-8f23-ea8c084405a6@freenet.de>
 <MW5PR13MB5632E7FD9A5E76949625BA54FD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <ca1212ef-4d60-4947-9180-d2b3f127e0fb@landley.net>
 <04614509-675d-43b4-82f8-d3b16797f559@freenet.de>
 <a4b7f1e2-e362-42fe-b038-74bd79020221@landley.net>
Content-Language: en-US
From: Marko Hoyer <mhoyer.oss-devel@freenet.de>
In-Reply-To: <a4b7f1e2-e362-42fe-b038-74bd79020221@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 1736458543E7837FA5C020O
X-Originated-At: 2a02:8071:7010:720:a611:d472:7a6a:d54!43526
X-Scan-TS: Thu, 09 Jan 2025 22:35:43 +0100

Am 09.01.25 um 22:10 schrieb Rob Landley:
> On 1/9/25 07:02, Marko Hoyer wrote:
>> Am 09.01.25 um 00:26 schrieb Rob Landley:
>>> CONFIG_EARLY_PRINTK output is emitted before interrupts are enabled 
>>> (last I checked they didn't kick in until RIGHT before PID 1 gets 
>>> forked off), so the early output drivers spin waiting for the next 
>>> character to go into the buffer (the memory mapped register ones 
>>> look something like "while (MASK&*status); *output = *data++;" in a 
>>> for loop) and the printk() call can't return until all the data has 
>>> been queued to the serial hardware, so you spend a lot of time 
>>> blocked in printk().
>>
>> Hi Rob,
>>
>> thx for the explanation, helps further!
>>
>> * This implementation would explain the observed behavior.
>>
>> * What I'm not understanding yet: logs from systemd delay systemd the 
>> same way as seen in the kernel. Looks like the issue is not solved 
>> even when PID 1 is started.  As said, It can be something specific to 
>> single core SoCs or even just to RPI Zero W. I'll check ...
>
> Buffering or not in the char device is a driver choice. If your serial 
> hardware has a small FIFO buffer and the driver doesn't do its own 
> layer of output buffering (with a tasklet or something to copy the 
> data to the hardware), then the write() syscall will block waiting for 
> the data to go out. (Writes to filesystems stopped doing this back 
> around 2.0 or something, when they rewrote the vfs to be based on the 
> page cache and deentry cache, meaning ALL filesystem writes go through 
> that now unless you say O_DIRECT to _ask_ for it to block, which isn't 
> even always honored. But for some reason the TTY layer drives people 
> insane, and char devices have been given a wide berth...)

Yeah looks like this is the case for RPi Zero W. I guess there is 
probably no buffer at all in the RPi serial driver / hw since every log 
line from systemd delays systemd for ~10ms (~80ms in baud9600 case).

Btw: I can confirm the same for RPi3 w/ four cores. Difference is that 
something seems to go on in kernel in parallel to logs writing to serial 
but at a certain point the kernel is waiting again for lot of seconds 
probably for the serial device to finish transmission. Systemds delay is 
pretty much similar to the single core case.

>
> There's a similar issue with some xterms where "make -j16 build" 
> spamming lots of output to a display terminal can run significantly 
> slower than "make -j16 build | cat" because the linux pipe 
> infrastructure inserts a pipe buffer (ulimit -p says 8 but I think 
> that's _pages_ so 32k? Except in 2.6.11 it was 64k? Eh, not looking it 
> up...) so the writes from each cc instance go into the pipe buffer and 
> return immediately when it's not full, whereas writes to a terminal 
> device block until the terminal has finished updating (which includes 
> scrolling the screen).
>
> If I recall (many years ago), the kde terminal implementation included 
> a buffer of its own (immediately returned before updating), and the 
> gnome one didn't (blocked until x11 display update completed), so 
> foreground builds were faster under kde.
>
> And the gnome guys' answer was to spray everything down with 3D 
> acceleration so the GPU was scrolling the screen for you, because of 
> course it was.
>
> Anyway, serialized latency has _always_ killed throughput, because 
> it's a cost you can't get BACK. The kernel guys used to know this:
>
> https://yarchive.net/comp/linux/raid0.html
>
> Hence the old high school math problem: if you have 2 hours to go 100 
> miles and you travel the first 40 miles at 20 miles per hour, how fast 
> do you have to go the rest to make it on time? Answer: you'd have to 
> instantaneously teleport because you spent 2 hours going 40 miles and 
> your time is up with 60 miles left to go. Optimizing the wrong part 
> DOESN'T HELP.
>
Absolutely correct.
>> As said in another mail: I do not know a valid (production) use case 
>> in which kernel logs need to be dumped to a serial console. I regard 
>> this mechanism only as useful for development purposes (in which fast 
>> boot is probably not so relevant). Please correct me if I'm wrong, 
>> would be happy to learn about such use cases.
>>
>> Based on that I think option 3) is the best options for most cases.
>
> You can adjust the loglevel so they still go into dmesg but don't go 
> out to the console, which theoretically shouldn't be THAT slow? (At 
> least cpu limited rather than wait-for-hardware.)

With quiet logs go into dmesg as well.

But as said, i do not really see use cases to dump out these logs to a 
serial console in a boot time critical system on each production boot. 
Reading dmesg or systemd's journal after time critical things are done 
should be ok in most case.

So my recommendation to people who seek for fastboot potential:

* switch of kernel to console log during startup using quiet cmdline 
option if you don't need these logs over serial essentially

* if you need them, your (Rob) options could be applied reducing the 
effect as best as possible

>
>
> But keep in mind that a lot of kernel devs seem actively trying to 
> sabotage embedded development, and the dmesg metadata is now multiple 
> times the size of the actual payload.
>
> https://lkml.iu.edu/hypermail/linux/kernel/2412.0/00045.html
>
> So trimming the dmesg buffer size is probably ALSO a good idea on 
> modern embedded systems, because WHAT THE FSCK? Also, I dunno how much 
> cpu time all that metadata fapping takes. (Before systemd, this was 
> just text going into a ring buffer. But systemd couldn't cope with 
> that because 
> https://www.theregister.com/2014/04/05/torvalds_sievers_dust_up/ and 
> https://en.wikipedia.org/wiki/Systemd#History and of course 
> https://www.linux.com/news/fun-photo-greg-kroah-hartman-crowned-systemd-hackfest/ 
> thus the data structures in the kernel had to become far more complex 
> after about 30 years of NOT being like that, because systemd.)
>
> Rob
Marko
