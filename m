Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFF83976A3
	for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426414; cv=pass; b=Hp8ToLJl2wYNNrU0fIAJHwyKWwkAlvtPLY7SdBaJtIXY2mIaIhyxQ/15jhSlbR9nmKmYEhRfUn1qadTLZ38nICAQF4nLtgwUszYuRtJJrsOU966Skc7Bn4OsmXQezF6Ht1kxwfoVwaqVn4C5HxPCC1rzpvk2xo/iIry/APlcSBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426414; c=relaxed/simple;
	bh=4WhtM/YDf/JfP0Ry8hWGB0GN/2XbpN8LYYvoXewCOv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpa/Hd1QC1Tl26aoLVh8ZMXD7aw/4JVDv0u0vGyNQblR67o81/VRnOq0Sf0uqGK1OPVcgQrVWwOWXMqSzyHZ/zkW+JeyzzwdTvoWVB0q0z+PBXCibNiRzKbUwmip2xbnMUEUskB7ItpVyCngQDrysEqeCVS/k6Nmtpk9U74FCk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7PUnMIS; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7PUnMIS"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64eaf8aa893so449282d50.3
        for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 04:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776426412; cv=none;
        d=google.com; s=arc-20240605;
        b=dcEgtsRQYApq9wZqbkcP8MhiWmaLTFFaLgDxPYU20AldLAAfqpg8UhKV2NMXNMxTKI
         1YVGhKBVMrLfzKTbbQ7psDMANh6AZYdSFJiJHwOkwu7/eNoH8Qe8v9fG1HM1ciEonyCI
         5OQ3WALa9wcU8+xeucikIRCxRtmNsLtBly6fYv7XfLKm6oNZ/FsC8AAMgUDjMazq0qml
         dgg9zD0oC7DFSGXcXyZ699ubCvfkQ+0J1+uLaiBBMns+hhHaeRz8YpNILi7DdiDZSWLQ
         Zlj4fmQdeQ6JJo6p4c26SgdUfbUEqq4H+nAerBCmK4iofIBS5U2lO8REhakPUnn+oaQI
         OFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4WhtM/YDf/JfP0Ry8hWGB0GN/2XbpN8LYYvoXewCOv4=;
        fh=4SzvH8XZHvuCl4LJAraHj8a+13WM551gKxJGZrlVLw0=;
        b=Rhp8gMJEwDsQZcZeWwcntJlPuRTqD489qy+27iGHlVa0vCkXfmK2wgIeu2RfhgvxCI
         qErCq7CodHTTEi3P7H785bnk4IIe8eQIAyGphnIxfY8oW1ayEAJtphqqC8a5vvKllwGP
         dgCxRMdKU5OpGd2MVdMYJL7lf/XQ31RQ+nhrNj7PCef9SGuPQ9Ihq4C68r7UPcx7Rc2g
         qi6uCR/pwLcQsgcTCquSmR11FQbDSnKuIdv6PMcJNXyyXWTuOSUZQ3G0dON3NYH/xzI2
         OfFeLk5/3Te1woC8aHHt9zzZ+UsRlkBRZS8ruFRW3yRojVAfOS4LOth0HVI/8jv2AMaN
         kHcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426412; x=1777031212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4WhtM/YDf/JfP0Ry8hWGB0GN/2XbpN8LYYvoXewCOv4=;
        b=o7PUnMISSFO1nIH6f2Id8ztN1bZKw8jKj8IBA8jnkIK/wuznoMwo1HysWo9ZPmMgMh
         IuY8C3wV3mxajKDbQo0zcFzSRDa2GkPW9vpllGMn1kD4xq0i6LdtN9aYzE7prhES2jHH
         KQgGgGDJxsMS0wBINqtqyfIDTgDvtN0LvwGtOY1XKnpfVC7Mgs10U30PCs9glOxdcAN8
         F2+yru/w9CEK7vWUgPMg2ZPYBjxTsntQnbxQjbvvPVbrR+QetY5SPIei/TFPjquxkUnK
         49o3NmYloxWRdXqFA9+X2l0BknAdPB5UGj4cVXuebWAYEsMF2aY/gBQarjEi02rYvdte
         TKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426412; x=1777031212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WhtM/YDf/JfP0Ry8hWGB0GN/2XbpN8LYYvoXewCOv4=;
        b=Fmqb45althEXRGtJuc5QlfiFTukdft+/7vTPAh5+KyrSjICFif1UFUvQPhjI7FcDVY
         bum9QnJ620971ywzAwiu7wdN2pOJf3hKZAWAmm4OmJqTJQ2LhBKUb4lt2PgJIu9c8BX+
         fnL3+xPr/41D4lEhPo/iEL4TpDJQozxBgZhQP197jHgU3wPtrsdbzeo4McbCI8PSutOa
         TrwryPIlqTMqI0beww4VEIhI2nQehxXAIYgSdXAyOfjwvkW2rP9p2w1YSuum8vcB4WdT
         J6g4RKWvxCJLiDTZgXzZoMMVFXj5Q9KaNzs9aAOPEDDbkr2vQJ7inlpTWgnGw/hpvDlb
         23Hg==
