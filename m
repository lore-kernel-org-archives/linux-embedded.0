From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] (updated, rolled up) make section names compatible with
 -ffunction-sections -fdata-sections
Date: Fri, 18 Jul 2008 08:17:23 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807180816550.20605@anakin>
References: <200807172213.37411.vda.linux@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754582AbYGRGRh@vger.kernel.org>
In-Reply-To: <200807172213.37411.vda.linux@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, mingo@elte.hu, x86@kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, Linus Torvalds <torvalds@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

On Thu, 17 Jul 2008, Denys Vlasenko wrote:
> Here is the update against current Linus tree,
> rolled up into one patch.
> 
> James Bottomley suggested a different naming scheme:
> instead of swapping parts (.text.head -> .head.text),
> prepend .kernel to our special section names.
> This patch implements his idea.

Why not '.linux'?

> ppc and v850 are dropped per comments from arch people.
> parisc and x86 had minor fixes. x86 fix added proper
> executable bits to a section:
> 
> -.section ".text.head"
> +.section ".kernel.text.head","ax",@progbits
> 
> Does arch/m68k/kernel/sun3-head.S need the same fix?

Sure, why not?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
