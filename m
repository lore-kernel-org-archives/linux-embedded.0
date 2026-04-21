Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6C4414
	for <linux-embedded@vger.kernel.org>; Tue, 21 Apr 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765147; cv=pass; b=HDqBCgWzifJwGEuTuXA/VFn2UM/6AA4AvvxJeFfvq+Rbfx61LiDC0wsPk1ReiJggAX9dFeCyKkQMpgfSlNeM/4Ute8aTrUZnXMHVMLmV3PlHt67v/KRym8ZP7IkQG1tqqaawxv2BBwbug6Oc8oJw9QFqJ5Zs/gq9ISe+mfcOBaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765147; c=relaxed/simple;
	bh=8E+p23Ocf2AuOfLZvvRc1EkGv98AgRWvHr/v5qwosYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npUwyAi3oLqfDlzjQbo7GFumpaJ6iAAjnT+tRpiPZsl6PvkR/Z+htOYPZ7rec6283zbkWqwFA+fD+fFsaZ8FaGCc5EyXNZPfn6Eo60TRpaIqQ4CctyapROEr6ZhpyvPCg9wdPfS+Vya43snyEt1N24CqOXpRNqZVD3TFktSmTmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7ZnSri2; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7ZnSri2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba67b332bbaso343898866b.0
        for <linux-embedded@vger.kernel.org>; Tue, 21 Apr 2026 02:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776765145; cv=none;
        d=google.com; s=arc-20240605;
        b=JzzDLZ4dGZT9w7jzuqKLDVUbJ5gU+J4lzMbDED0miIO5I9AY0zfS80BGbjLw13cEng
         tXX+eHy0P9zui4mJGhjvwoUK+1vAjyY087GZ83KxFc9cyuJYrFZnnIaNgwLFGCMDJXfB
         MSThLB/b6cukg9zTuFalz4+GO0QUISUskdwTsp8CIehBnMZywwJLXB9x+NX8QF3OuYMO
         GVliy34/HCW0Qtq6IdcGa4Jgo0xHVZTAjLE2Kp3PO7TFuv64TSbLxSLvQtOzzi4oKokT
         grgYbvNiN/u43s7KzugH+hHyDVfxZVq+kfXYh0uLNhgQSTm6FcZo9BYCDZvQKLjwTexF
         P1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QeyZIzkxmeqNwkJ2OZb+yhcmcZSRPDVw11x8hhIqh+Q=;
        fh=8Yu3t2AJTKZojwOqut2JQLjhgV/OcYoKWyC3kG3E1Ao=;
        b=PFQ6i88w271tqB5hUWoxf39VS55IP1tNiS3rSeMLS3ASsr65yyrUDj3Yqr1SrvsVNV
         DDjynNMnEgAkpW4H5DSC4mCyiO7lKLxwTHsLFICCIKJzWMNbNKZyQlOjmJ/ieoRBHW6T
         S4Wdvcrcm2UF7HvF2JIxhKREIRMG0T1iYHiyPh5FRM91Xd4x/ioUu5MmAKBZl2pjxvEc
         rRRkjfLcgaiO29y8FN9oFTCicTKcauVzF7dtEqo8gVS66LM8GSTHuri3fcwAzTWKRLcK
         HW8LfdX6Kht7RSd6u4po5ynxfp7Ws3wSWllSBGv69QqZBJCot9Z42aZwcXPC5AeL+9aX
         iBEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776765145; x=1777369945; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QeyZIzkxmeqNwkJ2OZb+yhcmcZSRPDVw11x8hhIqh+Q=;
        b=j7ZnSri2Zg3DC0v2qNKb3oJJdxjPDjO7MafK9XL34A1gUrTprPij8BGnVkRIgYIdEi
         AK2DboKDUB90/twjirXrftFVy9Hb7M5qOHVfsz3GdE8OI5sYR79WJWdXtHM8uVfrMemN
         4Sl5r6eSQY6svSXr78DCV44R1jriOPvxs36iM0U05/RjwjSQLgyTkDuC4jXlkLnvC3X4
         qvpobVozMrmJG2W28BZVzbUv1W6HnBGx2CdObr5SVALggV+IM4447u8a9aovwjuV3Nkv
         +K3Rh/6bFe1crl5oogRDay5CQ+Nk+bgcbwKdWGh/CzlzyR59ZhmLPl8sip/eLahBw4N6
         PVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765145; x=1777369945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeyZIzkxmeqNwkJ2OZb+yhcmcZSRPDVw11x8hhIqh+Q=;
        b=ILAvT8g1l6xXjuCnBQgGGkk+cvShauwIwYZLxcPmSwwfb+WtjyXseAmVllcMG6bpPS
         cGBweq/MBBI+6PtP5AAOeXVcwM07hqwZgP0Sc6yfjZ3mJ1RZaS9rwB6GHh9BXVe+3v0l
         eu5B+suk9gAzLcK0/BnoNm8k0F8T2I8SqUZa+YqVWpksqVe2ZR+PTM3X9gwTriFDwtco
         mc6eP0ykfpnKbg0vonvixpNvwD1vJENCZk4Eq39cW2tjdy92OWVIp7qVcVnRT8L74FqE
         yv2/16Ki/tF40v+6sQL/6KShJuYsjtiIc5gzOOphQcN1QPCW0zC6GepgjO+7peObX7Zx
         +XtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ko8AI2Kj7CJLmtcQsQR8M6UYobQgLG6FF1/dfbp0FapJmCHeICotbge0Zz/aa0PYJbFbCmo3ZE7NiEaZz5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3DQ/n5zA6dNcZgHiL9n/opIjjUzPhlg2lLBPGv3UEqcq4iQAX
	+SKZl3yw9NYeV+3T2jYAXQa1nX6yzUTsljDMb6cYelrtEYjeV7Z6fUW69T8cFh+hMLUW6Eag1SS
	eREU1dZyTVoRRnRlINSvoY89YgKjz8A==
