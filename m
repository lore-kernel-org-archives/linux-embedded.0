From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v8 1/3] PWM: Implement a generic PWM framework
Date: Wed, 30 Mar 2011 20:49:27 -0400
Message-ID: <AANLkTi=o3TCBOhd8gV5=2TOkL1eTrwXJqArLy7PLTkGC@mail.gmail.com>
References: <1299990249-18264-1-git-send-email-bgat@billgatliff.com>
 <1299990249-18264-2-git-send-email-bgat@billgatliff.com> <AANLkTik1_Eekn7e0H+czCWHUX8LdioPH8MSHjcoZG6B=@mail.gmail.com>
 <AANLkTi=fQsrVTo=dA03_75j_++Ya4-M1sd8T-9Lb1tPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=/JM6tTMbu29wpJV1MCcYtUPp/MpzI5X/8IW2MKdKquw=;
        b=PvYz8kT9Z+CiEMS9M+hz/YYVqtGgGh/rb1exGB7bhWnnNGp1V7al6aSMtg9wXqbS4f
         XeAYH8ouL/p/RNeDhwGgEBDwsBP20mIU90cNFEsLboPqM4AFHGArGm/w01uIkb8CsXBX
         St4tSp4iRIEyDteysaqWkyK3NevUjHmj6wcb8=
In-Reply-To: <AANLkTi=fQsrVTo=dA03_75j_++Ya4-M1sd8T-9Lb1tPQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Wed, Mar 30, 2011 at 20:43, Bill Gatliff wrote:
> On Wed, Mar 30, 2011 at 6:57 PM, Mike Frysinger wrote:
>> On Sat, Mar 12, 2011 at 23:24, Bill Gatliff wrote:
>>> +T: =C2=A0 =C2=A0 git git://git.billgatliff.com/pwm.git
>>
>> $ git clone git://git.billgatliff.com/pwm.git
>> Cloning into pwm...
>> fatal: The remote end hung up unexpectedly
>
> I just tried http://git.billgatliff.com/pwm.git, and that's working.
> FWIW. =C2=A0I don't know why git:// has suddenly stopped working...

seems to be working, albeit with significantly more overhead.  i guess
a one-off fetch is fine for now for me to play.
-mike
