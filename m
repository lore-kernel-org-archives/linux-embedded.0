Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939317C60
	for <linux-embedded@vger.kernel.org>; Tue, 31 Dec 2024 01:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735608304; cv=pass; b=FFTolkyN6rFssU2kEzSQC8RAQq0SgaXmCI604obA4SeXOrTL7vcwqR5MAv9BNSWP04A3iMrwj2NDqcQhEnfNy93FXp//XXqgrP8V/7KJJh+v57XoDPkHFy1r4D/yPPAqTYhUnlBGvDyvAWTRBbSImpU59ycGMX1mAEUd23ewqUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735608304; c=relaxed/simple;
	bh=VOWvc4TVJhwfJXoCVZyyW3zjPCxTKoC2/1QfY/KOw1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gy9Y1nVxYlZRlxFe4m1p1VTrZqMiVB2woNcy4q1+NJGK88GoMjQ4GVC6+mUlrAwjz1uNf1jw1NTuRESL0AZCKqcnUodqdvy1agRhwP6BKLfkybl9TO+M7slQYEgSuHdkrcxbSJuv9P+SM/CWF+kx1cmsymL658anPAX3gwjVaRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=H3ZlxB5q; arc=pass smtp.client-ip=185.56.87.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="H3ZlxB5q"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-m94z.prod.antispam.mailspamprotection.com; s=arckey; t=1735608302;
	 b=CwXAN6Um6XyxOdTuQg8RsFZ+Rpw0xuD/Ucu/F3PizhLvXN476oFa3NWTT1ogPmLmBh6NuW+EeN
	  WVO6VAMegWqog30h5TH+Z98fMO/cpOVWfIXnleESDoxZQKczgMVA+RJOw+ZfD4/gmGs1g+Bo1g
	  /Qy58CT3CYPLWo8EkAYXce/j3d9cPN8fVIBEjtRtNY40Go79sUmhieGcT7EdeyBc0iNZRBlbnc
	  er3xN6owHJzi5dttPahzqW8CwgeNnP0hZbDGovD4snXlEUKojIMuaKPPHQfrj9Az3XCezIhYlT
	  RZ9DD5Nkvh9LxBGuStkORPv7KIxOMQisJmUC3WZIC6FVAQ==;
ARC-Authentication-Results: i=1; instance-europe-west4-m94z.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-m94z.prod.antispam.mailspamprotection.com; s=arckey; t=1735608302;
	bh=VOWvc4TVJhwfJXoCVZyyW3zjPCxTKoC2/1QfY/KOw1o=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=yiQ8tBgORdv4FZd5PNqcIpvE4dLBWQsvimIE9wOhvXPGWRtBE8Zz8n16NBlZa5som0Lrb72QPT
	  F1xqHlAF/H2AiIQBXM4bnGoro7KOjou4GmzUTctn/VwfvO6QEyogomvyzTXF9ZtffM9Wd7qFTg
	  BUnfO/0dkuP7Od65+G7KM3RwA/VUFeSMm6I5RIqNExkg2/FHIqnemhGzKaz5SoIvgjR2ohhWvF
	  /BAA0Bv728mg8bLBWAT0u3lA3+f3J3e1yjTo2H3OMyXHA9VUL+OdmyiLIEh1Ejqs+MgxTEwuJU
	  sLAsaL+An1WhHZn0DE25Z8iE4RJe5K3DtmL6YPhe6goLpQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-m94z.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tSOLr-0000000FqvL-3voc
	for linux-embedded@vger.kernel.org;
	Mon, 30 Dec 2024 22:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3lbN5tZ3tnyV38Nc8U/tXYwBFmpDaQawr8FColneW4k=; b=H3ZlxB5qzIeZTKDQIH5coPtAlE
	hmkojop9Zyo+Z3A/jjhiXqlHn9lkyOuOeK++6iVBhV1mO1vJWSlT2bJUXCITFNf3vjQ2Uyl1OS0wx
	16ad4x9AzhOqSp0iODOZrRFkn6c+Tcd4DsZxIOGTKq5BEJDoC5++vstKAoA7qrzN/t9A=;
Received: from [87.11.41.26] (port=59292 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tSOLn-00000000KhJ-2mDh;
	Mon, 30 Dec 2024 22:35:03 +0000
From: Francesco Valla <francesco@valla.it>
To: Stephan Mueller <smueller@chronox.de>, Shankari <beingcap11@gmail.com>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Mon, 30 Dec 2024 23:35:03 +0100
Message-ID: <22372644.4csPzL39Zc@fedora.fritz.box>
In-Reply-To:
 <CAORPcfUfgNnQb6m0baW9qEGnrGYsnbpvwUUmF5Y9Byh9_iMAZw@mail.gmail.com>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box> <4095066.UUX0tPYDPe@tauon.atsec.com>
 <CAORPcfUfgNnQb6m0baW9qEGnrGYsnbpvwUUmF5Y9Byh9_iMAZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0c0da504259b7713c87b56b4e12a989f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-m94z.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Shankari,

On Sunday, 29 December 2024 at 19:52:29 Shankari <beingcap11@gmail.com> wrote:
> Hi
> 
> I wanted to provide an update on my recent contributions to the BeaglePlay
> project. I have recently started contributing and have been analyzing the
> boot time of the init process. Below is the output from the system log:
> 
> debian@BeaglePlay:~$ dmesg | grep "init process"
> [    1.480490] Run /init as init process
> 
> Moving forward, I plan to explore ways to modify the command line and
> further investigate the data used for SIG analysis. This will help me gain
> a deeper understanding of the boot process and its performance
> characteristics.

I started the same journey around a week ago, and it's proving a valuable
experience.

After some trimming, I reached a (reported) init startup time of around 0.6s:

root@beagleplay-ti:~# dmesg|grep /sbin
[    0.630046] Run /sbin/init as init process

The result above was obtained on a slightly modified 6.12.4 kernel with a
custom configuration (I am still thinking about the modifications, as they are
a bit unorthodox, but I can share them as well as the defconfig if you are
interested).
> 
> Please let me know if you have any suggestions or areas where I could focus
> my efforts.

In general, I'd suggest to use a recent kernel, as I observed a consistent
reduction of boot time between e.g. 6.6.x and 6.12.x.

> 
> Best regards,
> 
> Shankari
>

Regards,

Francesco





