From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v6 0/3] Implement a generic PWM framework
Date: Sun, 27 Feb 2011 12:48:53 -0500
Message-ID: <AANLkTimxcAwxX4wrwSa6pSQtvutmQ-v4n4M-=z-xRKcD@mail.gmail.com>
References: <1298259345-9794-1-git-send-email-bgat@billgatliff.com> <AANLkTimwS+KsB3uRinY2WVzXQ6ZsuhY0ySAmHquTWff6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=+wL8l4hc/Xyuy/fo46TzLXbA7y5kgHV3sXwLCsX/xmI=;
        b=gtrHpr1FkhI7idF4AA1TmiX5TJFS+uxFFL+9wzUVweby7fdv8xbCEdAzphGtXpt2D9
         tiI2gKf9Cpy8c0rxTeWOzwUkDh8LdkeRDIMTlMrri9zJVtW1TLqhT+0nkyLtC8z6fraO
         hcH27KgmMWGLXw4p4No5oNj1zQ8PNNYlwDAFo=
In-Reply-To: <AANLkTimwS+KsB3uRinY2WVzXQ6ZsuhY0ySAmHquTWff6@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Fri, Feb 25, 2011 at 21:38, Bill Gatliff wrote:
> On Sun, Feb 20, 2011 at 9:35 PM, Bill Gatliff wrote:
>> This patch series contains the sixth attempt at implementation of
>> a generic PWM device interface framework. =C2=A0Think gpiolib, but f=
or
>> devices and pseudo-devices that generate pulse-wave-modulated output=
s.
>
> Hearing no objections, does this mean that this code is finally ready
> for a pull request? =C2=A0To whom do I send it?

i'd start with akpm/lkml/linus and add yourself to MAINTAINERS for the
pwm framework
-mike
