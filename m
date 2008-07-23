From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH] (updated, rolled up) make section names compatible with -ffunction-sections -fdata-sections
Date: Wed, 23 Jul 2008 22:21:48 +0200
Message-ID: <20080723202148.GA2949@axis.com>
References: <200807172213.37411.vda.linux@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756236AbYGWUcY@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200807172213.37411.vda.linux@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "mingo@elte.hu" <mingo@elte.hu>, "x86@kernel.org" <x86@kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

On Thu, Jul 17, 2008 at 10:13:37PM +0200, Denys Vlasenko wrote:
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
> 
> Changelog follows:
> 
> 
> 
> The purpose of these patches is to make kernel buildable
> with "gcc -ffunction-sections -fdata-sections".
> 
> The problem is that with -ffunction-sections -fdata-sections gcc
> creates sections like .text.head and .data.nosave
> whenever someone has innocuous code like this:
> 
> static void head(...) {...}
> 
> or this:
> 
> int f(...) { static int nosave; ... }
> 
> somewhere in the kernel.
> 
> Kernel linker script is confused by such names and puts these sections
> in wrong places.
> 
> This patch renames all "magic" section names used by kernel
> to not have this format, eliminating the possibility of such collisions.
> 
> Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>

CRIS part:

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> vda

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
