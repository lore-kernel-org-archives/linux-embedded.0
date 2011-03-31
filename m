From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v8 1/3] PWM: Implement a generic PWM framework
Date: Wed, 30 Mar 2011 20:38:16 -0400
Message-ID: <AANLkTik67VeN6rEFFzA7SU=FcTqWNgUX4bFxOstF3RTP@mail.gmail.com>
References: <1299990249-18264-1-git-send-email-bgat@billgatliff.com>
 <1299990249-18264-2-git-send-email-bgat@billgatliff.com> <AANLkTik1_Eekn7e0H+czCWHUX8LdioPH8MSHjcoZG6B=@mail.gmail.com>
 <AANLkTimEqRQS+yPpNuzF7XOk9cuDx2Mu1MKnfQkZDLfk@mail.gmail.com> <AANLkTinfm-rCRvah1wKGHpPGHrFV3ne90xChmUVCYup9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=eDXgZ8YhevYEThzB06urPQFC1ZGe5spQZfnzZJH9/jY=;
        b=uj/y/pyG18eOlAsfX2s2wNTP3Onn2MVfCh43XsU3nb/eDZW4YuCOlHF7dOmAIPOpf6
         s+eoy3ZhwIUaKlAyXwmoDD2Ni5UOLU27CsetCBJFalqusmgTxbc8U68lt1M15J2ZWe7F
         SVgeh/uuQY3JOihY1T+5zUxUlsqwwu0aAka68=
In-Reply-To: <AANLkTinfm-rCRvah1wKGHpPGHrFV3ne90xChmUVCYup9@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Wed, Mar 30, 2011 at 20:36, Mike Frysinger wrote:
> On Wed, Mar 30, 2011 at 20:33, Bill Gatliff wrote:
>> On Wed, Mar 30, 2011 at 6:57 PM, Mike Frysinger wrote:
>>> On Sat, Mar 12, 2011 at 23:24, Bill Gatliff wrote:
>>>> +T: =C2=A0 =C2=A0 git git://git.billgatliff.com/pwm.git
>>>
>>> $ git clone git://git.billgatliff.com/pwm.git
>>> Cloning into pwm...
>>> fatal: The remote end hung up unexpectedly
>>>
>>> :(
>>>
>>> why not get an account on kernel.org like everyone else and push yo=
ur
>>> tree there ?
>>
>> Tried that once, got no response.
>>
>> I'm open to trying again if you can direct me to the right place.
>
> i used this:
> https://accounts.kernel.org/
>
> make sure to mention your PWM framework ?

in the mean time, you could easily use a free service like
http://repo.or.cz/ ...
-mike
