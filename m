From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: Expose regulator:set_consumer_device_supply()?
Date: Tue, 26 Apr 2011 16:15:23 -0500
Message-ID: <BANLkTi=KxNRktf3SOzQKK-stu6i+g8n2EA@mail.gmail.com>
References: <BANLkTi=dCHXEtv+=+sRaDp_Pt3zQy5o7ug@mail.gmail.com>
	<20110426083350.GA20595@sirena.org.uk>
	<BANLkTimmpx5ZThXj705Yn_wRQ6bF7VzwPw@mail.gmail.com>
	<20110426161516.GC11848@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110426161516.GC11848@opensource.wolfsonmicro.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

Mark:

On Tue, Apr 26, 2011 at 11:15 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
>
> No. =A0As I said in the text you've quoted above you can also specify=
 the
> device mapping using the dev_name() of the device.

Aah!  I see it now--- the regulator_consumer_supply structure will
take either the consumer's struct device pointer, or the device name
of the consumer's struct device.  The device name can easily be
predicted (controlled, in fact) before the consumer itself is
registered; in the case of i2c devices, it's the bus-id, i.e.
"0-0038".

Now it all fits together for me.  Thanks for your patience!

> It means you get reams of code in drivers conditionally using the
> regulator API, all of which adds needless complexity all over the tre=
e
> as people invariably make everything conditional on the regulator not
> being there when they shouldn't. =A0This then means you also end up w=
ith
> no meaningful error handling, all errors just get silently eaten.

Now I think I see your point: better to have drivers check the result
of regulator_get() themselves, rather than test a pointer coming in
with the platform data.  And since regulators are often registered as
platform devices themselves, there is no way to get a valid result
from regulator_get() in early-init board code anyway.


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
