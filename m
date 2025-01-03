Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD811FA25D
	for <linux-embedded@vger.kernel.org>; Fri,  3 Jan 2025 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735925018; cv=pass; b=syoOKEIO+PWQkC3Q5GC5O5QO1GnZdfhGUF1ChMZTzwvl9rq/waTXAo054RxL4fw63zRPzfqu5pag0w8+XlCxRdEbse/rj4SCk7m6Kmvm8eDB65k29roGr1Z0Luryc1d6T3PESJSUbXKKFKhBiRhhCQ55RlW6gH0SN9mP0u9Ua/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735925018; c=relaxed/simple;
	bh=KCf724L23XKf96asozPTKCEgPqbwcDSRqAusNJzUfCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7fF9dJIjFTp78MJOgQ2I2C+VRXSPYmkDCj822DG5KmfLRZP5OdOIHNNQZu0xY82Wbdeyq1nY5WojofyGKnxXFtzauoXgdvzgP+1dhmHLufxrFA2CvvMpPa9xcn++tIWrZJqxBkS4qDQeZfEdzFTM7E47ZhB7b9O0+ssCLPJ7YE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=Y8Xt1kgo; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="Y8Xt1kgo"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-07zg.prod.antispam.mailspamprotection.com; s=arckey; t=1735925015;
	 b=OD1jukL3WNV7sDeBVzVa65H1p5XCXe2ShHZeGeBAqFUvDUa8kvWXUukXZ0GTGYJEafvwmSt1lF
	  x6OjcAEs1OVNOv90Bq8a83iGMzprpX+bsqGX+PmrDXtVDvQz7lRrzwCc+WKOOyMPpbgQvioXtL
	  XPEm6iG1FHa881JFaOD20ymkM/AOxLBDOcUa19r3qmjhSTPT0yX848dES8cMjjMSiKFbTqmgNe
	  fEtYFnmpmovZ3dRUb5hmkXVFkid1x7T+v6qodHvPmOcOb4Slqzu3s/+99ERj50OEb/AdPhfgxp
	  qN7VnFkdRmGG/mMS/v652w3SZZ38kfmcF47G8zEqbYJIfQ==;
ARC-Authentication-Results: i=1; instance-europe-west4-07zg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-07zg.prod.antispam.mailspamprotection.com; s=arckey; t=1735925015;
	bh=KCf724L23XKf96asozPTKCEgPqbwcDSRqAusNJzUfCE=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=T4h8xAEJ7dGE/wGIkle2vjdP+0mBDnjZg/QsjKbL4Ivq1uuQ2Qw/qDXiMDb569/3I3qa8bOPQB
	  DZAgtB+90nehrQLisDvaI/I2VS+enONBzQV2uGwQ6HcdrU5m7hRUc6F+lW3WGEcII/A2k7D5Io
	  6yeumNsWHG9/6YCUqCNM0QnSvkpfzrKD7xtJ7ffdLjTEJkIzg8IcKSeUh2GcuVFLniaPmN4UHq
	  q4uyHsMc6BYt74RqTKgsLKDiqt2PKGioCyjD+AkwBlVzWMYOp6EBUptEGJxFArAgIH4Exyb7GY
	  PhMR2zb+Smk8pFohwx9hwu0yp3evrUDgFKoSu1iPTxRh/w==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-07zg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tTlOP-0000000CSJE-0N8F
	for linux-embedded@vger.kernel.org;
	Fri, 03 Jan 2025 17:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=LPRB/ctp2D8UlEIg6bQDwXH4KGAUTBTgCY8wEIfAZ5M=; b=Y8Xt1kgo6d+K5mB7ZrKfs3+mx/
	3gripdwhmlUq453MW1ALQ+yCAygMOVRsqwkrMMDSnZtP5WN2kurY1I/6RixbMlnTCt2G+aQEvT/n8
	1W4oAyODMc4XtaG4gPTBGd/7vevyhK8V8OwflUwv2DI54Rhpu+zEabKMJAFjNaLVO+os=;
