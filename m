Received: from hamster.birch.relay.mailchannels.net (hamster.birch.relay.mailchannels.net [23.83.209.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B9526299
	for <linux-embedded@vger.kernel.org>; Sat, 30 May 2026 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780178325; cv=none; b=LrIa15jBsUHoev/AcRT49oq2UOJf6/Rtm6ZOo70EJNZCmlNP8jECh46ByPKkzqTrXpMAu5fBygMOkg5JrOZjIHLdth2lwgpUIR7zDy7yaF0GVolMpF2/AxlIdCAtGyRKLEE5wXQV86fKft/EXRwehClIdwluW2acfbF8l2i2WOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780178325; c=relaxed/simple;
	bh=+fzGnKjkIZeCdWTZmbonjCVtTDnQCgKDFjzg1c4ClxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TqbtjtNQdW1EXgwQuEO1M7uVMOle+RA9Xk3veK5QeLtBdTUnYAE7yGW9cq0dfLF3+xGMz17h2lzp/D6So/IIIzcnmfwmZbddmeMvcRkop9KUXX0HYiGniHY//lGHFcbjkxda8iSLfUm/EjzxnzYXPTjYTuJnMcIgpMWFOKSAZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=Ohwo1Qhh; arc=none smtp.client-ip=23.83.209.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="Ohwo1Qhh"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A2D6546240C;
	Sat, 30 May 2026 20:41:26 +0000 (UTC)
Received: from pdx1-sub0-mail-a210.dreamhost.com (100-103-80-215.trex-nlb.outbound.svc.cluster.local [100.103.80.215])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 02955462308;
	Sat, 30 May 2026 20:41:25 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Whimsical-Duck: 3e1b06e141e767a0_1780173685304_4149709482
X-MC-Loop-Signature: 1780173685304:3604371909
X-MC-Ingress-Time: 1780173685304
Received: from pdx1-sub0-mail-a210.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.80.215 (trex/7.1.5);
	Sat, 30 May 2026 20:41:25 +0000
Received: from [192.168.14.155] (unknown [209.81.127.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a210.dreamhost.com (Postfix) with ESMTPSA id 4gSXFJ5CRLzSQ;
	Sat, 30 May 2026 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1780173684;
	bh=36AGt26xIJcYjMSl8shKICC+ai8jKxcAClVkCrGuL5s=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=Ohwo1QhhRGRofOKoUUdNQ17qL3oIHlHEuJuI09wNlapbRggE+Wpp4SPgMShyvSJST
	 mziKBRqF7ojUta07AH95wt3SH/+grmWHwVCd+A0C9F0rdcGXP0lTVDrc1fHx4W2QlG
	 x2nUTBE1x2T8PBTYMKUBi1bHkiTqG77vQdNfXakncZDHpFcObaJ5G1fv9AhXK3/xeB
	 aYPjv1pdOjbGIJLgoVbDhb/JD8MSqrG9RoBZhypbJ9xejIIFD2QWAujsYHObisfa5D
	 BvkER8pXJaVGfAS9tTSYQ11o4u3t82NtePuBK3OoNnB2CKWRcfkBa7dcHGJvhi/xMe
	 3GDJhYf53D44A==
Message-ID: <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net>
Date: Sat, 30 May 2026 15:41:24 -0500
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mkroot quickstart (was RE: Testing on lots of architecture
 targets with mkroot.)
To: "Bird, Tim" <Tim.Bird@sony.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <f35774f8-4194-4715-8321-dc2fdfc7fc88@landley.net>
 <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
 <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net>
 <MW5PR13MB5632FDD1833ABA105437D02AFD162@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <MW5PR13MB5632FDD1833ABA105437D02AFD162@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/26 10:54, Bird, Tim wrote:
> Hey Rob,
> 
> I just tried the mkroot quickstart instructions in toybox/mkroot/README, and the image failed
> to start, due to missing init program.

Commit d7cef2f4a7d6 should have fixed that?

https://codeberg.org/landley/toybox/commit/d7cef2f4a7d6

The problem is that while /init is always there, /bin/sh isn't unless 
your .config pulls in the shell, which is still in toys/pending and thus 
not in defconfig.

In an eventual 1.0 release that should all be tidied away, but right now 
mkroot.sh has a workaround for it that wasn't always triggering because 
I tried to be clever about letting it use your existing .config if you 
had one...

Did you pull from microsoft github instead of codeberg? I haven't 
updated the microsoft github version in weeks...

> Maybe I missed something.  What is the appropriate mailing list to use for mkroot
> discussion?  It is on the toybox list or somewhere else?

In theory the toybox list, although that's in the process of migrating 
from dreamhost to osuosl because 
https://www.reddit.com/r/dreamhost/comments/1tjunvv/ugh_dreamhost_getting_rid_of_mailman_email_lists/

I'm happy to stay on this list if you don't mind the noise?

> I'm thinking a mkroot environment might make a good baseline test system for short
> boot-times (kind of an extreme case to establish a minimum boot time value,
> at least for the kernel).

I hope so. :)

Your absolute minimum is rdinit=/bin/sh or similar, but the mkroot init 
is trying to do the minimum work to bring up a usable environment with 
mount points and networking before running the $HANDOFF program. 
Generally takes a fraction of a second, and the /init/mnt automation 
lets you record a timestamp as soon as your provided application code 
takes control. (Which if it's wget reaching out to a host cgi or 
something can be recorded on the host clock, although qemu's BIOS boot 
on platforms like s390 or powerpc can take ages. There's a design pass 
to figure out what success looks like here.)

The only actually delays where the script is waiting for anything are in 
the time setting error path when the virtual board doesn't emulate a 
battery backed up clock:

   [ "$(date +%s)" -lt 1000 ] && timeout 2 sntp -sq 10.0.2.2 # Ask host
   [ "$(date +%s)" -lt 10000000 ] && sntp -sq time.google.com

Which has a 2 second timeout for the first one and I believe a 3 second 
default timeout built into sntp? So 5 seconds total for "clock could not 
be set", but only in the case where the network card came up but (so no 
immediate "no route to host" failure) but isn't connected to anything 
(neither loopback NTP server nor network), AND the board's emulation of 
a persistent clock failed to trigger the attempts in the first place.

(You need to set the clock before calling "make" on a source package, 
otherwise all your file timestamps are in the future and make DOES NOT 
LIKE THAT. Part of my use case is "automated native build environment 
under emulation", ideally with distcc calling out to the cross compiler 
on the host.)

> Below was the output.
> 
> I checked the root filesystem in toybox/root/i686/fs/bin and there's no 'init' or 'sh' link or program
> present.

The /init isn't in bin, it's in the root directory (which is the first 
place the kernel looks for it):

$ grep '"/init"' linux/init/main.c
static char *ramdisk_execute_command = "/init";

> Does toybox use the same configuration in mkroot as the base toybox build?

See commit above. That was the failure I hit during the demo, which is 
AFTER I did https://mstdn.jp/@landley/116580239742755479 to try to make 
the previous "check and see if it's already got it" code reliable...

Potentially re-using the existing .config by default was just a sharp 
edge, I gave up trying to make it reliable so took out the "by default" 
part. Now it has to be specified explicitly as an override to be able to 
screw up like that.

> I modified the configuration for toybox to include the 'sh' toy, rebuilt it, and verified that the
> x86_64 toybox had a working 'sh' toy.
> 
> Then I rebuilt the mkroot environment with:
> $ mkroot/mkroot.sh CROSS=i686 LINUX=linux
> and ran it with:
> $ root/i686/run-qemu.sh
> 
> I got the same error (missing 'init') on running qemu.
> bin/init and bin/sh are still not in root/i686/fs.

It's not /bin/init, just /init. And the failure code path I was 
wrestling on mastodon back before the talk was the script replacing a 
good .config with a bad .config. I also have modified the .config to be 
right and the have the build fail.

(Possibly I had a test reversed or something, but I just ripped it out 
and stopped trying to do it that way because once /bin/sh is out of 
pending "defconfig is broken" stops being an issue, so I was debugging a 
workaround I intend to eliminate anyway. It also wouldn't apply to using 
busybox instead of toybox, where "make defconfig" should also just work 
unless Denys did something to it since I last checked. Busybox hasn't 
got "pending": they had a 10 year headstart on me, greater willingness 
to suck in external code because gplv2 vs 0BSD license, and a lot more 
developers...)

> Also, the build rebuilt the entire kernel, even though I had just built it a few minutes earlier.
> Not sure what's going on there.

I didn't bother to implement rebuilds for packages, it always does "make 
clean/all".

It's not hard to add, but I didn't want the complexity: incremental 
rebuilds are a RICH source of bugs. That whole "try to reuse the 
existing .config" bit is conceptually adjacent. :P

(That said, if you really want incremental builds, they're not hard to 
add. I'd probably make it another NOREBUILD=1 explicit override though: 
you get to keep the pieces, NOT the first timer's experience.)

> I note that the mkroot.sh script has 'make clean defconfig toybox install_airlock ...'
> which I'm not sure includes 'sh'.  Note that root/build/airlock has 'sh', but
> root/i686/fs/bin does not have 'sh'.

Toybox has a "pending" directory for unfinished commands. Both "sh" and 
"route" are in there, because each still has significant missing 
features, although both are good enough to use in mkroot. They work but 
they're not finished.

The "make defconfig" target does not include any pending commands by 
default.

The current code on codeberg looks like this:

> # Build static toybox with existing .config if there is one, else defconfig+sh
> if [ -z "$NOTOYBOX" ]; then
>   announce toybox
>   [ -z "$TOYCFG" ] && { rm -f "${TOYCFG:=.config}";} || CONF=silentoldconfig
>   [ -e "$ROOT"/lib/libc.so ] || export LDFLAGS=--static
>   PREFIX="$ROOT" KCONFIG_CONFIG="$TOYCFG" make clean \
>     ${CONF:-defconfig KCONFIG_ALLCONFIG=<(csv2cfg $(be2csv $PENDING SH ROUTE) y)} \
>     toybox install || exit 1
>   unset LDFLAGS
> fi

(Which now that I look at it again is slightly broken because 
${TOYCFG:=.config} can never assign a default value under a [ -z 
"$TOYCFG" ] guard... didn't clean it up enough from the previous code.)

Anyway, what that TRIES to do is add "sh" and "route" to defconfig. Ugh, 
I need to do another pass to simplify that again, I was clearly rushing 
before the talk. Maybe...

PENDING="$(csv2cfg $(be2csv $PENDING SH ROUTE) y)"
PREFIX="$ROOT" KCONFIG_CONFIG="$TOYCFG" make clean \
   ${CONF:-defconfig KCONFIG_ALLCONFIG=<(echo "$PENDING")} \
   toybox install || exit 1

Sigh, I really wanna split the whole CONF= assignment out instead of 
PENDING= but the problem is the ${X:-} naturally makes evaluating the 
<(subshell) part conditional (bash!) so the subprocess only gets 
launched when it'll be used, AND the lifetime is right when called 
inline. If I moved the <() into that separate PENDING= assignment it'll 
exit again before "make" gets called, and thus the /dev/fd/63 or similar 
it expands to will no longer be valid (it's the filename of a process's 
output pipe). I can't(?) use a DIFFERENT redirection style without 
creating a temp file, which I then need to delete, and there's a ctrl-c 
error path race with making SURE it got deleted so I'd need a trap and 
NOT GOING THERE. This is all because KCONFIG_ALLCONFIG= wants a filename 
to read from. (When I do this stuff right it looks like I didn't do 
anything, but getting there is gordian knot unraveling...)

Anyway, in the above code you can set PENDING= or TOYCFG= on the 
mkroot.sh command line:

A) set PENDING=diff,awk,getty,bootchartd,dhcp to tell it to use various 
commands out of toys/pending/*.c that mostly work but haven't been fully 
reviewed yet or which have major known missing features that should 
really be added before promoting t hem out of pending. (Note: some 
commands in there like git.c are really just stubs.) It will always add 
"sh" and "route" to this list. Oops yes I need to flatten the provided 
names to all upper case, I just changed how it works last week...

B) instead set TOYCFG=filename and it will use the provided .config file 
as-is, although it will run it through "make silentoldconfig" first.

But PENDING= at least is just a short-term hack because an actual 1.0 
release wouldn't still have a "pending" directory so defconfig SHOULD 
"just work". I just need to review and fix up all the unifinished code 
and external submissions in toybox and get out a 1.0 release...

I'm working my way towards fewer fine-tuning knobs. It should "just 
work". All that's transient, which is why I haven't polished it enough.

> Anyways, thanks for any tips you can provide to help me get this working...

I mean to push one last update to microsoft github as part of the next 
release, but the release notes say the project moved to codeberg (the 
website links were updated circa 
https://landley.net/toybox/git/commit/ea6c172dadd0 ) and I'll probably 
take the microsoft github version down in the following release.

If you don't like codeberg you can also pull/clone from 
landley.net/toybox/git but microsoft github has gone VERY STRANGE and 
I'm slowly backing away from it. (Microsoft github still being there is 
ALSO a sharp edge, but I'm unsure how to wean people off of it, or if I 
should just have it suddenly vanish one day...?)

> Write protecting kernel text and read-only data: 5764k
> Run /init as init process
> Failed to execute /init (error -2)

$ grep -w 2 /usr/include/asm-generic/errno-base.h
/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
#define	ENOENT		 2	/* No such file or directory */

Because /init starts with #!/bin/sh and if .config doesn't have 
CONFIG_SH in it (which defconfig doesn't because pending, I'm working on 
it ala https://codeberg.org/landley/toybox/commit/0b6e231b52ae) it will 
build a toybox that doesn't include "sh". Which the commit I linked 
above tried to make stop happening unless you EXPLICITLY asked it to 
re-use an existing .config, in which case you get to keep the pieces.

(It SEEMED like "re-use the existing toybox .config if it's good enough" 
was a good UI, but in practice overwriting .config sometimes and using 
it as-is other times was just too brittle and fiddly to be robust, and 
the resulting error message is far too eldrich to impose upon new users. 
So I made it explicit. The kernel could probably use a similar one, but 
splicing initramfs into that is even worse than pending. I could do a 
kernel patch that lets you say INITRAMFS=/path on the make command line, 
but my https://landley.net/bin/mkroot/0.8.14/linux-patches/ never go 
upstream, Greg KH hates me personally...)

Rob

P.S. Making things simple is _REALLY_HARD_. It needs to just work, a 
thousand things can go wrong, I have maybe 500 lines before their eyes 
glaze over trying to understand it and a third of that is whitespace and 
comments... I'm doing my best.
