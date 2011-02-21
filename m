From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v5 1/3] PWM: Implement a generic PWM framework
Date: Sun, 20 Feb 2011 22:33:09 -0500
Message-ID: <AANLkTi=egAxrcGxRsAqYwnv0=DgxQuL_Gqd5-AR7=3Zg@mail.gmail.com>
References: <1298175043-31727-1-git-send-email-bgat@billgatliff.com>
 <1298175043-31727-2-git-send-email-bgat@billgatliff.com> <AANLkTimpo=N8GNZxwkqAWuXqOgvtmqyGcn596rOGSuZv@mail.gmail.com>
 <AANLkTi=NGf7GM+Yb7uOFgw=s0mTp_spSSBqdg8+f952u@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=4YBpsWGZ7CnsKDO5D/LJ31J8Hb/VmU1yBqjPbWSnLNg=;
        b=ZNKY7KKafuqN62YpTl09f2bXNazQDLVX4q6qKiEBiW5xvlloqHE+sprcStUK/W7Vl5
         yW3NUVqzg2OBI6tPGA/0wOruS+J3nhD9jkcuKnP+JgVwtnQbVPP53jnsHzeRECJgSIH0
         +D6DI+3lrH9FxlHsKaJxtdDlI+GvqfR6pvn2U=
In-Reply-To: <AANLkTi=NGf7GM+Yb7uOFgw=s0mTp_spSSBqdg8+f952u@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Sun, Feb 20, 2011 at 22:18, Bill Gatliff wrote:
> On Sun, Feb 20, 2011 at 4:46 PM, Mike Frysinger <vapier.adi@gmail.com=
> wrote:
>>> +static const struct attribute_group pwm_device_attr_group =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 .attrs =3D (struct attribute **) pwm_attrs,
>>> +};
>>
>> should attribute_group have its attrs member constified ?
>
> Isn't it already, given that the pwm_device_attr_group definition is =
const?

if it were already, you wouldnt need that cast
-mike
