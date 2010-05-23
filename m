From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RESEND PATCH] ARM: fix 'unannotated irqs-on' lockdep warning
Date: Sun, 23 May 2010 15:13:01 +0100
Message-ID: <20100523141300.GD950@n2100.arm.linux.org.uk>
References: <1274615328-27953-1-git-send-email-tom.leiming@gmail.com> <20100523123801.GC950@n2100.arm.linux.org.uk> <AANLkTikRp0EHxshKYq39p18ymoRNAtyHrNm3yq6A49-r@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Sender; bh=zPUOvJA8J7oGeTK
	cdDaCfq5q3k7kE8HU7oeIWKBF5cs=; b=gAIj9sRxlhgRiorIBS2/H7gGGTRAolT
	+UbdhWy2Y+q1o1r7Lz8k147kuS47MH7qW7ByymWVVD3uZwA2TUVtzYahQY9xCKke
	pI8sX4FvKv8UZvWjC93waKl1AzlbvFheqRtAeP6h8r2l2N6SlEZyienYqgwca1H2
	+dVKYI2DlTcs=
Content-Disposition: inline
In-Reply-To: <AANLkTikRp0EHxshKYq39p18ymoRNAtyHrNm3yq6A49-r@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ming Lei <tom.leiming@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org, a.p.zijlstra@chello.nl, linux-kernel@vger.kernel.org

On Sun, May 23, 2010 at 09:44:20PM +0800, Ming Lei wrote:
> 2010/5/23 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> >> =A0ENTRY(ret_to_user)
> >> =A0ret_slow_syscall:
> >> - =A0 =A0 disable_irq =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 @ disable interrupts
> >> + =A0 =A0 disable_irq_notrace =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 @ disable interrupts
> >
> > I think this one does need to be traced - the pending work function=
s are
> > all C code which could call back into lockdep.
>=20
> If there are pending works, schedule will be called to give cpu to it=
,
> I wonder why the work function to be scheduled will be run with irq
> disabled. Seems we should enable irq again before calling schedule,
> not sure.

No.  I'm talking about things like do_notify_resume().

I think the above should be left as-is, so that as far as lockdep is
concerned, IRQs are off while userspace runs.  What happens between
returning to userspace and re-entering the kernel has no bearing what
so ever on lockdep.
