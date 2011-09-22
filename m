From: MohanReddy koppula <mohanreddykv@gmail.com>
Subject: Re: Timer interrupt on Linux 3.0.3
Date: Thu, 22 Sep 2011 11:52:34 +0530
Message-ID: <CAEZ9+qnSXXi5w9BbwyaQWQybCtaCsJ0T5j5ySEjOkpnnYmr7aA@mail.gmail.com>
References: <CAFbQSaD-c=QqSsq__VtBEcMCJabnBi4AP4KunDNV7u7xXAuaTw@mail.gmail.com>
	<4E73816C.6000304@freescale.com>
	<CAFbQSaBcdLCoVY471mVLAyM=eYDSN77=DODPasMaAEm6pRm7jQ@mail.gmail.com>
	<4E7A3DED.9030402@freescale.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Vr6CT6TtPHeHDxkqjfa5523Iqr1oFYuBCxVqPz6yegk=;
        b=DargFQyJHpdnLHlhBYjZlohFLg1gN7gX374jjVqve/BxSWawoxuXrIHHS1Piw0/bAE
         SsUOjt3Zv5BorBJOaItNn3BfymGuqunL8oagw04HgH8YNqMyRPUNfNuvszCst974nVA6
         nLo0u+cVcJbDtAPdjMZ3aRCiA25E8/eKpqQig=
In-Reply-To: <4E7A3DED.9030402@freescale.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Wood <scottwood@freescale.com>
Cc: Vineeth <vneethv@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

I had the same issue with an MPC885 board. My kernel was 2.6.33. On
that board decrementer exception was not working. I replaced the
board, took new board (MPC885 only, just another board) and the same
kernel worked fine. I don't know how the problem was solved.

-Mohan

On 9/22/11, Scott Wood <scottwood@freescale.com> wrote:
> On 09/21/2011 01:56 AM, Vineeth wrote:
>>>> What was the issue?  You really should try to make this work rather than
>>>> hack around it.
>>
>> what we found was the decrementer is not generating an exception when it
>> becomes 0. and the timebase registers are not getting incremented too.
>
> Does the decrementer actually tick until it reaches zero, or do it and
> the timebase never tick?
>
> Is the TBEN input to the CPU asserted?
>
> -Scott
>
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
>
