Received: from gecko.ash.relay.mailchannels.net (gecko.ash.relay.mailchannels.net [23.83.222.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439464431
	for <linux-embedded@vger.kernel.org>; Sun, 12 Jan 2025 01:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736643834; cv=pass; b=l+NkccT9iLKou9WTZw+ZLA4dpgkxUEsyScZi3adg6kre74J7xFHzRMnQjNBjOPnicJhK4eZPiaMl6bQoohl/JQQbjpEK8xuFzWs+S7/A2pfNYxRNdfH7E4eEhlBIUxG4HGs0HeQG4HSEm7WGny3HwKF8RDXFkGZvskhV+IYQXWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736643834; c=relaxed/simple;
	bh=SvK5JgC9+FDQr3eoqw2rt/p62C3MMznbDJ3LMZaGA0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=s6HTl+Oh/0jq7YGtVvZ9dcZTeSO/dAhQWMvTBrKTTb/NKa4PWk+XBh5ovRbb9FpLh6HPjJLNISImdbPfhkGVUzS4OsynHFvs4NX7OzPzDZsOQJqFKiX+8n7wUGUJPQn+vcK3/WrzAdyhIYZPEjff/E6DCHX5C+DIDdgr2sHcKBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=Tjt5KX9d; arc=pass smtp.client-ip=23.83.222.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="Tjt5KX9d"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C862C16283C;
	Sun, 12 Jan 2025 01:03:50 +0000 (UTC)
Received: from pdx1-sub0-mail-a238.dreamhost.com (trex-4.trex.outbound.svc.cluster.local [100.109.46.209])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6F3B81627EC;
	Sun, 12 Jan 2025 01:03:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736643830; a=rsa-sha256;
	cv=none;
	b=hK4CYd6xxwpwTM4erj2JKMmZztukpSmq+2ooGqJiK3YZIGg/ETYaX2d3QYEb5Pkl7uEXks
	7acOLp9JqWby2P90I8sYztwlzlv7ml8t/Q0cdmyyYJW2ONt6U+EpESiiDAQ1yIEaUPeSY4
	F4lOKBJZpPR4vXFDATM/v28JvteMhM0ONWjqiE2UXr3yfphgbIdSxqdLrX008FJdfq+Dtu
	gfDvy9F20TtJrTtSOg8+hLaPAbrxHDj+Z5DXM4rqCszp0Cqib2Pe2Y61fgNpHnMbezL/Rh
	JE1AX8E0cr0GhMYW3i32pZGzim6Hrwg8gFddy38rV4e7Pca2maotXwcblHJNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736643830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=PnGVgepnh++8Z5WAxwalNBoq5n1tdBPhKNHy8bAWax0=;
	b=xxqrtcBeOu/v/LIyvqt6qyckFgcMAUONTK7dur1YI6C6n3psAMUa2JXdetTAkiB8pvRIQO
	X2bP9rpuif/l0bfx1mhlXCnujWy80Bohv0k6hhkubajoMeVotV3KzqHdpxgmDf5fRQpVCb
	M7YEOfIIS5PDrHrgK2OL0FwJxXqVsJrnu9IOnhyk1nhtknGdtzwW3xLqU0tXbua+FjGQPi
	DzaSnSK/JNI5/4QKTaqCdX03LC+KMPbmgnCBuJJuy0p/X5r9tvyaoKsuWNPRixBGJNm+E7
	FB+xorXGs8Eg+7AWl4+YroVDvMB8EbJxIbR9ZGEXhFNfCQ8BXdCH9I+CYBCQSQ==
ARC-Authentication-Results: i=1;
	rspamd-b5645c5d4-bbvgc;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Language-Juvenile: 21f65c715ec4e79f_1736643830689_4081676879
X-MC-Loop-Signature: 1736643830689:2211144058
X-MC-Ingress-Time: 1736643830689
Received: from pdx1-sub0-mail-a238.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.46.209 (trex/7.0.2);
	Sun, 12 Jan 2025 01:03:50 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a238.dreamhost.com (Postfix) with ESMTPSA id 4YVxwj5rnRz2F;
	Sat, 11 Jan 2025 17:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1736643830;
	bh=PnGVgepnh++8Z5WAxwalNBoq5n1tdBPhKNHy8bAWax0=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=Tjt5KX9dYcX3ATHC01fTuPUgWL0zzzd1p9q+ftuMR36KqIOmOLN/W4H1Y2Yoc/F92
	 IqRECNOC/AJKTz8ZM4hgj1N/7MzvCqG5qtGIDzj49hHtKB8JVbnM/RDXghLzqCpKC0
	 o3E1jiSLgmLDJSAwf9T6QtJ/RLNuWRiy2gwn2/AD5o3/SMvJkZoscPvgMRn/ThusF8
	 YxF6ft2X3wkpq9RWYlAh009J1GuVizuStGj/Sru0U9hdRcCK2Q1oXZmGN6cpzQVLeN
	 RBWRjsE18t4m+GVrqjzbj+DACSG55x3ph6jnzk33CZ0A15DaXkjajJbK+ZRxqUl+lu
	 0QFw5y9Ab1dPA==
Message-ID: <0947e977-879b-495f-8225-534e38bc034b@landley.net>
Date: Sat, 11 Jan 2025 19:03:48 -0600
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
 <1c232997-79cf-4153-9b1c-6fcbc42121a9@freenet.de>
 <c70841da-3fe6-4b58-a24f-579dc3cc5dbc@landley.net>
 <1b6e380d-000d-420a-b198-ecb68c356d34@freenet.de>
 <98ae21b7-43bb-4a72-bd50-0b13f9700734@landley.net>
 <MW5PR13MB56325452C6F217FB9C927653FD1D2@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <MW5PR13MB56325452C6F217FB9C927653FD1D2@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/25 12:57, Bird, Tim wrote:
> Hey Rob, This is a great review of /dev, /sys and the different
> ways that /dev gets populated.

Feel free to link stuff from wikis or some such. The newest of those 
documents was written in 2007.

> For a lot of embedded Linux devices, the only bus where
> new items can show up dynamically is USB.

Yup, /sys/bus/usb/devices is in there too and when a driver binds to 
them, they wind up in /sys/block and such as well. (you USED to have to 
seprately mount a usbfs under /sys but they finally acknowledged that 
was silly about 5 years ago, hence 
https://askubuntu.com/questions/1218321/if-usbfs-has-been-deprecated-then-why-is-sys-bus-usb-drivers-usbfs-directory-p)

When a driver DOESN'T automatically bind to them it gets a bit 
complicated, and one of the things mdev can be configured to do is act 
as a firmware loader! Which is just... Ahem, there are YEARS of poor 
design decisions the kernel guys made, where they ignored a mechanism 
they already had an implemented something more complicated. The 
mechanism whereby the kernel opens a firmware file and read it directly 
out of the filesystem instead of calling a hotplug helper was... I'm 
just going to gloss over that.

Anyway, I saw patches go by ala 
https://patchwork.ozlabs.org/project/buildroot/patch/1436188175-7912-1-git-send-email-luca@lucaceresoli.net/ 
which says it's from 2015. I haven't really tried to do it because I 
often know how the plumbing works and usually just implement a ten line 
hack rather than looking up how to configure the more generic tool. 
(Even the generic tool grew out of something I wrote 10 years earlier...)

Anyway, the kernel's "request module" plumbing tends to do a "give me 
usb-vendorID-deviceID thing, and then there's alias plumbing lookup that 
figures out what module name to insmod for that, and at various points 
I've seen said alias lookup plumbing A) in the kernel, B) in module 
headers, C) in modprobe config files under /etc or /lib or something.

*shrug* I build static kernels when given a choice, and don't source 
hardware that needs drivers WITHOUT built-in firmware, so I am WAY out 
of date on that stuff. I remember enough to look it up but not the 
details off the top of my head. And I say that as someone who really 
SHOULD care more:

http://lists.landley.net/pipermail/toybox-landley.net/2024-October/030549.html

It's on the todo list...

> I've always thought the best solution (in terms of boot time)
> was to use static nodes in /dev during early boot (that is, just
> mknod the /dev nodes in the rootfs manually, and have them be present
> before the kernel even runs).  No dynamic discovery or boot-time
> population of /dev needed.

The system knows what devices are available. While you can mknod a 
major:minor node the kernel doesn't have a driver for, if you open it 
you get some sort of -EWTF where the kernel goes "nope".

The kernel has a CONFIG_DEVTMPFS_MOUNT that automatically mounts 
devtmpfs on /dev, but for SOME reason it doesn't apply to initramfs. 
I've been irregularly posting a patch to MAKE it apply on and off for 
most of a decade now:

https://lkml.iu.edu/hypermail/linux/kernel/2005.1/09399.html

And it's part of my mkroot kernel patches:

https://landley.net/bin/mkroot/latest/linux-patches/0003-Wire-up-CONFIG_DEVTMPFS_MOUNT-to-initramfs.patch

But Greg KH. Oh well...

> Then, sometime later, use either
> mdev or devtmpfs to accumulate (and remove?) other
> runtime-plugged devices.  This can be done after the time-critical
> phase of booting.
> 
> Does this overall approach work, or is there some in-kernel
> connections that may be missing if the dynamic tools are
> not used from startup?

I mean it more or less works, it's just... pointless manual maintenance 
of something the kernel does for you in a very small amount of code? (In 
devtmpfs, the /dev node being there means something. In a static /dev, 
it doesn't.)

So: I blather on a lot about my mkroot project, which is a 400 line bash 
script that builds tiny linux system that boots to shell prompt (mostly 
under qemu) on a dozen different architectures. And the init script in 
that starts here:

https://github.com/landley/toybox/blob/master/mkroot/mkroot.sh#L102

And you see how the script does this setup (which is only needed when 
you don't apply my patch to the kernel):

if ! mountpoint -q dev; then
   mount -t devtmpfs dev dev
   [ $$ -eq 1 ] && ! 2>/dev/null <0 && exec 0<>/dev/console 1>&0 2>&1
   for i in ,fd /0,stdin /1,stdout /2,stderr
   do ln -sf /proc/self/fd${i/,*/} dev/${i/*,/}; done
   mkdir -p dev/shm
   chmod +t /dev/shm
fi

(Don't ask me why devtmfs doesn't automatically have a "shm" directory 
with the sticky bit, it's a subclass of tmpfs so it does the right thing 
when it's there. And the middle two lines are just making 
/dev/{stdin,stdout,stderr} because toysh doesn't special case /dev/stdin 
like bash does so needs it in the filesystem if you're gonna use that.)

But that exec redirect line hit a bug, because when you don't have 
devtmpfs automounting but ALSO don't have /dev/console in your 
statically linked initramfs image... oh here, I explained it when I 
fixed it:

https://github.com/landley/toybox/commit/0b2d5c2bb3f1

https://landley.net/notes-2024.html#06-08-2024

tl;dr in usr/main.c the kernel tries to open /dev/console and fails if 
it's not already there, so PID 1 starts with stdin, stdout, and stderr 
closed, so if something goes wrong in early boot init can't tell you why 
it failed. This ONLY happens with static initramfs (created with cpio as 
a normal user and you can't mknod without root access), because of 
COURSE the kernel has two different codepaths for static vs dynamic, and 
the dynamic one does a manual fixup for this issue. No really!

https://github.com/torvalds/linux/blob/master/init/noinitramfs.c#L18

And of course the code doing the fixup runs for ANY system that doesn't 
have a static linked initramfs, including one where the bootloader 
points it at an EXTERNAL cpio.gz image like qemu -initrd blah.cpio.gz, 
because it checks for the external one AFTER doing the fixup. (Pop quiz: 
if you have static _and_ external initrd, and they include the same 
file, does the old one prevent the new one from extracting, does the new 
one replace the old one, or does the new one APPEND to the old one? At 
various points in history, it's done ALL THREE! I forget which is 
current, replace I think?) So external initramfs and built-in initramfs 
behave DIFFERENTLY in a subtle sharp edge ath I've complained at them 
about for YEARS...

*shrug* I make this stuff work in as simple a way as I know how. Been 
doing it for an embarrassingly long time now. But you _reach_ simple by 
process of elimination, and proving a negative is a lot of work.

> Thanks,
>   -- Tim
> 

Rob
