Received: from fly.ash.relay.mailchannels.net (fly.ash.relay.mailchannels.net [23.83.222.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0294F364934
	for <linux-embedded@vger.kernel.org>; Tue,  2 Jun 2026 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.222.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412396; cv=none; b=cAckv+1hzZWIfF8ofGkbc+/svtbbYlUEKMYMXqLE5qUmV+kNOmfIRSqbo/k78IFeFgwLXiiZ7IXrjsU7nJ8L1aVJkTsVJo5fchpBqKR5LAanKMjzy0rQ2uKIe+jrtA0sWxqcQMI9pvqp2+Q91ZAQ92UBhaT5SWyJaFetDUEJUgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412396; c=relaxed/simple;
	bh=/1tdflZOc6BdSQvS9BhfOylzVQFBcz2TaUQYEYXq7HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bav3lJ4mQWrJrp3Qlrwdyn6qjRp2oocTMjyJ1mjjq+dmIQges9HM8M6pn79EIsoeZudmcGOhN9LL3d/MP5VNppdKkuBYtWLs5Pd1dZodsSMFY9R5LM7aOzVa58VveqL03WqemXCBYfG/CA/DZJ8wH+dIaghU3wUOB4xY2vJSF/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=X34eOjAV; arc=none smtp.client-ip=23.83.222.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="X34eOjAV"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 57D784E1765;
	Tue, 02 Jun 2026 14:44:18 +0000 (UTC)
Received: from pdx1-sub0-mail-a237.dreamhost.com (100-101-168-249.trex-nlb.outbound.svc.cluster.local [100.101.168.249])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id DA23B4E3B68;
	Tue, 02 Jun 2026 14:44:17 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Wipe-Troubled: 77d2c0b353ea984a_1780411458186_4168874164
X-MC-Loop-Signature: 1780411458186:1229240132
X-MC-Ingress-Time: 1780411458184
Received: from pdx1-sub0-mail-a237.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.168.249 (trex/7.1.5);
	Tue, 02 Jun 2026 14:44:18 +0000
Received: from [192.168.14.155] (unknown [209.81.127.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a237.dreamhost.com (Postfix) with ESMTPSA id 4gVD9s3jLJz107S;
	Tue,  2 Jun 2026 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1780411457;
	bh=A4e/Y2zAjaKXoag1lCJ3XCemUTe6xp8HJd1zNtrX0yw=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=X34eOjAV8EzJaCL/fagAOLVik83qyHVDHuzM4TNucYx62+2wz9IFFKLOKLaX/dtBb
	 pLXyc0TIYsUckXiX+8x/BE9zcjiHEiESKtosx/ygiRzqplP4myiV1/pX4PMfokzbG/
	 ZeQ1z3ijAj6Tuvgk8qHv2P1hUPDxjz+xaUM4zFbIUmtvZLH/RnnSdvmdJl4jd7fBM6
	 ZAZL9L6gGpbZe02d1MGq8uA2FHBX9rp4HgKewbCzDaI+MlB2Nq4aUqXHUb9JyBzlup
	 NrKolldtRJwNV3QTySTJHLdi8Fh9gk0wa5zPdbD7u0H6FUdpHtT/+iiVS0TLxoCROI
	 wp1ZyAueunZ1w==
Message-ID: <064b8c64-ebd7-4210-ac28-8be27773c8bf@landley.net>
Date: Tue, 2 Jun 2026 09:44:16 -0500
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
 <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net>
 <MW5PR13MB563232D40A099D798E698272FD152@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <MW5PR13MB563232D40A099D798E698272FD152@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/26 15:54, Bird, Tim wrote:
> Next up is testing it with grab-boot-data.sh.

I _think_ I fixed the bug you sent me that was screwing up that script 
(sequencing issue using variable expansion results as a shell function 
to call), but my todo list runneth over and started composting some 
years ago. Lemme know if you hit a bug. (I'm redoing the \ line 
appending in HERE documents right now.

I have a busybox package in mkroot/packages which in theory lets you do

$ mkroot/mkroot.sh busybox CROSS=i686 LINUX=~/linux

And the result should have busybox instead of toybox providing the $PATH.

In practice, I never finished implementing bzip2 compression in toybox 
(because it was obsoleted by xz, so at the design level I went "I'll 
provide gzip as a compressor, and just provide extractors for everything 
else") but busybox decided that if you have bzip2 decompression enabled 
(which is in defconfig) the build will compress its help text with bzip2 
and there's NO WAY TO TELL IT NOT TO. You cannot have the extractor 
enabled WITHOUT the build calling the "bzip2" compressor on the host.

So building busybox with the toybox airlock enabled required a hack to 
the busybox source/build which disabled the help text entirely, and I 
went "there has to be a less terrible way to do this" but Denys has been 
a bit distracted recently and I haven't come up with a less ugly busybox 
config patch myself yet...

> I'll need to turn on PRINTK_TIME,
> and set initcall_debug on the kernel command line, and I'll likely want to add
> my latest early-times patch.  I'll poke around the scripts and see if I can figure
> out how best to do each of these.

The kernel is an external repo so you just patch it yourself. The patch 
stack I applied to 7.0 is at:

https://landley.net/bin/mkroot/0.8.14/linux-patches/

$ for i in ../patches; do echo $i; patch -p1 -i $i || break; done

To enable extra kernel config symbols from the command line, set KEXTRA 
in CSV format. (The plumbing circa line 361 literally sources 
docs/linux-microconfig and that gets written in there on line 348.) 
Something like:

$ mkroot/mkroot.sh CROSS=allnonstop LINUX=~/linux \
   KEXTRA=PRINTK_TIME,COREDUMP,JFS_FS

(There's also a MODULES= if you want to go there, and yes it enables 
module support when it has any modules to build. Eventually 
modules/plumbing/tests is intended to run the toybox test suite under 
mkroot, including a bunch of "requires root and a known kernel 
environment" tests I've only partially written so far. Really hard to 
test "mount" or "ps" outside a virtual environment like that, let alone 
modprobe. But I need to get the shell finished first...)

Rob

(Did you know the kernel's initrd loader will accept appended cpio.gz 
archives? Just cat them together, you don't even have to decompress and 
recompress. That makes module support in initramfs MUCH easier. Last I 
checked mkroot.sh was doing that right, but I haven't regression tested 
it in forever...)
