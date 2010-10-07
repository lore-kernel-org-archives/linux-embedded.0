From: "Sugumar Natarajan" <sugumar@ti.com>
Subject: RE: [PWM 01/10] API to consolidate PWM devices behind a common user and kernel interface
Date: Thu, 7 Oct 2010 13:28:22 +0530
Message-ID: <023101cb65f5$69b93750$3d2ba5f0$@com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>	<loom.20101005T121312-661@post.gmane.org> <AANLkTi=LiUooyUaYw_pKAHp+23ADKXdsAwTo_6zSaX0s@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=LiUooyUaYw_pKAHp+23ADKXdsAwTo_6zSaX0s@mail.gmail.com>
Content-Language: en-us
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Bill Gatliff' <bgat@billgatliff.com>, 'sugumar' <sugumar.embedded@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Thu, Oct 07, 2010 at 00:20:25, Bill Gatliff wrote:
> On Tue, Oct 5, 2010 at 5:35 AM, sugumar <sugumar.embedded@gmail.com> =
wrote:
> > =A0 I have been working on writing generic PWM driver that provides=
=20
> > common interface to all the PWM devices. I hadn't come across this=20
> > thread until kevin pointed out. It looks like a very good=20
> > implementation and i would like to make my eHRPWM driver to fit int=
o=20
> > this framework. eHRPWM (enhanced high resolution
> > pwm) module has other features such as Dead Band, PWM chopper and T=
rip=20
> > Zone and i am not sure how to incorporate these in the generic=20
> > framework. I really need you help here.
>=20
> Ok.  Can you point me to a datasheet for the part?
>=20
> > =A0 =A0I am sure the generic framework should support all the featu=
res=20
> > provided by the PWM devices. For eg, eHRPWM has Trip-Zone feature=20
> > where an asynchronous input (incase of short circuit .) can be conf=
igured to generate an interrupt.
> > I am interested in finding a way to handle this. Kindly give your c=
omments.
>=20
> Well, we could handle it in the generic framework by adding to the sy=
nchronization callback mechanism.  Or we could leave it as a
feature unique to the eHRPWM device, and a device-specific solution.
>=20
> Maybe I will have a better idea once I look at the hardware.

Bill,
  Thanks for your comments. Also, I am not particularly clear about the=
 pwm_set_handler function.=20
  As far my understanding goes, in order to defer the work,

1. Set the "set_callback" variable in the pwm_device structure to the c=
allback function.

2. Call the "pwm_set_handler" function to set the bottom halve handler =
and the data.

3. "pwm_set_handler" inturn invokes the call back function  defined in =
step 1 .The latter
   would set the PWM channel call back to "pwm_handler" function which =
is local to the PWM=20
   framework.

4.Call the pwm_channel callback in the interrupt handler to queue the w=
ork for later processing.

1. Is my above understanding correct?

2. Single channel may support multiple interrupts.
   For eg.,=20
    pwm_set_handler(handler_1)
    pwm_set_handler(handler_2)

 	How to handle multiple interrupts with the above framework?

3. pwm_set_handler() -- Defines an end-of-period callback.
   =20
	Is the pwm_set_handler only used for the end-of-period interrupt.
	Can't it be used for other events ?


4. Various applications may require different actions to be handled in =
the interrupt
   handler (Eg. Motor Control, Backlight control ..). so, we cannot hav=
e a generic=20
   interrupt handler in the pwm device driver. How to handle this?=20

Regards,
N.Sugumar.
     =20








> b.g.
> --
> Bill Gatliff
> bgat@billgatliff.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20


