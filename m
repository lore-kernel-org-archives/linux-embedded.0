Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E02238D3E
	for <linux-embedded@vger.kernel.org>; Fri,  7 Feb 2025 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939603; cv=pass; b=RtCRURSnNeg+/X5yBtgllDtssIVu0fT3LCXKFr6qQNhTHOJrBd5L+y9TQNcXMNzvny31rnXjZii1riOZwdG75GQ/KGyWMYPXIrCcOGoMZwiHBxVvWxln00vWGXese0OYyq9B76lbrGtZJIW68qLygTOL8yJ+xTnDpwjbYLETjrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939603; c=relaxed/simple;
	bh=9tOO1N09pvh7o6mzjgUITmbG1RglmWJVJWV2Aq3bork=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lh4pPmhyKm14BBN9yXKW0aWTSNjweriFY0iHbo61S0vX5I07Z2WUlRVA1fuZY+xdmh/bdderjsrLUp72hoNsBFyzV9Te8MwumCd9z+17/43MtDb5AuXNNBL8Taonblmnvm9oH3eUP/dYi7JX1LYNDIvtL+9FIW4BVlmRMLPjTCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=U0qxPeKT; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="U0qxPeKT"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-kd4z.prod.antispam.mailspamprotection.com; s=arckey; t=1738939601;
	 b=ncSMZ+zJ2nNNNydrHDvz4CJlta0IWfS0Ol5AIM/X4cMrrXsIRB6iFB/0rLegVPx7OP5x08Ggr7
	  3HEolKdXblbhtwYfZXFtZ+jhbnlKqC4h4WNnKtvT0JE+cORJSF/zrob1NTZBLikX8yaNCfUerS
	  M6nQjyA5ulLDBKhSt5XRLhF0uQGSEFG/OtURHkpLw9nV7KGtMsJi4fMccxXT6DAxea8n4Ply8j
	  JKrSiULl/NUOcPwo2oSWIP3+KyL5X8D1UI+9B6QcDbhROphKwHB5xKAc5fiwNIjzef/izKOAPg
	  PArpuc0hpMd+oZKDsVs5adNqeQK6dNLT36lZ0B3svDaLzg==;
ARC-Authentication-Results: i=1; instance-europe-west4-kd4z.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-kd4z.prod.antispam.mailspamprotection.com; s=arckey; t=1738939601;
	bh=9tOO1N09pvh7o6mzjgUITmbG1RglmWJVJWV2Aq3bork=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=mbPNAcMPd1aX907eeIgcCepQt1g1p1GQvP+cRimXfPrXQCifTGosVfDKWv2y6CrtRpVeLjLDeu
	  /1Fs2spWIHb9ir2YOFDZdYLN8SNp4U9YwAX49pU58GifvyaI2Ip9g1ccjEhCzHeoDQYbeF6uWv
	  dTnOPFKLfUEFlTDdYEsXKpliYeNlNPJ6XLlPGv5lBDVKaGLxqSkX/83ow+fw/kj5rxTohFss0P
	  XZMXYINltfTJMGCvUxeaBJj1BK87D3QcmIZWzL7kS8toRyew7DnD8kbMtnc7OjCoclNjh6e28O
	  K9JaU8bty99i5svFcq1SvEYgRu+NsL6MKuS0T/B90u9yiA==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-kd4z.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tgIsk-00000000vrJ-3ldg
	for linux-embedded@vger.kernel.org;
	Fri, 07 Feb 2025 07:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=HthEv3z8obA6AyKJ7sli8wyc0KbAd6jqo4vsM7LVqAM=; b=U0qxPeKTurg5cOMyPt7OnVlkdU
	XG5HgNWvLqj1BwohHxu5tLgPmiigosl6wJl1IDTOc893slW3qHzM9pr2fc6LIkkAZ5EuHA8c9ia2Y
	eCs+34tvyZZuKJNmFzbUT9ajhRyO5zGFhKhokTtIvcW085IQJRCzt1Fw8ey3O+NBzACg=;
