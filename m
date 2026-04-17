Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5575355049
	for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776455564; cv=pass; b=QcKDxWHa1KcRnyDebndodfTQI+VADdV8VjfF1dmcfXmTh19HeUDrMg8j0vZ81O/OFI9NxOB2p1L1V0U9KbW6av0GCSzfWtbjHRlYSRaanlcDsYRXOyC/ljhxhrPhhK2aHzOYwUM/cv521oy8Fs3XwSuSEZ3cYb4TAfxMihDzeIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776455564; c=relaxed/simple;
	bh=5f8pvc3UtkmpPiljuNCgde0nsUu06vcjpQe2s+vw7VI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWkDB2pdt67xW01mDLjrsRFtWMPYOhfWzBS0YA0v3+2QuZmvzvsxRfkYNsiNJo/sE70XNGu2riXO1PWMs208ATU7l2fZyUzYMJHtcAsMIs4QXjjZDwLSf5ZpXMjbcmK9QJZYuAP8q3ASUEyyubhhVIMWj+fLY+7VoIH58uYeRnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0qumcDo; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0qumcDo"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-793fdbb8d3aso11124817b3.3
        for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 12:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776455563; cv=none;
        d=google.com; s=arc-20240605;
        b=kRTohhQwylhNNO5PjNs1MZKWmQVV1QnbTbQ1wuXl/T3KG565m1fWWn0Xi/mLLaoe7p
         0CiO16MWCMIj5bJID1zOzmrEVUMjoZ4t/iZ8+RKCNBvIROHgMkcCUpS64qfTV3jBC/Ev
         auLEkw2WMMfpFE9OhMY1E0L68Nahu+gzMbtzZuGAuwBgVEpuX9+D2nHhi5YGTl23nIoV
         zhAmCGcq2flep66OhGX/st6i9qNjOVBXqAykBGKda8XXOezICkUnfZ2Pjr6Zjm04/lYO
         hcBHfQfKbDOYisUiofJhQMrQjJjd5vwFGi0wvcficTqV5jub5aqVm7De4e/mTlU7FnFb
         3Z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K5sflrq7wsa6RckrY/9EMSsrJmuP/wFJ+UAxwUuxGDU=;
        fh=LlkEWbpv2ZaxeemQYojLIzCvpXkR5CQ7caMdT/JbS9w=;
        b=Gy21NJP/YLg/1RuEINQP4DX+6cs0kpO6uQxPrnkR7akjjBvbG2Jvgojy1J6TObY9WE
         DzZCqkAIEHM7zSu2eELiJQp56wXn7ClR4dhnJFyUtHQkZokMzcOZKiLRYwgSEWN/F5A5
         LyQJOjpIXMWmXJjhVpG2CHNWM9v/z9KkpYwAganCbDuNMUU+lbeBYS0XYyOjA1o4JwEb
         hwSf+x46MY0Fbh0OR00t6A7WYKh7Tpm/HLzhy/Morvi+E/C0nKUek3AdWjrpGXMRwAJ7
         tLk8IgKr3nfZIAVYsJPxMh0Nbo62wnbBCfKUnX2MsTMaVhAWWMnnaGzKJH9mX4+Tum5F
         DReg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776455563; x=1777060363; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K5sflrq7wsa6RckrY/9EMSsrJmuP/wFJ+UAxwUuxGDU=;
        b=B0qumcDotLm7eZk6g8rqBqkwY10Qf2l7jQwIvl4L5+O7VrpqLHWu7ycvBPY7BDdfmf
         ysIjZJcL6ZkRB3HlfM+6tFAuuOojCOSNbyGskJNejNz27g0O43Bu6wZ+ZjDxz+1fyDGp
         nH94EDxwpN6GsnCYJai6/UaHdQ0PShCBRy/x9/a2cJ6lLHqbOwuUgWDzUmH9zKhGKOMj
         BMwW2hG7UHkPlyMkMvQaWJwou69xExueCMnRg7X9HjB7EFJ0tlx4BKumPPsDI1G/wsGX
         yp4u5xqKl/XmhlnTGxP6eYNCxVhRfCQv795hgzekHUFNEIM8uZzcuTf993nopijILJeY
         NISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776455563; x=1777060363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5sflrq7wsa6RckrY/9EMSsrJmuP/wFJ+UAxwUuxGDU=;
        b=G7SnwlfmyJP/vpy3RFASg6Gp+B5TWPGO7rXjuXYoMNTA9DMYNNP5Gu+VOHZBYQgLIt
         5izI/g8KGKtDbwVdFk11foDqHv3xuV7FY5pbcibUpAu+XGfsAmDTvZ2Rp0bw6PmZYthw
         IXytBlUNNeQQA6l6yDPK53C3XA4suUui2XNlF50JYvGesTHVphGi0ImzsBy6pZAhmhhU
         aRSxX8USCARgrHMQTN2ZoQOc+Qv5q80ReFJIkZQZivFJj2X+k6+Gg10gGru20D9jNunJ
         YVBKHF8+DX4AYHJRM3icnaGl/920zlmdM5rZGalLLA+TqnHHoSYxn9N48LfdUeiEpgnS
         BkPw==
