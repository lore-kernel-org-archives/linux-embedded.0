From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v4 2/3] PWM: GPIO+hrtimer device emulation
Date: Sat, 12 Feb 2011 22:28:00 -0600
Message-ID: <AANLkTinAcF+XK-YY3q-XQHH7vR=5h+Bxioooz-0gwTm6@mail.gmail.com>
References: <1297563323-24074-1-git-send-email-bgat@billgatliff.com>
	<1297563323-24074-3-git-send-email-bgat@billgatliff.com>
	<AANLkTimNuz245U64MBzGNpop7oVVnVpZ04UUA=7p5CLj@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTimNuz245U64MBzGNpop7oVVnVpZ04UUA=7p5CLj@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike:


Thanks for looking at this code!  Replies inlined below.

On Sat, Feb 12, 2011 at 8:53 PM, Mike Frysinger <vapier.adi@gmail.com> =
wrote:
> document the module name in the help ?

Not sure what you are asking.  Like this?

    config GPIO_PWM
           tristate "GPIO+hrtimer PWM device emulation"
           depends on GENERIC_PWM
           help
             When enabled, this option creates a module named gpio-pwm
             that emulates single-channel PWM devices using
             high-resolution timers and GPIO pins.  The PWM framework
             allows you to create as many of these devices as desired,
             subject to CPU overhead and GPIO pin availability.  If
             unsure, say N.


>
>> --- /dev/null
>> +++ b/drivers/pwm/gpio-pwm.c
>> +#define DRIVER_NAME "gpio-pwm"
>
> use KBUILD_MODNAME instead ?

Good suggestion.  Fixed.

>
>> +static void gpio_pwm_work (struct work_struct *work)
>
> no space before the "("

=46ixed.

>> +static struct pwm_device_ops gpio_pwm_device_ops =3D {
>> + =A0 =A0 =A0 .config =A0 =A0 =A0 =A0 =3D gpio_pwm_config,
>> + =A0 =A0 =A0 .config_nosleep =3D gpio_pwm_config_nosleep,
>> + =A0 =A0 =A0 .request =A0 =A0 =A0 =A0=3D gpio_pwm_request,
>> +};
>
> is this struct not constified ? =A0same for some of the other structs=
 in
> this file ...

It isn't constified, but it should be.  But if I do, I get lots of
"discards qualifiers" warnings because const isn't used in the
functions I pass these structures to.  So I kind of have to leave it
as-is, no?

>
>> + =A0 =A0 =A0 gp =3D kzalloc(sizeof(*gp), GFP_KERNEL);
>> + =A0 =A0 =A0 if (IS_ERR_OR_NULL(gp))
>
> i dont think the kmalloc funcs return a pointer error. =A0it's either
> NULL or it's a valid pointer. =A0this comes up a few times ...

Ok.  I like that macro so much, sometimes I get carried away.  :)
=46ixed. (I found only two locations where this mistake occurred).


>
>> +EXPORT_SYMBOL(gpio_pwm_create);
>> +EXPORT_SYMBOL(gpio_pwm_destroy);
>
> are people expected to call these directly ?

Yes.  It's equivalent to doing a platform_device_register_simple(),
except that gpio_pwm devices aren't platform devices--- they are just
a combination of an hrtimer and a gpio pin.

> =A0is that useful if they cant call any of the config funcs ?

Users of gpio_pwm aren't supposed to call the config functions in
gpio-pwm.c, they are supposed to invoke them indirectly via the
regular PWM API (pwm.c).


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
