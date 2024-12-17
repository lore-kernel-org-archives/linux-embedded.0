Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB21E8823
	for <linux-embedded@vger.kernel.org>; Tue, 17 Dec 2024 13:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734441954; cv=pass; b=hL+5Rh5D5xYngXuY7iYE7OlEJQ9v31GpsEMyNAzF+3oqVzjOLEc9f/9xfHAYhqCYIt1QcAU5Aq6xcSit+5CLEVlVL0tJEriSjQ4Z061C5CPRc1pJZ05NER9eHDiw1N4+BnqeZ0GkAudCnLeWV6CLz5nmjIA61StEYmUbIDN4xmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734441954; c=relaxed/simple;
	bh=VTZLsKTUtDZ5CAAjxLUJwAd28kxqGb1By3zTi7pJc2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TX4qbRzBkrKumhXhysH3aaaO/6GN3PiUyaj+43mOAI9W/jJQRImel6aLuL6LdwCU+NvqJuZf47bY8K5y7lK/A4d0appE40EzwR7QjMU+AkxLBbqcWD8/f9TsvCW76yF0iDyV+gkat6gKczweyBSPUfOr9QSHlp3pLJkHpwILdb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=gbzt4v3N; arc=pass smtp.client-ip=185.56.87.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="gbzt4v3N"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-vv44.prod.antispam.mailspamprotection.com; s=arckey; t=1734441951;
	 b=bfaIcMin2YjbTx1SIT2lgmB+7NUEHHqoXVSNvFe/N4UT10245+gJ1xW9qT8PiUACVmE3uJAviw
	  nHufsSeM3MkI6Ub5VFi2iPe154LQ0Vhwu061iCc8TgGXehKiDtY8QNcodx6C7f5g9rGkPaan6X
	  mQh7MWWqWCz4NTCMlj0+hdqq9udfQXsROGQa2K5kKafpCjBDf6xnfOBzOBneY70NFJrjrVJyZV
	  Na/wE+L3C+IyXojQopn9XZTD7gBLJBXNYRZzzdUB7DZ/w0EHFD+gmP72teLTgu/efLHXg3WP88
	  9PluYOuXTnT4Oi/pl3BUz9lGtGs62pGqcggnJrAkhyVg4Q==;
ARC-Authentication-Results: i=1; instance-europe-west4-vv44.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-vv44.prod.antispam.mailspamprotection.com; s=arckey; t=1734441951;
	bh=VTZLsKTUtDZ5CAAjxLUJwAd28kxqGb1By3zTi7pJc2Q=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=mKnMtbTt6zLyLDAO+GYgUI5gfiH3InEbOtsQksG6EjQ07iivZUbhivH1A1S6OSyhxRcDHqfCB8
	  iq0T2mml0QLrTHmOAVY5wmeBPUn67H6G4RjYfvFzULyQAF4JIkusRLlN9Z+ONLIf58vldN5V4z
	  vgF48qGHBo+JDQ7BYV3bZ7xLTsrWH8o0FfYfEJDFCqMZoLTgUsmZVRFn3H9bkwyx3k5qLwyfXx
	  qqlogdLsaT/CrlvU5aw8xAeW3fs2UzKESnmnF6t6XxgDJHFNCd7J4ND+L5e+5LNKWnwniOAApk
	  6j5M4Tg7Nbl1M2WQFRDvPDoCukO6+Nbq5tpu4nfYjhtHsA==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-vv44.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tNWzJ-0000000858y-2Fqu
	for linux-embedded@vger.kernel.org;
	Tue, 17 Dec 2024 12:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=JPXxppHeTInMu4L900AkzOi1cW41UghTVldPH2YgVJQ=; b=gbzt4v3N6lAX1d2nqVjYtADZVd
	aDt2HLTxrEbAzjNZGuoYQTwpEkqw11C4KyTUnHIPp2XZVdLoyWfDOl1OYhPyHU5MJZGRSaksqFT5+
	TLGrRfI4mrIhyUsS/6CuTXuA1LQxIv7Xk9rOrb7HYaNNt1psPFH8ZlJlEnBhYIZcyLIM=;
Received: from [176.200.129.89] (port=24628 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tNWzC-00000000Jbm-4BVf;
	Tue, 17 Dec 2024 12:47:39 +0000
From: Francesco Valla <francesco@valla.it>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Cc: "khasim@ti.com" <khasim@ti.com>
Subject: Re: Dec 17 - Next Boot-Time SIG meeting
Date: Tue, 17 Dec 2024 13:47:36 +0100
Message-ID: <3597559.dWV9SEqChM@fedora>
In-Reply-To:
 <MW5PR13MB56326570980A91F6A77472EDFD042@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB56326570980A91F6A77472EDFD042@MW5PR13MB5632.namprd13.prod.outlook.com>
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
X-SGantispam-id: f22d86ebbf088c97e2aff195424b8182
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-vv44.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi,

On Tuesday, 17 December 2024 at 05:48:31 Bird, Tim <Tim.Bird@sony.com> wrote:
> Hey Linux Boot-Time SIG interested parties,
> 
> Here is the information for the next Linux Boot-Time SIG conference call.

while very honored to be on the agenda, I unfortunately won't be able to
participate to the meeting today due to end-of-year activities at my workplace
that cannot be  postponed.

I hope I'll have more time the next year to contribute to the SIG, for which I
confirm my interest. I already booked the slot for Jan 28th

I wish you all a joyful Christmas.

Regards,

Francesco



