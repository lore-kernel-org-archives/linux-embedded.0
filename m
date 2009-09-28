From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: GPIO driver for MPC8313.
Date: Mon, 28 Sep 2009 10:43:00 +0800
Message-ID: <cb9ecdfa0909271943o6133f5c8r9b25a25140e7842f@mail.gmail.com>
References: <cb9ecdfa0909222055x1d691698sb516b5b8f5f81d@mail.gmail.com>
	 <87y6o6rvvc.fsf@macbook.be.48ers.dk>
	 <cb9ecdfa0909230352w77a37f59h3c7f1e146121f9f6@mail.gmail.com>
	 <87r5txrkfz.fsf@macbook.be.48ers.dk>
	 <cb9ecdfa0909230820k6ebbd589o409e58e2d9b6740c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=CiBGW3N0++lhb51kHnxRHEUfvwSAiyBilpBmcoQbL6o=;
        b=gfeuEY47T+0O5KtZsVWxwOhLqE0490grfhuwexg2VsujBb8kLmyelWtW31oPOkz08S
         3FOVLQFrm//Pn2WsiWmBUxJ16WCbhp/ikmm1PJP3CpC6+xDDAmQKqckObUG5080TyZ8w
         IoMwJyJ7ltpv3ZSSWy4z95hbecHM99vVaefAw=
In-Reply-To: <cb9ecdfa0909230820k6ebbd589o409e58e2d9b6740c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

The kerne source I used now is 2.6.23 with MPC8313-erdb pached. I
think I should port 2.6.28 gpio function back to 2.6.23. Is it a
common way to implement it in the kernel I used or I should port
MPC8313-erdb pached to 2.6.28 opposite?

BRs, H. Johnny

2009/9/23 Johnny Hung <johnny.hacking@gmail.com>:
> Many thanks for your help. I will try it.
>
> 2009/9/23 Peter Korsgaard <jacmet@sunsite.dk>:
>>>>>>> "Johnny" =3D=3D Johnny Hung <johnny.hacking@gmail.com> writes:
>>
>> =A0Johnny> Thanks, got it. BTW, how to trigger GPIO level in user sp=
ace
>> =A0Johnny> application? I also found
>> =A0Johnny> arch/powerpc/platforms/52xx/mpc52xx_gpio.c is a good
>> =A0Johnny> example. Any reply is appreciate.
>>
>> Through sysfs. See 'Sysfs Interface for Userspace' section of
>> Documentation/gpio.txt
>>
>> --
>> Bye, Peter Korsgaard
>>
>
