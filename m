From: Alessio Igor Bogani <abogani@kernel.org>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Wed, 4 May 2011 19:30:58 +0200
Message-ID: <BANLkTimFmSEykpoOWkicOe8vQFZNZdFoFA@mail.gmail.com>
References: <1304455330-2728-1-git-send-email-abogani@kernel.org>
	<4DC171EB.6030900@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=XP5Am6T6phxtOUmL6FCeRlNq0QG1zH1zjZOsMWjhGlE=;
        b=RiDtlTEnu+Zy01lp5sTedResGlFWjwF4A33m/FSa3k6SOnLVJaJaKF5w/J6CNBBCUq
         NN39GLQmD0AYQ3dSvCTxhl+U51RTsOTSMeArr2yZ7VSzVhIR/jI/XTVAH7BhsAdFAQJf
         6VMwhBe/wVfvcHFGdBqX+/YBkrK/FZQCWmARs=
In-Reply-To: <4DC171EB.6030900@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Behme <dirk.behme@googlemail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>

Dear Mr. Behme,

2011/5/4 Dirk Behme <dirk.behme@googlemail.com>:
[...]
> How is this patch related to patch 4/4
>
> http://marc.info/?l=linux-kernel&m=130296062420328&w=1
>
> of the recently sent patch set? Is it a replacement? Or an add on to this
> (i.e. patch #5)?

Sorry it's my fault: This patch is an add on to that patch set.

Ciao,
Alessio
