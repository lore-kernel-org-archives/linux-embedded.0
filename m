From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] (updated, rolled up) make section names compatible
	with -ffunction-sections -fdata-sections
Date: Fri, 18 Jul 2008 10:48:44 +0200
Message-ID: <20080718084844.GM6875@elte.hu>
References: <200807172213.37411.vda.linux@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200807172213.37411.vda.linux@googlemail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>


* Denys Vlasenko <vda.linux@googlemail.com> wrote:

> Hi Andrew,
> 
> Here is the update against current Linus tree,
> rolled up into one patch.
> 
> James Bottomley suggested a different naming scheme:
> instead of swapping parts (.text.head -> .head.text),
> prepend .kernel to our special section names.
> This patch implements his idea.
> 
> ppc and v850 are dropped per comments from arch people.
> parisc and x86 had minor fixes. x86 fix added proper
> executable bits to a section:
> 
> -.section ".text.head"
> +.section ".kernel.text.head","ax",@progbits
> 
> Does arch/m68k/kernel/sun3-head.S need the same fix?
> 
> The patch is run-tested on x86_64.
> 
> I would like to ask arch maintainers to ACK/NAK this patch,
> and Andrew to act accordingly.

Acked-by: Ingo Molnar <mingo@elte.hu>

could you please put the ax/progbits fix in front of the queue so that 
it becomes bisectable and so that the later patches keep their "it 
should not change anything" property?

I.e. do not mix small fixlets into a large set of "no change" patches - 
split them out in front. This is really important for the x86 bits as 
linker script changes tend to be quite fragile.

	Ingo