X-Forwarded-Encrypted: i=1; AFNElJ+rToXhYAQH7mt3B/927kgleqlj1D13XZ75ybFlaFUzwzwRpAz9sUXwOWuVWd5ApgM5FuX6VN5muAJJC0hhmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTsyVZ0XUPAKg9BFsVv90UJ1fRhcfLG2j13yNqyZxsAm+14P/z
	Rm6GQ+MvodZi39d19KcSz9ulXDg5Tdewb1wvi/FAPPGuM5mYOnAavd4cIir3oaalT3jg03xB9I6
	7698WQoAxENTqCE7hUIDMEFlEudATaA==
X-Gm-Gg: AeBDietoL0tLVnG4bdjGMTwQB/487Zik67Wo3hXwrm74+NafYqPx9r6NaY0Al7BaKxR
	f4BT80C/sLEpHt04I5V9D/l4AiULRjI/8yY7Ngwt7n1Nq0LPaZsoZEhtwgqmienSNa5MHgIxjg6
	72mC1LDL/NkRKK0oYo1CBHNVNgdQ2ISwOtaXOaoSl+8Ujn7cqzpV1GgLR69QjJD4SZsk3dMjTzr
	PKHhp8DtK2TA3fGavmiDMSZRGjRSdlOklduV3pJ3o52D2LCIhCg5GDtF+ijpCUHU9zi+BW3lMEt
	xcBwi7Bn5joR2tb+uZAvZvy5h9rkh5vx3e8PfmKRwGwpe5DrK4NEq1BI57GUxssf0vGVKh7Zh0S
	OtDR7osFuvJB6p9DBR1i0HgTO6p9z
X-Received: by 2002:a05:690c:4b0b:b0:7b1:3579:2f00 with SMTP id
 00721157ae682-7b9ecf8b675mr47457387b3.30.1776455562624; Fri, 17 Apr 2026
 12:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <aeINb8-a83R3QDXd@pathway.suse.cz> <CABx5tqLZvNFvkeUXBzJkQS00Cb_WVKgxGwEPhA5sTLwkWja9vw@mail.gmail.com>
In-Reply-To: <CABx5tqLZvNFvkeUXBzJkQS00Cb_WVKgxGwEPhA5sTLwkWja9vw@mail.gmail.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Fri, 17 Apr 2026 21:52:03 +0200
X-Gm-Features: AQROBzBr-U6Rb8UR7KlXGLyhmI_DLVLsoKEJrdLtPNxbDpmFOwRqss8JecEax3c
Message-ID: <CAJGKYO4uSi9X8F9S=9G0-28P7i0Ago31bEX3RpF3wsRm1G_D8g@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Brian Masney <bmasney@redhat.com>
Cc: Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@kernel.org>, Tim Bird <tim.bird@sony.com>, 
	rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org, 
	francesco@valla.it, geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 21:24, Brian Masney <bmasney@redhat.com> wrote:
>
...
>
>     If you see this message and you are not debugging the kernel,
> report this immediately to your vendor!

Brian, busybox is taken. The escalation up to the vendors is nil.

When people playing cards meets people playing chess... (sergio leone
background track music)

Best R-
