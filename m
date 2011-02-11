From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v3: 1/3] PWM: Implement a generic PWM framework
Date: Fri, 11 Feb 2011 12:22:27 -0600
Message-ID: <AANLkTika903eDoFOEcLtcAcizZpPqBH7k4drOdYyz3dA@mail.gmail.com>
References: <1297353231-14475-1-git-send-email-bgat@billgatliff.com>
	<1297353231-14475-2-git-send-email-bgat@billgatliff.com>
	<20110210203937.GV9041@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110210203937.GV9041@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-embedded@vger.kernel.org

Sascha:


Thanks so much for the great feedback!  My responses are inlined below.


b.g.


On Thu, Feb 10, 2011 at 2:39 PM, Sascha Hauer <s.hauer@pengutronix.de> =
wrote:
> default n is the default and can be removed.

=46ixed.


> I can't see anything from platform_device.h being used here.

Correct.  I forgot to remove that header file.  Fixed.

>
>> +#include <linux/pwm/pwm.h>
>> +
>> +static const char *REQUEST_SYSFS =3D "sysfs";
>> +static LIST_HEAD(pwm_device_list);
>
> This is unused.
>
>> +static DEFINE_MUTEX(device_list_mutex);
>> +static struct class pwm_class;
>> +static struct workqueue_struct *pwm_handler_workqueue;
>
> This is used but never initialized.

=46ixed.

>
>> +
>> +static int pwm_match_name(struct device *dev, void *name)
>> +{
>> + =A0 =A0 return !strcmp(name, dev_name(dev));
>> +}
>> +
>> +static struct pwm_device *__pwm_request(struct pwm_device *p, const=
 char *label)
>> +{
>
> I think this function should return int.

I think that might probably work.  :)  Fixed.

> class_find_device does not return error pointers. Luckily we can get =
rid
> of this horrible cast here.

Agreed.  Fixed.  Though, I still use IS_ERR_OR_NULL on the return
value from class_find_device in case that someday it decides to return
error pointers.

> A pwm should not stop when the handler returns non null. Instead the
> handler should call pwm_stop if it wants to. This is much clearer.

Good point.  Fixed.

> Why must a pwm driver be bothered with the __pwm_callback argument? I=
t
> could call a function exported from the pwm API instead.

Because a driver needs to know whether or not a callback is requested.
 If there is no callback, then the driver has the opportunity to mask
the interrupt(s) that trigger the callback mechanism.

I suppose that an alternative would be for the framework to provide
drivers enable_callback() and disable_callback() hooks, plus a
pwm_callback() that they invoke when the callback occurs.  That would
hide the details of the callback implementation fully inside of the
PWM API implementation.

I suppose I can live with that.  Will fix.

> I think it has been mentioned in an earlier review that it's not good
> to request a pwm by reading a sysfs entry. People are not expecting t=
o
> change anything while reading a file.
> I think the whole concept of requesting a pwm via sysfs in userspace =
is
> broken as there is no way to free the pwm again when the process whic=
h
> requested a pwm dies.

I don't enforce that the requester's PID and the unrequester's PID be
the same.  It is strictly an advisory interface a'la gpiolib.  I
really don't think this concept is broken at all.

I generally use echo(1) to request and unrequest PWM channels from
userspace, as well as to set the period, duty, etc..  This lets me
test the API without having to implement an ioctl program, and also
allows for PWM control from shell scripts, etc.

The objective of the sysfs request attribute is to prevent
simultaneous uses of a channel in both kernel and user spaces.  Same
as with GPIO pins.

> There is no need for introducing ioctl like interfaces in the kernel.
> You should create the appropriate callbacks instead which is both eas=
ier
> to read and easier to implement.

I disagree.

The problem with implementing callbacks to do the job of these
configuration flags is trying to come up with an approach that lets
users set multiple parameters at the same time.  To achieve what I am
doing with these flags using callbacks, I would need a
pwm_set_period_and_duty_ns(), pwm_set_period_and_duty_and_polarity(),
pwm_set_duty_and_polarity(), and so on.

I'm thinking mostly about DC motor control applications, where you
vary both the period and the duty cycle based on the speed of the
motor.  The two values have to change at the same time.

You might argue that all I need to add, therefore, is a
pwm_set_duty_and_period_ns().  You would be right--- and I can
certainly do that at the API level.  But I still want one
configuration entry point into the driver code itself, which means I
still need flags somewhere.

Why do I want one entry point into drivers?  Because at the same time
users want to change single or multiple parameters in one go, the
hardware may prevent doing so simply because it doesn't work that way.

The pwm_config structure conveys to the hardware what the desired
final state of the hardware is for that invocation of the
configuration event.  The flags tell which fields in the pwm_config
structure are valid.  So long as PWM hardware and my API work as they
do, I can't see a way to avoid having both.

I guess the above is my polite way of saying "nak".  :)

> This struct shows the major problem with this API. It allows to pass =
in
> inconsistent and contradicting values. We should have a single intern=
al
> representation of the pwm values, either in duty_ns/period_ns or
> duty_ticks/period_ticks. Everything else should be provided with help=
er
> functions.

I agree with you, and in fact things started out that way.  The
redundancy was added by a user's request, but has been somewhat
problematic.  I'll see if I can take them back out.

>> +
>> +struct pwm_device {
>> + =A0 =A0 struct list_head list;
>
> This is unused.

=46ixed.


>> + =A0 =A0 volatile unsigned long flags;
>
> This should not be volatile.

I added that in because I was getting compiler warnings with bitops.
But now that I take it back out, I can't seem to reproduce those
warnings.  Fixed.

>> + =A0 =A0 pwm_callback_t callback;
>
> This field is unused and seems to be a duplicate of handler.

It's definitely unused and unnecessary.  I think I put it there so
that drivers wouldn't have to allocate their own storage for the
callback pointer.  At any rate, it'll go away when I tweak the
callback API itself.  Fixed.

> I think theres no value in having the FLAG_REGISTERED flag and this
> function.

I think it sneaked in before I was using the mutex to prevent the list
of devices from changing during a lookup.  Fixed.


> Function declarations should not be ifdefed.

=46ixed.




b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
