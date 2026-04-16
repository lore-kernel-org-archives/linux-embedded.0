Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DA739C006
	for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332372; cv=pass; b=aM57y7sNEXq7oGRdeLZiMCCp8R51NYWYELB2H+6zmoucawRKxM48VvDqBAA5OWCdJ2G/pN4udGgrY+v9RfWQ8Hvck8ryeEFKJb42Ndf8wLFmxFL06ioXYi2DuMQKVtcpFR2XvEb94LlJsyuvAs0FjY2+BKQxbkm1A4H/wEgYAko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332372; c=relaxed/simple;
	bh=oI6kRYjBL18yMMLzf6bNvOxgogHV221M0cOdhLtMbww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVtzpwTav6ZwMZ6PflywtWucwfkNZ+HK6xeiZ8By/AgHAr9V8yF7zFcqcBWgqR2clrwciIKwgO7JDbiEtz/oyDNtz5pUiodsg7xQOI/CVLqkNKduchftaPjn6K0yphuRZMde4Hfn977r+tdPbpIlOCZ+LTKcgylwBt6VzWHPAHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWy2q14n; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWy2q14n"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7986e538decso83812987b3.1
        for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 02:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776332370; cv=none;
        d=google.com; s=arc-20240605;
        b=Ztlv1pb/uYkVcLTbGQYLu33tTrn3OeBX0RrPKRPlKRzTucylIvaBkDKHgePfyVBuWU
         wSMNnosL2TdW9l5HevqzE9kHqSHar7NXiH8o2nQjFtjyKHDbKH2s6bKsCXlsgTi9BZpl
         e9ZWPY40rnveSM7syp1HkJQ3Vm5rHBp8HxFUaa83RZSED0giJ/hNRLlasZNGP+xjkxXL
         F7IAk/y2MyEiLvmCptALBCPtoRTApwRFkCMYrVAOaxRvXte5qSDDHfH0bFhm2X6qsrda
         kwPmL8W1F6SvN2UcngJy80fd7gZ8usKFFKmhJwejMpPTu8fwhhCU9FBASan5FAVP8gu1
         xE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oI6kRYjBL18yMMLzf6bNvOxgogHV221M0cOdhLtMbww=;
        fh=l6DuppS115mM/pmPvM6oXdRAF0TuQ0UmiVBZxc1foS0=;
        b=IgbYzkONcIXNVB4UmGnrH44lNhM3INhF1+QRTfR70Q4zcqheFB9x7r3YQesSh3VTZR
         n5YNwONjRV2lOnw2fT3A9LC01CDTRrtLFnBnnfQROHiTsNFdFcy5NCutmRWPe220TFOc
         2mnNOioH+8bha27Wdxz9kB7haL3ryGw/60JrVPgyn9zi/iDv5s0ezycktI5bzmEC7SQW
         UsEBztf3kSwgZ8MVgnzFtr1YmM5dg0n4q/8lgF+jtVhtq1MjfVlPrXNzhFKeT0mVAIal
         Ze81Apcpz9/B3NlIKNvYE5o6F16UL6wYU+xKARamjxNBkHbDqbeWC9hF1yaPTF0w5pHx
         dlmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776332370; x=1776937170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oI6kRYjBL18yMMLzf6bNvOxgogHV221M0cOdhLtMbww=;
        b=KWy2q14nKTlEY4x9vc1ZQmwtFEylax8CEfprh0N4txbVuQ5ppBMWKacju/ZQfHErJJ
         CfFSjwCSilpAlOUAPpNlVgLuQ8zsP6KdiYaIkAmVIcUL8H6iwD1v9kzhq1T9pPiJ1z9o
         wVRgAf0GxLHgkgDyLgrMKHHOpfwWXcqaEMmVp0DSgzCt13fOGd72nAE5XqsUjjC4c80W
         YIVhQVMvJ+sZXA5YI0dBFB6p9uCmncGSCv7+AjmtHnL8RkbIVG3LSHCZw1xzn2TVBj69
         pxRIMoKTLYDsATtCbiLuAFiHnciWoRZiRKofPU/F/LEQVIbNK+wntYgWm+Ae9qV/AACv
         MdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776332370; x=1776937170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI6kRYjBL18yMMLzf6bNvOxgogHV221M0cOdhLtMbww=;
        b=bUuP1X6EYlnPw0i5H62VgZ7IHpXomFJ19UH6VaoGUe+z1BbtsF94pYWuFYiQCcaMxp
         /E9HZh22yOrrVD1PDmPOJcEF2tHihrMRh3CbtUGake71GFi7epmqu0i/pRaJfP+Q+SUz
         nKUphpH4FIBED79ORTVv5IlSNNKSrBzryjCKBYmxzkpfjxFYenCe+pRyk4mvRlVFVSkj
         Mu9l0F4qOLoknF45T7pdvUjpkmyzRICKecwPg7Ss/qbgVKc1ZVLOm9zi1p7iZKdg5Gwv
         evyBwwIPGul9xT8LsOIR5QSqDryv+bRny/52YS8K9R7pPC4wwUMkFipvOuyxDDUnDZrB
         bjAg==
