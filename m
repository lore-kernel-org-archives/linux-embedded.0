From: Trilok Soni <soni.trilok@gmail.com>
Subject: Re: [[RFC] 4/5] An LED "dimmer" trigger, which uses the PWM API to 
	vary the brightness of an LED according to system load
Date: Sat, 31 Oct 2009 13:15:36 +0530
Message-ID: <5d5443650910310045l188b16ecia09df826de743fc@mail.gmail.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com>
	 <1255984366-26952-2-git-send-email-bgat@billgatliff.com>
	 <1255984366-26952-3-git-send-email-bgat@billgatliff.com>
	 <1255984366-26952-4-git-send-email-bgat@billgatliff.com>
	 <1255984366-26952-5-git-send-email-bgat@billgatliff.com>
	 <8bd0f97a0910191451w89d80ffx9afcdbe31dad0cc7@mail.gmail.com>
	 <4ADD158C.2090708@billgatliff.com>
	 <20091030140337.GD4795@pengutronix.de>
	 <5d5443650910310043p1f82cf68i28bd5bfcdb9b8d7e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=+ld7wJUzxdHZQoQtHsRdQ0wqqXceHBEzuf5gL88/AUM=;
        b=ltAl5v5mqn0YreRIjbrjTI0JevG+qr5ub71q2UOlCFMyQdTtg7jFTjuFoR+2JMgMGT
         W7evZbYGVYSg/gfp19H9KTkd7DyQipE4QwA4rPSTSQAgFkUdT88Ic1tgDcwx8VAI5HWI
         jGzIFyWMPWaTEfqobFVjuv92Gat883IxvBSsw=
In-Reply-To: <5d5443650910310043p1f82cf68i28bd5bfcdb9b8d7e@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Luotao Fu <l.fu@pengutronix.de>
Cc: Bill Gatliff <bgat@billgatliff.com>, Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org

Hi Bill,

On Sat, Oct 31, 2009 at 1:13 PM, Trilok Soni <soni.trilok@gmail.com> wr=
ote:
> Hi Luotao Fu,
>
> On Fri, Oct 30, 2009 at 7:33 PM, Luotao Fu <l.fu@pengutronix.de> wrot=
e:
>> Hi,
>>
>> On Mon, Oct 19, 2009 at 08:42:36PM -0500, Bill Gatliff wrote:
>>> Mike Frysinger wrote:
>>> >On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
>>> >>--- a/drivers/leds/leds-pwm.c
>>> >>+++ b/drivers/leds/leds-pwm.c
>>> >>@@ -1,153 +1,167 @@
>>> >>-/*
>>> >>- * linux/drivers/leds-pwm.c
>>> >>- *
>>> >>- * simple PWM based LED control
>>> >>- *
>>> >>- * Copyright 2009 Luotao Fu @ Pengutronix (l.fu@pengutronix.de)
>>> >>- *
>>> >>- * based on leds-gpio.c by Raphael Assenat <raph@8d.com>
>>> >>- *
>>> >>- * This program is free software; you can redistribute it and/or=
 modify
>>> >>- * it under the terms of the GNU General Public License version =
2 as
>>> >>- * published by the Free Software Foundation.
>>> >>- */
>>> >
>>> >this should not be removed. =A0if you wanted to add your copyright=
 line,
>>> >then that's fine, but the rest needs to stay.
>>>
>>> For the record, the reason the file looks like it does is because I
>>> wrote an original one that replaced the previous leds-pwm.c--- but
>>> obviously git didn't see it that way when it produced the diff.
>>>
>>> I certainly wasn't trying to write-out anyone's copyright! =A0I don=
't
>>> have a problem with their names appearing in the file, regardless,
>>> so I'll put them back in. =A0If they have problems with their names
>>> appearing therein, they can let me know. =A0:)
>>
>> I certainly don't have any problems with that. ;-) As a matter of fa=
ct.
>> My driver was a really simple spinoff of the gpio led driver. Nothin=
g
>> fancy in there. So I'm certainly happy that the driver will eventual=
ly
>> see a rewrite. I'm just a little surprsied as I caught up this mail
>> quite by occasion since I'm not subscribed to linux-embedded (time t=
o do
>> it now, I think ;-)). 'd be nice if you could put the copyright hint
>> back in there. I'd test it by chance.
>>
>> The framework looks nice. The recent pwm stuff was more a loose poli=
cy
>> and spreaded in different places in kernel. Nice to have a real fram=
e
>> work now. Nice work!
>
> Your observation is correct, and that's why I prefer to have this
> framework in mainline ASAP. It becomes more worst in the embedded
> system, when you would like to share the device drivers in open-sourc=
e
> with different semiconductor vendor's SoCs. If you look at the Haptic=
s
> patches on LKML, you will observe this problem, and why we need to
> have common PWM APIs in mainline.

Please always add LKML in CC for PWM framework patches to get more
reviewers :).

--=20
---Trilok Soni
http://triloksoni.wordpress.com
http://www.linkedin.com/in/triloksoni
