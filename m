Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EFE197552
	for <linux-embedded@vger.kernel.org>; Thu,  2 Jan 2025 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735822626; cv=pass; b=rsog9YLg2xFnT6pF1w9rI6AvbN/EThLsB76frrMmj7zJab60OLpNTEceMY/lOIeSRb6CA2e3rerHJGJmMagNkSUeYr2f3aYg7XdxCaZeXa/VmKpCOqXi5Yal2+yb0ucm+svyuqoEIBYZF0uNK91QS3hlIi8DUxnf6fPPlNc/9bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735822626; c=relaxed/simple;
	bh=N0lQzaHU0zUFgLk1/KX1dn8PSM2jAuai9KzeLac86fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmPLyIqUWAQ+tsoYs9fvOu5tNcliIzuTKcw6tnBv4DqWwI5dJZF1FxfhzQXlvng0qFUDcAQ/WSWciUGMNFCH//f9Pjorp3LnK0PDBFe7Peoe7pNgOendBjeiMDg/5lkgwaGJ6c5gOlVYdLpJOZu22wzL7DGOszRFOQ4dQ7VZSuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=tFaQHigU; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=c9EQHwql; arc=pass smtp.client-ip=85.215.255.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="tFaQHigU";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="c9EQHwql"
ARC-Seal: i=1; a=rsa-sha256; t=1735822620; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Vwej4D064yJsQR2mqRuD58f1fYWy6hkxskqF1XtM56EOI7T0KGR0dVTqD7j+Oc4vPA
    ZMZRGqUeTeMO8jf+jxkeGllE75+J9qKWebAja94Mnciz++5LIGj1WdvfY3y2WBuvhVoF
    W2+7r7Z1RcUzIGto9u7xWeb1f72Z+AOT0rCV6I14/857zeBlGlN0ONktmY4fxPSVJ8Gc
    jvYQCU/3OnVmSYTlamkRlsEm6DCxyU+TJQdkJRzrWSP6oEpwCQ9kbybM3vnWHcToOA9X
    N0z5KGdDE2ML4eY/KtPDTSU0Lub4qEoFkTo+y3gvGyY7RalXpcFdgfIWmV3+qHc1VSbt
    b7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735822620;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QIxyNA/C4F4HiO9aMGXniejy777uK4EA8NsbG4v1ZEc=;
    b=ed9WzEgEkAJwKOb97b/h2csG8NHPXAHHmvBeduT70mbAoArhAS5INOYi7c5orR5bj0
    vsz85Uo4iTjsytNSBRJmBsPSC4UaPBYC26ROGEP7mBaeZBXgYDXOJBEDo+ccHQJ7ViWn
    30QpO5XXYrtC7lcNnzbtdA7KBh9UzUNGv0kKl8uXjfSENhcUX1ZL6VsLQKlWigHVGAS2
    c6fX4z541x3IYdlEBOXcc5pdF9ah0xEz7af7poeRiPlGbIbadcRNaDpUnkvKW1xwfuVd
    VpWmRJC4leMfmyyvXnG7b14mozSmBeDTvvndHoq09uTpswLwIFZOAGQVIQrY9mtsBElk
    oPvA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735822620;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QIxyNA/C4F4HiO9aMGXniejy777uK4EA8NsbG4v1ZEc=;
    b=tFaQHigUb5kqok2ZmHyTDGViAmrHUGN+xYF0SeetdGZVnHN3qi9G79t5gB8GzBWQrr
    ooI+AS/EuothVBJkjWxMZSwSoTqHhCbt50lqzBm2hZnYfGjsgzR9lYu9HczBVJwarXij
    q4PeAQ055PYYj36m7Sc1hE6UYAeOBOc8W8kl589h0Bv9XLdbLkVjI7Or/HGO5usj06by
    7M6XAdxQYVCHsk/EAPCbI8JgNOb+dNOa2Qj1/Xk7CFRtLjZ1j+PVXebKCbMTzR7DTVgS
    1g4zKiy15uy6d9Xzio0GmPLscowQ9spHu0NurGr/nh+AqDv20EFyZyW3M9CWDQPk9DMg
    ljPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735822620;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QIxyNA/C4F4HiO9aMGXniejy777uK4EA8NsbG4v1ZEc=;
    b=c9EQHwqlM7LOoB2+ds6opTHKD93//fUEQGO874n6qZo1PecpvoCWqbnxQ4VydSltwi
    64FrXoyawa7qS3yAwWAA==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzHHXDYJfSfteE3"
