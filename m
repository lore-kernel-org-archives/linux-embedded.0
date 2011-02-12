From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v3: 1/3] PWM: Implement a generic PWM framework
Date: Fri, 11 Feb 2011 23:48:39 -0600
Message-ID: <AANLkTi=XRRELsqEaWAqxFhv+7tOvuLEV_XCDXmpsjQpm@mail.gmail.com>
References: <1297353231-14475-1-git-send-email-bgat@billgatliff.com>
	<1297353231-14475-2-git-send-email-bgat@billgatliff.com>
	<20110210203937.GV9041@pengutronix.de>
	<AANLkTika903eDoFOEcLtcAcizZpPqBH7k4drOdYyz3dA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTika903eDoFOEcLtcAcizZpPqBH7k4drOdYyz3dA@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-embedded@vger.kernel.org

Sascha:


>> I think theres no value in having the FLAG_REGISTERED flag and this
>> function.
>
> I think it sneaked in before I was using the mutex to prevent the lis=
t
> of devices from changing during a lookup. =A0Fixed.

I take that back.  What having that flag lets one do is error recovery
that looks like this:

for (wchan =3D 0; wchan < NCHAN; wchan++) {
    ret =3D pwm_register(&x->p[wchan], ... );
    if (ret) goto error;
}

=2E..

error:
for (wchan =3D 0; wchan < NCHAN; wchan++) {
    if (pwm_is_registered(&x->p[wchan]))
        pwm_unregister(&x->p[wchan]);
}


Without pwm_is_registered() the driver must itself keep track of which
devices were successfully registered and which ones weren't---
something the internals of the API already knows.

True, in the above example it's simply a matter of always registering
in increasing channel order AND preserving the wchan value if an error
occurs.  And then having an "errchan" index that counts from zero up
to the last successfully-registered channel in the error loop.

The pwm_is_registered() function does work of tracking successful
device registrations, and therefore leads to simpler code in device
drivers.  In particular, the error paths are simpler (and less
redundant across drivers) than without pwm_is_registered().

So I think pwm_is_registered() is a keeper.



b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
