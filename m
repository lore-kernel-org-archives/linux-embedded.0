Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E63378D78
	for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411368; cv=pass; b=eOn4e3QWWh2kJ/MrPgsqC380iq0OP1OKVb8alnirRFv005urE1EO8OqjPxiur11HzGHFhbCgr47/2tcHlpZ1+9lWTOi7scfi2auCfJrFa332jzLmUHbEURDmR8QQBFnv9WXT2EdoMwOTCKv2HOjQHL7MJAmY0LWZt4YEJ3jAVEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411368; c=relaxed/simple;
	bh=O7VO2bciKAcfUE+96dGRBZIQJGpO001vjFfQlmuzrzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucTwpFstblx2pD6FZcNPZRN8vazL0m5iZm54Vl/fIapJfsT1h0vUW+n2/ZHz443ZZgAhJoiY52jzHbwvtaNvQs3q1LYcCAKrxc9dmsu4xorGeG4fyHjal+FBrKxYupnv8zm9Jq4v+wP69Lhbo3+HA8nMaXfDzboX9Q7VoUrMD2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pK61+umW; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pK61+umW"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7991db3dc98so4160017b3.0
        for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 00:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776411366; cv=none;
        d=google.com; s=arc-20240605;
        b=OIelD3byNjHXa+hIIhzVsTkEjYuS4wztLx+mupM63rK3M+voesKYYagLs5OqBgrtuD
         87okVPBIpMYLl0y8/wz3/jBKYSttJlhSDvjNeW5z1E7cq8jca1tMonYUZUlNlHbG0S9e
         bhloaSIa/9blbskjUrecZrJ1opu9w+R7wyEzmGwKV3rEhUghajD9a3YAjgn/qPFRpceW
         xltLTJVt8NE9JkyAhg2wV+9wKKsPi4xEAKK53CSrg2HydmHcVzm9Tid2a5wo0PRTc9DM
         DiKfLovGb4GIFc6uK7g5EHA0Y4x0aUbjpSyXLJR6dOl9l6e1ttvAREMUDCbsFJp16LWQ
         5Vew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ujtjmnUpxafqHi8hWbdDGZdy2wa7AXERoDapsBO7uzc=;
        fh=yAQBiaFxGRHlKa+3H1xmq5yQo3N8z7Vxez6LHBqQEoA=;
        b=Zi70jf5NndiIogn4oRk7PxTWB9gL1qhJTyHAy0UJsl6X44aLo+TzDO0HBcqYDImvyM
         Vb8x6uhfzAOcNQkmw5LEbFhojW2X02vd0Au4T38I3ounQp3MBsUOdSXu/nE9NKwce1vC
         5Xv5YfnWdhHTmF2JfHvwqXX9H+Zt0S24IB3J+YrUvg9PN3Fwbo54mg2MYkqjYI+k2232
         kNfIwmQEAcwXMvfpeKsHxR4J4DzS6NUvU2gDr8tibWS/RJ+q5vePRUZyJNayTIPOy9N8
         ++JYuX69ZAxVYB9aFKM9hs7req0M0F/Y3pDrR2kqulIQGtQCwNX2w4apHdp3Y4wmuRy6
         fEnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776411366; x=1777016166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ujtjmnUpxafqHi8hWbdDGZdy2wa7AXERoDapsBO7uzc=;
        b=pK61+umWJbfcGOL8MDqhRuI8UbEdJyJBr5jS2C2wg/cLRtBzoNta39F+Y8Ccp5hJUD
         HgnzsP9WMsOoeybaf211RZi3fEhk2WXMy3PK3Pn5MOpHArkcqhgb1B7xMfrjvcA9Wun2
         4si63j2lLfcxDbFai93R7zuAIKbY5wdIcnn0hqu+XyF7kNjSk1jPTLQ5kFyz7VOUg0WW
         hVWXP9A+/oNr4+TJ+nDJGqEDzteEteimZGpT5KTs6mXCWcvpqeWwG+NLo7oMk8zIYGcQ
         6mxIE7nMX625XTAFfhaySvxmK0QGAFP55odKVrn/k3FsTrlP3Z3oQSNO0h5OgwdnX03U
         TZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411366; x=1777016166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujtjmnUpxafqHi8hWbdDGZdy2wa7AXERoDapsBO7uzc=;
        b=Cz7JNJ6MzIDtOyND6NSUDz/Y2Mq+YM0fsKP8azFUc6/ycBf0vO8QZJzaeSDr4m2EeA
         20PSi1i07G3apXY2jSAGJpVwdVZkSdLEyYdt/WDdVdvl9gjgUPHuPOI2AQz1kDUck0bt
         5WYCasBmPLv01RMoUMVZK217HZNkyzNwxqzjshekiN4iLKSqtSIpnVszOP8AwaXp83IA
         hJXo9bo5ObxUcY4bVCkLtSJg2NBs641o/IW+itS5sXyRSIa/rQrRgy7Ad7UOMiUS8icd
         VhXpeFfiLP75CsJ8/lHrPsWlD3MVphsDCyKG7oauCUcjJsGkn/1OGEyAKvAnq8Y5a4jn
         KRGw==
