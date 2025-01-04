Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED315383C
	for <linux-embedded@vger.kernel.org>; Sat,  4 Jan 2025 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.219
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736006278; cv=pass; b=DM6gJdwkq1nCz2oSl8hLEZP1h/af2Ai8LSefbt0Uqa3B/Pdw4v48b6bYNS/3CwOH4nHo4olYyQaiNIqa6fmxjIVFZIcGFU8OvvucIUX6GPQ4NtVfoCgrkaj7zR6sjxdI/MjQdkzn9mAO8gQ77Vj8p0S/F5yvMgXHwUDstSZjYZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736006278; c=relaxed/simple;
	bh=NlQTmm1Us2ZGlNfsE0q8l3n3V5wI9lkCT2JcJO5iBnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbKEF8WEVWhWzEKX7srJMQxcVkcLnbkDzavJAh/1nZbHF5OYc0CiQI3lkKIRfBZ2H7NSsb3JzxbC+KykeaqsyP+6Ckgr0HREjXZahzUFrrIYoN+oj9Yiq5i4sgZIz/dQmvM4bMXXead87dz2tBbgRwLS0INPNUvCX9OAvOIshRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=M3p6nSwv; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=GKXgt7Tl; arc=pass smtp.client-ip=81.169.146.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="M3p6nSwv";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="GKXgt7Tl"
ARC-Seal: i=1; a=rsa-sha256; t=1736005543; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=boXmNK+OOGcUJvpnByKBpeqJEUxAxeIvv4iVA9LR8Yqr0ePHwruCWcfCPAK8fPkLjK
    jCdo6r1BOoopW+Tj+GxVKXUkaboMNt/G3OWQWptdR/SjTeLsjRV8mc0Wg57ePGwzRZ0T
    uysHzCxc2pmMaBpxt0SUMm6BhVg52VfXn5W+Y2duOhqUdAf2FnxlUEcwa5xOtuwen2dT
    yfmXr3SyLoOFYybymQsUcJjsycgMAhWIeisIlXMEsOHLUZ1oH/dJqlBFp8sTu1IyZ/Vt
    pZlOLYZbuOQP4FLFG/JWyFU8cjAdtUXtWhjA2mOcT1zNr25KiFJhcXIrcRk5CfNpauV2
    1czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1736005543;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlQTmm1Us2ZGlNfsE0q8l3n3V5wI9lkCT2JcJO5iBnc=;
    b=dl0aZ4mXZIagxVt4oB+hp5Hvxi1tooLoyoQyQHeRJBLFOgZVkR04rr2vqxR2AE+6RC
    nd78yOZvtnHPMilcu+1QiE79ev81nARhGkIb5tJMWp503aiyvkrZrwpYaG3kh9YitsLR
    VrwpxueB3YDuxF3kymtMX4XngdySYAeuV01wjp8NiJjPJ7D60/JyG3wt/M11YUwBKbxv
    amQhpBvXRZQGIgDQxIf/6KXHlrg2XNC/4w/q6igEneTbZz6Jj2Kf4310O/cn131XR72b
    IT0fbPjL4jXiwurpxTqAR/d90L7/CXmml0iYMkZA/RRxysGXaJA1buGsp54FjmmPD38W
    83pA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1736005543;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlQTmm1Us2ZGlNfsE0q8l3n3V5wI9lkCT2JcJO5iBnc=;
    b=M3p6nSwv6IIixAGRp7aITek2SsuLdNaVSnU+CkEBJE0B74eDt5q27hoO6K6n/8Xg5j
    DS/rNYoLQsOcPoIRgSDMuc88/LhSI+PpORq+KxKxQU/nplQtgAM11tYrnPgCDgtbIhfr
    GscAWfZdDvJK88G3ngLIfG0IYArK1Noam2a9x37zbIXByt/UObUrGtMk+c3CEBHP0Ebp
    uXdPtu6L5SRMRLCvDTeipJJHKG0mrLNJQDbMspww+I2qv8DxeoZUIt9JnG11XLTfCUDM
    KmUF7+ScgUbxPchQ91dnpQGtvLC+p4a++QLMbYZRvg6qy4dc31EDL0Rsbtzl6nEbV4Qv
    1D7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1736005543;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlQTmm1Us2ZGlNfsE0q8l3n3V5wI9lkCT2JcJO5iBnc=;
    b=GKXgt7Tl+Hnd4Z8rbxUfHICBv0yqRhU3kefUGwsMrvuL1hdFPzixJnzrT3vuyL9xCu
    1lDLWgnmJ7ipu892uuDg==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzHHXDYIvSfxa0V"
