From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Wed, 6 Oct 2010 13:50:25 -0500
Message-ID: <AANLkTi=LiUooyUaYw_pKAHp+23ADKXdsAwTo_6zSaX0s@mail.gmail.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
	<loom.20101005T121312-661@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <loom.20101005T121312-661@post.gmane.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: sugumar <sugumar.embedded@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Tue, Oct 5, 2010 at 5:35 AM, sugumar <sugumar.embedded@gmail.com> wr=
ote:
> =A0 I have been working on writing generic PWM driver that provides c=
ommon
> interface to all the PWM devices. I hadn't come across this thread un=
til kevin
> pointed out. It looks like a very good implementation and i would lik=
e to make
> my eHRPWM driver to fit into this framework. eHRPWM (enhanced high re=
solution
> pwm) module has other features such as Dead Band, PWM chopper and Tri=
p Zone and
> i am not sure how to incorporate these in the generic framework. I re=
ally need
> you help here.

Ok.  Can you point me to a datasheet for the part?

> =A0 =A0I am sure the generic framework should support all the feature=
s provided by
> the PWM devices. For eg, eHRPWM has Trip-Zone feature where an asynch=
ronous
> input (incase of short circuit .) can be configured to generate an in=
terrupt.
> I am interested in finding a way to handle this. Kindly give your com=
ments.

Well, we could handle it in the generic framework by adding to the
synchronization callback mechanism.  Or we could leave it as a feature
unique to the eHRPWM device, and a device-specific solution.

Maybe I will have a better idea once I look at the hardware.


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
