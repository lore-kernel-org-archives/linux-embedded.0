From: Daniel Walker <dwalker@mvista.com>
Subject: Re: [PATCH] 2.6.27-rc4-git3: make section names compatible with
	-ffunction-sections -fdata-sections
Date: Tue, 26 Aug 2008 11:33:05 -0700
Message-ID: <1219775585.3797.2.camel@dhcp32.mvista.com>
References: <200808250118.08406.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200808250118.08406.vda.linux@googlemail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, mingo@elte.hu, x86@kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Russell King <rmk@arm.linux.org.uk>, David Howells <dhowells@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Lennert Buytenhek <kernel@wantstofly.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Dave Miller <davem@davemloft.net>

On Mon, 2008-08-25 at 01:18 +0200, Denys Vlasenko wrote:
> Hi Andrew,
> 
> You asked me to maintain it and resubmit when
> merge frenzy is over.
> 
> Here is the update against current Linus tree
> (which is 2.6.27-rc4-git3), rolled up into one patch.


Do you have the patches that actually use
-ffunction-sections,-fdata-sections updated someplace?

Daniel