Received: from positron.chronox.de
    by smtp.strato.de (RZmta 51.2.16 DYNA|AUTH)
    with ESMTPSA id fbdb2a104FjhwkV
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 4 Jan 2025 16:45:43 +0100 (CET)
From: Stephan =?UTF-8?B?TcO8bGxlcg==?= <smueller@chronox.de>
To: Shankari <beingcap11@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Sat, 04 Jan 2025 16:45:42 +0100
Message-ID: <2855035.XAFRqVoOGU@positron.chronox.de>
In-Reply-To: <3506889.LZWGnKmheA@fedora.fritz.box>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box> <2972828.e9J7NaK4W3@tauon>
 <3506889.LZWGnKmheA@fedora.fritz.box>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=smueller@chronox.de;
 keydata=
 mFIEZZK4/xMIKoZIzj0DAQcCAwTDaDnchhDYEXH6dbfhyHMkiZ0HPYDF5xwHuMB8Z24SuXYdMfh
 pnovdsgwpi6LNAvnI/lGPrvDc/Mv0GQvHDxN0tCVTdGVwaGFuIE3DvGxsZXIgPHNtdWVsbGVyQG
 Nocm9ub3guZGU+iJYEExMIAD4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQQ0LE46O
 epfGZCb44quXQ2j/QkjUwUCZZK6YwIZAQAKCRCuXQ2j/QkjU/bVAP9CVqPG0Pu6L0GxryzpRkvj
 uifi4IzEoACd5oUIGmUX7AD8DxesdicM2ugqAxHgEZKl9xhi36Eq7usa/A6c6kFmyHK0HVN0ZXB
 oYW4gTcO8bGxlciA8c21AZXBlcm0uZGU+iJMEExMIADsWIQQ0LE46OepfGZCb44quXQ2j/QkjUw
 UCZZK6QgIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRCuXQ2j/QkjU8HNAQDdTmzs+
 Cls6FMoFrzoWdYtOGCW5im7x1G5M/L0L3VOvgEA6m9edpqCc0irbdNXVjoZwTXkSsLOxs2t7aDX
 2vFX54m0KVN0ZXBoYW4gTcO8bGxlciA8c211ZWxsZXJAbGVhbmNyeXB0by5vcmc+iJMEExMIADs
 WIQQ0LE46OepfGZCb44quXQ2j/QkjUwUCZb+zewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBw
 IXgAAKCRCuXQ2j/QkjU1pIAQDemuxTaZdMGsJp/7ghbB7gHwV5Rh5d1wghKypI0z/iYgEAxdR7t
 6KrazO07Ia9urxEAQWqi0nf6yKluD0+gmOCmsW4UgRlkrj/EwgqhkjOPQMBBwIDBBo6QjEMU/1V
 DD+tVj9qJ39qtZe5SZKFetDzXtyqRpwL+u8IbdIjv0Pvz/StziFMeomh8chRB7V/Hjz19jajK3C
 IeAQYEwgAIBYhBDQsTjo56l8ZkJvjiq5dDaP9CSNTBQJlkrj/AhsgAAoJEK5dDaP9CSNTLQwA/1
 WxGz4NvAj/icSJu144cMWOhyeIvHfgAkG9sg9HZXGdAPsGzKo4SezAYCwqgFKnyUIAjKYl1EW79
 pSCOFS36heQvbhWBGWSuP8SCCqGSM49AwEHAgMEiEhJatNBgxidg8XJFTy8Ir7EsTCeoVY2vJAN
 rysZeAAmSaUWFD4pvXE5RYQFeCYTWTG419H7ocNGUz5u1dgKhAMBCAeIeAQYEwgAIBYhBDQsTjo
 56l8ZkJvjiq5dDaP9CSNTBQJlkrj/AhsMAAoJEK5dDaP9CSNTGCAA/A2i1CxhQJmYh2MwfeM5Hy
 Wk6EeWruSA1OgSWmaJaoGaAP4mARD2CviJgz8s3Gw07ZTk8SYHOTnv70hUbaziZ3/tjA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 3. Januar 2025, 18:23:19 Mitteleurop=C3=A4ische Normalzeit schr=
ieb=20
=46rancesco Valla:

Hi Francesco,

> > =3D=3D=3D=3D=3D=3D
> >=20
> >=20
> > Now given the description, what can you do? I would apply the following
> > steps:
> >=20
> > 1. measure whether the timer your system has is really a high-res timer
> > (the higher the resolution, the higher the detected variations and thus
> > the entropy)
>=20
> Resolution reported by clock_getres() is 1ns. Is this sufficient?
>=20
It should, but it is in relationship to the complexity of the CPU itself.

> > 2. assuming that test 1 shows a high res timer, reduce the OSR back to 1
> > (CRYPTO_JITTERENTROPY_OSR) and measure the entropy rate -
>=20
> Turned out my system already had the OSR set to 1, since CONFIG_CRYPTO_FI=
PS
> was set to N.
>=20
> > 3. if test 2 shows insufficient entropy, increase the amount of memory
> > (CRYPTO_JITTERENTROPY_MEMSIZE_*) and measure the entropy rate
> >=20
> >=20
> >=20
> > The tool for measuring the entropy rate is given in [1] - check the REA=
DME
> > as you need to enable a kernel config option to get an interface into t=
he
> > Jitter RNG from user space. As you may not have the analysis tool, you
> > may give the data to me and I can analyze it.
>=20
> Here are the results (with default parameters for processdata.sh:
>=20
=2E..

> min(H_original, 4 X H_bitstring): 3.168741

That last value, the min-value, is the key: it must be larger than 1/OSR -=
=20
when it gets close to 1/OSR, the health tests start to flag errors once in =
a=20
while (with a probability rate of around 2**-30 time stamps). So, you have =
OSR=20
set to 1 which is already the lowest value supported by the Jitter RNG. Thu=
s,=20
there is unfortunately not much more you can do to increase the performance=
=20
during boot time.

I thought OSR was set to 3 in your environment.

> min(H_original, 8 X H_bitstring): 4.473812

Ciao
Stephan