X-Forwarded-Encrypted: i=1; AFNElJ8RHmMREtBH8MX7u68vTaS8gAmcKA+RNkYw8tT9gxr5+gp+9pNaAo1gsazgkNog5YPzBARWyb6eE9rw6wTsLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEiW8s7bp7M34+9/bLaC79zCkmLVEjwuCHXnOYHah0lmgi482S
	d0NceK69f5wLjTzIec8nHz6t4KpRbPOf3aqFcdIHoK3Zv11sUGltywB8D/sb6uNOoELDZS5NQ0P
	H+yBAr5pzQn/ZLURZj2qyVc23Khe3GQ==
X-Gm-Gg: AeBDies8sSDv0NPif3ysdGvQ9/iZ2y9ESqkdUU/+q15vo62xUFkKxIVjsTtSXI/THBR
	lXKprtrbjpSa6XsmEBTWWvM5Fd60nd62JbeaWI4CcqNyTaxJ9yG20Zcc2xr8p2lWcaQSxDu7rBt
	5JIr/wOcOPb9FoKO+Yoy2ticvyH5w6KGcpbplEapT6JG7SOwvmCqd0ozx/EN7ozrpgezKeV+val
	rrtT8NaU+CidO5LdIJd1B4LE9JDwk+VQJvYFgLIy/yJterxmB1+CwGQXShA7mLxTzz10GP0NFnU
	lFf4TOm93JAtfxOLhLXpjvdtlhItoGQ+aiGxTUFbAw8aN0IuiM92QNtI4f9+57MOJTHnxdWeh+X
	CydvF43utdKD7pEqWoLcY
X-Received: by 2002:a05:690c:c83:b0:79a:b409:b623 with SMTP id
 00721157ae682-7b9ecefdb53mr16027457b3.18.1776411366572; Fri, 17 Apr 2026
 00:36:06 -0700 (PDT)
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
 <CAJGKYO7==hZ3OnRNuG81j6rxH3y1gK8qB-orxxrDsc4pNFv=hQ@mail.gmail.com>
 <CAMuHMdUW1CGpR3k8UCCGLdoEBgxpHz5=sgMGOB0E4FNmA94MiA@mail.gmail.com>
 <CAJGKYO6As=rYv2TfKVRkA_g5tiTt5ajSeG4NL8YHC1avq6dCaA@mail.gmail.com> <20260416115211.20d04a1f@pumpkin>
In-Reply-To: <20260416115211.20d04a1f@pumpkin>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Fri, 17 Apr 2026 09:35:28 +0200
X-Gm-Features: AQROBzALlHzaxQdg7IHUN-r_fYEobQhPkPKH6wleYBBrSxqd-1ijaJRPYRRxJbQ
Message-ID: <CAJGKYO5B_xYO5pr_8s_rMUC_h_E3STffcQm+94XASB8-wfHvhA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: David Laight <david.laight.linux@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "Bird, Tim" <Tim.Bird@sony.com>, 
	Thomas Gleixner <tglx@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Apr 2026 at 12:52, David Laight <david.laight.linux@gmail.com> wrote:
>

>
> Eh?

Kids were playing for a prize, I was in charge of assigning THAT
specific prize and I already assigned it in november 2023. They
continued to play because they were not informed about the assignment,
not even the one who one got it (or possibly he did not tell anyone).
Kids have been misdirected for political goals using the Facebook
platform. We are NOT kids, we do not play to win a prize. We do stuff
because we are aware of what we are doing and when we do work, we
expect to be paid (or paid to sell, and we are also great in sales and
marketing if we want to).

We are seniors. Not granny, not kid. Senior. Is it clear the difference?

Technical stuff is signed with R- because humility, statements like
this are signed with the full name, because a man in flesh and blood
wrote it, not a geek not an AI, a senior wrote it and there is anymore
doubt that I am a senior like many others, also here.

A senior,
-- 
Roberto A. Foglietta
+49.176.274.75.661
+39.349.33.30.697
