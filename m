Received: from mout2.freenet.de (mout2.freenet.de [195.4.92.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C9A38B
	for <linux-embedded@vger.kernel.org>; Sun, 12 Jan 2025 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.4.92.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736676721; cv=none; b=QOHiNt5xnAaILqRP4oY/P+amCNXkeaEVR3o9IBvO7/XSOTIrujImwIwIi9kVw2BYShdfe5W3M7xrGAydBG/g5uupCrEsFY9EnxYnEd5tBCRMx0unME0R/1L2ZD5NhEvOR7qftXCDt1b4DHD1D5vTUfTJZfChl4J6kj7n9irgPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736676721; c=relaxed/simple;
	bh=Vx5KmRMtwn+hCNjd8bX/4i+Lcs+wmaC2bP6n1lCzBwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BVpSGOijOS9kBt6FTeqbOXP069BKUHgzSUznb0HnF9VoJvD53GKDHIr4Suum9n1zRNjTMYw3IAoS5BdQZYg2IlkotLcOrrhAckWvyDSWNeTQOIz6XxZ2sbxsVRXyWeDBXiECsd2eyxJEJK439a6pCsbnpTIDIR/KTVw5QMVfZGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=JcUNCgjY; arc=none smtp.client-ip=195.4.92.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="JcUNCgjY"
Received: from [195.4.92.127] (helo=sub8.freenet.de)
	by mout2.freenet.de with esmtpa (ID MarkoHoyer@freenet.de) (port 25) (Exim 4.94.2 #2)
	id 1tWuwc-000uww-BV; Sun, 12 Jan 2025 11:11:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SVT1fOMH0p/w6ta4tirb73Q4HT8TNoz1e2Sh/NGicjg=; b=JcUNCgjYEQ4V/iF+rKcZtMJ+O6
	lyyW7pILhj08LnmuBA25j0qLI6UbGa538nxPAB8ZZXMJ2I/cx/Nn59ataWGRF8ZYSK0jS72MvA950
	xJxNJfBunsO3izad4l/MbCDs3PkMjcIj15dzOALNyC9Gkp2AbRRlj9z7kTAWAkb8xVOuCPtCORhZB
	YUWsWcrOerQBZGNCh7/skkyOq9596hs8CDyvE+6Mhf1+uMa4r8J/Tz8W6/4x8fgW31nrs0CF937ik
	E2mmB6N3yAqv+UmQ+RP1gzeC7Rgg1zt0XwINq0OCIYB+1Fp7uvdp8lorw299SBExu5ZQa7ZU61CB3
	3PzVOCFw==;
Received: from [2a02:8071:7010:720:db7d:daa6:9792:fba2] (port=52964)
	by sub8.freenet.de with esmtpsa (ID MarkoHoyer@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 587) (Exim 4.94.2 #2)
	id 1tWuwc-00G6Gw-0P; Sun, 12 Jan 2025 11:11:46 +0100
Message-ID: <32c4e5f1-7ba4-40b0-ae7d-a9fe9dd65d6b@freenet.de>
Date: Sun, 12 Jan 2025 11:11:44 +0100
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
 <1c232997-79cf-4153-9b1c-6fcbc42121a9@freenet.de>
 <c70841da-3fe6-4b58-a24f-579dc3cc5dbc@landley.net>
 <1b6e380d-000d-420a-b198-ecb68c356d34@freenet.de>
 <98ae21b7-43bb-4a72-bd50-0b13f9700734@landley.net>
 <MW5PR13MB56325452C6F217FB9C927653FD1D2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <0947e977-879b-495f-8225-534e38bc034b@landley.net>
Content-Language: en-US
From: Marko Hoyer <mhoyer.oss-devel@freenet.de>
In-Reply-To: <0947e977-879b-495f-8225-534e38bc034b@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 1736676706214BACCFD4FDO
X-Originated-At: 2a02:8071:7010:720:db7d:daa6:9792:fba2!52964
X-Scan-TS: Sun, 12 Jan 2025 11:11:46 +0100


Am 12.01.25 um 02:03 schrieb Rob Landley:
> On 1/11/25 12:57, Bird, Tim wrote:
>> Hey Rob, This is a great review of /dev, /sys and the different
>> ways that /dev gets populated.
>
> Feel free to link stuff from wikis or some such. The newest of those 
> documents was written in 2007.
>
>> For a lot of embedded Linux devices, the only bus where
>> new items can show up dynamically is USB.

SDCARD readers connected via MMC are common in automtove head units as 
well ...


>
> Yup, /sys/bus/usb/devices is in there too and when a driver binds to 
> them, they wind up in /sys/block and such as well. (you USED to have 
> to seprately mount a usbfs under /sys but they finally acknowledged 
> that was silly about 5 years ago, hence 
> https://askubuntu.com/questions/1218321/if-usbfs-has-been-deprecated-then-why-is-sys-bus-usb-drivers-usbfs-directory-p)
>
> When a driver DOESN'T automatically bind to them it gets a bit 
> complicated, and one of the things mdev can be configured to do is act 
> as a firmware loader! Which is just... Ahem, there are YEARS of poor 
> design decisions the kernel guys made, where they ignored a mechanism 
> they already had an implemented something more complicated. The 
> mechanism whereby the kernel opens a firmware file and read it 
> directly out of the filesystem instead of calling a hotplug helper 
> was... I'm just going to gloss over that.

WIFI & Bluetooth devices often use this firmware mechanism. And yes I 
agree, it looks a bit ** ugly** seeing the kernel loading a firmware 
file from /lib/firmware  searching it in the root file system w/o 
knowing the state of it during boot ... For WIFI and bluetooth I do not 
see a big issue here since I'd prevent putting such features on a 
critical chain by system design in any way since bringing them up and 
(re)connecting external devices is time consuming by nature. Nothing you 
shall need to wait for ...

> Anyway, I saw patches go by ala 
> https://patchwork.ozlabs.org/project/buildroot/patch/1436188175-7912-1-git-send-email-luca@lucaceresoli.net/ 
> which says it's from 2015. I haven't really tried to do it because I 
> often know how the plumbing works and usually just implement a ten 
> line hack rather than looking up how to configure the more generic 
> tool. (Even the generic tool grew out of something I wrote 10 years 
> earlier...)
>
> Anyway, the kernel's "request module" plumbing tends to do a "give me 
> usb-vendorID-deviceID thing, and then there's alias plumbing lookup 
> that figures out what module name to insmod for that, and at various 
> points I've seen said alias lookup plumbing A) in the kernel, B) in 
> module headers, C) in modprobe config files under /etc or /lib or 
> something.
>
> *shrug* I build static kernels when given a choice, and don't source 
> hardware that needs drivers WITHOUT built-in firmware, so I am WAY out 
> of date on that stuff.

Compiling in modules vs. loading them later from user space is a 
trade-off. The effect of putting stuff into modules is to keep the 
kernel small which helps you in the "unpacking & loading kernel" phase 
before the kernel is actually started. Having an 1MB unpacked kernel is 
significantly a difference to a 5MB one. On the other hand, my 
experience is that there is lot of overhead (CPU time and IO) loading 
modules from user space. So it really only makes sense, if you have 
drivers to load at a point in time during startup where you have enough 
time and resources left.

> I remember enough to look it up but not the details off the top of my 
> head. And I say that as someone who really SHOULD care more:
>
> http://lists.landley.net/pipermail/toybox-landley.net/2024-October/030549.html 
>
>
> It's on the todo list...
>
>> I've always thought the best solution (in terms of boot time)
>> was to use static nodes in /dev during early boot (that is, just
>> mknod the /dev nodes in the rootfs manually, and have them be present
>> before the kernel even runs).  No dynamic discovery or boot-time
>> population of /dev needed.
>
> The system knows what devices are available. While you can mknod a 
> major:minor node the kernel doesn't have a driver for, if you open it 
> you get some sort of -EWTF where the kernel goes "nope".
>
> The kernel has a CONFIG_DEVTMPFS_MOUNT that automatically mounts 
> devtmpfs on /dev, but for SOME reason it doesn't apply to initramfs. 
> I've been irregularly posting a patch to MAKE it apply on and off for 
> most of a decade now:
>
> https://lkml.iu.edu/hypermail/linux/kernel/2005.1/09399.html
>
> And it's part of my mkroot kernel patches:
>
> https://landley.net/bin/mkroot/latest/linux-patches/0003-Wire-up-CONFIG_DEVTMPFS_MOUNT-to-initramfs.patch 
>
>
> But Greg KH. Oh well...
>
>> Then, sometime later, use either
>> mdev or devtmpfs to accumulate (and remove?) other
>> runtime-plugged devices.  This can be done after the time-critical
>> phase of booting.
>>
>> Does this overall approach work, or is there some in-kernel
>> connections that may be missing if the dynamic tools are
>> not used from startup?
>
> I mean it more or less works, it's just... pointless manual 
> maintenance of something the kernel does for you in a very small 
> amount of code? (In devtmpfs, the /dev node being there means 
> something. In a static /dev, it doesn't.)

I agree. There is kind of dynamic device enumeration done by the kernel 
drivers anyway once loaded. Any data structures to devices are build up 
internally. Nothing you can save ...

I'm even not sure how devtmpfs can be combined w/ your static devnodes 
you created in any kind of persistent partition. And if you even can get 
the kernel accepting your partition to use as /dev, you need to have it 
writeable for the case of dynamics you might need (usb for instance) 
which does not really go well with a read only RFS ... You could ... 
overlay fs ... well no, I think this goes into a wrong direction -> too 
complicated ;)

>
> So: I blather on a lot about my mkroot project, which is a 400 line 
> bash script that builds tiny linux system that boots to shell prompt 
> (mostly under qemu) on a dozen different architectures. And the init 
> script in that starts here:
>
> https://github.com/landley/toybox/blob/master/mkroot/mkroot.sh#L102
>
> And you see how the script does this setup (which is only needed when 
> you don't apply my patch to the kernel):
>
> if ! mountpoint -q dev; then
>   mount -t devtmpfs dev dev
>   [ $$ -eq 1 ] && ! 2>/dev/null <0 && exec 0<>/dev/console 1>&0 2>&1
>   for i in ,fd /0,stdin /1,stdout /2,stderr
>   do ln -sf /proc/self/fd${i/,*/} dev/${i/*,/}; done
>   mkdir -p dev/shm
>   chmod +t /dev/shm
> fi
>
> (Don't ask me why devtmfs doesn't automatically have a "shm" directory 
> with the sticky bit, it's a subclass of tmpfs so it does the right 
> thing when it's there. And the middle two lines are just making 
> /dev/{stdin,stdout,stderr} because toysh doesn't special case 
> /dev/stdin like bash does so needs it in the filesystem if you're 
> gonna use that.)
>
> But that exec redirect line hit a bug, because when you don't have 
> devtmpfs automounting but ALSO don't have /dev/console in your 
> statically linked initramfs image... oh here, I explained it when I 
> fixed it:
>
> https://github.com/landley/toybox/commit/0b2d5c2bb3f1
>
> https://landley.net/notes-2024.html#06-08-2024
>
> tl;dr in usr/main.c the kernel tries to open /dev/console and fails if 
> it's not already there, so PID 1 starts with stdin, stdout, and stderr 
> closed, so if something goes wrong in early boot init can't tell you 
> why it failed. This ONLY happens with static initramfs (created with 
> cpio as a normal user and you can't mknod without root access), 
> because of COURSE the kernel has two different codepaths for static vs 
> dynamic, and the dynamic one does a manual fixup for this issue. No 
> really!
>
> https://github.com/torvalds/linux/blob/master/init/noinitramfs.c#L18
>
> And of course the code doing the fixup runs for ANY system that 
> doesn't have a static linked initramfs, including one where the 
> bootloader points it at an EXTERNAL cpio.gz image like qemu -initrd 
> blah.cpio.gz, because it checks for the external one AFTER doing the 
> fixup. (Pop quiz: if you have static _and_ external initrd, and they 
> include the same file, does the old one prevent the new one from 
> extracting, does the new one replace the old one, or does the new one 
> APPEND to the old one? At various points in history, it's done ALL 
> THREE! I forget which is current, replace I think?) So external 
> initramfs and built-in initramfs behave DIFFERENTLY in a subtle sharp 
> edge ath I've complained at them about for YEARS...
>
> *shrug* I make this stuff work in as simple a way as I know how. Been 
> doing it for an embarrassingly long time now. But you _reach_ simple 
> by process of elimination, and proving a negative is a lot of work.
>
>> Thanks,
>>   -- Tim
>>
>
> Rob
>
To summarize from my point of view:

* It's worth talking a bit about the effect of udev and about alternatives

* "mdev" is surely worth being named as an potential option besides 
"selective triggering" and "static setup and moving triggers back in time"

* I wouldn't regard mknode as an real alternative in todays system

* In addition I can imagine is "modules loading" vs. "compiling in 
drivers" something which is worth mentioning

* Once I've access to the wiki, I can try to put these ideas into an 
initial structure filled up w/ info we discussed in this thread

Marko

