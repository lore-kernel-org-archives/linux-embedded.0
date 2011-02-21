From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v5 1/3] PWM: Implement a generic PWM framework
Date: Sun, 20 Feb 2011 21:18:14 -0600
Message-ID: <AANLkTi=NGf7GM+Yb7uOFgw=s0mTp_spSSBqdg8+f952u@mail.gmail.com>
References: <1298175043-31727-1-git-send-email-bgat@billgatliff.com>
	<1298175043-31727-2-git-send-email-bgat@billgatliff.com>
	<AANLkTimpo=N8GNZxwkqAWuXqOgvtmqyGcn596rOGSuZv@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTimpo=N8GNZxwkqAWuXqOgvtmqyGcn596rOGSuZv@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike:

On Sun, Feb 20, 2011 at 4:46 PM, Mike Frysinger <vapier.adi@gmail.com> =
wrote:
>> +static const struct attribute_group pwm_device_attr_group =3D {
>> + =A0 =A0 =A0 .attrs =3D (struct attribute **) pwm_attrs,
>> +};
>
> should attribute_group have its attrs member constified ?

Isn't it already, given that the pwm_device_attr_group definition is co=
nst?


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
