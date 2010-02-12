From: "Stanislav O. Bezzubtsev" <stas@lvk.cs.msu.su>
Subject: Re: [PWM PATCH 2/5] Emulates PWM hardware using a high-resolution timer and a GPIO pin
Date: Fri, 12 Feb 2010 10:22:50 +0300
Message-ID: <A8919B3D-43EF-4EA5-8334-F1B52AE97E5A@lvk.cs.msu.su>
References: <cover.1265094517.git.bgat@billgatliff.com> <2d73f9b2fd175fd3e482920baebcd3028206f02e.1265094517.git.bgat@billgatliff.com> <20100211200702.GB1487@ucw.cz> <4B746A02.9060306@billgatliff.com> <20100211205801.GA29159@elf.ucw.cz>
Mime-Version: 1.0 (Apple Message framework v1077)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100211205801.GA29159@elf.ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Pavel Machek <pavel@ucw.cz>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org


11.02.2010, =D7 23:58, Pavel Machek =CE=C1=D0=C9=D3=C1=CC(=C1):

> On Thu 2010-02-11 14:35:14, Bill Gatliff wrote:
>> Pavel Machek wrote:
>>>> +static void
>>>> +gpio_pwm_work (struct work_struct *work)
>>>> +{
>>>> +	struct gpio_pwm *gp =3D container_of(work, struct gpio_pwm, work=
);
>>>> +
>>>> +	if (gp->active)
>>>> +		gpio_direction_output(gp->gpio, gp->polarity ? 1 : 0);
>>>> +	else
>>>> +		gpio_direction_output(gp->gpio, gp->polarity ? 0 : 1);
>>>> +}
>>>>=20
>>>=20
>>> ...polarity ^ active ?
>>>=20
>>=20
>> ... except that if polarity and/or active are >1, I don't send the
>> values 1 or 0 to gpio_direction_output.  I don't know if the API is
>> specifically intended to accept nonzero values that are greater than=
 1.
>=20
> !polarity ^ !active ? :-).


One the one hand that wouldn't be 100% right because according to ANSI =
C !(0) is just !=3D 0 but no one says it is 1.
On another hand as far as I can see polarity and active fields are both=
 defined as "unsigned long <name> :1" in the gpio_pwm structure. And th=
at means they can be equal only to 0 or 1. So simple (polarity ^ active=
) is the right choice as far as the original decision.
What is strange for me is that resulting control flow is not right repr=
esentation of what is happening. I mean that actually one should perfor=
m a call to an external function with an argument that depends on value=
s of two variables. While this code is equal to call function A if some=
 variable is not equal to 0 with argument depending on value of some ot=
her variable else call function B. I hope you understood what I'm tryin=
g to say.
Therefore even if you wish to leave if statement (not sure that gcc wou=
ld optimize that) the right control flow representation should be the f=
ollowing:
=2E....
	if (gp->active)
		value =3D ((gp->polarity)?1:0);
	else
		value =3D ((gp->polarity)?0:1);

	gpio_direction_output(gp->gpio, value);
=2E....

The second strange thing is "unsigned long <name>:1". I'm not sure but =
as far as I can remember the right way to define several-bits field is =
"int <name>:1". But I might be mistaken.


Best regards. Stas.


