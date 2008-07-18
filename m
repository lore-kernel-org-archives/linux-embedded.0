From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] (updated, rolled up) make section names compatible
	with -ffunction-sections -fdata-sections
Date: Fri, 18 Jul 2008 09:14:00 +0100
Message-ID: <20080718081400.GB21656@linux-mips.org>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, mingo@elte.hu, x86@kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

On Thu, Jul 17, 2008 at 10:13:37PM +0200, Denys Vlasenko wrote:

> I would like to ask arch maintainers to ACK/NAK this patch,
> and Andrew to act accordingly.

MIPS bits are looking good:

Acked-by: Ralf Baechle <ralf@linux-mips.org>

Is this patch intended to go to Linus for 2.6.27?

  Ralf