Received: from [87.11.41.26] (port=60513 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tgIsf-000000000D5-1cSE;
	Fri, 07 Feb 2025 07:34:29 +0000
From: Francesco Valla <francesco@valla.it>
To: Brian Masney <bmasney@redhat.com>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: [boot-time] [SCRIPT v4] analyze-initcall-debug.py
Date: Fri, 07 Feb 2025 08:34:28 +0100
Message-ID: <2289257.vFx2qVVIhK@fedora.fritz.box>
In-Reply-To: <Z6J3WpeJKIKENC81@x13s>
References: <4927911.OV4Wx5bFTl@fedora.fritz.box> <Z6J3WpeJKIKENC81@x13s>
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
X-SGantispam-id: 39fd37267876ae237b4484b728325264
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-kd4z.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Brian,

On Tuesday, 4 February 2025 at 21:23:54 Brian Masney <bmasney@redhat.com> wrote:
> On Tue, Jan 28, 2025 at 06:15:53PM +0100, Francesco Valla wrote:
> > Hello,
> > 
> > this is the fourth version of the analyze-initcall-debug.py script, which can
> > be used to analyze the kernel output when booting with initcall_debug
> > to extract some human-readable data from it.
> > 
> > This version brings a complete bootchart of the kernel-side portion of the
> > boot sequence, showing both the initcalls and the probes.
> 
> Hi Francesco,
> 
> This is a useful script and I have a few suggestions:
> 
> - Report on the probe deferrals, and group them by name. For example,
>   this is one of the probe deferrals on my Thinkpad x13s laptop
>   with a Qualcomm SoC:
> 
>     probe of 3210000.soundwire returned -517 after 3 usecs
> 
>   As a hack, I can group them together with this one liner:
> 
>     x13s:~$ grep 517 dmesg.txt  | grep returned | \
>               awk -F"probe of " '{print $2}' | awk '{print $1" "$5}' | sort \
>               awk '{a[$1]+=$2} END {for (i in a) print i, a[i]}' | sort
>     15000000.iommu 750
>     18200000.rsc:regulators-2 61
>     1c00000.pcie 13458
>     1c10000.pcie 18266
>     1c20000.pcie 250
>     3200000.rxmacro 51
>     3210000.soundwire 18
>     3220000.txmacro 105
>     ...
> 
>   and add the following to the end to get the overall time:
> 
>     | awk '{sum += $2} END {print sum}'
> 
>   493,730 usec in this example.
> 

This is certainly useful and will be added to the next version. It's
partially there for the HTML output, but can be added to the textual one
with virtually no effort.

>   Note I attached the dmesg for my system since it's a pretty extreme
>   example since we have pinctrl drivers set to modules instead of built
>   in on Fedora.
> 
>   I CCed Saravana since he mentioned at the boot SIG meeting last week
>   that this may not be an accurate way to measure probe deferrals. Take
>   a look at the output of 'grep 33c0000.pinctrl' against the
>   dmesg I attached, and see the timestamps are the range
>   2.190008 - 13.358063.
> 

As far as I understood, this is not accurate since also the "forced"
deferrals caused by devlink are accounted for. But that would be fine,
since it's time spent for the given driver nonetheless. I'll let Saravana
comment more, though. 

> - Run pylint against the code and fix up some of the warnings that are
>   reported.

Noted.

> 
> - Add commas to some of the output. For example, change:
> 
>     Top 10 initcall durations:
>      * apm_driver_init -> 804412us
>      * panel_edp_init -> 205809us
> 
>   to:
> 
>     Top 10 probe durations:
>      * gprsvc:service:2:1 -> 5288,273us
>      * 1c10000.pcie -> 1,091,920us
> 

Not a big fan of commas as separators, but I'll give it a thought.

> - Map the return values to their pretty name. For example, change:
> 
>     Failed initcalls/probes:
>      * kvm_arm_init -> ret = -19
>      * test_kstrtox_init -> ret = -22
> 
>   to:
> 
>      * kvm_arm_init -> ret = -ENODEV (-19)
>      * test_kstrtox_init -> ret = -EINVAL (-22)
> 

Will do for sure.

> Brian
> 

Thank you for the feedback!


Francesco


