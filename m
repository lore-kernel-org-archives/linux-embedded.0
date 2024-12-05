Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F922F56
	for <linux-embedded@vger.kernel.org>; Thu,  5 Dec 2024 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733382508; cv=pass; b=oCDlLIeF1Eh2kNP1Ib5d9pzIkmiyJxzY+k8GJ2SQizEQ2OTWVzPIXkA4+IhuEs3jGo6kBwrbIW5xRkdmQC64Jzyb3YxnqJOw4VrahrGn0xAdw3gNEcQ/PrFChNqy3b3Hp6J0n7IVp73FQ3coM6PJer7NAvflZn2M9x6xoDMUZQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733382508; c=relaxed/simple;
	bh=7sPnPRpdOG/EOkMMJCOX6wwhmPR8XcveOMABz46o8Lk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9SP9tdILXHcS7aeW+7V+T4HYRbqb7GRwk7QrYxfSwrg+7iK4xfgERumSH8BWBCjaaIXHizV8O1pMYfKcdKiU7Xl/95hRxGmIdETETxd67c98TIepGvOL5CvVswC9hzQuE8pO6pcjCPXDXHbQP+clFDcG0/6ST/CQ+CCIU4hswE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=cBnajHKF; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=8mvCbNMu; arc=pass smtp.client-ip=85.215.255.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="cBnajHKF";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="8mvCbNMu"
ARC-Seal: i=1; a=rsa-sha256; t=1733382144; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JC45Ehh3OGS7TXb7RWQ3j6KSnDpo362T6Q6Xu6QEcEtvMKH250pLv9OeSdiUN5z9un
    lgVc84KNxnZ5NFkuKyEfn+6BAQ1KOc/hpsaTU5a0gpoMw4fQwDBpgNkd4CLI5huae/kD
    0I3SSASckCVUf42z6UUKC2G52wg+j6Y4WeWkm9xFuK8gjpdWXitb9O0An+vgNQq2sYEX
    u7QJ9ah8o5bwN3ZY3mvInWwsaHHAWW2CcrGbXnxViypPcCgB3tgfj+jXx5H3yQXx4nwQ
    U1UPNYPAbzrRGWhK6gnY1mvwi+30vrhe7f4tmBG4yK3cuadV5B/nNmyT8n0k072ftHv3
    ogDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1733382144;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=vPR6EBI93SJOsGdq9T0YJbkkgAl5aeAOBmrzLvNonWs=;
    b=tPiIBv3HUsNheZLcjjm0WX/GP9wh+/BGNVNDQjWz+g0sGhXOb2h3jBdVqCxGhzRu1Y
    EQaFSso8tngSt59NuFC4Gl3KZ3kSepIIPSSZdqgkPP0bAvzPNf93R8C4Kw/LAD8DL1ZX
    G1Dj+aluEwvU38rsxrHYkkeB02EqKohmtNhB2xRCeYA6f4ykmf4MK5yzPgntRQvYYpQI
    g4NaiRjCMYEkPzlPzxNeKiVPl5ksLZhGboSLiJ4tRooHtjiUU0jUREeSRt9deaoviEoQ
    cwfOHFiiWK+m6chsUA+j+YopwsVFPThQuzsTlCqNqztHASG3lqQvmoDZza82pZHaJTPH
    eDSw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1733382144;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=vPR6EBI93SJOsGdq9T0YJbkkgAl5aeAOBmrzLvNonWs=;
    b=cBnajHKFKDXUn0Dquhd4mTmCrSxClEBxHWFGbEz/G2w0IdsxjdlO/wN5E65ybSug95
    gskOeEeeGghiXD6EWcf4jRsngdWUAPadO/ZTwMv/C/Vlpq1kJvTY8xUPnqgyqR4HUNQL
    aGb4Xm9ti3nOOxCvBHoGOzVXu/GuVEYDWx2NCnGatFu8k1jqiEXue61dkvCipP33ojO/
    DiDHkhz2opFp4doJ+f3CgU1XnkoSyr6bDWjLMQ9uNOvwOZdrpluxRkOjrp1BHPWgKqju
    1RxPHpstUm3t2+8sRRkBGs+WWmjIX9NsV9iuoq5bb9zwAwiwuVt4QKceJ253eSblLDnn
    WWTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1733382144;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=vPR6EBI93SJOsGdq9T0YJbkkgAl5aeAOBmrzLvNonWs=;
    b=8mvCbNMulvMrsel5TBu+bv61SaL52Ke9pXCT+al6Ur26ep6DfWqRYJhW/pyNl5lGMJ
    90LeQEeLMrdCt9IDisBw==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9zW4DNhHgExWlYfvTiILzU3H+E6rF6MBtE8BFxmvg/XQPF4tGa/5o"
Received: from tauon.atsec.com
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id f9f4250B572ND95
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 5 Dec 2024 08:02:23 +0100 (CET)
From: Stephan Mueller <smueller@chronox.de>
To: Francesco Valla <francesco@valla.it>,
 Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Thu, 05 Dec 2024 08:02:23 +0100
