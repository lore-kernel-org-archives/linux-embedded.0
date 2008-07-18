From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] (updated, rolled up) make section names compatible with -ffunction-sections -fdata-sections
Date: Fri, 18 Jul 2008 12:53:08 +0100
Message-ID: <14472.1216381988@redhat.com>
References: <200807172213.37411.vda.linux@googlemail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758729AbYGRMCw@vger.kernel.org>
In-Reply-To: <200807172213.37411.vda.linux@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: dhowells@redhat.com, Andrew Morton <akpm@linux-foundation.org>, mingo@elte.hu, x86@kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Russell King <rmk@arm.linux.org.uk>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

Denys Vlasenko <vda.linux@googlemail.com> wrote:

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

Acked-by: David Howells <dhowells@redhat.com> [FRV and MN10300]
