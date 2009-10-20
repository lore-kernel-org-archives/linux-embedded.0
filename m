From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [[RFC] 4/5] An LED "dimmer" trigger, which uses the PWM API to 
	vary the brightness of an LED according to system load
Date: Mon, 19 Oct 2009 23:58:39 -0400
Message-ID: <8bd0f97a0910192058p2b3144cfl9ef7d3e5fe352e8c@mail.gmail.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-4-git-send-email-bgat@billgatliff.com> <1255984366-26952-5-git-send-email-bgat@billgatliff.com> 
	<8bd0f97a0910191451w89d80ffx9afcdbe31dad0cc7@mail.gmail.com> 
	<4ADD158C.2090708@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=3wAnkKl7RxeN2bIZVNmGk8+e+VNOH3MBY3VA2V7s0ss=;
        b=hKXrHpYp+oESF4lWRUR0VxJGuR6XYsv3o3eHmp4RSehPb8uEzc1fw9SBPSwIGq2y6M
         0m0w1qPhADTvEmUoT4RIQ9ubjgM5StMMYolnN3WEbUrh0JHLqQVVnywdhby1qRix8ycl
         eCAipHp+uu91OA3ROIJxi802tvFmoua+Fjbgk=
In-Reply-To: <4ADD158C.2090708@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Mon, Oct 19, 2009 at 21:42, Bill Gatliff wrote:
> Mike Frysinger wrote:
>> On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
>>> =C2=A0#include <linux/pwm.h>
>>> +#include <linux/pwm-led.h>
>>
>> if there's going to be a bunch of new pwm related headers, perhaps a
>> subdir makes more sense: linux/pwm/xxx
>
> In general I don't have a problem with this. =C2=A0However, in this s=
pecific case
> would it make more sense to just fold pwm-led.h into pwm.h? =C2=A0The=
re really
> isn't much to pwm-led.h.

since pwm-led.h is meant for platform data and for boards to include
it, keeping it separate makes sense to me.  and once we start getting
more pwm based drivers that want to do headers of their own, having
linux/pwm/ for them would be nice.

as for the core pwm header, either linux/pwm.h or linux/pwm/pwm.h
would work i think.

>>> +static void
>>> +led_pwm_brightness_set(struct led_classdev *c,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0enum led_brightness b)
>>> +{
>>> + =C2=A0 =C2=A0 =C2=A0 struct led_pwm *led;
>>> + =C2=A0 =C2=A0 =C2=A0 int percent;
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 percent =3D (b * 100) / (LED_FULL - LED_OFF)=
;
>>> + =C2=A0 =C2=A0 =C2=A0 led =3D container_of(c, struct led_pwm, led)=
;
>>
>> instead of using container_of() everywhere, why not add a helper mac=
ro
>> that turns a led_classev into a led_pwm
>
> That's just a personal style thing. =C2=A0As soon as I write a helper=
 macro, I
> tend to forget how it works and then start mis-using it everywhere. =C2=
=A0But I
> don't have a problem with doing a helper.
>
> For better type-safety, would a helper inline-function be a better ch=
oice
> than a helper macro? =C2=A0Or would it make any difference?

an inline function might be better.  it would also allow you to pass
in void* pointers though ...

>>> + =C2=A0 =C2=A0 =C2=A0 if (!try_module_get(d->driver->owner))
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>>
>> is this really needed ?
>
> Not sure.

after looking at the other patches, i dont think it is.  the core pwm
framework does the module_get for you when you register the driver.
-mike
