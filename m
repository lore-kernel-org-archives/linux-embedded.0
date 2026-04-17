Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019283AF67C
	for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 19:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776454037; cv=pass; b=JlsxAhOThgSBoSUVBrQkzAGUgb1Do8/NLho9yEw2QMwXkL18feaiTOSTG/A+fm6cCz3kHPqa0toLQuU7Wc7ENWV4Nv6fxGqOM0hCri4hJggxeLS0U3YufCYvlh7eiA8Uswadc5AbMgHBZnXCMqfngdu+Z0Wkj78UpImaueJKZdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776454037; c=relaxed/simple;
	bh=LCpJBkUqo0TwR686BMgkfvhfrWSnXen35EhjsGpCm/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG7hIFvn3F97xw0ypwA92477jEhDWfVPgkazeYeYho2FpkiGWDUPudYbAvUGO37B87IVVa/0GJCPY3ohSe3t94fP/eClGvaToIDHSbQUSZPuY1xJ86oYpE+GQT1WqD+9IG4xJ1jYkaNT1QbyTcJ0BWzrFUWSB6K7DwoHnmclxSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTAodnFv; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTAodnFv"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7b81f5ab95fso11033587b3.2
        for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 12:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776454035; cv=none;
        d=google.com; s=arc-20240605;
        b=F+vZThyAp+9HHTbIqedvuR8iIqG7GDqVxT9ihR32apuHqzp1aDr+NEOyZHIXZROYB5
         b+f/O97yrOFGoAOhWBY1UyDogG0/Dn1/Nfg2FqXJDi0KzO+SO27HEJJRYX4nstoJ4qTz
         eU5R86jF/ZtqemKzu5uuOPtAhAu+t7QV4zOxFI9XPh7LlLwSBHYY6uiUIfPw9s+6wogh
         gsQs6IEll0dGpUy15xEdz8FYWsVn81db9tfDmvPMQfmwpGZuaiVKCU0NE8s3IBNDWvma
         B2HzUG2O7OoyBfXtNbhJacrdnp3HWt8KQUC+zu6DucNSJ69DCY8s9VXVsUYyNWEwQwqs
         Hk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pSDeJCWBBJo97R3Y6mpw82cVWG+KXXOzEC554xBxuC8=;
        fh=fNX/pwr3gAFPPUbCsC+wGMYpVRbwxC7BxntiXJ5XrCA=;
        b=jrjFQcX+A17n5Vq69S9vF6R0RTrTUerknAJnrIn+Ff1KgY0Xo3jttcthT1L3aZz+n6
         D9bR5Gef32KMPlqgUGKZFtbNhTqht5d3n79kqx+iRjNBeRihV2prQZq/kgn9xZLWQWG3
         zuViO/Kw3YrSNzmaHM4ALaM7On4m4QZ7gnuNADgfAizFJ1iAXzfGv7qS9c8KiNAhXS6l
         yl0s2xq2LB/IBLu6SFRmupOXnWIpOmMmOtFMqlOrWxvzzlewJXGtrhvJyWE/J2rBirTp
         xjwv/iyJNz7rsIz/T+Z2a7W5Mbl3ee4v92U/S48sOt87cp+MMSKV+DKfkw9eROQk2czO
         dv7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776454035; x=1777058835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pSDeJCWBBJo97R3Y6mpw82cVWG+KXXOzEC554xBxuC8=;
        b=GTAodnFvmPyIetk6BMOgHvml2XsGTxMnz7hyP0YWUQ44u6Kx26QjXceAsTChpUq74T
         q5LJmLo4vYkXVxsUyVBQXPU06c9XF/z43brp+Zt1ugOBrfV7nW7PGVdvdmtlWUauO8Vl
         N1d6rD7wtQJGEty7EqvNkKfCxkQ7flP/JGg09fdTU+VUWdaVni0MsH7QENyuAg/BtE5Q
         2leffQs1yt/1djpfAAE6i70jqa2YoRILGTZqMfCVzSShjeKhqO+wedQo4K+Pl8FAqjX/
         lIT3NwfnnOdgUUIqKFK/5W6kUVxEl8xz5XAPDNlb32VoPdU8PZbCh6frzRDQQ1OJQWhd
         pGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776454035; x=1777058835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSDeJCWBBJo97R3Y6mpw82cVWG+KXXOzEC554xBxuC8=;
        b=YEAMVrtPod04kfRnBKtb8nYWtn8xFTj7+5GcVKa4Ls2ZDsxP3RfpeamBhJ/JKdhdzz
         cvts6Jpogs7YJnxcKn6Lj21Fp4mNoU9oDDmr41fqiBb4rg9Bj99fMglqify+HPXBEbz5
         gdfJGr2iJ8ivbeno+l7HNrUC9OUNtLY2flULOE1YWTppEdQVsj+EmpBrRSVAyGPBSsuT
         Cdb/ROe5HA1a1NE8dI02fcdNUEr80RXJpQvHyVq6aWNBcpZ8qoHbX3scRgydhxoWEY7H
         vvXKw42uugLcz7x7+AsDVPe2nyhz3fFJgXY6LqjKqVosPm7HvuehgXDrEnoimaht+QbW
         ilOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MxtzkOcp4nVdYpgXIWT4leIdTdKeXZty0VkOE0alYwENHB7EvHM5qVWdbnjmEKcgq8BlXmZvOuWDWN212hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+NZm/8Ei38cZkxZ2LDitEZnOs3gGOoF/865I5mP0fD9QzTzd
	D9aB0kMIGHXBoERfo0yMhzWQrevZxz61ZKsdPm0crNXflcuC/vxjwl40HR1dgQgGscL6DfjpJRb
	8bu+H3uJ8jNPH1V0wbbNUcg71BqUUNQ==