X-Gm-Gg: AeBDievZBCBDW25EB8g2A55UC0+kjVa7KaPIKTD8BSDU60JqjVrAXP4IQo5+YVUbMGN
	CXf77VDw8j6px5SwvtI9Zbzn7mqVkJ6aP6/10gKv+3z2Fen0LWAF7o3Roo6/3R8FJfl9SBKtVVj
	JK4gUA1lU4yIHz0PFV+Selmd8eB8FsUCiSQ+jcek33dbT94Zlf5AmIbZizT1XC0+W9LNZNbcqqN
	pbbGGyUh0uOVHvdloxK+0eCBcexe7ljfQ8wBx75E3xc1Cp5HLj6S9g7qBIUwAcqYTY7X85FNzt3
	/3u1I69k9wKICjitSBKB0/f8rdA2CRKgKZH99h4sK72/OzBKLUCqUiy9r9SMYdud12LpbR5KsQt
	AvQYKmL6/Np2b9SVm4A==
X-Received: by 2002:a17:907:da7:b0:ba7:62f:9fa4 with SMTP id
 a640c23a62f3a-ba7062fa21cmr423379666b.6.1776765144308; Tue, 21 Apr 2026
 02:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <aeINb8-a83R3QDXd@pathway.suse.cz> <MW5PR13MB5632F6F08DB75F7CCBC2AFA1FD2F2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <aec2a2RPO9rYQa0D@pathway.suse.cz>
In-Reply-To: <aec2a2RPO9rYQa0D@pathway.suse.cz>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Tue, 21 Apr 2026 11:51:44 +0200
X-Gm-Features: AQROBzDXO4LRZEmA3R_7tRvpltG3Vlxw9DrjeHVfcmC6CId--z8YcfC6uMcHiMU
Message-ID: <CAJGKYO6c1g0WCeQmZmbKkVgDgnSyOF4oCw5JUuxAdoCdH8nHtg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Petr Mladek <pmladek@suse.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, Thomas Gleixner <tglx@kernel.org>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"geert@linux-m68k.org" <geert@linux-m68k.org>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 10:36, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-04-20 22:18:29, Bird, Tim wrote:
> > > From: Petr Mladek <pmladek@suse.com>
> > >    2. The early timestamps provided by the bogo cycles
> > >       are not synchronized with timestamps from
> > >       the proper time keeping.
> > >
> > >       Would it help to print a disclaimer, similar to,
> > >       for example, trace_printk() first use?

Every timestamp before the timekeeper init is arbitrary wrong or
unreliable, or it is a hardware value from a registry. As simple as
that.

> > >       Something like:
> > >
> > > [    0.002912] **********************************************************
> > > [    0.002917] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> > > [    0.002921] **
> > > [    0.002935] ** Using BOGO early timestamps
> > > [    0.002939] **
> > > [    0.002943] ** They are not properly calibrated and might use a source
> > > [    0.002949] ** with an unstable frequency.
> > > [    0.002953] **
> > > [    0.002957] ** They are not comparable with timestamps after
> > > [    0.002961] ** the timekeeping is initialized.
> > > [    0.002966] **
> > > [    0.002968] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> > > [    0.002971] *******************************************************
> >

Considering that it is supposed to be a debug feature, a large banner
like timesquare end of WW2 seems the most appropriate way to "not
interfere with the process under debug". Can we also have a playable
ASCII doom version of it?

Use a negative number to indicate something that precedes the time. A
negative number where a timestamp is expected should puzzle every
reasonable mind, plus this feature is for debugging and it is not
supposed to be seen in production. Or even simpler printing a registry
value and let the "expert senior" that activated that hacking dealing
with it. The kernel has no time to print? Then, don't mimic time.

Hence patch V6

Best regards, R-
