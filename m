From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [RESEND PATCH] ARM: fix 'unannotated irqs-on' lockdep warning
Date: Sun, 23 May 2010 21:44:20 +0800
Message-ID: <AANLkTikRp0EHxshKYq39p18ymoRNAtyHrNm3yq6A49-r@mail.gmail.com>
References: <1274615328-27953-1-git-send-email-tom.leiming@gmail.com>
	 <20100523123801.GC950@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=XbN8v7eRG2U+YsGFqF+MF9QP0iNokdFPDJQkX1rr/2Y=;
        b=Bx/GbutH9qyk2nPbwVQhfrCqb7fGHS2kmfoCmfFh375vsJZbytdrJQ9sGFdFzsEJ82
         hxdpQcop0K/+ogPirmOnzTYJoZsM+Ty5bYnngX3KuU+AYb/NatWWX5gqrFrMveNIXApv
         6KAr5HkS8WkDPAUinKD5RRsxZfvNhgzrrNr2w=
In-Reply-To: <20100523123801.GC950@n2100.arm.linux.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org, a.p.zijlstra@chello.nl, linux-kernel@vger.kernel.org

2010/5/23 Russell King - ARM Linux <linux@arm.linux.org.uk>:
>> =A0ENTRY(ret_to_user)
>> =A0ret_slow_syscall:
>> - =A0 =A0 disable_irq =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 @ disable interrupts
>> + =A0 =A0 disable_irq_notrace =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 @ disable interrupts
>
> I think this one does need to be traced - the pending work functions =
are
> all C code which could call back into lockdep.

If there are pending works, schedule will be called to give cpu to it, =
I wonder
why the work function to be scheduled will be run with irq disabled.
Seems we should enable irq again before calling schedule, not sure.

> Also, I'm nervious about applying this patch without seeing more peop=
le
> test it.

I test the patch on my beagle board and is OK, and if you don't apply o=
ne
patch into your tree, there are few people who may test it since they h=
ave to
parse the raw email patch(which is more inconvenient than 'git pull') f=
or test
if they want to do.

Thanks,
--=20
Lei Ming
