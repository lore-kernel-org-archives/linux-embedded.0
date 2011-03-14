From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v8 1/3] PWM: Implement a generic PWM framework
Date: Mon, 14 Mar 2011 09:29:00 -0500
Message-ID: <AANLkTim9XhrHjQy8EmGAez6DV8e-aASDHUQOyf=cjvdM@mail.gmail.com>
References: <1299990249-18264-1-git-send-email-bgat@billgatliff.com>
	<1299990249-18264-2-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1299990249-18264-2-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
Cc: Bill Gatliff <bgat@billgatliff.com>

Guys:

On Sat, Mar 12, 2011 at 10:24 PM, Bill Gatliff <bgat@billgatliff.com> w=
rote:
> +static ssize_t pwm_duty_ns_show(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
device_attribute *attr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char *b=
uf)
> +{
> + =A0 =A0 =A0 struct pwm_device *p =3D to_pwm_device(dev);
> + =A0 =A0 =A0 return sprintf(buf, "%lu\n", pwm_get_duty_ns(p));
> +}


What would happen if device_unregister() was called on the above
device while duty_ns_show() was running?

My hope is that the device_unregister() would decrement the usage
count on the device, but the count would still be nonzero due to the
running attribute method; thus, the device would not be deleted.  When
the method exited, the usage count would become zero and THEN the
device would disappear.  Is that how things work?  (I have looked at
the code for device_unregister() and friends, but haven't yet been
able to answer this question for myself; said code seems nontrivial).


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
