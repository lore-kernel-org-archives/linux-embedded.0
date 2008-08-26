From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: [PATCH] 2.6.27-rc4-git3: make section names compatible with -ffunction-sections -fdata-sections
Date: Tue, 26 Aug 2008 22:05:32 +0200
Message-ID: <200808262205.32222.vda.linux@googlemail.com>
References: <200808250118.08406.vda.linux@googlemail.com> <1219775585.3797.2.camel@dhcp32.mvista.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759325AbYHZUEA@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=ybdaLwtzuNJcc+SuBJrkhmlQOgOhUtUky7jT44/GFiI=;
        b=RNQCvofl2ZomBsNRaJtxrJpdoGahpuxFuV2LoU7664KdRsPhyFRhY/dlBhPq5DTxS/
         wtFHa1F0xr8QQySNxTwll7I+HS7EcFiZPJFhDZhghKR8nBa1G/iFa1O+opz8r1pVBKFH
         AswWjstOsl6b8IX/4Dy22pxfhATejARkAQh4Q=
In-Reply-To: <1219775585.3797.2.camel@dhcp32.mvista.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Walker <dwalker@mvista.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, mingo@elte.hu, x86@kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

On Tuesday 26 August 2008 20:33, Daniel Walker wrote:
> On Mon, 2008-08-25 at 01:18 +0200, Denys Vlasenko wrote:
> > Hi Andrew,
> > 
> > You asked me to maintain it and resubmit when
> > merge frenzy is over.
> > 
> > Here is the update against current Linus tree
> > (which is 2.6.27-rc4-git3), rolled up into one patch.
> 
> 
> Do you have the patches that actually use
> -ffunction-sections,-fdata-sections updated someplace?

I had, but it's a PITA to maintain and rediff them.
My current plan is to get this merged first,
and then introduce another change which actually
puts -ffunction-sections,-fdata-sections to use.
It will be much easier to review this way.
--
vda
