From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [RESEND PATCH] ARM: fix 'unannotated irqs-on' lockdep warning
Date: Sun, 23 May 2010 23:07:50 +0800
Message-ID: <AANLkTinV9Na9zxYMIfTr893Ynnc0YOk2B6uPKEa9s4R1@mail.gmail.com>
References: <1274615328-27953-1-git-send-email-tom.leiming@gmail.com>
	 <20100523123801.GC950@n2100.arm.linux.org.uk>
	 <AANLkTikRp0EHxshKYq39p18ymoRNAtyHrNm3yq6A49-r@mail.gmail.com>
	 <20100523141300.GD950@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=B9RSY9HW90Yqc09iI0PwpJzPu+qQ2/ruvcQPA58YTa4=;
        b=ahfsNaxhJX2Fho7G/mFTYP+1vXvySoCPC+LGINQGxNWniJ3uhB/eGIEaXH/u4wdyOR
         JRfXwvRi66jgMN/icMjAAgDG69kR5ktYoc3u3FMcacw8SUrizOTLcg4tuzpbzWbA/N+o
         G23x9vx+Zz+18jx9Vkd5Sx99NzYvrSN0stj1k=
In-Reply-To: <20100523141300.GD950@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org, a.p.zijlstra@chello.nl, linux-kernel@vger.kernel.org

2010/5/23 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> On Sun, May 23, 2010 at 09:44:20PM +0800, Ming Lei wrote:
>> 2010/5/23 Russell King - ARM Linux <linux@arm.linux.org.uk>:
>> >> =A0ENTRY(ret_to_user)
>> >> =A0ret_slow_syscall:
>> >> - =A0 =A0 disable_irq =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ disable interrupts
>> >> + =A0 =A0 disable_irq_notrace =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 @ disable interrupts
>> >
>> > I think this one does need to be traced - the pending work functio=
ns are
>> > all C code which could call back into lockdep.
>>
>> If there are pending works, schedule will be called to give cpu to i=
t,
>> I wonder why the work function to be scheduled will be run with irq
>> disabled. Seems we should enable irq again before calling schedule,
>> not sure.
>
> No. =A0I'm talking about things like do_notify_resume().
>
> I think the above should be left as-is, so that as far as lockdep is
> concerned, IRQs are off while userspace runs. =A0What happens between
> returning to userspace and re-entering the kernel has no bearing what
> so ever on lockdep.
>

Oh, trace_ret_hardirqs_on has to be added before returning to user-spac=
e to
remove the warning, like x86 and mips. If you agree, I'd like to post
a new version
patch.

Thanks,

--=20
Lei Ming
