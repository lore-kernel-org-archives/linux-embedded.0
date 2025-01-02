Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892A617996
	for <linux-embedded@vger.kernel.org>; Thu,  2 Jan 2025 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735809871; cv=pass; b=N0JJZiuBZheaXiocZsmv2lWp+vY5emnIxq6jHWmht57PVUNo1ijEzuJj/KZNLpsdSLaJX5Xd6Smc7Mfd3yX5Y8A0pmJXJZdsfyaSWQQpQSDrAvnAAiu9Zj7/6K70GJp8/uLFb7m1wGpuE7dn+jWHqnHvyNaRolA0uO9zkIwZWsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735809871; c=relaxed/simple;
	bh=VUYZSrnpuc8NX0C8a817ipNlD+ILoSI6U83zgLHU3jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MGbGc49kBlGLGB8/ecyNvN1/obvQSQE/JCbi1/tBq6BUiNV02n+GLgDYNBAfxytIJ6cj6Cs/3rZXsTuwCpMLWGuQnGz36PqVKHK8oneS3FsstzuLPuaRXNtGMTIc4mJmEFwp2NzoezlFgJ0IGYp1+XmGAgIJ3UEjHNG6BQGaeoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=nRUnKEH7; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=E5nWf7vx; arc=pass smtp.client-ip=85.215.255.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="nRUnKEH7";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="E5nWf7vx"
ARC-Seal: i=1; a=rsa-sha256; t=1735808786; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CStkkEuBRxBVw6SjY9U/IR+feDVVqg6aDPopnF4c0enaBHKqaohnPhP7MVG/CehZBx
    naqmM2BDl+ZI/07x6OMbY06XysV5PPknc1e4g6lhL3pcvrsYFc9ndT8K66m9z2N5g/qR
    tHEfpuCK0kWk7RL4xaqNsS++GGBtCYx5BWamvjT5L8zmROwIpbunEjxzIR87VaBhO48A
    3g9LqNu0OGC5ill/ut3jsGIQ7CEulkpaP4eG3eYiupaxl06Ch5Yl4IifEAhcmwSmX2MZ
    z0JrHpVoeYoOkGLHeBIsU2Vuh1SOnTwH861J7xkriUqzq9NlbepnwsoYks29on9s1x3Z
    GBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735808786;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6DnpzYrJm64AlmNlN3AmIyA08nYu50lyVHp+Uq5WhKU=;
    b=mYLL+nFkPZTT4WdYsogBMxf/FvOwui26auKFfqAD0JDSw4FrNAoCNq+J/2OvAzT2uf
    1PwQ+Z2InrmFhaWEbaRCGElrs1KzFSRhfVbClS/6OevBQc7m/1bEjCQ9WwVXV7ne38eg
    2na18U7cueZwwU8FfEpAzvzL8nr5VuKvskz9bVvwXcnsHNlOMs4rEx3mffsFe2IU4DLM
    b0zgGoOZ8bQlJwjKKZ+x1uJg8aaoUCtZdY7IzCQ75DFXF81auqdwqd0KZrMNNYutCqTI
    rT/TrUmkReg+XJmQYoJ/V3qi1gerLJrxrqq6XBSJESS146lB40EU53uFbTe39nFyxd6+
    iFAQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735808786;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6DnpzYrJm64AlmNlN3AmIyA08nYu50lyVHp+Uq5WhKU=;
    b=nRUnKEH7Pjs5aWFf5bsEC4USUn5Bjzd/+xd9ITfMSiS3r84R+BAiVC/UhROHZDQXMe
    ReBVHM7T5kfW8F5T4qTDSu+5z42YIfLywhG8EpBGhfNGPF8QltwBtx0IXPXr/8763akf
    Qv7kiW6cjxg+sX7nZrJMWaUYUUzURk09QUFovWDGn/CURVn+NA6+luoA0BbJ03X74oV5
    wBDcZV8v+eq5JEDDPSRqt5s6oPN56gShSygRY2DDMQ9lwovvEttCbUXn0USpg3kzXHVl
    2gtpHLz5llWUpIulXKDYDVyg1YLuzLiLeenVF9CfEhBYE5SLpa+DjvZH01Qmmz6w5R+X
    lg2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735808786;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6DnpzYrJm64AlmNlN3AmIyA08nYu50lyVHp+Uq5WhKU=;
    b=E5nWf7vxr30FwYPeTxdtpV/zuzvPy3RfOjmQNucudEf+cG3faJTxEFhXpiF9MleQeM
    y8EXRNzjZwuh7tk6BPDg==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzHHXDYJfSfteE3"
Received: from tauon.localnet
    by smtp.strato.de (RZmta 51.2.16 DYNA|AUTH)
    with ESMTPSA id fbdb2a10296QnMu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 2 Jan 2025 10:06:26 +0100 (CET)
From: Stephan Mueller <smueller@chronox.de>
To: Shankari <beingcap11@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Thu, 02 Jan 2025 10:06:25 +0100
Message-ID: <3346275.44csPzL39Z@tauon>
In-Reply-To: <2285043.vFx2qVVIhK@fedora.fritz.box>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box>
 <26792960.1r3eYUQgxm@positron.chronox.de>
 <2285043.vFx2qVVIhK@fedora.fritz.box>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 31. Dezember 2024, 15:42:16 CET schrieb Francesco Valla:

Hi Francesco,

> The ultimate goal here is reducing the boot time to the minimum possible
> without removing functionalities. The purpose is educational, but on the
> long term it will probably be beneficial to my work too (as I work in the
> automotive industry, where each millisecond counts).
> 
> There isn't anything inherently wrong, at the moment I am trying to
> determine what is real initialization time and what instead is an actual
> waste of time (e.g.: excessive probe deferral). The aforementioned
> jent_mod_init (on which Tim I think is working on some level) is one of the
> longest single inits, but to be honest I don't know much about all the
> entropy stuff.
> 
> Wishing you the best for the new year,

Same to you!

Thanks for your answer. With that, if you desire it, I can try to help you 
lowering the boot time at least in light of the Jitter RNG. This, however, 
requires a bit of analysis which you need to help me with as I do not have a 
board you discuss. But the Jitter RNG has some turning knobs that can be used.

Ciao
Stephan