Received: from tauon.localnet
    by smtp.strato.de (RZmta 51.2.16 DYNA|AUTH)
    with ESMTPSA id fbdb2a102Cv0ogZ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 2 Jan 2025 13:57:00 +0100 (CET)
From: Stephan Mueller <smueller@chronox.de>
To: Shankari <beingcap11@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Thu, 02 Jan 2025 13:56:59 +0100
Message-ID: <2972828.e9J7NaK4W3@tauon>
In-Reply-To: <2736774.vuYhMxLoTh@fedora.fritz.box>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box> <3346275.44csPzL39Z@tauon>
 <2736774.vuYhMxLoTh@fedora.fritz.box>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 2. Januar 2025, 11:33:08 CET schrieb Francesco Valla:

Hi Francesco,

> That would be wonderful! Whenever you have the time, please let me know what
> analysis you need.
> 

Ok, some background: the Jitter RNG technically has 2 noise sources which are 
sampled concurrently:

1. variations of the execution of CPU instructions

2. variations of memory access times

For (1) the Jitter RNG has a fixed set of instructions it performs the 
execution time measurements for: the SHA-3 conditioning operation 
(specifically the Keccak sponge function). For that, it performs a given set 
of Keccak operations.

For (2) the Jitter RNG allocates a fixed set of memory and simply reads / 
writes data there and measures this timing.


For (1), the more instructions are samples, the higher the entropy gathered. 
This means more time is required to sample that entropy. I.e. when you 
increase the number of measured Keccak operations, you get more entropy.

For (2), when the memory is large enough to "spill over" into the next type of 
memory (from L1 to L2 to L3 to RAM), the higher the entropy gathered.


So, for (2), to get more entropy, is invariant from the execution time. But 
for (1), the entropy rate depends on the execution time.


Thus, what you want is to try to reduce the time spend for (1).


The key now is that the overall entropy rate the Jitter RNG requires for 
functioning must be such that when gathering 256 bits of data from it, it 
contains 256 bits of entropy.


Now, there are 2 "knobs" to turn via Kconfig:

- the oversampling rate (OSR): given that the individual number of rounds for 
(1) and the number of accesses for (2) are kept the same, the OSR causes the 
Jitter RNG to multiply the round counts. For example, the baseline with OSR == 
1 is that for gathering 256 bits of entropy, 256 times both noise sources are 
sampled. For an OSR of, say, 3, to get 256 bits of entropy, 3 * 256 = 768 
times both noise sources are sampled. This value was changed from 1 to 3 for 
6.11 because there were reports on some CPUs that the Jitter RNG did not 
produce sufficient entropy - most CPUs, however, can perfectly live with OSR 
== 1.

- the amount of memory for (2) can be increased. The default is 2kBytes which 
usually means that the L1 can fully handle the accesses.


======


Now given the description, what can you do? I would apply the following steps:

1. measure whether the timer your system has is really a high-res timer (the 
higher the resolution, the higher the detected variations and thus the 
entropy)

2. assuming that test 1 shows a high res timer, reduce the OSR back to 1 
(CRYPTO_JITTERENTROPY_OSR) and measure the entropy rate - 

3. if test 2 shows insufficient entropy, increase the amount of memory 
(CRYPTO_JITTERENTROPY_MEMSIZE_*) and measure the entropy rate



The tool for measuring the entropy rate is given in [1] - check the README as 
you need to enable a kernel config option to get an interface into the Jitter 
RNG from user space. As you may not have the analysis tool, you may give the 
data to me and I can analyze it.


More details on tuning the Jitter RNG is given in [2] - it discusses to the 
user space variant, but applies to kernel as well.

[1] https://github.com/smuellerDD/jitterentropy-library/tree/master/tests/raw-entropy/recording_runtime_kernelspace

[2] https://github.com/smuellerDD/jitterentropy-library/tree/master/tests/raw-entropy#approach-to-solve-insufficient-entropy

Ciao
Stephan


