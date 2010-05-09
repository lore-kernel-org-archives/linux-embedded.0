From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [PATCH] ARM: fix inbalance of hardirqs trace before return to 
	user or exception
Date: Sun, 9 May 2010 21:07:08 +0800
Message-ID: <i2kd82e647a1005090607w24424d8p4b524007a9c7fe0@mail.gmail.com>
References: <1273377379-18078-1-git-send-email-tom.leiming@gmail.com>
	 <20100509091856.GA29763@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=wEs7V29dX4QvuR6Y3TFc0G1PFTrXJ1ZHY85o5AtQwFc=;
        b=Zlh71+hzW5aDh1iIsaM2FUA3bXpP1jRlwlWyC26f+xUqOmtKVgKSjvDzvJtvAm+KaW
         OAFzrIZxNMPwOV2lTZxBfVliJ99sxn9yjHTzfmLb+Zq/YQyYChq5ZaHSWKw3SFQEio1h
         rsTWsXlLjF4d694Ih/1JudMpdr/OliiPLgf5U=
In-Reply-To: <20100509091856.GA29763@n2100.arm.linux.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org, a.p.zijlstra@chello.nl, linux-kernel@vger.kernel.org

2010/5/9 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> On Sun, May 09, 2010 at 11:56:19AM +0800, tom.leiming@gmail.com wrote=
:
>> From: Ming Lei <tom.leiming@gmail.com>
>>
>> This patch introduces macro of trace_ret_hardirqs_on, which will
>> call asm_trace_hardirqs_on if I flag in the stored CPSR is zero.
>>
>> The patch adds trace_ret_hardirqs_on before returning to user
>> or exception mode once disable_irq was called explicitly, which does
>> fix the inbalance of hardirqs trace and make lockdep happy. The patc=
h
>> does fix this kind of lockdep warning below:
>
> I'm not convinced that this is required in all the places you're addi=
ng
> it. =A0Eg, in the return-to-user case, userspace _always_ has IRQs
> enabled, and when we enter kernel space from the exception handler, w=
e
> always enable IRQs. =A0Returning from any syscall with IRQs disabled =
is a
> bug, and so that _should_ produce a warning.
>
> In fact, returning to user mode with IRQs disabled in _any_ case is a
> bug.

The patch only adds hardirqs on event to make lockdep see it.
Maybe in this paths, we should not trace the hardirqs off event, then w=
e
will not need to add the hardirqs on event before return to user. If
you agree, I'll
write another patch to do it.

>
> Please provide your reasoning for adding this to every path.

The patch adds this in places which disable_irq is called before return=
ing to
user or kernel mode from sys-call or exception. This can keep hardirqs =
trace
balance to remove lockdep warning of "unannotated irqs-on" since disabl=
e_irq
may call trace_hardirqs_off to trace hardirqs off event and lockdep
will see it.

If lockdep warning is produced, lockdep does not work afterwards. It is=
 the
purpose of the patch.

>
> Finally, using asm_trace_hardirqs_on is extremely expensive, and in
> many cases the register saving is completely wasteful. =A0That's why
> places were doing this:
>
> #ifdef CONFIG_TRACE_IRQFLAGS
> =A0 =A0 =A0 =A0tst =A0 =A0 r4, #PSR_I_BIT
> =A0 =A0 =A0 =A0bleq =A0 =A0trace_hardirqs_on
> #endif
>
> which is much more efficient.

Yes, I'll use the efficient way in v2 of the patch.


--=20
Lei Ming
