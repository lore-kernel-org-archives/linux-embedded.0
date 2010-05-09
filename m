From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: fix inbalance of hardirqs trace before return to
	user or exception
Date: Sun, 9 May 2010 10:18:56 +0100
Message-ID: <20100509091856.GA29763@n2100.arm.linux.org.uk>
References: <1273377379-18078-1-git-send-email-tom.leiming@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:In-Reply-To:
	Sender; bh=kEjxpZzv/VOw8XCHqudtGwIQ4yXDAdcMYH09NNT73Vg=; b=HjoGG
	MQJuol+S+PXw0QF5VCkkWeNlPAJ5kEl5Sb2kAjruOElsvPOTlt6y3Muh45qWSTZG
	D7PjC19KbO0dvYpvgFGROSyO/ib9A8+0LE+G0QT5UAMwLBF6MFBhrmmFGZmGGnsQ
	0HZCqHgjMRQbEm3R7LfdbWI7AB5kjZRF1MIsWs=
Content-Disposition: inline
In-Reply-To: <1273377379-18078-1-git-send-email-tom.leiming@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tom.leiming@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org, a.p.zijlstra@chello.nl, linux-kernel@vger.kernel.org

On Sun, May 09, 2010 at 11:56:19AM +0800, tom.leiming@gmail.com wrote:
> From: Ming Lei <tom.leiming@gmail.com>
> 
> This patch introduces macro of trace_ret_hardirqs_on, which will
> call asm_trace_hardirqs_on if I flag in the stored CPSR is zero.
> 
> The patch adds trace_ret_hardirqs_on before returning to user
> or exception mode once disable_irq was called explicitly, which does
> fix the inbalance of hardirqs trace and make lockdep happy. The patch
> does fix this kind of lockdep warning below:

I'm not convinced that this is required in all the places you're adding
it.  Eg, in the return-to-user case, userspace _always_ has IRQs
enabled, and when we enter kernel space from the exception handler, we
always enable IRQs.  Returning from any syscall with IRQs disabled is a
bug, and so that _should_ produce a warning.

In fact, returning to user mode with IRQs disabled in _any_ case is a
bug.

Please provide your reasoning for adding this to every path.

Finally, using asm_trace_hardirqs_on is extremely expensive, and in
many cases the register saving is completely wasteful.  That's why
places were doing this:

#ifdef CONFIG_TRACE_IRQFLAGS
        tst     r4, #PSR_I_BIT
        bleq    trace_hardirqs_on
#endif

which is much more efficient.
