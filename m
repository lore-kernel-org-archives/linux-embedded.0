Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E71A315A
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 20:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748031214; cv=pass; b=pVUla3cLJIwALGAufY7XtFmIMQbWT13EYWci63BpKzFj27gponOPsSaHvkEP5EE447Em01aCSVUx3ucz2Q4fxgeoATt/D4m1z5iAbOGvb9XTMEQQlLd/IA2V9+kcJ2ZPMtiFLwzlmuLmOBUc6ps8ClpvqbkwQxlaZ5+986+UxjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748031214; c=relaxed/simple;
	bh=9n1i/G+VjgC/Z2+WwHPmBwXOI4EaQjz4b3WNta2CnDc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XcCHQ5u2rF7FGPKc3kn4WyG9jTHrqpaThb7Lp8r3jjlbhNBla3EmHBQMSKcp6jeTLEa83ehgTZJEmnP1laG8VsGL0aw187sTcKugZFqO6royCywNf4aCIFHfbnUrW7HsElvKvi56UUNs2o0Csm7Ha7R7DB/E7rTYRLDqiKQTgb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=HFPmg0C6; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="HFPmg0C6"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-45wp.prod.antispam.mailspamprotection.com; s=arckey; t=1748031212;
	 b=eGFq8+qvrv0vgZp2Uqd+UG3Qx/xUk8Uc09VdWhsN/v7DihmjghZZN+RlWMBD6qYLTqRJ8qanu3
	  zBPoGmbonMyC3M7cBlqlmNAXdEHmF1zSf1FI9FjQmX7DpnKue7fqrA56lm+0JCPMj5KHpHut1D
	  y/6yMZeGISgFgdb+aWHejDVW4Gl7SOAS2CUk9Np2itkIp2YjdNsIQ3n+W1lEpDnnMHIsYrf95e
	  Kjl5w9adxvsziAxixjOk13mhAWtg/TACB2scj7THm699fNLfDogwOfw9F9OS+07nevMxWfEmnB
	  3OEP+waU79mBdOxy4fEJ/4h7o5KOwayxEQc7iw+nMOkiNg==;
ARC-Authentication-Results: i=1; instance-europe-west4-45wp.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-45wp.prod.antispam.mailspamprotection.com; s=arckey; t=1748031212;
	bh=9n1i/G+VjgC/Z2+WwHPmBwXOI4EaQjz4b3WNta2CnDc=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:To:From:DKIM-Signature;
	b=Fo5lK0wK/d3zKgrSzNxkXk63lxtsrmhI5kY+/l3AtOxLEv6W0ENdeGB7pM6RDAuSAwnQFR4ewg
	  t/htrHOc28GnZEsbR4kDbz2xrj97K74QPhK1HEkZ+MVcLcW4TrxdveIjaniXHG4BbShYzdOm3n
	  HrtTP00fyTxFxG/lZevF0NSkhUvfkaDD8HfOSkIYRDMvCz0n1KGD/o6hRbyyNBcM4HbS4tRD+m
	  PqFPo9m4cifTXYrv3x9nBGDuxSw5h2vZuzyBY0DUG9U8y1aSEu097SB6m72QJEoU656chGfb9H
	  snTEZoIHbe+gwCzz4T/e5aTJfa8vHqrs6AvGeb+kifRAlQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-45wp.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIYJ0-00000000gJd-4AXp
	for linux-embedded@vger.kernel.org;
	Fri, 23 May 2025 19:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:To:From:cc:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=9YL/TQAPo1VWG0nmu7ZgtJ1nTUPsattzVWITb/Bo3cI=; b=HFPmg0C6SUkpq5D9jasBVBHG9s
	3r/B6YwC3TcXph8s9ChrWBQvq7wke79vyU8dqzSjzfyeKPvceA/GDK/arjB8f+cv7EVLydt99FcEl
	mbheRjmoR1qIDQxRZ2+Y6QJu4mopLbP3EhUEyUvEHTk/7L2X9hkWYIRSV/V03spgTe68=;
Received: from [80.182.118.140] (port=59622 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uIYIt-000000008YG-3Trx;
	Fri, 23 May 2025 19:43:39 +0000
From: Francesco Valla <francesco@valla.it>
To: linux-embedded@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/1] drivers: misc: add driver for bootstage stash
Date: Fri, 23 May 2025 21:43:38 +0200
Message-ID: <3107514.XAFRqVoOGU@fedora.fritz.box>
In-Reply-To: <f1673d75-e951-4cdd-8414-f1e9d7d6e6aa@kernel.org>
References:
 <20250522224223.358881-2-francesco@valla.it>
 <20250522224223.358881-3-francesco@valla.it>
 <f1673d75-e951-4cdd-8414-f1e9d7d6e6aa@kernel.org>
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
X-SGantispam-id: f4d5b56e9e0ca7617870533886ba0d5e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-45wp.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Krzysztof,

On Friday, 23 May 2025 at 08:29:28 Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 23/05/2025 00:42, Francesco Valla wrote:
> > Add support for bootstage stash areas containing boot time data
> > created by some bootloader (e.g. U-Boot). The driver provides generic
> > time information through sysfs and platform-specific one through
> > debugfs.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> 
> Your Cc list is so incomplete I really do not understand which project
> you target and this popped up in my lei filters. If this is not for
> Linux kernel, please ignore the rest.
> 

Yes, target is the Linux kernel, the patch contains a mock-up driver
generated by a discussion [1] of the Boot Time SIG held on last Tuesday.
I should have marked it as proof-of-concept rather than RFC, probably.

> If this is for Linux kernel then:
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 

The only warning, if we ignore three on unnecessary parentheses raised
by --strict, is the one about the DT bindings that need to be submitted
separately. That was expected and somewhat specified in the cover letter,
but I honestly did not think of the automated tooling.

> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 

I used scripts/get_maintainer.pl in the past but I wasn't aware of this
use of b4. I'll check it out.

> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 


I did not want to unnecessary bother people that might not be interested,
as the current form is not intended for mainline. I'll however be more
scrupulous in the future.

> 
> Best regards,
> Krzysztof
> 
> 

Thank you for the guidance!

Regards,
Francesco

[1] https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq5mN0/edit?tab=t.0