X-Forwarded-Encrypted: i=1; AFNElJ8wG+g/Ti90oRc+Z/DlARbn2enM2dCL7piGr3eqx5nr/ejk3ASxxnt9/v3UBet+miVrHvCIjhSksZC/EIlH7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDyJuIP9spN/pk0yaJiNo92v+gnn5aalP4P/5u35bDAf/jrhkI
	v8umbLSWOIPX+xV+uOB3f0m/v6Rs2zickX2TIsIJssPazTg502T1aqcI3LBCjaHSUJN+Xvi0vl3
	dgEEH7ACBexc3Sx9fLbG20K039IylcA==
X-Gm-Gg: AeBDiesJ+rGS/w1J5Wy4i2TpYDMwqkVH+ti7nhv7OH3nnmiKVWSJUGlovuRPZEbtFT/
	n3kDDkCw9bvAezpeJkK9Z4isdjZViajJtG3rqTAbQmq3fQQJ3UX0aP2z35jxvTF1LysAQ71fqp+
	KW5HFCFFEH2EuqcJxWI2pT93UpnfLRzaCIKItzoFXcl0VcjaEQwhfuyov0VBPujLXKw2xjLtS8O
	8jx2QCA603iJ6tdiW+VI/6BUeM2vVLZiYDH68SNMZVyWQ7ROswUDxf2bOXbJKZ14Z9FM/l7LeZ/
	vQT/Xmip+4lInkVqLEBpUGSpc3IL2/op5C/jX5HvaYvFqvT41T0Fb9KNNaVhKs9i6Vt5ggf9g8z
	VT9DEni8Epg==
X-Received: by 2002:a05:690c:c4f3:b0:799:3a3:2f25 with SMTP id
 00721157ae682-7af71b5097dmr275802317b3.38.1776332370000; Thu, 16 Apr 2026
 02:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <87bjfjap37.ffs@tglx> <CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
 <CAJGKYO4PatnJLPVuwp730hEEqsMCEAravO-cS6xyenMNJEsXtQ@mail.gmail.com>
 <MW5PR13MB563296D757735B5B84336781FD222@MW5PR13MB5632.namprd13.prod.outlook.com>
 <CAJGKYO5TotaDTPYP5Ddoy9cgi2L8emFrNxdxyJNZ_UZm=jfWLA@mail.gmail.com>
 <CAJGKYO7==hZ3OnRNuG81j6rxH3y1gK8qB-orxxrDsc4pNFv=hQ@mail.gmail.com> <CAMuHMdUW1CGpR3k8UCCGLdoEBgxpHz5=sgMGOB0E4FNmA94MiA@mail.gmail.com>
In-Reply-To: <CAMuHMdUW1CGpR3k8UCCGLdoEBgxpHz5=sgMGOB0E4FNmA94MiA@mail.gmail.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Thu, 16 Apr 2026 11:38:53 +0200
X-Gm-Features: AQROBzBTYKIA9OrTTKCwGwcVInoK23tOw4PsFONN_QY1ND9uLNCwoM4u5tKAbVc
Message-ID: <CAJGKYO6As=rYv2TfKVRkA_g5tiTt5ajSeG4NL8YHC1avq6dCaA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, Thomas Gleixner <tglx@kernel.org>, 
	"pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <david.laight.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Apr 2026 at 10:44, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Roberto,
>
> On Thu, 16 Apr 2026 at 10:25, Roberto A. Foglietta
> <roberto.foglietta@gmail.com> wrote:
> > In attachment the V6 of the patch, and these are the changes since Tim
> > proposed it:
>
> Please no attachments, as it makes it much harder to read the patch,
> and comment on it:

Thanks for having considered the patch.

>
> https://elixir.bootlin.com/linux/v7.0/source/Documentation/process/submitting-patches.rst#L278
>

Is this a link? ;-)

--> No MIME, no links, no compression, no attachments. Just plain text

You guys need a plugin for TUI e-mail readers/git-am that solves the
text/base64 attachments issue.

Seriously, someone should write it and write it in a manner that
kernel guys are happy to adopt/use it.

It will be a great relief for both the sides (senders, receivers)
because space/tab mismatch hurts as well.

While git-send requires some hard-to-grant precautions to not become a
serious trouble / headache.

Best regards, R-
