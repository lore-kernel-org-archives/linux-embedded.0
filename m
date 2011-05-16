From: Anders Kaseorg <andersk@ksplice.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Mon, 16 May 2011 14:02:09 -0400
Message-ID: <BANLkTi=2jW5PHB6QCaddHeZH0P=9PKWosw@mail.gmail.com>
References: <1304455330-2728-1-git-send-email-abogani@kernel.org>
	<4DD14469.5030804@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ksplice.com; s=google;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=bCR0SbHwGYD3CS0dRToCHvkoD/isFze21OJugSCeFZI=;
        b=N2qvPX/cosuozodrkCFd1vJf1EP9kU+HHrdRA7jZmWYFdtoVz9Uqnp+14JeumQWigU
         DTIyDZ1Y0d0DTDV+jM+PwVFW5FLbAotvTpmkNiEvMKOAPx/gS1kCbSEjt4tCOgjvdZIT
         6rJcvEGPs+p65VT5bn2Y3FzWkx8ZfqPktEg98=
In-Reply-To: <4DD14469.5030804@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Behme <dirk.behme@googlemail.com>
Cc: Alessio Igor Bogani <abogani@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>

On Mon, May 16, 2011 at 11:36, Dirk Behme <dirk.behme@googlemail.com> wrote:
> Then, thinking again, results in the question if the first argument of
> bsearch() shouldn't be 'name' rather than 'ks->name'?

Yes, it should be.

> Then it would be the job of cmp_name() to check for start == stop == 0?

Actually bsearch already handles this case correctly (it will make no
calls to cmp_name and return NULL), so nothing needs to specially
check for it.

Anders