X-Forwarded-Encrypted: i=1; AFNElJ9jsdxdFxIx5OhYryf5Frxt91cJme+Ls7hqRSESc8hLVCJjOP6fCZ8btzHSgF5rf33UtNpPQhu2NrEmlvPB6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjdlsoJ4QAbKO2dDTxLTRSYuV6tAT3RmVGe785N3+l4IxlAzi
	kiPg2ChqlxtOMtrzl6rrKnDgtshS9576tieCYdApMQCSPm7ztxcysQiHo0yYi2uVF4DXzA1kmOH
	E7dDETcBeH3Fwv8QuXpZV6FqGzET/uw==
X-Gm-Gg: AeBDietOTY1vJVe7oud4vYMXd7PjDUUundCeBnyZblAKGXJrAMDtqEXykPmiGV0C94U
	+vQi+YY4+Daykv6cUt7hh36zPIzynyQL6T1G462ICNMmvEyDN5wNLPsvqeuqXccVs+V+VCYL3q+
	dwDUA0cRrceM3TgLZctidOSvhBfCWPo6mYlLejFyxV8dfgilw/jQeBSap4nPAYa3SpzOnoXWrIP
	mLcEylX+HpxEGYGsCKcRzJoXFu8moUIC0CDrzhf9k2/VrTBlky1fESq8Ja9q9PKLMnPEvl6Fur9
	Lzb824tbPvFwA+yy6AMcozI2La4qki82YOR+mUngrFBJqkrCaCWIoMC9DvdOlP25OsiUzilS2Yp
	49juCQJyT4nySwW3ywSd6lQby7dcoPcU=
X-Received: by 2002:a05:690c:dc7:b0:7aa:451d:bf9f with SMTP id
 00721157ae682-7b9ece752ffmr23722397b3.5.1776426411697; Fri, 17 Apr 2026
 04:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <aeINb8-a83R3QDXd@pathway.suse.cz>
In-Reply-To: <aeINb8-a83R3QDXd@pathway.suse.cz>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Fri, 17 Apr 2026 13:46:12 +0200
X-Gm-Features: AQROBzDcmMLWxqp5Jka2rZA_GlQOqeFKTR06kruZ-km3bJKAd9g-omdc804gpDU
Message-ID: <CAJGKYO4aOqQ05=X+r8k7S-fnZiPUXZyroGOSG63kgzo1vbeRJg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Petr Mladek <pmladek@suse.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Tim Bird <tim.bird@sony.com>, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 12:41, Petr Mladek <pmladek@suse.com> wrote:
>
...
> IMHO, the main risk is that it won't be used just by the 50 developers
> but it will get misused and open some can of worms. I think that
> the risk might be acceptable but...
>
> What do you think, please?

There are two different topics here and confusion arises from not
separating them:

1. Having a monotonic timestamp fully reliable and ASAP after the
kernel takes the control, is a great feature. Period.

2. Few people but relevant ones, those need to port the kernel on
prototypes that later will be products (hopefully).

The #1 goes in the kernel, following strictly the rules of the coding
/ janitoring. Period.

The #2 cannot go into the kernel tree but it is inheterly doomed to be
an out-of-tree entry point for "few people". Simply because it servers
those for which they are working "before" the kernel (early times, not
just about boot but kernel porting). In such a condition, the kernel
might oops soon after the boot without even reaching the timekeeper
calibration. As per first look or last resort, printing cycles (or any
other values as much as possible tight with the hardware) is the only
feasible approach.

A link (to this m-list repository) avoid repetitions, the V6 is much
better and more useful that a bunch of #ifdef / #else in the printk.c:

V6 ~> https://lkml.org/lkml/2026/4/16/441

How to settle down the debate about #1 and #2. Recognising that the #1
is a kernel feature, the #2 is a "before" the kernel thus out-of-three
approach for few but relevant people. Why offer to these "few but
relevant people" an entry point with essential directives, a fenced
read of a register, available for many arch in the same local header?
It costs almost nothing in terms of maintainability and provides a
universal way to face the same-old-issue of having something useful
rather than zero in early boot.

It costs almost nothing because it is essential and it is not supposed
to grow or be refined: essential is essential. Moreover, we cannot
develop for boards that did not exist yet, but essentials remain
valid, at least as a concept. It is clearly something out-of-the-three
because #include "early-times.h" and it is clearly something that it
is for advanced debugging and hacking (proper menuconfig placement),
thus not a feature but "essential as service".

Value (in terms of market)? Just a matter of perception: we know you
are out there, few and messy down in some portings, here you are our
2cents for you. In less modern terms: welcoming, as custom courtesy.
Is it relevant to add? Everyone that can port the kernel can do it in
their own way. It is relevant to recognise that #2 is not #1, anyway
even when #1 will solve the issue for every product out there.

Best regards, R-
