From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v8 1/3] PWM: Implement a generic PWM framework
Date: Wed, 30 Mar 2011 20:36:59 -0400
Message-ID: <AANLkTinfm-rCRvah1wKGHpPGHrFV3ne90xChmUVCYup9@mail.gmail.com>
References: <1299990249-18264-1-git-send-email-bgat@billgatliff.com>
 <1299990249-18264-2-git-send-email-bgat@billgatliff.com> <AANLkTik1_Eekn7e0H+czCWHUX8LdioPH8MSHjcoZG6B=@mail.gmail.com>
 <AANLkTimEqRQS+yPpNuzF7XOk9cuDx2Mu1MKnfQkZDLfk@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=ezIruLAlQm2sN0TK7SgNBrjyE8jZR25a8HgWSO0m+Kk=;
        b=EhYHVkPo7Dqolat8a4+p41kksyDq2Bt2HyymCZO3lDKYMXDAQjok196jHOXrh7sAp9
         UstlKke3aqo9LslMHnq7svIKAD8tUdgN9bnqmeyFajoPjiDOyqAgpga+jgADVpLNHbiw
         ek2nNLGog1qh2SdKPW2CJZVGKNY1DAVDr0jJU=
In-Reply-To: <AANLkTimEqRQS+yPpNuzF7XOk9cuDx2Mu1MKnfQkZDLfk@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Wed, Mar 30, 2011 at 20:33, Bill Gatliff wrote:
> On Wed, Mar 30, 2011 at 6:57 PM, Mike Frysinger wrote:
>> On Sat, Mar 12, 2011 at 23:24, Bill Gatliff wrote:
>>> +T: =C2=A0 =C2=A0 git git://git.billgatliff.com/pwm.git
>>
>> $ git clone git://git.billgatliff.com/pwm.git
>> Cloning into pwm...
>> fatal: The remote end hung up unexpectedly
>>
>> :(
>>
>> why not get an account on kernel.org like everyone else and push you=
r
>> tree there ?
>
> Tried that once, got no response.
>
> I'm open to trying again if you can direct me to the right place.

i used this:
https://accounts.kernel.org/

make sure to mention your PWM framework ?
-mike