Message-ID: <4095066.UUX0tPYDPe@tauon.atsec.com>
In-Reply-To:
 <MW5PR13MB5632D5A1AE2D16F53FA2391FFD362@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box>
 <MW5PR13MB5632D5A1AE2D16F53FA2391FFD362@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 3. Dezember 2024, 22:24:28 Mitteleurop=C3=A4ische Normalzeit s=
chrieb=20
Bird, Tim:

Hi Tim,

> > -----Original Message-----
> > From: Francesco Valla <francesco@valla.it>
> > Dear fellow boot time optimizers,
> >=20
> > following the first boot time SIG meeting, which I lurked with much
> > pleasure
 (but didn't participate to, as I was a bit in awe among such
> > authorities), I'd like to introduce myself with code rather than a
> > presentation or resume.=20
> > Here is a python script which can analyze a dmesg output with
> > initcall_debug
 option enabled and extract some useful information. It
> > can for example be used to analyze the output of the grab-boot-data.sh
> > tool that Tim presented on this list [1] just a few days ago.
> >=20
> > Usage is very simple, as the output of dmesg can be piped directly to i=
t:
> >=20
> >=20
> >     dmesg | analyze-initcall-debug.py
> >=20
> >=20
> > If no option is specified, it outputs a brief summary, like the followi=
ng
> > one
 (obtained on my Beagleplay):
> >=20
> > 1758 drivers has been initialized, of which 1758 before userspace
> > 119 probes happened outside of the init of their driver
> > 0 deferred probes pending
> > ---
> > Top 10 init/probes durations:
> >=20
> >  * 30200000.dss -> 523002us
> >  * deferred_probe_initcall -> 487483us
> >  * fd00000.gpu -> 162859us
> >  * 8000f00.mdio -> 142521us
> >  * 44043000.system-controller -> 71390us
> >  * 2-004c -> 71178us
> >  * 40900000.crypto -> 59350us
> >  * 8000000.ethernet -> 58419us
> >  * 44043000.system-controller:clock-controller -> 56599us
> >  * jent_mod_init -> 52140us
>=20
>=20
> This is odd.  On my beagleplay board, jent_mod_init only took 32326us.
> (see
> https://birdcloud.org/boot-time-files/boot-data-timslab-bp1-241203-134136=
=2Et
> xt)
=20
> I'm assuming that we have similar hardware, but possibly different config=
s,
> kernel cmdlines or kernel versions.  I'll take a look at this and see if I
> can figure out what the difference is between our systems, that causes the
> difference in the duration for this function.
>=20
> This initcall (jent_mod_init) is on my list of initcalls to research to s=
ee
> if they
 can be improved or deferred.  I haven't seen any degradation in
> system behavior by deferring this initcall on my system, but that could be
> from lack of my system doing some related operation that needs the RNG
> data, or my own ignorance of the effects of this call.
>=20
> Can someone comment on what items or operations might depend on
> jent_mod_init
 in early boot?  In particular, would we expect any
> cryptographic problems if the initcall was deferred to a few seconds after
> booting?
>=20
> It can be configured as a module, which makes me think that maybe loading
> it sometime in very late boot (or even later) is OK.
>=20
> jent_mod_init is defined in crypto/jitterentropy-kcapi.c, and controlled =
by
>=20
 CONFIG_CRYPTO_JITTERENTROPY (See crypto/Kconfig)
>=20
> It appears to do some random number generator seeding by measuring
> the jitter of a compressiong operation in the kernel. I assume some of the
> cryptography
 configs affect the duration of the operations.  The initcall
> duration results on my beagleplay seem to be relatively consistent (in the
> 32ms range consistently), and from bobs_lab, on machine sam1, the duration
> range is also consistent (at between 4800 and 5200 usecs).
>=20
> I'd be interested to see if the range is consistent between runs on other
> machines
=20
> Francesco - Can you submit another boot-data file (or 2 or 3) for
> francsecoslab-beagleplay, to
 provide some data on this?
>=20
> Also, can anyone else who sees this initcall in their boot sequence run
> grab-boot-data.sh
 (from https://birdcloud.org/boot-time/Boot-time_Tools)
> and submit the data for one or more of their machines?
>=20
> Stephan Mueller - what are you seeing for the cost of this operation on y=
our
> machines?

I have never done the measurements on my system, but with patch=20
95a798d20060d2b648dd604321e347c85edfd783 the so-called oversampling rate wa=
s=20
changed which reduced the performance of the Jitter RNG (read: it takes a b=
it=20
more to gather all data).

=20
> This is one of the first initcalls I'm going to dive into to see if it can
> be improved or deferred.
 Maybe some of the RNG seeding can be held over
> from a previous boot, in order to eliminate the overhead on the early
> portion of a current boot.  Any feedback on that idea?
>=20
> Thanks.
>    -- Tim
>=20


Ciao
Stephan


