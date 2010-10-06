From: "Grosen, Mark" <mgrosen@ti.com>
Subject: RE: [PWM 01/10] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Wed, 6 Oct 2010 14:02:34 -0500
Message-ID: <5F744A5A3C131242B81CE5874BD2CFFB93E1BC93@dlee01.ent.ti.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
	<loom.20101005T121312-661@post.gmane.org>
 <AANLkTi=LiUooyUaYw_pKAHp+23ADKXdsAwTo_6zSaX0s@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=LiUooyUaYw_pKAHp+23ADKXdsAwTo_6zSaX0s@mail.gmail.com>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>, sugumar <sugumar.embedded@gmail.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

-----Original Message-----
=46rom: linux-embedded-owner@vger.kernel.org [mailto:linux-embedded-own=
er@vger.kernel.org] On Behalf Of Bill Gatliff
Sent: Wednesday, October 06, 2010 11:50 AM
To: sugumar
Cc: linux-embedded@vger.kernel.org
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common=
 user and kernel interface

> On Tue, Oct 5, 2010 at 5:35 AM, sugumar <sugumar.embedded@gmail.com> =
wrote:
>> =A0 I have been working on writing generic PWM driver that provides=20
>> common interface to all the PWM devices. I hadn't come across this=20
>> thread until kevin pointed out. It looks like a very good=20
>> implementation and i would like to make my eHRPWM driver to fit into=
=20
>> this framework. eHRPWM (enhanced high resolution
>> pwm) module has other features such as Dead Band, PWM chopper and Tr=
ip=20
>> Zone and i am not sure how to incorporate these in the generic=20
>> framework. I really need you help here.

> Ok.  Can you point me to a datasheet for the part?

PDF datasheet here: http://www.ti.com/litv/pdf/sprufl3b

Mark--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
