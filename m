From: Alessio Igor Bogani <abogani@kernel.org>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Tue, 17 May 2011 21:41:06 +0200
Message-ID: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com>
References: <BANLkTi=2jW5PHB6QCaddHeZH0P=9PKWosw@mail.gmail.com>
	<1305577420-3685-1-git-send-email-abogani@kernel.org>
	<878vu6nftw.fsf@rustcorp.com.au>
	<4DD2CA02.9040707@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=u4ySmsiPd+yolHcE7+BcFa5i1EFPM+M5bJ0+q3Sri28=;
        b=BsS1arhAh4A0lYULX6TdlsL4G8xhS7B2bjbnzHcFEJoHzkuEYx1rtk/ZusDCfTw6pn
         PrcCkXAe4bezD9Pf+DDaAVatLcU0/1BI6YX5fYwzcOhclL+7XSNg0gP80tNR56KvBkSe
         ivz+dYIarPloZdHo1YX61+uXy2kZQaZC5lCtE=
In-Reply-To: <4DD2CA02.9040707@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Behme <dirk.behme@googlemail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>

Dear Mr. Behme,

2011/5/17 Dirk Behme <dirk.behme@googlemail.com>:
[...]
> With the version above we should get a warning
>
> kernel/module.c: In function 'lookup_symbol':
> kernel/module.c:1809: warning: unused variable 'ks'

Sorry It's my fault. I'll provide a right version in few hours.

Ciao,
Alessio
