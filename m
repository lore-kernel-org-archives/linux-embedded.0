From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: [PATCH 5/23] make section names compatible with -ffunction-sections -fdata-sections: blackfin
Date: Wed, 2 Jul 2008 02:08:33 +0200
Message-ID: <200807020208.33302.vda.linux@googlemail.com>
References: <200807020235.08025.vda.linux@googlemail.com> <8bd0f97a0807011558u2c02f6fcre2f3af3d5cced936@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=uLkK5obSCCVthiadZb8ORUupHmhN8+kmkByDY+mZRT4=;
        b=YiVloIXBGmMIv+1L7Pv2tH4uMLrbBPElQr+ApxnAi8YWAWjv4gIQvpK+Io+5jBoMpl
         CwNcKrufg2WYu/s/FtgpBbo8/8bGmDHh0h7uMcppK1hkqZRBWzMM1ZXe1kA8pYAVmT2m
         lgYMEiSar9aNWGXTq4shYgArmob1AKY/3qXBA=
In-Reply-To: <8bd0f97a0807011558u2c02f6fcre2f3af3d5cced936@mail.gmail.com>
Content-Disposition: inline
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-arch@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

On Wednesday 02 July 2008 00:58, Mike Frysinger wrote:
> On Tue, Jul 1, 2008 at 8:35 PM, Denys Vlasenko wrote:
> > The purpose of this patch is to make kernel buildable
> > with "gcc -ffunction-sections -fdata-sections".
> > This patch fixes blackfin architecture.
> 
> the comment right above what you changed says it already works for
> Blackfin.  so you arent fixing it at all.
> >                /* This gets done first, so the glob doesn't suck it in */
> >                . = ALIGN(32);
> > -               *(.data.cacheline_aligned)
> > +               *(.cacheline_aligned.data)

This may pull in an unrelated data object named "cacheline_aligned"
(say, a static variable in a driver). If that variable is not
itself aligned to the cacheline size, it will mess up alignment of all
objects in .data.cacheline_aligned which follow. Not good.

To be safe from such weird and hard to debug problems
it's better to not use names like .data.XXXX at all.
I just uniformly renamed al such "special sections"
in the kernel to .XXXXX.data
--
vda
