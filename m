From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Subject: Re: [PATCH 3/23] make section names compatible with -ffunction-sections -fdata-sections: arm
Date: Wed, 2 Jul 2008 08:22:43 +0200
Message-ID: <e4c675870807012322s3937b88ak9f8b77cbe06f8e65@mail.gmail.com>
References: <200807020234.26755.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=hPvdog8ojDdKzb+ER4C6C3iwAzwRkPzVnVvbln07i40=;
        b=gLKqfZboMqUtzr0ZXDyrxkcvt+dAhmuIYdtgHu0mXlRxQY8O7mmDAn4YnXRccXSVtm
         jEjQxUHRw3gwn+Ymkt8QoUndCBf6GfLL3xlhVN/PMULe51oT1kfd0eZcbuHCw2sEfuMe
         Ge+dQQ1uQyu8wa1iVUeTURoOoP8OC4Kf398u0=
In-Reply-To: <200807020234.26755.vda.linux@googlemail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: linux-arch@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

2008/7/2 Denys Vlasenko <vda.linux@googlemail.com>:
> The purpose of this patch is to make kernel buildable
> with "gcc -ffunction-sections -fdata-sections".
> This patch fixes arm architecture.
>

Hi Denys,

 I see your patchset. may I suggest you to take a look to this tools?

 http://www.emn.fr/x-info/coccinelle/

 I think it could simplify this kind of patching for the future.
 I found it reading the kernel janitors m-list and I hope it helps.

 Cheers,
-- 
/roberto