Received: from [87.11.41.26] (port=60856 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tTlOJ-000000003fd-44vl;
	Fri, 03 Jan 2025 17:23:20 +0000
From: Francesco Valla <francesco@valla.it>
To: Shankari <beingcap11@gmail.com>, Stephan Mueller <smueller@chronox.de>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Date: Fri, 03 Jan 2025 18:23:19 +0100
Message-ID: <3506889.LZWGnKmheA@fedora.fritz.box>
In-Reply-To: <2972828.e9J7NaK4W3@tauon>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box> <2736774.vuYhMxLoTh@fedora.fritz.box>
 <2972828.e9J7NaK4W3@tauon>
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
X-SGantispam-id: 5dc597b6480958a67fcd3edd34accd31
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-07zg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Stephan,

On Thursday, 2 January 2025 at 13:56:59 Stephan Mueller <smueller@chronox.de> wrote:
> Am Donnerstag, 2. Januar 2025, 11:33:08 CET schrieb Francesco Valla:
> 
> Hi Francesco,
> 
> > That would be wonderful! Whenever you have the time, please let me know what
> > analysis you need.
> > 
> 
> Ok, some background: the Jitter RNG technically has 2 noise sources which are 
> sampled concurrently:
> 
> 1. variations of the execution of CPU instructions
> 
> 2. variations of memory access times
> 
> For (1) the Jitter RNG has a fixed set of instructions it performs the 
> execution time measurements for: the SHA-3 conditioning operation 
> (specifically the Keccak sponge function). For that, it performs a given set 
> of Keccak operations.
> 
> For (2) the Jitter RNG allocates a fixed set of memory and simply reads / 
> writes data there and measures this timing.
> 
> 
> For (1), the more instructions are samples, the higher the entropy gathered. 
> This means more time is required to sample that entropy. I.e. when you 
> increase the number of measured Keccak operations, you get more entropy.
> 
> For (2), when the memory is large enough to "spill over" into the next type of 
> memory (from L1 to L2 to L3 to RAM), the higher the entropy gathered.
> 
> 
> So, for (2), to get more entropy, is invariant from the execution time. But 
> for (1), the entropy rate depends on the execution time.
> 
> 
> Thus, what you want is to try to reduce the time spend for (1).
> 
> 
> The key now is that the overall entropy rate the Jitter RNG requires for 
> functioning must be such that when gathering 256 bits of data from it, it 
> contains 256 bits of entropy.
> 
> 
> Now, there are 2 "knobs" to turn via Kconfig:
> 
> - the oversampling rate (OSR): given that the individual number of rounds for 
> (1) and the number of accesses for (2) are kept the same, the OSR causes the 
> Jitter RNG to multiply the round counts. For example, the baseline with OSR == 
> 1 is that for gathering 256 bits of entropy, 256 times both noise sources are 
> sampled. For an OSR of, say, 3, to get 256 bits of entropy, 3 * 256 = 768 
> times both noise sources are sampled. This value was changed from 1 to 3 for 
> 6.11 because there were reports on some CPUs that the Jitter RNG did not 
> produce sufficient entropy - most CPUs, however, can perfectly live with OSR 
> == 1.
> 
> - the amount of memory for (2) can be increased. The default is 2kBytes which 
> usually means that the L1 can fully handle the accesses.
> 
> 

This was a very instructive read. I didn't (yet?) have the time to dive deep
into all the crypto "backbone", but I think I understood in broad terms.

Thank you!

> ======
> 
> 
> Now given the description, what can you do? I would apply the following steps:
> 
> 1. measure whether the timer your system has is really a high-res timer (the 
> higher the resolution, the higher the detected variations and thus the 
> entropy)
> 

Resolution reported by clock_getres() is 1ns. Is this sufficient?

> 2. assuming that test 1 shows a high res timer, reduce the OSR back to 1 
> (CRYPTO_JITTERENTROPY_OSR) and measure the entropy rate - 
> 

Turned out my system already had the OSR set to 1, since CONFIG_CRYPTO_FIPS was
set to N.

> 3. if test 2 shows insufficient entropy, increase the amount of memory 
> (CRYPTO_JITTERENTROPY_MEMSIZE_*) and measure the entropy rate
> 
> 
> 
> The tool for measuring the entropy rate is given in [1] - check the README as 
> you need to enable a kernel config option to get an interface into the Jitter 
> RNG from user space. As you may not have the analysis tool, you may give the 
> data to me and I can analyze it.
> 

Here are the results (with default parameters for processdata.sh:

Opening file: '../results-analysis-runtime/raw_noise.0Fbitout.data' (SHA-256 hash 079f14467f309991a0bcaac2b667283ff1f19eba0ddf1fbd6b34e55a6d94ed87)
Loaded 1000000 samples of 16 distinct 4-bit-wide symbols
Number of Binary Symbols: 4000000

Running non-IID tests...

Running Most Common Value Estimate...
Bitstring MCV Estimate: mode = 2027350, p-hat = 0.50683750000000005, p_u = 0.50748139719173813
        Most Common Value Estimate (bit string) = 0.978573 / 1 bit(s)
Literal MCV Estimate: mode = 68652, p-hat = 0.068652000000000005, p_u = 0.069303328207377918
        Most Common Value Estimate = 3.850932 / 4 bit(s)

Running Entropic Statistic Estimates (bit strings only)...
Bitstring Collision Estimate: X-bar = 2.4981538638330933, sigma-hat = 0.49999674790330145, p = 0.53784137679559285
        Collision Test Estimate (bit string) = 0.894747 / 1 bit(s)
Bitstring Markov Estimate: P_0 = 0.50683750000000005, P_1 = 0.49316249999999995, P_0,0 = 0.50927960145016893, P_0,1 = 0.49072039854983107, P_1,0 = 0.50432742976576173, P_1,1 = 0.49567257023423827, p_max = 3.0783392443248932e-38
        Markov Test Estimate (bit string) = 0.973524 / 1 bit(s)
Bitstring Compression Estimate: X-bar = 5.2062336468660613, sigma-hat = 1.0200139851715606, p = 0.037082666137132736
        Compression Test Estimate (bit string) = 0.792185 / 1 bit(s)

Running Tuple Estimates...
Bitstring t-Tuple Estimate: t = 18, p-hat_max = 0.5303003556530639666278, p_u = 0.5309431295223588315809
Bitstring LRS Estimate: u = 19, v = 43, p-hat = 0.50389349457067132, p_u = 0.50453743245287026
        T-Tuple Test Estimate (bit string) = 0.913371 / 1 bit(s)
Literal t-Tuple Estimate: t = 4, p-hat_max = 0.0814448250695374631388, p_u = 0.08214935860193944897723
Literal LRS Estimate: u = 5, v = 9, p-hat = 0.063061514307713893, p_u = 0.063687630641525933
        T-Tuple Test Estimate = 3.605607 / 4 bit(s)
        LRS Test Estimate (bit string) = 0.986967 / 1 bit(s)
        LRS Test Estimate = 3.972843 / 4 bit(s)

Running Predictor Estimates...
Bitstring MultiMCW Prediction Estimate: N = 3999937, Pglobal' = 0.50734663518092882 (C = 2026779) Plocal can't affect result (r = 25)
        Multi Most Common in Window (MultiMCW) Prediction Test Estimate (bit string) = 0.978956 / 1 bit(s)
Literal MultiMCW Prediction Estimate: N = 999937, Pglobal' = 0.071847840262787413 (C = 71181) Plocal can't affect result (r = 6)
        Multi Most Common in Window (MultiMCW) Prediction Test Estimate = 3.798911 / 4 bit(s)
Bitstring Lag Prediction Estimate: N = 3999999, Pglobal' = 0.50760302185063 (C = 2027836) Plocal can't affect result (r = 23)
        Lag Prediction Test Estimate (bit string) = 0.978227 / 1 bit(s)
Literal Lag Prediction Estimate: N = 999999, Pglobal' = 0.07177509499573978 (C = 71113) Plocal can't affect result (r = 6)
        Lag Prediction Test Estimate = 3.800373 / 4 bit(s)
Bitstring MultiMMC Prediction Estimate: N = 3999998, Pglobal' = 0.50910236964447519 (C = 2033833) Plocal can't affect result (r = 23)
        Multi Markov Model with Counting (MultiMMC) Prediction Test Estimate (bit string) = 0.973972 / 1 bit(s)
Literal MultiMMC Prediction Estimate: N = 999998, Pglobal' = 0.06979561605633619 (C = 69142) Plocal can't affect result (r = 6)
        Multi Markov Model with Counting (MultiMMC) Prediction Test Estimate = 3.840720 / 4 bit(s)
Bitstring LZ78Y Prediction Estimate: N = 3999983, Pglobal' = 0.50745980290740611 (C = 2027255) Plocal can't affect result (r = 25)
        LZ78Y Prediction Test Estimate (bit string) = 0.978635 / 1 bit(s)
Literal LZ78Y Prediction Estimate: N = 999983, Pglobal' = 0.068264919012970812 (C = 67617) Plocal can't affect result (r = 5)
        LZ78Y Prediction Test Estimate = 3.872712 / 4 bit(s)

H_original: 3.605607
H_bitstring: 0.792185
min(H_original, 4 X H_bitstring): 3.168741

---

Opening file: '../results-analysis-runtime/raw_noise.FFbitout.data' (SHA-256 hash 670cc4f908a3fa430112387c7490280b801fbc3e0d9b2eb5725a7382f1726353)
Loaded 1000000 samples of 256 distinct 8-bit-wide symbols
Number of Binary Symbols: 8000000

Running non-IID tests...

Running Most Common Value Estimate...
Bitstring MCV Estimate: mode = 4293572, p-hat = 0.53669650000000002, p_u = 0.53715061859478275
        Most Common Value Estimate (bit string) = 0.896601 / 1 bit(s)
Literal MCV Estimate: mode = 25394, p-hat = 0.025394, p_u = 0.025799226085884197
        Most Common Value Estimate = 5.276528 / 8 bit(s)

Running Entropic Statistic Estimates (bit strings only)...
Bitstring Collision Estimate: X-bar = 2.4368621131861672, sigma-hat = 0.4959976634888219, p = 0.67866590835207607
        Collision Test Estimate (bit string) = 0.559227 / 1 bit(s)
Bitstring Markov Estimate: P_0 = 0.53669650000000002, P_1 = 0.46330349999999998, P_0,0 = 0.58912975024059222, P_0,1 = 0.41087024975940778, P_1,0 = 0.47595730335441655, P_1,1 = 0.52404269664558345, p_max = 3.5198162547162731e-30
        Markov Test Estimate (bit string) = 0.764393 / 1 bit(s)
Bitstring Compression Estimate: X-bar = 5.1060913378184907, sigma-hat = 1.0602301402207321, p = 0.089700342434675784
        Compression Test Estimate (bit string) = 0.579790 / 1 bit(s)

Running Tuple Estimates...
Bitstring t-Tuple Estimate: t = 24, p-hat_max = 0.6077535669643823323526, p_u = 0.608198213970942755998
Bitstring LRS Estimate: u = 25, v = 55, p-hat = 0.57377327555229816, p_u = 0.57422363845508301
        T-Tuple Test Estimate (bit string) = 0.717387 / 1 bit(s)
Literal t-Tuple Estimate: t = 2, p-hat_max = 0.02539400000000000000072, p_u = 0.02579922608588419654918
Literal LRS Estimate: u = 3, v = 6, p-hat = 0.014678019585973216, p_u = 0.014987790126594754
        T-Tuple Test Estimate = 5.276528 / 8 bit(s)
        LRS Test Estimate (bit string) = 0.800315 / 1 bit(s)
        LRS Test Estimate = 6.060069 / 8 bit(s)

Running Predictor Estimates...
Bitstring MultiMCW Prediction Estimate: N = 7999937, Pglobal' = 0.53749557635492473 (C = 4296298) Plocal can't affect result (r = 26)
        Multi Most Common in Window (MultiMCW) Prediction Test Estimate (bit string) = 0.895675 / 1 bit(s)
Literal MultiMCW Prediction Estimate: N = 999937, Pglobal' = 0.031150330241116859 (C = 30704) Plocal can't affect result (r = 4)
        Multi Most Common in Window (MultiMCW) Prediction Test Estimate = 5.004609 / 8 bit(s)
Bitstring Lag Prediction Estimate: N = 7999999, Pglobal' = 0.55941498930539801 (C = 4471702) Plocal can't affect result (r = 30)
        Lag Prediction Test Estimate (bit string) = 0.838009 / 1 bit(s)
Literal Lag Prediction Estimate: N = 999999, Pglobal' = 0.024834737018808978 (C = 24437) Plocal can't affect result (r = 4)
        Lag Prediction Test Estimate = 5.331497 / 8 bit(s)
Bitstring MultiMMC Prediction Estimate: N = 7999998, Pglobal' = 0.56384793754105667 (C = 4507169) Plocal can't affect result (r = 30)
        Multi Markov Model with Counting (MultiMMC) Prediction Test Estimate (bit string) = 0.826622 / 1 bit(s)
Literal MultiMMC Prediction Estimate: N = 999998, Pglobal' = 0.026034084289744124 (C = 25627) Plocal can't affect result (r = 4)
        Multi Markov Model with Counting (MultiMMC) Prediction Test Estimate = 5.263455 / 8 bit(s)
Bitstring LZ78Y Prediction Estimate: N = 7999983, Pglobal' = 0.55942260687547074 (C = 4471754) Plocal can't affect result (r = 30)
        LZ78Y Prediction Test Estimate (bit string) = 0.837990 / 1 bit(s)
Literal LZ78Y Prediction Estimate: N = 999983, Pglobal' = 0.026039513473967817 (C = 25632) Plocal can't affect result (r = 4)
        LZ78Y Prediction Test Estimate = 5.263154 / 8 bit(s)

H_original: 5.004609
H_bitstring: 0.559227
min(H_original, 8 X H_bitstring): 4.473812

---

> 
> More details on tuning the Jitter RNG is given in [2] - it discusses to the 
> user space variant, but applies to kernel as well.
> 
> [1] https://github.com/smuellerDD/jitterentropy-library/tree/master/tests/raw-entropy/recording_runtime_kernelspace
> 
> [2] https://github.com/smuellerDD/jitterentropy-library/tree/master/tests/raw-entropy#approach-to-solve-insufficient-entropy
> 
> Ciao
> Stephan
> 

Thank you again!

Francesco




