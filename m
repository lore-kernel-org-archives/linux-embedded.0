From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: GPIO driver for MPC8313.
Date: Wed, 23 Sep 2009 23:20:17 +0800
Message-ID: <cb9ecdfa0909230820k6ebbd589o409e58e2d9b6740c@mail.gmail.com>
References: <cb9ecdfa0909222055x1d691698sb516b5b8f5f81d@mail.gmail.com>
	 <87y6o6rvvc.fsf@macbook.be.48ers.dk>
	 <cb9ecdfa0909230352w77a37f59h3c7f1e146121f9f6@mail.gmail.com>
	 <87r5txrkfz.fsf@macbook.be.48ers.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1gYb/E66AvHPk8tHd00SCfZN4sitmA4uD7wAvHguhwM=;
        b=pWHlf613vm73AQOf2x76OhjuXedwVVMsc/8iol93Pd5C1gqHRTWWC1eV0sG1T1mQ2B
         yUPUlxwKCwZu4PR6l0iwwJ3654yrdEBgby8AEfy1s7QzuSHwNEAwb1FTCg/eTBKsESWi
         9adAWS9rnocITeWPx8rWtWS24KALpHJORKXno=
In-Reply-To: <87r5txrkfz.fsf@macbook.be.48ers.dk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

Many thanks for your help. I will try it.

2009/9/23 Peter Korsgaard <jacmet@sunsite.dk>:
>>>>>> "Johnny" =3D=3D Johnny Hung <johnny.hacking@gmail.com> writes:
>
> =A0Johnny> Thanks, got it. BTW, how to trigger GPIO level in user spa=
ce
> =A0Johnny> application? I also found
> =A0Johnny> arch/powerpc/platforms/52xx/mpc52xx_gpio.c is a good
> =A0Johnny> example. Any reply is appreciate.
>
> Through sysfs. See 'Sysfs Interface for Userspace' section of
> Documentation/gpio.txt
>
> --
> Bye, Peter Korsgaard
>
