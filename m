Received: from fly.ash.relay.mailchannels.net (fly.ash.relay.mailchannels.net [23.83.222.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794693B95F8
	for <linux-embedded@vger.kernel.org>; Tue, 26 May 2026 19:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.222.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822056; cv=none; b=q+K1/pQmcgXZFioWkshx82OxVrxXScAs+tLYsvXiE9JqAE9c8uR6cVfU+x8EGWCHl5w4osXZK84EAF6hwdkXMjdBGetso71+Q1s6OMql9NiEsrjwjalglGLIdvGoIrv2J+AcAlYAfx766BkOONLynVAeMMs8wHFoBerVo+KDB2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822056; c=relaxed/simple;
	bh=80JJKMoWe6AlFLlxl5rHeyRnDLuHdk2spu9yhXN/m+M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=AWlNyXZRJ4p1NhHskM8I66rEpuld73VmtnEfcvbpdHEjr4JrsleVvCLOGcp8MKto6erSkz8wQhIWC6w0bZXtYlrIsz1pyrrLNQ2OQzu7pgIzp1hcrwF5IUtWb3K/7+3KIEnNrAH55CEhkfFWxkWT895vkz3nsFwgwZWrCqeWNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=B63R8kHr; arc=none smtp.client-ip=23.83.222.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="B63R8kHr"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1A33C4C220E
	for <linux-embedded@vger.kernel.org>; Tue, 26 May 2026 18:51:26 +0000 (UTC)
Received: from pdx1-sub0-mail-a227.dreamhost.com (trex-green-2.trex.outbound.svc.cluster.local [100.101.203.85])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id BF00C4C1D27
	for <linux-embedded@vger.kernel.org>; Tue, 26 May 2026 18:51:25 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Interest-Lyrical: 3866e2273abc8a14_1779821485986_1757191380
X-MC-Loop-Signature: 1779821485986:268921289
X-MC-Ingress-Time: 1779821485985
Received: from pdx1-sub0-mail-a227.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.203.85 (trex/7.1.5);
	Tue, 26 May 2026 18:51:25 +0000
Received: from [192.168.14.155] (unknown [209.81.127.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a227.dreamhost.com (Postfix) with ESMTPSA id 4gQ20F2Tb1z1Py
	for <linux-embedded@vger.kernel.org>; Tue, 26 May 2026 11:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1779821485;
	bh=QKUrVCpDDUDidbQ4reMEeqGMuU9QTyg5LL8tSktm7gA=;
	h=Date:From:Subject:To:Content-Type:Content-Transfer-Encoding;
	b=B63R8kHr1jqBQSERXg0YiSmobLZVCbdgkJjxvekkSVDoKMnTSzz1B46qn2+a54Buo
	 B0faY+z5uWJYz/ZmvGNpqkvHVZHuWsrWVDxfe5a7ZntnCF8WIi0vcGdV6ZhlBRsX53
	 lUPZuNlZ1RGMwzrRxoE8Ym+Dbot5mlOPf8f0FwxEb/DiIFAD6625ZO6mXcUDe6FaG7
	 pGu1IZ+9W/jLMK7VFyCcIKmdXVXaXoJcqWQoXVEaulfVBaR0WurDxq0dpgmR4hLTu7
	 RTuK0o4qdY+WnO2IpOdf0XzGyOOcuOVYCQHPYTGDidq5zxNgcUhtORVKZeKvoAM266
	 uSu1L5RaiqQqA==
Message-ID: <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net>
Date: Tue, 26 May 2026 13:51:32 -0500
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rob Landley <rob@landley.net>
Subject: Testing on lots of architecture targets with mkroot.
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <f35774f8-4194-4715-8321-dc2fdfc7fc88@landley.net>
 <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I promised Tim I'd explain to him how I regression test on s390x and sh4 
and mips and powerpc and so on in parallel, and he was in the audience 
for my wednesday talk at ELC, but I'm not sure that gave him everything 
he needed to do proper automated regression testing under qemu on lots 
of architectures in parallel.

The source repo I used was: https://codeberg.org/landley/toybox

Prebuilt binaries of all the outputs are at https://landley.net/bin/ 
with several releases worth of history. (Although it'll probably go down 
at the end of the year to avoid Gavin Newsom's $7500/download fines.)

There's a README in the toybox/mkroot directory, but also instructions 
at https://landley.net/toybox/faq.html#mkroot and 
https://landley.net/talks/mkroot-2023.txt (which was the previous time I 
gave a mkroot talk).

You'll need cross compilers: my musl+gcc cross (and native) compilers 
are built with Rich Felker's 
https://github.com/richfelker/musl-cross-make using a wrapper script in 
scripts/mcm-buildall.sh in the toybox source. The binary tarballs are in 
https://landley.net/bin/toolchains but you'll probably want to build 
them from source.

If you run that mcm-buildall.sh script in a fresh musl-cross-make 
checkout directory with no arguments it builds toolchains for all the 
targets I've managed to get working so far.

If you want to rebuild just one, you can feed it any of the strings from 
https://codeberg.org/landley/toybox/src/branch/master/scripts/mcm-buildall.sh#L18 
as an argument, ala:

$ ~/toybox/mcm-buildall.sh m68k::

Note that these toolchains are statically linked with a host compiler to 
be portable, so the script will first build a musl host compiler (see 
line 38 in the buildall script) because glibc is incompetent at static 
linking.

In theory this means you can just grab a tarball and extract it 
somewhere and add it to your $PATH and it should just work. There's also 
a https://landley.net/bin/toolchains/25-03-2024/musl-cross-make.tar.xz 
with everything (all the source and all the targets it built) to shut 
Bradley Stallman up.

The test harness script is mkroot/testroot.sh again in the toybox 
source. Run it from the top level (toybox source) directory and it'll 
iterate through all the images under root/ and try to run them under 
qemu (you need qemu-system-* and mksquashfs in your $PATH, it'll 
complain if either is missing). It provides a squashfs filesystem with 
controls scripts and test data, so instead of booting to a shell prompt 
the qemu instance runs a test script and then exits on its own. It 
prints out various "=== thingy" lines for successful tests, and the 
pass/fail thing at the end says whether it got enough === lines of 
output. If not, look at root/build/log/*-test.txt to see what output it 
DID get.

I did the start of a busybox-based version at 
https://codeberg.org/landley/toybox/src/branch/master/mkroot/packages/busybox 
a while back but unfortunately building busybox defconfig is INSANE 
these days. You'll notice rather extensive patching with sed to remove 
build dependencies toybox doesn't have, and even then it was mad about 
something (I forget what).

That said, you can also just do:

mkroot/mkroot.sh NOAIRLOCK=1 LINUX=~/linux CROSS=allnonstop mybusybox

To skip the airlock step and run your own much simpler busybox build 
script (just stick it in mkroot/packages), and as long as your script 
sets NOTOYBOX=1 before it exits you should get the directory layout, the 
init script, the kernel build and packaging, and the run-qemu.sh for the 
target, with whatever additional files YOU installed (under $ROOT/). So 
a busybox based filesystem instead of toybox shouldn't be a big lift, 
just wasn't a priority for me.

But since you're not testing _toybox_, and toybox isn't 1.0 yet, that 
would probably give you an environment much closer to what you want. :)

Note that mkroot.sh is almost entirely self-contained, merging it into 
toybox and having LINUX= be specified on the command line was just so I 
didn't have to download any packages in the default build. (There's 
download plumbing in scripts/plumbing, I think I went over that in the 
talk. The "dropbear" package is another one to read to see how that 
stuff works.)

Rob
