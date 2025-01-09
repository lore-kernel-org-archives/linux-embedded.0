Received: from black.elm.relay.mailchannels.net (black.elm.relay.mailchannels.net [23.83.212.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356F20013C
	for <linux-embedded@vger.kernel.org>; Thu,  9 Jan 2025 21:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457070; cv=pass; b=b8LQQO1jdAufi7+FaQ/h7GGR10W53dP9oWfIDT4ls0PSOFk1WiXpVai0VhPHQjapttVpn1dgd+uQL6PflNPD51CmE9IgKPRHYsQzUor658KXMBO6FoFWMsvG8Y7zeBSdtVwQq5ML8g7J0nOVVUboUUe7LuN0jZc+BkZkWQakwzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457070; c=relaxed/simple;
	bh=eqEp3ubAThfB2J3DCwoM6Tr4fPPZK/sO5s05P/+1NxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f0D//uictuh9LEWQO+1eJlpmqC5YVnQhNlvMdCmYGt36d0oBc3s7clGKKgN9mCE7I+qzvfnny6ZbLZFccdaT59SEUZTAaJP3VmvBP+I/tgpGQqD5aGGbPEmEvvW4HZUplWipiIcEskznHlsm5/ZyfL7eJo85AafRHfBNcY2mNKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=Bcnj2d+C; arc=pass smtp.client-ip=23.83.212.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="Bcnj2d+C"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9274B7815E6;
	Thu,  9 Jan 2025 21:11:01 +0000 (UTC)
Received: from pdx1-sub0-mail-a294.dreamhost.com (trex-0.trex.outbound.svc.cluster.local [100.109.114.128])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 151C87831FB;
	Thu,  9 Jan 2025 21:11:01 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736457061; a=rsa-sha256;
	cv=none;
	b=ckMO3ZDJfkw7MtMqAzQGkwBjYvO0m826SeDucb+Z5As2n3ZB3H+NomSuWTXFNVgz82gS7E
	PHDBjm4vy2a6zHvcHKHBc0Xyz+e/EqErrR5QniaO+6KjNC2DRGqss2xx5RE1HHUiHv8YsP
	tGEx0zbYBM3ttgX9jEG4n20ZCeHthm3EmgrdXgpeZ7rzR2bheR4ObKYrWbAB2iZnyMpjOI
	Vcry0ehZLztKARnh2+NWXkIM20EY0CixnyvduSE8e9CYHX71cqtnlgYqjp1m2PgrhMKd6y
	HdFvT11kTRJ/mh+LcHrURCPoAuVul/NUhXfAWDqYf8PnB/IokVVHohb4EhMNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736457061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=RkjHxLhxugBZ6y3PD76On2F3ngagXAB9oifa51py63U=;
	b=qZe+FgqJz4xvA9MUSIQLBYlyAvqsIIwiK0+9vOC1DBzRGyiRyb46FdSD0dje0ZQIgeFClp
	EGhJ68frivFZYZIbm5lfeycByRyvmgSetXWUuV7ARLkjFGt25cPrC4elGX9n1cX4cwgXvn
	GpqnVdc8NJp2rEDd0SiB0MhpaVzYzwoq3YZyqjZrOkQjNyRxvjhqmgPC4mGF44KFj6ajtj
	iB3PUe8yfUSsCjSB0q9oICkaz52qGjQgmOUxxDKbiAuxxqxw0LCS0BF4HdE3PQPVwUxLAX
	GnVAeUtOcYNY8c5/jIQ3daN+TKmP2ppW/b6jpLmFkelUzEyTW9jq2u5euMkN9w==
ARC-Authentication-Results: i=1;
	rspamd-7df4dcbd86-t9kth;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Language-Trouble: 7ea7e0ed4b1f971d_1736457061342_1244893225
X-MC-Loop-Signature: 1736457061342:2590778488
X-MC-Ingress-Time: 1736457061342
Received: from pdx1-sub0-mail-a294.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.114.128 (trex/7.0.2);
	Thu, 09 Jan 2025 21:11:01 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a294.dreamhost.com (Postfix) with ESMTPSA id 4YTcs03Brmz1p9;
	Thu,  9 Jan 2025 13:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736457060;
	bh=RkjHxLhxugBZ6y3PD76On2F3ngagXAB9oifa51py63U=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=Bcnj2d+C55CIH9+zJP2sZlZzs9fo3Hg3HNzPXaakd3sYeESo0jTF3VW0rkf50Mi5W
	 PenHPbMxoe6Qn42ZixzlzcVpVYbNKlylwfnvjvpKLOZjzHYyAm6EyTMQjGR7EhG+zc
	 HFakXXn8s96k56RPZv7qqkic2Ba+OIj8H8a/0dKPzmhOZd01tx6fsyjWTVTUQf79gR
	 ozWRP/jFGmKlZvihXO8IhWbwtnW4KkiTHGSO++D765ZAirVIfUFj/llLaYKqNzzLAk
	 NKZTAnsQJ+lrR7BSYCYkF8S+e+HQVSI5P7mV+i79vBqDthgM8+dh3KdhnDGBSlrpRq
	 Fn6IICcEhgvFA==
Message-ID: <a4b7f1e2-e362-42fe-b038-74bd79020221@landley.net>
Date: Thu, 9 Jan 2025 15:10:59 -0600
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-time]
To: Marko Hoyer <Marko.Hoyer@freenet.de>, "Bird, Tim" <Tim.Bird@sony.com>,
 Marko Hoyer <mhoyer.oss-devel@freenet.de>, Shankari <beingcap11@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <b0dd83c8-eb23-494b-8f23-ea8c084405a6@freenet.de>
 <MW5PR13MB5632E7FD9A5E76949625BA54FD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <ca1212ef-4d60-4947-9180-d2b3f127e0fb@landley.net>
 <04614509-675d-43b4-82f8-d3b16797f559@freenet.de>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <04614509-675d-43b4-82f8-d3b16797f559@freenet.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/9/25 07:02, Marko Hoyer wrote:
> Am 09.01.25 um 00:26 schrieb Rob Landley:
>> CONFIG_EARLY_PRINTK output is emitted before interrupts are enabled 
>> (last I checked they didn't kick in until RIGHT before PID 1 gets 
>> forked off), so the early output drivers spin waiting for the next 
>> character to go into the buffer (the memory mapped register ones look 
>> something like "while (MASK&*status); *output = *data++;" in a for 
>> loop) and the printk() call can't return until all the data has been 
>> queued to the serial hardware, so you spend a lot of time blocked in 
>> printk().
> 
> Hi Rob,
> 
> thx for the explanation, helps further!
> 
> * This implementation would explain the observed behavior.
> 
> * What I'm not understanding yet: logs from systemd delay systemd the 
> same way as seen in the kernel. Looks like the issue is not solved even 
> when PID 1 is started.  As said, It can be something specific to single 
> core SoCs or even just to RPI Zero W. I'll check ...

Buffering or not in the char device is a driver choice. If your serial 
hardware has a small FIFO buffer and the driver doesn't do its own layer 
of output buffering (with a tasklet or something to copy the data to the 
hardware), then the write() syscall will block waiting for the data to 
go out. (Writes to filesystems stopped doing this back around 2.0 or 
something, when they rewrote the vfs to be based on the page cache and 
deentry cache, meaning ALL filesystem writes go through that now unless 
you say O_DIRECT to _ask_ for it to block, which isn't even always 
honored. But for some reason the TTY layer drives people insane, and 
char devices have been given a wide berth...)

There's a similar issue with some xterms where "make -j16 build" 
spamming lots of output to a display terminal can run significantly 
slower than "make -j16 build | cat" because the linux pipe 
infrastructure inserts a pipe buffer (ulimit -p says 8 but I think 
that's _pages_ so 32k? Except in 2.6.11 it was 64k? Eh, not looking it 
up...) so the writes from each cc instance go into the pipe buffer and 
return immediately when it's not full, whereas writes to a terminal 
device block until the terminal has finished updating (which includes 
scrolling the screen).

If I recall (many years ago), the kde terminal implementation included a 
buffer of its own (immediately returned before updating), and the gnome 
one didn't (blocked until x11 display update completed), so foreground 
builds were faster under kde.

And the gnome guys' answer was to spray everything down with 3D 
acceleration so the GPU was scrolling the screen for you, because of 
course it was.

Anyway, serialized latency has _always_ killed throughput, because it's 
a cost you can't get BACK. The kernel guys used to know this:

https://yarchive.net/comp/linux/raid0.html

Hence the old high school math problem: if you have 2 hours to go 100 
miles and you travel the first 40 miles at 20 miles per hour, how fast 
do you have to go the rest to make it on time? Answer: you'd have to 
instantaneously teleport because you spent 2 hours going 40 miles and 
your time is up with 60 miles left to go. Optimizing the wrong part 
DOESN'T HELP.

> As said in another mail: I do not know a valid (production) use case in 
> which kernel logs need to be dumped to a serial console. I regard this 
> mechanism only as useful for development purposes (in which fast boot is 
> probably not so relevant). Please correct me if I'm wrong, would be 
> happy to learn about such use cases.
> 
> Based on that I think option 3) is the best options for most cases.

You can adjust the loglevel so they still go into dmesg but don't go out 
to the console, which theoretically shouldn't be THAT slow? (At least 
cpu limited rather than wait-for-hardware.)

But keep in mind that a lot of kernel devs seem actively trying to 
sabotage embedded development, and the dmesg metadata is now multiple 
times the size of the actual payload.

https://lkml.iu.edu/hypermail/linux/kernel/2412.0/00045.html

So trimming the dmesg buffer size is probably ALSO a good idea on modern 
embedded systems, because WHAT THE FSCK? Also, I dunno how much cpu time 
all that metadata fapping takes. (Before systemd, this was just text 
going into a ring buffer. But systemd couldn't cope with that because 
https://www.theregister.com/2014/04/05/torvalds_sievers_dust_up/ and 
https://en.wikipedia.org/wiki/Systemd#History and of course 
https://www.linux.com/news/fun-photo-greg-kroah-hartman-crowned-systemd-hackfest/ 
thus the data structures in the kernel had to become far more complex 
after about 30 years of NOT being like that, because systemd.)

Rob
