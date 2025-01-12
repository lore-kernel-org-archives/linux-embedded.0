Received: from weasel.tulip.relay.mailchannels.net (weasel.tulip.relay.mailchannels.net [23.83.218.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EBF3232
	for <linux-embedded@vger.kernel.org>; Sun, 12 Jan 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.247
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736706966; cv=pass; b=kQFoSfwttVPwvNwKgZIiUN0dV197NoJzYNDaAQWjJ/9ZndIhLQncSER6KmSU4pY1Vzv565ikt07s3VzQ9W+HD6bmwpotYNqhqu6wUkU/CEfD/u87sKrMdYxA2rj/LfKwPARsEce9Y+bWlPmqvr+lhbEokndPYjbektKTd3MnyN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736706966; c=relaxed/simple;
	bh=G2A0E3s0arSkSmSFJmIu6Tuj5hcakiGpdBGoqi7UTaE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=PtWyoE1YG31+s+PckN0uAPleKiWeyQzyYbUg6f/8UfIQZ9bF5e2QyHFOHIs+jz/EPZNlQomjT6PITI928SJoOiJgM3lfXORX11QVnTP9CNrxTgcprr4tfNzG/19+CGQ1iTHG+BvPGAjPs8O3Ndg5JIRNGPMEC9jvnDC9jKKYORk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=hIpXc7Q2; arc=pass smtp.client-ip=23.83.218.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="hIpXc7Q2"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B07F0782A10;
	Sun, 12 Jan 2025 18:35:57 +0000 (UTC)
Received: from pdx1-sub0-mail-a294.dreamhost.com (100-111-94-125.trex-nlb.outbound.svc.cluster.local [100.111.94.125])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 56CD27828A8;
	Sun, 12 Jan 2025 18:35:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736706957; a=rsa-sha256;
	cv=none;
	b=nemq1yqDl9AamxZWgHsl0rqIYV8ZciLxshiI+oiubfeUtHnuto8gc8I6YikuvFPhjb7Opg
	UTYCDNw+LjjiDFsMZuLrE+wozV8a31M/obTxjIwvUQR+6oKF7WhnfxPuSAyiZBkiuiwBWo
	CzgpgEXxynSvjVIbwrBELM5nUIpmR7xmh3hi/mPet/WAG/0AO+Rfmas4W+1+VewHr/1Hjv
	Ih1SYeHN5mc/BdryMBjgLdA7mN4IOVU8DSraFrJgJV94N1tkoF6Lg1tFdpy/hiiDaIAkhJ
	0CmOUBE3mPZLCqGC68xFYrqg7Jf/EzgppBREPiloN9USFxvp0AgQNRZF54cXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736706957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=QXM61ep/r/scPrGyaXAfFnYga2d2ScKwIvtvC72Xy+U=;
	b=PkvCuwt0LXq4ntbZRVUkKEnIbX3SA6vx+73oF6k3+3xAmAXwUMFsPJpfpGjVXRdNazuL6+
	+KG4q5+dXocBHx09kQ1mMvY6XGFobsDuK/Fk5zUjaqXRJs56N9gfJTG0kNSi7xt1rFqqO5
	PAbTClulXIzdGt1dNyCUoC8xVK2WwMuldPIMk3cEuR3kpFlu3PuNPyvp95Y+lWmLECUEdE
	ayul7+z1mUwLaASig40HLTR7bRyuNH6o9NtaEsnekYn+g1bphMPcxER2a/vp294QMh1fPR
	hpzh/JMjv3XGVomM0GHSXDEYaBcnwxLAWl+68EUFY96Yw/fSRoMlNEJ8yblqUg==
ARC-Authentication-Results: i=1;
	rspamd-7df4dcbd86-stgxl;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Average-Spill: 7d7326a432ab122b_1736706957597_2474460382
X-MC-Loop-Signature: 1736706957597:188818463
X-MC-Ingress-Time: 1736706957597
Received: from pdx1-sub0-mail-a294.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.94.125 (trex/7.0.2);
	Sun, 12 Jan 2025 18:35:57 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a294.dreamhost.com (Postfix) with ESMTPSA id 4YWPGh59Tgz6X;
	Sun, 12 Jan 2025 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736706957;
	bh=QXM61ep/r/scPrGyaXAfFnYga2d2ScKwIvtvC72Xy+U=;
	h=Content-Type:Date:Subject:To:From;
	b=hIpXc7Q21lqaMipHEiGuWRit7i1vybWs9Uh4cjN34re5xAlHOXRlJYh4u8zz1OkBr
	 EMIo2mx5Z0XCpU1xRDGU0TJKo+ktSrA/otr9xJNtkXS139L3kPOb3a/oAs/gXf5EZY
	 W6HH87Hvc0rXUnm1HNPFlC0fzj93hwVNMn6o92J3MkdlHnbONIImo0YwWz2OIPz17N
	 IYdvN831TUnbfvVkvZG4tP7kVlD1/1YTs581FsiYIq66FViXKZA7gSmM6vQb2Vp124
	 kY5IqShVklx9pcEkMScB/Y3qh4Oi7g4W1JsuM3h/auBEEOibdWTn3F51KIboeqKaGL
	 WyGBk5pNvRjOA==
Content-Type: multipart/mixed; boundary="------------xJ0URpFIoiDB0YnGK64joF77"
Message-ID: <3c0f0064-9282-4028-88a9-daf0cc893497@landley.net>
Date: Sun, 12 Jan 2025 12:35:55 -0600
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
 <98ae21b7-43bb-4a72-bd50-0b13f9700734@landley.net>
 <MW5PR13MB56325452C6F217FB9C927653FD1D2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <0947e977-879b-495f-8225-534e38bc034b@landley.net>
 <32c4e5f1-7ba4-40b0-ae7d-a9fe9dd65d6b@freenet.de>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <32c4e5f1-7ba4-40b0-ae7d-a9fe9dd65d6b@freenet.de>

This is a multi-part message in MIME format.
--------------xJ0URpFIoiDB0YnGK64joF77
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/25 04:11, Marko Hoyer wrote:
> Am 12.01.25 um 02:03 schrieb Rob Landley:
>> On 1/11/25 12:57, Bird, Tim wrote:
>>> Hey Rob, This is a great review of /dev, /sys and the different
>>> ways that /dev gets populated.
>>
>> Feel free to link stuff from wikis or some such. The newest of those 
>> documents was written in 2007.
>>
>>> For a lot of embedded Linux devices, the only bus where
>>> new items can show up dynamically is USB.
> 
> SDCARD readers connected via MMC are common in automtove head units as 
> well ...

But do they give an insertion/removal notification that can generate an 
interrupt rather than needing to be polled? (Last couple of boards I 
poked at didn't, but it was cheap hardware...)

>> When a driver DOESN'T automatically bind to them it gets a bit 
>> complicated, and one of the things mdev can be configured to do is act 
>> as a firmware loader! Which is just... Ahem, there are YEARS of poor 
>> design decisions the kernel guys made, where they ignored a mechanism 
>> they already had an implemented something more complicated. The 
>> mechanism whereby the kernel opens a firmware file and read it 
>> directly out of the filesystem instead of calling a hotplug helper 
>> was... I'm just going to gloss over that.
> 
> WIFI & Bluetooth devices often use this firmware mechanism.

The wifi and bluetooth _hardware_ is always there though. Transciever 
link toggle is more or less a media insertion/removal event, which is a 
slightly different hotplug mechanism.

Ogres, onions... layers.

> And yes I 
> agree, it looks a bit ** ugly** seeing the kernel loading a firmware 
> file from /lib/firmware  searching it in the root file system w/o 
> knowing the state of it during boot ...

They already HAD the hotplug helper mechanism and initramfs! You could 
already CALL A LOADER and some of us had that working and DEPLOYED 
before they built a whole new mechanism for "the kernel reaches out and 
reads a file out of the userspace view of the filesystem from kernel 
space without a process context to do it in like the ELF loader has, 
don't ask me what this means for containers and namespaces..."

(Ok, they wanted to load firmware before PID 1 launched, but they were 
already breaking the drivers into separate probe/init sections so you 
could probe before were started and init after interrupts were started 
and launching PID 1 is the first thing that happens after interrupts are 
enabled (we have a scheduler now, the idle task can fork off PID 1 and 
PID 0 can run pause() in a loop. Except between those two the kernel 
launches a zillion "kernel threads" including the tasklets and deferred 
device initialization and so on...)

It wasn't just awkward, it was unnecessary. (And it DOES NOT SOLVE the 
underlying licensing issue of "this firmware is not gpl, I am bundling 
it into a statically linked initramfs, is this "mere aggregation", let's 
see what a judge has to say!

Meanwhile Bradley is in court ACTIVELY ARGUING that there's no 
difference between GPLv2 and GPLv3 and that the complete lack of any 
copyright holders willing to sign on to his increasingly extreme 
enforcement views isn't a problem because GPLv2 is a contract despite 
the complete absence of things like "privity of contract"... No really:

https://blog.tidelift.com/will-the-new-judicial-ruling-in-the-vizio-lawsuit-strengthen-the-gpl

I got dragged into this recently to spend a day telling a camera "no, 
Bradley's full of it", and yes he flew in to sit at the other end of the 
table for some reason:

https://landley.net/notes-2024.html#24-06-2024

Sigh. There's a reason I do 0BSD these days:

https://landley.net/toybox/license.html

> For WIFI and bluetooth I do not 
> see a big issue here since I'd prevent putting such features on a 
> critical chain by system design in any way since bringing them up and 
> (re)connecting external devices is time consuming by nature. Nothing you 
> shall need to wait for ...

Except that reconnection mostly happens in software. The _hardware_ 
you're talking to stays connected. It's a resource 
acquisition/allocation problem sure, but closer to partition re-scanning.

*shrug* The asynchronous notifications that something happened behind 
your back come in through similar mechanisms, but if that's ALL we were 
dealing with we wouldn't have needed most of this plumbing.

(Although that was ANOTHER fun failure of the old devfs: /dev/eth0 isn't 
common, thanks to Bill Joy somehow not really understanding unix in 
1979. And of course renaming /dev/hda to /dev/sda is a big deal from a 
compatibility perspective, but the <strike>devfsd2</strike> systemd guys 
deciding that eth0: is now potato03x1: or some such? That's just fine, 
who cares about compatibility with that...)

> Compiling in modules vs. loading them later from user space is a trade- 
> off. The effect of putting stuff into modules is to keep the kernel 
> small which helps you in the "unpacking & loading kernel" phase before 
> the kernel is actually started. Having an 1MB unpacked kernel is 
> significantly a difference to a 5MB one.

If you can avoid ever loading the module, you may come out ahead. 
(Modulo why are you shipping it then, still needs storage.) Last I 
checked the actual module unloading was still a NOP half the time (the 
memory stays pinned) and marks your kernel "tainted" if you ever 
actually do it, which is not a vote of confidence in the codepath if you 
ask me.

But I had toybox insmod working years ago, the question is toybox 
_modprobe_ is still in pending because modprobe pulls fairly extensive 
shenanigans I am not personally familiar with and have to learn how to 
use before I can implement them, and they just seem like TERRIBLE IDEAS:

https://github.com/landley/toybox/issues/522

> On the other hand, my 
> experience is that there is lot of overhead (CPU time and IO) loading 
> modules from user space. So it really only makes sense, if you have 
> drivers to load at a point in time during startup where you have enough 
> time and resources left.

The kernel boot process is already fairly heavily asynchronous, which is 
why your shell prompt gets buried with "link up" notifications spamming 
the console after it prints the $ and so on. That's why mkroot's init 
script does echo 3 > /proc/sys/kernel/printk before the exec handoff to 
whatever inherits PID 1 from the setup script:

https://github.com/landley/toybox/blob/0.8.11/mkroot/mkroot.sh#L133

Because if it's a shell, and we don't do that, you won't see the prompt 
under the noise.

>> I mean it more or less works, it's just... pointless manual 
>> maintenance of something the kernel does for you in a very small 
>> amount of code? (In devtmpfs, the /dev node being there means 
>> something. In a static /dev, it doesn't.)
> 
> I agree. There is kind of dynamic device enumeration done by the kernel 
> drivers anyway once loaded. Any data structures to devices are build up 
> internally. Nothing you can save ...

I spent YEARS convincing the android guys to look at devtmpfs, 
initramfs, container plumbing... (Keep in mind Google bought Android 
Inc. in 2005 and shipped the first phone at the end of 2008, meaning 
their main development effort predated most of this plumbing and they 
had to retrofit it in much later.)  No idea how much impact I had and 
how much they would have eventually done anyway, but the main guy I was 
having those conversations with WAS the android base OS maintainer, 
so... Most recent was probably:

http://lists.landley.net/pipermail/toybox-landley.net/2022-August/029139.html

You'd think the early boot stuff was fairly straightfoward, but I keep 
winding up being the one to manually fix crap like:

https://lkml.iu.edu/hypermail/linux/kernel/1306.3/04204.html

And then YEARS LATER, it's me who has to:

https://lore.kernel.org/lkml/8244c75f-445e-b15b-9dbf-266e7ca666e2@landley.net/

And then it had to be rewritten to remove my taint:

https://lkml.iu.edu/hypermail/linux/kernel/2311.1/01821.html
https://lkml.iu.edu/hypermail/linux/kernel/2311.2/02938.html

Let alone obvious polishing nonsense like:

https://lkml.iu.edu/hypermail/linux/kernel/1705.0/02640.html

(Which only went in because Andrew Morton picked it up despite Greg KH 
doing his usual stonewalling of literally anything from me. Oh well.)

Anyway, there's a reason I'm not really a kernel developer. When I try 
to engage with them myself, "crickets chirp" is pretty much the GOOD 
outcome...

https://lkml.iu.edu/hypermail/linux/kernel/1707.2/01797.html

Ahem. I'll stop now.

> I'm even not sure how devtmpfs can be combined w/ your static devnodes 
> you created in any kind of persistent partition.

You could mount your own /tmp and do mdev -s into it. That's what we 
used to do back around 2005:

https://lkml.iu.edu/hypermail/linux/kernel/0512.0/1326.html

(Also, when devtmpfs first went in, if you modified a node (touch, 
chattr, etc) then it wouldn't delete it and your management tool would 
have to delete it via hotplug removal event handling. So you could PIN 
nodes, I was just never clear on why you'd want to. It probably still 
does that?)

> And if you even can get 
> the kernel accepting your partition to use as /dev,

Kernel doesn't care.

> you need to have it 
> writeable for the case of dynamics you might need (usb for instance) 
> which does not really go well with a read only RFS ... You could ... 
> overlay fs ... well no, I think this goes into a wrong direction -> too 
> complicated ;)

If you just have a /tmp dir in initramfs with some starting nodes 
initialized via the cpio extractor, and then have something like mdev 
add things on top of that as they're hotplugged, initramfs is inherently 
writeable thus the /tmp dir would be.

There's a race condition where "I booted a device with USB already 
plugged into it before powerup, when is the hotplug event delivered and 
is it before the hotplug handler is registered", which I cared deeply 
about in 2005 and no longer remember the details of. I could try to dig 
them up out of my blog and the busybox/kernel mailing lists if you care?


> To summarize from my point of view:
> 
> * It's worth talking a bit about the effect of udev and about alternatives

I am not a fan of udev, for reasons that are part technical and part "oh 
those assholes" rant path I'm trying to avoid going down.

> * "mdev" is surely worth being named as an potential option besides 
> "selective triggering" and "static setup and moving triggers back in time"
> 
> * I wouldn't regard mknode as an real alternative in todays system

It still comes up from time to time, usually when initializing 
containers. (Because devtmpfs in containers does NOT give a proper 
container-local view of its namespace.)

Once upon a time, you could use the linux kernel's built in initramfs 
generation plumbing to create a cpio with arbitrary contents by 
providing simple text snippets to supplement their scanner, including a 
/dev/console entry created as a normal user (without running as root!).

But of COURSE the kernel developers removed the ability, and I patched 
it back in (attached), and then went "no, not fighting that fight"...

> * In addition I can imagine is "modules loading" vs. "compiling in 
> drivers" something which is worth mentioning

There's buckets of domain expertise there and I have like 1/3 of what 
I'd need to be confident there. (I know where to look it up, but have 
never considered it a good thing. Half the point of modules was to 
load/unload drivers for testing without reboots, and I just boot cycle a 
system under qemu or KVM when I can, and boot cycle a physical board 
when I can't because fiddling with modules really doesn't HELP my 
workflow. YMMV...)

The main other reason modules persist is out-of-tree drivers, usually 
not under GPL, which have been under systematic attack for well over a 
decade and the people still doing it have large teams writing shim code.

Most "let's use modules" decisions _since_ then boil down to either

1) "this is a generic PC hardware distro and I have no idea what 
hardware will be on there, and building every possible module into the 
kernel wastes a couple dozen megabytes of RAM on a system"

2) This mechanism exists, there must be a reason, therefore I should 
definitely use it because it's there.

(They built _mechanisms_ to prevent you from upgrading modules without 
upgrading the kernel they plug into. Note that the description of 
CONFIG_MODVERSIONS says that WITHOUT it you can't have even slight 
version skew. That's without MODULE_SIG and MODULE_SRCVERSION_ALL and so 
on.)

By the way, you can provide "module arguments" on the kernel command 
line, write to things like /sys/module/psmouse/parameters/rate after the 
driver's up...

> * Once I've access to the wiki, I can try to put these ideas into an 
> initial structure filled up w/ info we discussed in this thread
> 
> Marko

Good luck.

You know what we REALLY need a new version of? A rewrite of:

https://landley.net/kdocs/mirror/lki-single.html

With sections for each architecture. (And if you tried to write one, 
you'd hate Raspberry Pi as much as I do! Although 
https://forums.raspberrypi.com/viewtopic.php?t=357536 is extremely 
promising, and a far sight better than 
https://github.com/christinaa/rpi-open-firmware ever got to. Although I 
haven't really dug into the details of what's still proprietary black 
box spyware subtly bugging your board with "system management mode" 
hijacks, and what they actually managed to work around despite not 
having hardware documentation for broadcom chips...)

Rob
--------------xJ0URpFIoiDB0YnGK64joF77
Content-Type: text/x-patch; charset=UTF-8;
 name="0011-gen_init_cpio-regression.patch"
Content-Disposition: attachment;
 filename="0011-gen_init_cpio-regression.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9iIExhbmRsZXkgPHJvYkBsYW5kbGV5Lm5ldD4KRGF0ZTogRnJpLCAwNiBPY3Qg
MjAyMyAwMjo1NjoxOSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIEFkZCBnZW5faW5pdHJhbWZz
LnNoIC1PCgpBZGQgYSAtTyBvcHRpb24gdG8gb3V0cHV0IHRoZSBsaXN0IGluc3RlYWQgb2Yg
dGhlIGFyY2hpdmUuIChZb3UgY2FuCnNwZWNpZnkgLW8gYWZ0ZXIgLU8gdG8gcHJvZHVjZSBi
b3RoLikKCkZvciAxNSB5ZWFycyBnZW5faW5pdHJhbWZzX2xpc3Quc2ggcHJvZHVjZWQgYSB0
ZXh0IG91dHB1dCBmb3JtYXQgdGhhdApvdGhlciB0aGluZ3MgY29uc3VtZWQgYW5kIG1vZGlm
aWVkIGFuZCBmZWQgYmFjayB0byB0aGUga2VybmVsLCB0aGVuCnRoZSBzY3JpcHQgY2hhbmdl
ZCB0byBjb25zdW1lIHRoZSBsaXN0IGludGVybmFsbHkgYW5kIHByb2R1Y2UgdGhlIGNwaW8K
YXJjaGl2ZSBkaXJlY3RseS4gKFdoeSB0aGV5IGRpZG4ndCBqdXN0IGNoYW5nZSBnZW5faW5p
dF9jcGlvLmMgdG8gdHJhdmVyc2UKZGlyZWN0b3JpZXMgaXRzZWxmIGlmIHRoZXkgd2VyZSBn
b2luZyB0byB0YWtlIGF3YXkgdGhlIGFiaWxpdHkgdG8gZmlsdGVyCnRoZSBsaXN0IGlzIGFu
IG9wZW4gcXVlc3Rpb24uIE1heWJlIGl0IGNvdWxkIGhhbmRsZSBmaWxlbmFtZXMgd2l0aCBz
cGFjZXMKaW4gdGhlbSBpZiB0aGV5J2QgZG9uZSB0aGF0PyBBbmQgd2h5ICJzcXVhc2giIGlu
LWJhbmQgc2lnbmFsbGluZyBpbnN0ZWFkIG9mCnRoZSAtMSBJIHN1Ym1pdHRlZCwgd2hpY2gg
ZG9lc24ndCBjb25mbGljdCB3aXRoIGV4aXN0aW5nIHVzZXJzIGJlY2F1c2UKaW50ZWdlcnMg
YXJlbid0IHZhbGlkIHVzZXJuYW1lcy4uLikKClNpZ25lZC1vZmYtYnk6IFJvYiBMYW5kbGV5
IDxyb2JAbGFuZGxleS5uZXQ+Ci0tLQoKIHVzci9nZW5faW5pdHJhbWZzLnNoIHwgICAxMCAr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Vzci9nZW5faW5pdHJhbWZzLnNoIGIvdXNyL2dlbl9pbml0cmFtZnMuc2gKaW5kZXgg
MTRiNTc4MmY5NjFhLi44Zjc1OTg4YTU3OTkgMTAwNzU1Ci0tLSBhL3Vzci9nZW5faW5pdHJh
bWZzLnNoCisrKyBiL3Vzci9nZW5faW5pdHJhbWZzLnNoCkBAIC0xNSw2ICsxNSw3IEBAIHVz
YWdlKCkgewogY2F0IDw8IEVPRgogVXNhZ2U6CiAkMCBbLW8gPGZpbGU+XSBbLWwgPGRlcF9s
aXN0Pl0gWy11IDx1aWQ+XSBbLWcgPGdpZD5dIHstZCB8IDxjcGlvX3NvdXJjZT59IC4uLgor
CS1PIDxmaWxlPiAgICAgIE91dHB1dCBhbm5vdGF0ZWQgZmlsZSBsaXN0IGluc3RlYWQgb2Yg
YXJjaGl2ZQogCS1vIDxmaWxlPiAgICAgIENyZWF0ZSBpbml0cmFtZnMgZmlsZSBuYW1lZCA8
ZmlsZT4gYnkgdXNpbmcgZ2VuX2luaXRfY3BpbwogCS1sIDxkZXBfbGlzdD4gIENyZWF0ZSBk
ZXBlbmRlbmN5IGxpc3QgbmFtZWQgPGRlcF9saXN0PgogCS11IDx1aWQ+ICAgICAgIFVzZXIg
SUQgdG8gbWFwIHRvIHVzZXIgSUQgMCAocm9vdCkuCkBAIC0yMDYsNiArMjA3LDE1IEBAIHdo
aWxlIFsgJCMgLWd0IDAgXTsgZG8KIAkJCWVjaG8gImRlcHNfaW5pdHJhbWZzIDo9IFxcIiA+
ICRkZXBfbGlzdAogCQkJc2hpZnQKIAkJCTs7CisJCSItTyIpCSMgT3V0cHV0IGFubm90YXRl
ZCBmaWxlIGxpc3QKKwkJCXVuc2V0IG91dHB1dAorCQkJdHJhcCAtIEVYSVQKKwkJCVsgIiQx
IiA9ICItIiBdICYmCisJCQkJY3Bpb19saXN0PSIvZGV2L3N0ZG91dCIgfHwKKwkJCQljcGlv
X2xpc3Q9IiQxIgorCQkJc2hpZnQKKwkJCTs7CisKIAkJIi1vIikJIyBnZW5lcmF0ZSBjcGlv
IGltYWdlIG5hbWVkICQxCiAJCQlvdXRwdXQ9IiQxIgogCQkJc2hpZnQK

--------------xJ0URpFIoiDB0YnGK64joF77--
