Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428518787A
	for <linux-embedded@vger.kernel.org>; Tue, 31 Dec 2024 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735656162; cv=pass; b=M0yLNo39KRFzYwocg2iI3no26CU3pyp6Pq+W+U7bY9PkKskkBMyKhARMlVkXjzgdstSnEXPnUR5spLBTvBGxcI35tde4KjjlWC1uaExKXtg+nS9odoIyglrNDNEzjxqmPSi0k3Y4dkWyGsYJ2HgxGbBZZyYYFpK1a4l8UTHdEbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735656162; c=relaxed/simple;
	bh=bcdGWRTPDff14f5sOWnqXW67DUn5/d53OXIsl1+zJUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rLEbCw5jIfctufTb1PaqFqIttBfux54vgPShV+5FxiUV84W9NYGK/0jD3zQVR53y81FUqqsVTB8epz8Z1rT+GLGfUXvGPmZ/RSha7GWsuYs0WpkymkuMhVkCQ/JsEIvlbKT8+bb3NK0yrqXEZVt6p+XUntjYP/adH5E/ufC7bho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=ptos9Hof; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="ptos9Hof"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-72m3.prod.antispam.mailspamprotection.com; s=arckey; t=1735656159;
	 b=I9zTi1pFeON62Vo3m3DNXkqwdJ+opSRltG8VE4DI+P3a9UNaCko844C30U8zPVWCh9CvCmAJoY
	  duFu27yCjbTQJpRT13UI0fI6J04ZjHd3nAcM/Ohzuf38INlSyd6aafoCxag4TXQWlEVZJw3tj9
	  /iVGLhe/pwbxA0J4T2q3lIWKi4zINS/3YCKsUz6oronLLnjLRluIPuGjUCOU3SzN2Xpkv6XdBM
	  c9nF63mFN8ohOU4aHkBVTJkQxKC8WPsEEdN70Ps9856OreopYIAe/UEu04W8naAkMAP66Q1qrq
	  x7M3sdyH21BaLIov2ltlht/yOHfZxD2iNZynoio+pEPGTQ==;
ARC-Authentication-Results: i=1; instance-europe-west4-72m3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-72m3.prod.antispam.mailspamprotection.com; s=arckey; t=1735656159;
	bh=bcdGWRTPDff14f5sOWnqXW67DUn5/d53OXIsl1+zJUc=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=OgcR8EeZmNAy2372OUsNO5cX1iXViskwe6bovrcc6zRSTYWxe35fngSasffgJgNphNmMrcqxt3
	  ItjQzNDAIQLuD982NTzCC3A2yHpI15OFQSSTZLfxs3SXackTtxnUHzfLMwVs4/w3fWJxZQ7CVN
	  fB8gguZcpMeDyzVJ7aGgTipMfRo/pq/3KD79Z7a6mmf5/fjtLTf/R+WsTRk25qkgtcVIU2TFzp
	  k/xYypMcAMEDCNLUY5glTQ7G/qrc4uvj8wmCME8rzSfswnfJLSz0TqgT3giUIT5Hc2JT4qcgIC
	  fXWJzuJGTVTjJYf+osh68nQgObEfHZ38f6Z46JIx21X8JA==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-72m3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tSdS2-00000003B8y-08bi
	for linux-embedded@vger.kernel.org;
	Tue, 31 Dec 2024 14:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3DKRXEd3WPsAKYqBSCOZrA0pfFIlHRQPk+12xit2OEw=; b=ptos9HofKJXBlqvATJ+wtqMTsx
	KTvG5hifMzc4iOD5Utdowdzjgee6cNstKeXvoEvMmDKpJxIJekgQHSMLtCRRNK7mH4bWG0z3N8re4
	wjlkZZkX0rHircXXMmLXUvKklfvSv6iqqipejh9l9IkOAeH5L2ny1EhfmTvVS/PJdvWQ=;
Received: from [87.11.41.26] (port=61797 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tSdRv-00000000Kgz-0z6n;
	Tue, 31 Dec 2024 14:42:24 +0000
From: Francesco Valla <francesco@valla.it>
To: Shankari <beingcap11@gmail.com>,
 Stephan =?UTF-8?B?TcO8bGxlcg==?= <smueller@chronox.de>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Tue, 31 Dec 2024 15:42:16 +0100
Message-ID: <2285043.vFx2qVVIhK@fedora.fritz.box>
In-Reply-To: <26792960.1r3eYUQgxm@positron.chronox.de>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box> <22372644.4csPzL39Zc@fedora.fritz.box>
 <26792960.1r3eYUQgxm@positron.chronox.de>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 8ab5e5c3bb5747ba7c9cc37d8233b7b7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-72m3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Stephan,

On Tuesday, 31 December 2024 at 10:55:06 Stephan M=C3=BCller <smueller@chro=
nox.de> wrote:
> Am Montag, 30. Dezember 2024, 23:35:03 Mitteleurop=C3=A4ische Normalzeit =
schrieb=20
> Francesco Valla:
>=20
> Hi Francesco,
>=20
> > Hi Shankari,
> >=20
> > On Sunday, 29 December 2024 at 19:52:29 Shankari <beingcap11@gmail.com>=
=20
> wrote:
> > > Hi
> > >=20
> > > I wanted to provide an update on my recent contributions to the Beagl=
ePlay
> > > project. I have recently started contributing and have been analyzing=
 the
> > > boot time of the init process. Below is the output from the system lo=
g:
> > >=20
> > > debian@BeaglePlay:~$ dmesg | grep "init process"
> > > [    1.480490] Run /init as init process
> > >=20
> > > Moving forward, I plan to explore ways to modify the command line and
> > > further investigate the data used for SIG analysis. This will help me=
 gain
> > > a deeper understanding of the boot process and its performance
> > > characteristics.
> >=20
> > I started the same journey around a week ago, and it's proving a valuab=
le
> > experience.
> >=20
> > After some trimming, I reached a (reported) init startup time of around
> > 0.6s:
> >=20
> > root@beagleplay-ti:~# dmesg|grep /sbin
> > [    0.630046] Run /sbin/init as init process
> >=20
> > The result above was obtained on a slightly modified 6.12.4 kernel with=
 a
> > custom configuration (I am still thinking about the modifications, as t=
hey
> > are a bit unorthodox, but I can share them as well as the defconfig if =
you
> > are interested).
> >=20
> > > Please let me know if you have any suggestions or areas where I could
> > > focus
> > > my efforts.
> >=20
> > In general, I'd suggest to use a recent kernel, as I observed a consist=
ent
> > reduction of boot time between e.g. 6.6.x and 6.12.x.
>=20
> I am now partially in this discussion - what exactly are you trying to=20
> achieve, or rather is there anything wrong with the current system? I am=
=20
> trying to see whether there is something on my side to work on.
>

The ultimate goal here is reducing the boot time to the minimum possible
without removing functionalities. The purpose is educational, but on the lo=
ng
term it will probably be beneficial to my work too (as I work in the automo=
tive
industry, where each millisecond counts).

There isn't anything inherently wrong, at the moment I am trying to determi=
ne
what is real initialization time and what instead is an actual waste of time
(e.g.: excessive probe deferral). The aforementioned jent_mod_init (on which
Tim I think is working on some level) is one of the longest single inits, b=
ut
to be honest I don't know much about all the entropy stuff.

Wishing you the best for the new year,

=46rancesco