X-Gm-Gg: AeBDietSUHDBISKnWDu28+T2mletyD93mdNzFdX2PNa87MH5L+Fnzsqx2D3AvdUUIDP
	H/14C8VwFGYlwBTbdUaC3/0sJgKJjOiFimFlbowfubyyu2lYJPWIzTIuaMjEZYRPw2/netQdhwU
	HQXtxOb+GqpO80HzFHYSn8aXodQieisUkbv7k7Pnwvvyz+kC9q9W9+9bUVwWmGYGs9sVEi8Im+K
	qAUjK4TCPKiVN91ZpLb5G9rbeDxfSID5IYLLANyzzRBcui0FvMWs3jC6g1wSJztgrsM+2MR8qwN
	7tZPsFvTLmzfXbG99DyWLVWlEaEkBhl4o+gpLai5CQEQFAKzaLd0l9sOKFIbaZJuaD0ORoObnbI
	i63mHWrLkKlPr6CDOyeg=
X-Received: by 2002:a05:690c:1d:b0:7b4:3d82:bf0 with SMTP id
 00721157ae682-7b9eceb3a6dmr42918317b3.11.1776454034901; Fri, 17 Apr 2026
 12:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <aeINb8-a83R3QDXd@pathway.suse.cz> <CAJGKYO4aOqQ05=X+r8k7S-fnZiPUXZyroGOSG63kgzo1vbeRJg@mail.gmail.com>
 <20260417121117.53fe104f@fedora>
In-Reply-To: <20260417121117.53fe104f@fedora>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Fri, 17 Apr 2026 21:26:35 +0200
X-Gm-Features: AQROBzAAdOrfx1JdCJ6Cy1_qJGm3U_lNCNeDGyWabB2U9YvFjeUDDKvTtEeUWkc
Message-ID: <CAJGKYO54LBdEWVYMQcNKLTLvA=PP3fQo6krSB+XkYtes+6vu+Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@kernel.org>, Tim Bird <tim.bird@sony.com>, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 18:11, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 17 Apr 2026 13:46:12 +0200
> "Roberto A. Foglietta" <roberto.foglietta@gmail.com> wrote:
>
> > V6 ~> https://lkml.org/lkml/2026/4/16/441
>
> Note, nobody uses lkml.org anymore as it is unreliable and slow. We've
> been using lore for years.
>
>   https://lore.kernel.org/all/CAJGKYO7==hZ3OnRNuG81j6rxH3y1gK8qB-orxxrDsc4pNFv=hQ@mail.gmail.com/
>
> -- Steve

... but the link is something as easy as a website, m-list code, date,
message id.
