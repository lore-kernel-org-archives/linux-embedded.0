Received: from panther.cherry.relay.mailchannels.net (panther.cherry.relay.mailchannels.net [23.83.223.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B2EA2D
	for <linux-embedded@vger.kernel.org>; Thu,  9 Jan 2025 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736461897; cv=pass; b=A7ODln8qhLDFKJZZu6a9Rf+3dX9DssNHuInie8w7ltbn0aFWwiHT1p4lepOJ+SnqkYRpHl4BrIehVwzU3sRSjrmYHpa9OlbqTWOf4EcQf4s9w9YYzlgQrqhr3Ey2PzVNcXLBxJviPRYJFSD3bTqoEv6uyyBY9WMpWzZ/T3aUpAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736461897; c=relaxed/simple;
	bh=3NlaeRvKvze2xdcKrLq0pPh0BI1WX5bOafywkR7tImY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=t48eckxlqx9QqhaqbPRwJ6fi/XZkj5LphDLDig+1wuvMUIwqtkf4HJWSrxe/GeOA1cAW/Do57SWUoPTBiEoeOLnH+w4E2SAN1JO00obwxbiLRm6gbUOjdA37l3V6m9uQxU3bjvkB4Qo7Og5ET/CqIcRxmZWKEy9SKU/xpmFh6yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=kDlHWGRW; arc=pass smtp.client-ip=23.83.223.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="kDlHWGRW"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5A91C1A4C6B;
	Thu,  9 Jan 2025 22:31:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a294.dreamhost.com (trex-2.trex.outbound.svc.cluster.local [100.111.51.238])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id D82951A5379;
	Thu,  9 Jan 2025 22:31:28 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736461888; a=rsa-sha256;
	cv=none;
	b=KyHgMzw0X1rPJevAQJKKg9NFfeo+4aGQM7ONh6+xgm9Fx7rEag+tkv9qbfnTqv+EG+rRjh
	KfTU/4VO6pjn6dq47+Dh/vDTj3oGFMqz4SitFhDdljqjRBFk4VdTQ8UtoHOaWojL+6yE4a
	KtONqfwlEcJYPUi5o50JkCPE/hqo0DMXFOIz0mabdqs+aj/aDWW720ob0eZXtLPXxTfb5m
	w7mzAFBaenlokXGSE66weQzJq0TBFxS41dUZ7zIhUGQAPkoSkoxGl1idISvJ4JuOJiEEjW
	tL3qWxaHYpeXuvMwCYFu1+p8M24QPrPtFhQODihs9NKjj3m8cJMq0wjjlXgbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736461888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=74ud6iI7o4JsiDhfOTY7PcJ90YnI0YWM3U8BV19ZbIo=;
	b=maaXicmTfpjYkO2iT89MfLl62njaVoBxyf3lpxDF9Oq0fQsU/rGs9eGRvDE6eU950dGG+H
	ljeq2RpsOtm8JAj9Ts2W/g8FbS+oY+qnynt6zE++qpswuq2/CHz5FdJ9aL7hLCibC4wSiz
	hi2RZ23LQBra2FUkdzmCwxWVuoEY0fVLVuZ49rQ2e5lY0EDycyY20AGmtHTkQKMTfQ7s0O
	4IFvSUcypin7c0w0hlw3fkcrUPrE4oKlVfICoabKVp8Y/cWIh32MfF70DvqtpZXCUoOxgE
	gEmVjXP5wNtVnejMeYG6Pv5XuShoDde6IskgbvEiRhEF5difJZSURHU4N7+h9Q==
ARC-Authentication-Results: i=1;
	rspamd-b5645c5d4-qsmpb;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Decisive-Ski: 61dd8dff15f82986_1736461889124_4159600709
X-MC-Loop-Signature: 1736461889124:2950279160
X-MC-Ingress-Time: 1736461889124
Received: from pdx1-sub0-mail-a294.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.51.238 (trex/7.0.2);
	Thu, 09 Jan 2025 22:31:29 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a294.dreamhost.com (Postfix) with ESMTPSA id 4YTfdr2VLkzQn;
	Thu,  9 Jan 2025 14:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736461888;
	bh=74ud6iI7o4JsiDhfOTY7PcJ90YnI0YWM3U8BV19ZbIo=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=kDlHWGRWIWuu6oV0SInztsM2mudli24AySRljQjhHssOvshHjiQ0GTMmQ6bNG+mn1
	 8MD6zKIAuXQb2eH/Ph+Xn8l44NbOTlInr13ufuyJIgqNPx5wqK7PEzfMygY2poKosu
	 4fyrdXPZ4bqYzEEyIExdmVhQvI19IRxixrqSqT+HmahF/ytkZ341oiMRkmTfkWm1Wn
	 iD7lMqffry8TZl2wpBGQn739grDVWww74aZVL1re1Vz+RqXqWZAzYgqAgQNkyVFPhU
	 /tas5V7ieoRpqQ7ZpvGZFBg0XTGe1v9zNm2DIIoMqzeVBewxFRL4zDJ8+FhBi4QZtN
	 rnZuxRPSGDLbg==
Message-ID: <9b77d538-a429-4ff0-9c76-df0b9dafa787@landley.net>
Date: Thu, 9 Jan 2025 16:31:27 -0600
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
 <b0dd83c8-eb23-494b-8f23-ea8c084405a6@freenet.de>
 <MW5PR13MB5632E7FD9A5E76949625BA54FD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <ca1212ef-4d60-4947-9180-d2b3f127e0fb@landley.net>
 <04614509-675d-43b4-82f8-d3b16797f559@freenet.de>
 <a4b7f1e2-e362-42fe-b038-74bd79020221@landley.net>
 <e772b530-234e-4b5c-94b4-085cb03689bd@freenet.de>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <e772b530-234e-4b5c-94b4-085cb03689bd@freenet.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/25 15:35, Marko Hoyer wrote:
> Am 09.01.25 um 22:10 schrieb Rob Landley:
>> Buffering or not in the char device is a driver choice. If your serial 
>> hardware has a small FIFO buffer and the driver doesn't do its own 
>> layer of output buffering (with a tasklet or something to copy the 
>> data to the hardware), then the write() syscall will block waiting for 
>> the data to go out. (Writes to filesystems stopped doing this back 
>> around 2.0 or something, when they rewrote the vfs to be based on the 
>> page cache and deentry cache, meaning ALL filesystem writes go through 
>> that now unless you say O_DIRECT to _ask_ for it to block, which isn't 
>> even always honored. But for some reason the TTY layer drives people 
>> insane, and char devices have been given a wide berth...)
> 
> Yeah looks like this is the case for RPi Zero W. I guess there is 
> probably no buffer at all in the RPi serial driver / hw since every log 
> line from systemd delays systemd for ~10ms (~80ms in baud9600 case).

Well there's gotta be a LITTLE fifo for input or you drop characters all 
over the place.

(That's the reason Linus started writing Linux in the first place, 
because minix's microkernel design couldn't keep up with serial input, 
the overhead of the task switch to the userspace serial receive driver 
process took too long and characters got dropped. So he wrote a terminal 
program that booted from a floppy, and then taught it to read from and 
write to the minix filesystem on his hard drive so he could download 
stuff from usenet, then taught it to run "bash" so he didn't have to 
reboot to mkdir/mv/rom, and that turned out to be 90% of the way to 
getting it to run gcc...)

And serial hardware tends to be symmetrical about that: if it's got 16 
chars of input buffer, it'll usually have 16 chars of output buffer. But 
that's less than 1/50th of a second at 9600 baud...

(Fun detail: the input fifo often has a programmable watermark so you 
can say "fill up this much before generating an interrupt, or if X timer 
ticks pass by with no more input" so you don't get an interrupt every 
character (and spend all your time entering and exiting the interrupt 
code) BUT still have some leeway between the interrupt being generated 
and the buffer filling up until it drops characters. The OUTPUT fifo can 
do something similar, only from the other end (fill it all the way up, 
then generate an interrupt when it drains to the watermark so you can 
refill it before it empties and produces a gap in the output).

Programming serial devices can get slightly complicated...

> Btw: I can confirm the same for RPi3 w/ four cores. Difference is that 
> something seems to go on in kernel in parallel to logs writing to serial 
> but at a certain point the kernel is waiting again for lot of seconds 
> probably for the serial device to finish transmission. Systemds delay is 
> pretty much similar to the single core case.

Yeah, the point of a bottleneck is that's the part you're waiting for, 
so speeding up the rest of it doesn't help so much.

Optimization is a whole thing. Spinlocks vs semaphores infuriate some 
people (you're intentionally spinning wasting time?) so sometimes you 
need to explain with analogies to get them to stop "helping".

You're standing at a train crossing, and a train is going past, it'll be 
through in 10 minutes. If you walk towards the end of the train you'll 
reach the end faster and can cross in only 7 minutes, but if you need to 
come BACK HERE to where your road is you'll wind up walking 7 minutes, 
crossing, walking 7 minutes back, and resume from here 14 minutes from 
now instead of only 10, so being busy doing the wrong thing and then 
just _undoing_ it again instead of waiting here ready to go is actually 
_slower_ than the waiting.

>>> As said in another mail: I do not know a valid (production) use case 
>>> in which kernel logs need to be dumped to a serial console. I regard 
>>> this mechanism only as useful for development purposes (in which fast 
>>> boot is probably not so relevant). Please correct me if I'm wrong, 
>>> would be happy to learn about such use cases.
>>>
>>> Based on that I think option 3) is the best options for most cases.
>>
>> You can adjust the loglevel so they still go into dmesg but don't go 
>> out to the console, which theoretically shouldn't be THAT slow? (At 
>> least cpu limited rather than wait-for-hardware.)
> 
> With quiet logs go into dmesg as well.

Which _used_ to be almost free back when it was just a ring buffer doing 
a strlen() and two memcpy() at the wrap. But these days: dunno, haven't 
benched it.

> But as said, i do not really see use cases to dump out these logs to a 
> serial console in a boot time critical system on each production boot. 
> Reading dmesg or systemd's journal after time critical things are done 
> should be ok in most case.

The switch from printk(blah) to pr_loglevel(blah) was IN THEORY so you 
could kconfig a minimum loglevel to retain, and all the macros below 
that level would drop out of the kernel at compile time, reducing the 
kernel image size significantly AND doing nice things with cache 
locality and so on. (String processing is expensive, you traverse a lot 
of data that goes through the memory bus and evicts cache lines from L1 
and L2.)

Last I checked the kernel devs had broken it for some reason, but it 
might be working again? (Or was a patch still out of tree...?) Anyway, 
if you run out of ideas that's a thing to look for.

Data going across the memory bus is another one of those bottleneck 
things, where it doesn't matter how fast your processor is clocked if 
you're waiting for memory. An order of magnitude down from where we're 
currently looking, but still a thing that comes up a lot once the real 
low hanging fruit is dealt with...

Of course there's all sorts of "Loop unrolling! No, smaller L1 cache 
footprint! Prefetch! No, spectre/meltdown!" pendulum nonsense I usually 
treat roughly the same way as the man trying to cross the street in The 
Pink Panther:

https://www.youtube.com/watch?v=nistdsACs3E

I once watched using a lookup table instead of calculating the value be 
an optimization, then a pessimization, then an optimization, then a 
pessimization, without even recompiling the binary (just upgrading the 
hardware). Doing the simple thing is always at least excusable. (And 
less to reverse engineer to understand WHY, and a good general argument 
against the endless "this is not helping". Basically Chesterton's fence 
in software: understanding why it's there lets you throw it out.)

Rob
