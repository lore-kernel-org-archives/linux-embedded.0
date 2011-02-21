From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v5 1/3] PWM: Implement a generic PWM framework
Date: Sun, 20 Feb 2011 19:58:33 -0500
Message-ID: <AANLkTi=6PsM5+MyO5Ks5SxBGg4wu+FsJNPmDOZpiGvZe@mail.gmail.com>
References: <1298175043-31727-1-git-send-email-bgat@billgatliff.com>
 <1298175043-31727-2-git-send-email-bgat@billgatliff.com> <AANLkTimpo=N8GNZxwkqAWuXqOgvtmqyGcn596rOGSuZv@mail.gmail.com>
 <AANLkTim3UfTO9u3gL5Nb9Cdsp-qZA7koLBfHbCh=cGmj@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=kNj8tpQ55V13t/E3bhNsO0FD4e+7F3crP+d8pgzYR/w=;
        b=lANN8KXAD5ewBDmY/SWOz8rT6FsyAE6t5izzKwWIzOa6SpgSjXEW/M/cH8XoZGH0dr
         9j6qqv0iUn+hyvEW8alDeou0wKzvbvq3yrlPN//4m6OKBhzOCdEzlvTbADZoorVX+fcu
         z5Y2sZ3+1BLXgZUAW7lm/qNbtNLFUbKNZFOCQ=
In-Reply-To: <AANLkTim3UfTO9u3gL5Nb9Cdsp-qZA7koLBfHbCh=cGmj@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Sun, Feb 20, 2011 at 19:38, Bill Gatliff wrote:
> On Sun, Feb 20, 2011 at 4:46 PM, Mike Frysinger <vapier.adi@gmail.com=
> wrote:
>>> +#ifdef MODULE
>>> +module_init(pwm_init);
>>> +module_exit(pwm_exit);
>>> +MODULE_LICENSE("GPL");
>>> +#else
>>> +postcore_initcall(pwm_init);
>>> +#endif
>>
>> i dont think you need this MODULE trickery. =C2=A0common code alread=
y takes
>> care of this for you, and it'd let you avoid a warning about pwm_exi=
t
>> being unused.
>
> So the postcore_initcall() becomes equivalent to module_init() when I
> build as a module? =C2=A0That would make sense, but I had never thoug=
ht
> about it before now...

correct, that's what linux/init.h does for people
-mike
