Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9718A6A6
	for <linux-embedded@vger.kernel.org>; Thu,  9 Jan 2025 17:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442843; cv=pass; b=TRfzezQWIkryljwXPJQt/aNGyridBAnK9PwZDHdUe5sWfUygX/2yt1r/qV4Df4mO64JjQV75E/vN5VUdL+suuOufAgQA2049D75X4m5e8fdUZdc7OQyu0kDqm5IEp+nHpIUavHxC7IB5C9VpBYIlLzyUA3RxJnYfjMqkdXCE69A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442843; c=relaxed/simple;
	bh=OSAlksV4h1CmHYqrYGM5M2yb+xaHA+El7x3Bq0os+Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ImGReQ1Itp6r/TQz6YIbTJG9cGZDW0KHMPjqIrK7uv9kGimLCOsFYNDn/XDkncK9LmyAAOFwaV6n9OIzS9gKAWRjP/PetIMXA14/30hj58Di60Wk4tJ2AynFBp2cFmndtnt8CfEdSXygMsMtdiYOLbasuwllaaDdRz1v7aGz7/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=QZ0H6ieB; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="QZ0H6ieB"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-75c7.prod.antispam.mailspamprotection.com; s=arckey; t=1736442839;
	 b=iRZSllYYrXIZ12nxpaqW5JPDxC2zIcLuIJq/ls0izl8yQCqaw8/pnTjpf1IoXbPkxtMU42yAvX
	  VWCkJSvz8767tDsIv5KPzTK0Hv3I/OwTHW5/up61+0d2VCTIG4kCcw0KLlJWyUQ8RqN2BQQeIx
	  l8thOhB2cPxQ5NWDmlwzbStTym30MQYJQw6pBR3017HMdTEXKEUAY0HBjVeeyB4P0TO891sucU
	  EAYL6eT1Uq2eXHVk+VChUqksDue/4ttGj4OxVrC3trC/G3zy8XojKVBfMK6ayPagfJwARJApQY
	  KQw2Io9E8WwF9Y5vzbrs2XzFSre2/qHCkfSyKQ3qhESDWw==;
ARC-Authentication-Results: i=1; instance-europe-west4-75c7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-75c7.prod.antispam.mailspamprotection.com; s=arckey; t=1736442839;
	bh=OSAlksV4h1CmHYqrYGM5M2yb+xaHA+El7x3Bq0os+Pw=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=HD87UCDimYYpieZqxcY4dkl1W5hLs+CSeQ2wOwQfagXDxyuPfTJW+LgRST2BbHUIBEldQ07jiW
	  p1QtakfNWKg4ANvw2Cvk1CYl1GcbN69KAuO3Rnb7NaPZJRJYubVpN/Ea6LkSutRTF0CXHl7GQE
	  VojlyvSMzbJJulGHf6DKozLAQrXPuBfPYA/IjTfp6jbMeQ5XthJYIAIyIrrHd42ft5YN0YG44P
	  fw9O4Ah5XFmakNV8zgjQ1mcA/3EUANEWdMp2BpDDX9eio86FSryiWLH4dg5pAecmZqO6A1/iGq
	  DQn04/qqBpS1l0rXUxokl2WFZVeDKB3Tg4qRdCFosJpgDA==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-75c7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tVvJV-00000001dcB-2D2K
	for linux-embedded@vger.kernel.org;
	Thu, 09 Jan 2025 16:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=AvKhatYY9dET2IR65DmiCdLY4O0R0RhzugX90U3eYe4=; b=QZ0H6ieBmQYSV2QKgmHvJz0q7t
	g4zuLEQOKwmEBhGBS9e4i07vyYMdVQ1sTBzfqi+lEB1M+04kHAar+G9DJ5U8aisF3L12olC2Tyk2h
	qduVrYBIT1mpaStVea1dpPW5Dg6F9JqhWns7TbPhwDItqrfwJsCzB/J1DZORraDcfHXY=;
Received: from [87.11.41.26] (port=63930 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tVvJJ-00000000I5F-0Gur;
	Thu, 09 Jan 2025 16:23:05 +0000
From: Francesco Valla <francesco@valla.it>
To: "Bird, Tim" <Tim.Bird@sony.com>, Stephan Mueller <smueller@chronox.de>,
 Shankari <beingcap11@gmail.com>, Rob Landley <rob@landley.net>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>
Subject:
 Re: boot markers ideas (was RE: [boot-time] jent_mod_init on beagleplay)
Date: Thu, 09 Jan 2025 17:23:04 +0100
Message-ID: <2161392.9o76ZdvQCi@fedora.fritz.box>
In-Reply-To: <211b015d-44e5-4e64-9e44-5968d86dfac4@landley.net>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box>
 <MW5PR13MB5632780514DC36D18EE9AC33FD112@MW5PR13MB5632.namprd13.prod.outlook.com>
 <211b015d-44e5-4e64-9e44-5968d86dfac4@landley.net>
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
X-SGantispam-id: fde8f76a3034241c2aced4f60dbcf6bf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-75c7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Rob,

On Wednesday, 8 January 2025 at 00:40:13 Rob Landley <rob@landley.net> wrote:
> Is there a place to get this measuring script other than fishing it out 
> of a webmail archive?
> 
> https://www.spinics.net/lists/linux-embedded/msg04363.html

No, at the moment the mailing list is the only place I posted it. I am still
unsure if it should live on its own somewhere or it's better to try to augment
the bootchart.py script that lives inside the kernel sources [1].

> The most recent wiki mention in the archive subject lines was 
> https://www.spinics.net/lists/linux-embedded/msg04336.html and trying to 
> find this effort in elinux.org's top right search bar found 
> https://elinux.org/Boot-up_Time_Reduction_Howto which "view history" 
> says was last touched in 2010...
> 
> Rob
> 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/power/pm-graph/bootgraph.py

Regards,

Francesco




