Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4925028C
	for <linux-embedded@vger.kernel.org>; Thu,  5 Dec 2024 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733437188; cv=pass; b=qMx1qeVEaNF94rI1YjwK9FSCmG4EoqD/lxCpksjGfytT8Bm+OD6I9FUM1NYtEb7AnkrHsjzhoeMY/q63kI+RiQyjrcuamqj/7+5uJQTg/lOGWw/3tu2FJvoU605tjyyPcykLILWM8ynNBBXwSegdh3wIy8AHwsX4hpa+VRkaWuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733437188; c=relaxed/simple;
	bh=3DPTTRpzy88aKIeE9S3E/WAIZSVyQj+RFmXBoqgwvNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FLlWiKSIeHZMDFH2Zg+THnBfmfZNiS5VVPj3wQ2Tz/5Dh4uHXamHbYH7UK8/y7FyX56evp2jisWffg/W2/rc4mluACBsma8KUgRhOuZIqMvbEIUO7wRxs5QFd8XbRZ8994zu6k4Ct6lE72tvj87GrqAbKGdnGJe6bBhflxRB/vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=Eq0h39W3; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="Eq0h39W3"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-j25l.prod.antispam.mailspamprotection.com; s=arckey; t=1733437185;
	 b=mU5QoAEdZ7oqbVaiZcq8/wH+owQe35BClbppYFrlRt3htkoKjuIKExdYMkulOVsFXmqyhV1al0
	  gv1Z+YSy5dkNMwOVIbjzkiy6/tfkNflHNIbdmPNrSBO22p+0jgg9sDFyU8ZSPJaQFlT+8wj31o
	  /De/f969TGbVhoL4Hl3W/Ggng/fShxmczeqSfOSqycxzEHcWpbki+MDiFKxnonvejZtNSwM7pR
	  EjpQqiOZMBUdKuI98JU/pqKspsEjk1ckR7jkN51y2F+zUxk0ITLhPas9UI2zWGW/vZ/abZ7TFD
	  UQqibG4FYpa2Mtyza2nXWeObS09v3v33PxxUNhN8UbOfYw==;
ARC-Authentication-Results: i=1; instance-europe-west4-j25l.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-j25l.prod.antispam.mailspamprotection.com; s=arckey; t=1733437185;
	bh=3DPTTRpzy88aKIeE9S3E/WAIZSVyQj+RFmXBoqgwvNo=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=GdZtk7Q6dz8vNJUekBqTWcCkqmllc/FUI9jXZT7tWyXiU7vS/G2Um969eYKp2Oq5e3DdWdGmu3
	  ujPYd1QWnS8T9JxGiW0R4gLIrV+YrsSCgM0sCUeXMifvjVNVV4cgcZJSaPfwHvtp+TFxu4/G19
	  D4FN5ErnppANKlEOWk1yS6/maMRJ/ZfCSPV3g7agS2+nXsxg6zHWkZKnff+YItYw5DL//Ryvmo
	  gaMzn/+2PQeMh6FcuOnugIFqWGPE3rrcbmDdabau/4M9vg/eNoc2iXabdt1PwcBvC+2R4JADlF
	  r7rj2DdXeKOo5xMMtptqPF61WD4AWML2/XTT3o4sdITscQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-j25l.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tJJWl-00000008qZQ-2ien
	for linux-embedded@vger.kernel.org;
	Thu, 05 Dec 2024 21:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=he3neSg5w3OexyxdzotAgKdqCsyg0UoRKPrRtYqWwWA=; b=Eq0h39W3QaV9LMgQDl5wtXMQXl
	2NoYsFR1Xx7CwWc4VH3cs91dxkk+tgoUmODph9UjAqKXfpODK7znbbVl6TW4YDZKI0ZIFDKZSHYb2
	aZY2lB62yzyZE4dPKZMGQHA68KLmDN52XtB2SiexJvD5GG/PxBkjVtQus3BTgJV7KB0U=;
Received: from [79.27.39.59] (port=65039 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tJJWf-000000005rI-2BiG;
	Thu, 05 Dec 2024 21:36:45 +0000
From: Francesco Valla <francesco@valla.it>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Subject:
 Re: [boot-time] [RFC] analyze-initcall-debug.py - a tool to analyze the
 initcall debug output
Date: Thu, 05 Dec 2024 22:36:42 +0100
Message-ID: <26676974.1r3eYUQgxm@fedora.fritz.box>
In-Reply-To:
 <CAMuHMdUsLwvnZJ9i531coBkZpDzD_GuhODpHfqayrPAXT6PfOQ@mail.gmail.com>
References:
 <1964175.7Z3S40VBb9@fedora.fritz.box> <2281836.vFx2qVVIhK@fedora>
 <CAMuHMdUsLwvnZJ9i531coBkZpDzD_GuhODpHfqayrPAXT6PfOQ@mail.gmail.com>
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
X-SGantispam-id: 1f3b2651bc8a88d98548c0dd4ef8d831
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-j25l.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Geert,

On Thursday, 5 December 2024 at 15:58:09 Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> Hi Francesco,
>=20
> On Thu, Dec 5, 2024 at 3:47=E2=80=AFPM Francesco Valla <francesco@valla.i=
t> wrote:
> > On Tuesday, 3 December 2024 at 21:33:06 Bird, Tim <Tim.Bird@sony.com> w=
rote:
> > > > From: Francesco Valla <francesco@valla.it>
> > > > Top 10 init/probes durations:
> > > >  * 30200000.dss -> 523002us
> > >
> > > This call, and a lot of the others are missing function names.  Did y=
ou compile the kernel with
> > > CONFIG_KALLSYMS=3Dy?
> > >
> > > If that's the case, is there a way to use the System.map file for the=
 kernel (used on
> > > the machine where the dmesg was obtained from) to map these addresses
> > > to their respective  function names?
> >
> > These are not in fact addresses, but rather device names. In my underst=
anding, they are printed
> > when a probe happens outside of the initialization function for their d=
river. I still don't have an idea
> > on how to match probes with their original initcall, in order to presen=
t the user the complete picture.
>=20
> 30200000.dss corresponds to dss@30200000 in the DTS.
>=20

This is a simple example, but what about e.g. an I2C device (say 2-004c)? S=
ome heuristic
would be needed to search for the correct I2C bus and then the 0x4c device;=
 once found,
the compatible would then need to be searched through the entire kernel sou=
rces / git repo
to match it to the correct driver.

At that point, the tool would probably be too complex to be maintainable, w=
hile the added
value very little IMO (in my experience, boot time optimization is done by =
experienced
developers, which can match a probe with its driver quite easily, even if m=
anually).


Thank you!


Regards,

=46rancesco


