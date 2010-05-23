From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RESEND PATCH] ARM: fix 'unannotated irqs-on' lockdep warning
Date: Sun, 23 May 2010 20:47:46 +0100
Message-ID: <20100523194746.GE950@n2100.arm.linux.org.uk>
References: <1274615328-27953-1-git-send-email-tom.leiming@gmail.com> <20100523123801.GC950@n2100.arm.linux.org.uk> <AANLkTikRp0EHxshKYq39p18ymoRNAtyHrNm3yq6A49-r@mail.gmail.com> <20100523141300.GD950@n2100.arm.linux.org.uk> <AANLkTinV9Na9zxYMIfTr893Ynnc0YOk2B6uPKEa9s4R1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Sender; bh=GGTTnR/QmymJKTO
	QRfCsjtb0MLF8iXYNYrcFNdzbjhA=; b=A71HRRfKtvxmTpvSbOcW0Wlt0fD0CsX
	/3jvGv7oEgFDCME/PzQOeH1xZejxoUqM3TCumGKAt/b3U4WBe1LF9jEmc+6L38DV
	v8vLnV5QS2JDVLOlNHtqrm2wulYRzU9L3oervQ8VDAsAZ8Qt0OBxK5H5mN6FVFl2
	EAZhIugND6NI=
Content-Disposition: inline
In-Reply-To: <AANLkTinV9Na9zxYMIfTr893Ynnc0YOk2B6uPKEa9s4R1@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ming Lei <tom.leiming@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org, a.p.zijlstra@chello.nl, linux-kernel@vger.kernel.org

On Sun, May 23, 2010 at 11:07:50PM +0800, Ming Lei wrote:
> 2010/5/23 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> > On Sun, May 23, 2010 at 09:44:20PM +0800, Ming Lei wrote:
> >> 2010/5/23 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> >> >> =A0ENTRY(ret_to_user)
> >> >> =A0ret_slow_syscall:
> >> >> - =A0 =A0 disable_irq =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ disable interrupts
> >> >> + =A0 =A0 disable_irq_notrace =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 @ disable interrupts
> >> >
> >> > I think this one does need to be traced - the pending work funct=
ions are
> >> > all C code which could call back into lockdep.
> >>
> >> If there are pending works, schedule will be called to give cpu to=
 it,
> >> I wonder why the work function to be scheduled will be run with ir=
q
> >> disabled. Seems we should enable irq again before calling schedule=
,
> >> not sure.
> >
> > No. =A0I'm talking about things like do_notify_resume().
> >
> > I think the above should be left as-is, so that as far as lockdep i=
s
> > concerned, IRQs are off while userspace runs. =A0What happens betwe=
en
> > returning to userspace and re-entering the kernel has no bearing wh=
at
> > so ever on lockdep.
> >
>=20
> Oh, trace_ret_hardirqs_on has to be added before returning to user-sp=
ace to
> remove the warning, like x86 and mips. If you agree, I'd like to post
> a new version patch.

Let me explain again.  We have this series of actions:

- in userspace
- exception happens
- cpu disables interrupts itself
- save state
- enable interrupts, and tell lockdep that IRQs are unmasked
- we process the exception, and ultimately call ret_fast_syscall or
  ret_slow_syscall

Now, what was happening in existing kernels is:

POINT A.
- disable interrupts, and tell lockdep that IRQs are masked
- check for any work pending
  - if work pending, call function - with IRQs still masked
  - go back to point A.
- restore state
- resume userspace, which implicitly re-enables IRQs

This results in a balanced and afaics correct setup.  Lockdep doesn't
care about the state of userspace - it only cares about state (and its
code only ever runs) when we're in kernel mode.

With your change above, what's happening is the above is replaced by:

POINT A.
- disable interrupts, but don't tell lockdep that IRQs are masked
- check for any work pending
  - if work pending, call function - with IRQs still masked
	*but* lockdep believes IRQs are enabled.  Therefore, I believe
	false warnings are probable from things like the scheduler,
	signal handling paths, etc.
  - go back to point A.
- restore state
- resume userspace, which implicitly re-enables IRQs

So can you now see why I believe the above change I've quoted is wrong?

Moreover, I put to you that it's utterly pointless - and a waste of CPU
time - telling lockdep about the IRQ masking when an exception occurs,
and it's also pointless telling lockdep about the IRQ unmasking when we
resume userspace.
