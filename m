Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CDD18A6AD
	for <linux-embedded@vger.kernel.org>; Tue, 31 Dec 2024 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.219
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735639638; cv=pass; b=irgWxtPo+vw7pxIjo81jqPX1cqA6QOFtXSX88kNs0upllrJWz8SxfvR/75kxhYj2AVOXJo0fPA5AmSeZSphWy1CdoPSsBdYusqOHew7pQa1wAAgurQrJnALAERarMhfVDgTypkpZQdLDV4QEDmMU+VPquZi2XuvxM3OM+OiQdfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735639638; c=relaxed/simple;
	bh=nGeHXKqQ/WENcwHRN+VjtzUOHq5M6s16CEUBsLNVuZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsUDDnmF7RBgU8kvp0GddV5QnA2SRJdPUbNgWOqUTojrXxxWdRavj7kfpS07o3r1xxxIL1/AXOabSjh0SkWR/4Ztwh5PATP1lXnZQSwyuT1SS3eYYfmNSwGgJ8xA6IN4M/dBy+TZ+ePpBIde5cAZQNJnVjoyMAblkukUw2jHAXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=QLY/m+06; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=9kRxhZMu; arc=pass smtp.client-ip=81.169.146.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="QLY/m+06";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="9kRxhZMu"
ARC-Seal: i=1; a=rsa-sha256; t=1735638907; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TwcBIdz2tzIp/qoopIksFB86XGsRohObQ7Zqjv9A9/EBwLbpCbRtJ8DPFaJJt4tKyS
    tz66HB+SA1vt37FHFh6NVJoPK2SNmkBTbtuKU9vOhVrbIGSMLcRVu9kYNoNFwIyfvOzy
    Y8GwVP1v3HHcQvPiI2H9bIKxlKJh7oz1zPRUboasiP3Z16Fby4S5aNvHuewEEHx7ufk8
    zct6GoOQ/Re9nEHg7VEflxiD4HCzb+sb2sdhGWPMzbinigupNlmundh5c8aQXcWH3rxY
    msunPysgY4xvaCed65TdHYBJElYe3kxpO8Ip8Uzq7SD+jYjgHa3mVAuvi3Qpc8UDMVls
    BW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735638907;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7xspy2wXynmVJHPKs+1PboYm9S4088NM/h92GEMkIIo=;
    b=rrCLVLhgEE0Ua+juachvDk6wDXggfI7HEmYduLUji3VH2fvzHGaqX6lDXC5nsAqTBk
    XfQlkkAhWMewxdBLwZH/K0tbi3DM6Dw7UiRIFglLqpDTKT701SIrX8psA3gQZeR6GBn7
    eseCKO9tbGcCewp/gIMZSiM2U4Hs8N2VSuZo4a37yHOJGIj9O07dVL71LrC604gE6Ull
    R5iHpSR8WQYEhmXboQz+ScdRfL3pMRE5kzZunPADuvCezPy0zM1R7ywbJI0onwejm3oK
    FxnuOL1PUBI83xbZUMpBRTwp1Anc9ilveWK+/Sml+UArVaJ+okGof9P49Z1nfjRN5rp+
    EmFg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735638907;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7xspy2wXynmVJHPKs+1PboYm9S4088NM/h92GEMkIIo=;
    b=QLY/m+06z3D29qsDjfaa+CnuvfuU8BUe/Ni59HLZqx5BpmY7C7n4aKM+SKdcTrbpk+
    JE8i5iI9MrvsYfNvhwKhH/SyPCyVswNfMbHvBSTHisNMR5AqrdzEzlYHDyV5XImmFLDm
    hwOmxMsmhxOMKd9nERJEaqaF6+/W9UFHiCkANa52J1rOB/qQfVtcu5LGeq9p2s633UTY
    ffmrYkAz4VKl/RbG5E4HdYvFhOPP+Z0tngib4ssE5mUw6LqF60rN4/s0H0GHy8GBCiYg
    vr3C1ACEnsf7f3ohCxBFEOh+07qTdesarZhaokA64EGu3MevXKdfsYYfg3f5v1tHQnzv
    gdtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735638907;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7xspy2wXynmVJHPKs+1PboYm9S4088NM/h92GEMkIIo=;
    b=9kRxhZMuzIk+kDpGwoEWGj1SAaea6hIVedewg/nqX0qb9Fk8GUlof3NexYljSYVElC
    RnDms3QAA3/7xMRnNKBw==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9zW4DNhHgExWlYfvTj4KuVnH+E6nu18GxIgYG1onDLQNVQKijhUEI"
Received: from positron.chronox.de
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id fbdb2a0BV9t7iO0
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 31 Dec 2024 10:55:07 +0100 (CET)
From: Stephan =?UTF-8?B?TcO8bGxlcg==?= <smueller@chronox.de>
To: Shankari <beingcap11@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Tue, 31 Dec 2024 10:55:06 +0100
Message-ID: <26792960.1r3eYUQgxm@positron.chronox.de>
In-Reply-To: <22372644.4csPzL39Zc@fedora.fritz.box>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box>
 <CAORPcfUfgNnQb6m0baW9qEGnrGYsnbpvwUUmF5Y9Byh9_iMAZw@mail.gmail.com>
 <22372644.4csPzL39Zc@fedora.fritz.box>
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

Am Montag, 30. Dezember 2024, 23:35:03 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb=20
=46rancesco Valla:

Hi Francesco,

> Hi Shankari,
>=20
> On Sunday, 29 December 2024 at 19:52:29 Shankari <beingcap11@gmail.com>=20
wrote:
> > Hi
> >=20
> > I wanted to provide an update on my recent contributions to the BeagleP=
lay
> > project. I have recently started contributing and have been analyzing t=
he
> > boot time of the init process. Below is the output from the system log:
> >=20
> > debian@BeaglePlay:~$ dmesg | grep "init process"
> > [    1.480490] Run /init as init process
> >=20
> > Moving forward, I plan to explore ways to modify the command line and
> > further investigate the data used for SIG analysis. This will help me g=
ain
> > a deeper understanding of the boot process and its performance
> > characteristics.
>=20
> I started the same journey around a week ago, and it's proving a valuable
> experience.
>=20
> After some trimming, I reached a (reported) init startup time of around
> 0.6s:
>=20
> root@beagleplay-ti:~# dmesg|grep /sbin
> [    0.630046] Run /sbin/init as init process
>=20
> The result above was obtained on a slightly modified 6.12.4 kernel with a
> custom configuration (I am still thinking about the modifications, as they
> are a bit unorthodox, but I can share them as well as the defconfig if you
> are interested).
>=20
> > Please let me know if you have any suggestions or areas where I could
> > focus
> > my efforts.
>=20
> In general, I'd suggest to use a recent kernel, as I observed a consistent
> reduction of boot time between e.g. 6.6.x and 6.12.x.

I am now partially in this discussion - what exactly are you trying to=20
achieve, or rather is there anything wrong with the current system? I am=20
trying to see whether there is something on my side to work on.
>=20
> > Best regards,
> >=20
> > Shankari
>=20
> Regards,
>=20
> Francesco


Ciao
Stephan


