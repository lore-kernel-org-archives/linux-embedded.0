From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PWM v9 1/3] PWM: Implement a generic PWM framework
Date: Thu, 14 Apr 2011 13:49:27 -0600
Message-ID: <BANLkTi=1Nh+EcZw_U6U8ZS2yVyqmCtuAcQ@mail.gmail.com>
References: <1301630392-20793-1-git-send-email-bgat@billgatliff.com> <1301630392-20793-2-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1301630392-20793-2-git-send-email-bgat@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

Hi Bill,

Comments below...

[cc'ing Greg & Kay regarding the use of device class (comment near the =
bottom)]

On Thu, Mar 31, 2011 at 9:59 PM, Bill Gatliff <bgat@billgatliff.com> wr=
ote:
> Updates the existing PWM-related functions to support multiple
> and/or hotplugged PWM devices, and adds a sysfs interface.
> Moves the code to drivers/pwm.
>
> For now, this new code can exist alongside the current PWM
> implementations; the existing implementations will be migrated
> to this new framework as time permits. =A0Eventually, the current
> PWM implementation will be deprecated and then expunged.
>
> Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
> ---
> =A0Documentation/pwm.txt =A0 | =A0276 ++++++++++++++++++++++
> =A0MAINTAINERS =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A08 +
> =A0drivers/Kconfig =A0 =A0 =A0 =A0 | =A0 =A02 +
> =A0drivers/Makefile =A0 =A0 =A0 =A0| =A0 =A02 +
> =A0drivers/pwm/Kconfig =A0 =A0 | =A0 10 +
> =A0drivers/pwm/Makefile =A0 =A0| =A0 =A04 +
> =A0drivers/pwm/pwm.c =A0 =A0 =A0 | =A0580 +++++++++++++++++++++++++++=
++++++++++++++++++++
> =A0include/linux/pwm/pwm.h | =A0140 ++++++++++++
> =A08 files changed, 1022 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/pwm.txt
> =A0create mode 100644 drivers/pwm/Kconfig
> =A0create mode 100644 drivers/pwm/Makefile
> =A0create mode 100644 drivers/pwm/pwm.c
> =A0create mode 100644 include/linux/pwm/pwm.h
>
> diff --git a/Documentation/pwm.txt b/Documentation/pwm.txt
> new file mode 100644
> index 0000000..6a0c95d
> --- /dev/null
> +++ b/Documentation/pwm.txt
> @@ -0,0 +1,276 @@
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Generic PWM Device API
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0February 7, 2011
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Bill Gatliff
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<bgat@billgatliff.co=
m>
> +
> +
> +
> +The code in drivers/pwm and include/linux/pwm/ implements an API for
> +applications involving pulse-width-modulation signals. =A0This docum=
ent
> +describes how the API implementation facilitates both PWM-generating
> +devices, and users of those devices.

Good documentation!

> +
> +
> +Motivation
> +
> +The primary goals for implementing the "generic PWM API" are to
> +consolidate the various PWM implementations within a consistent and
> +redundancy-reducing framework, and to facilitate the use of
> +hotpluggable PWM devices.
> +
> +Previous PWM-related implementations within the Linux kernel achieve=
d
> +their consistency via cut-and-paste, but did not need to (and didn't=
)
> +facilitate more than one PWM-generating device within the system---
> +hotplug or otherwise. =A0The Generic PWM Device API might be most
> +appropriately viewed as an update to those implementations, rather
> +than a complete rewrite.
> +
> +
> +Challenges
> +
> +One of the difficulties in implementing a generic PWM framework is t=
he
> +fact that pulse-width-modulation applications involve real-world
> +signals, which often must be carefully managed to prevent destructio=
n
> +of hardware that is linked to those signals. =A0A DC motor that
> +experiences a brief interruption in the PWM signal controlling it
> +might destructively overheat; it could suddenly change speed, losing
> +synchronization with a sensor; it could even suddenly change directi=
on
> +or torque, breaking the mechanical device connected to it.
> +
> +(A generic PWM device framework is not directly responsible for
> +preventing the above scenarios: that responsibility lies with the
> +hardware designer, and the application and driver authors. =A0But it
> +must to the greatest extent possible make it easy to avoid such
> +problems).
> +
> +A generic PWM device framework must accommodate the substantial
> +differences between available PWM-generating hardware devices, witho=
ut
> +becoming sub-optimal for any of them.
> +
> +Finally, a generic PWM device framework must be relatively
> +lightweight, computationally speaking. =A0Some PWM users demand
> +high-speed outputs, plus the ability to regulate those outputs
> +quickly. =A0A device framework must be able to "keep up" with such
> +hardware, while still leaving time to do real work.
> +
> +The Generic PWM Device API is an attempt to meet all of the above
> +requirements. =A0At its initial publication, the API was already in =
use
> +managing small DC motors, sensors and solenoids through a
> +custom-designed, optically-isolated H-bridge driver.
> +
> +
> +Functional Overview
> +
> +The Generic PWM Device API framework is implemented in
> +include/linux/pwm/pwm.h and drivers/pwm/pwm.c. =A0The functions ther=
ein
> +use information from pwm_device and pwm_config structures to invoke
> +services in PWM peripheral device drivers. =A0Consult
> +drivers/pwm/atmel-pwmc.c for an example driver for the Atmel PWMC
> +peripheral.
> +
> +There are two classes of adopters of the PWM framework:
> +
> + =A0Users -- those wishing to employ the API merely to produce PWM
> + =A0signals; once they have identified the appropriate physical outp=
ut
> + =A0on the platform in question, they don't care about the details o=
f
> + =A0the underlying hardware
> +
> + =A0Driver authors -- those wishing to bind devices that can generat=
e
> + =A0PWM signals to the Generic PWM Device API, so that the services =
of
> + =A0those devices become available to users. Assuming the hardware c=
an
> + =A0support the needs of a user, driver authors don't care about the
> + =A0details of the user's application
> +
> +Generally speaking, users will first invoke pwm_request() to obtain =
a
> +handle to a PWM device. =A0They will then pass that handle to functi=
ons
> +like pwm_duty_ns() and pwm_period_ns() to set the duty cycle and
> +period of the PWM signal, respectively. =A0They will also invoke
> +pwm_start() and pwm_stop() to turn the signal on and off.
> +
> +The Generic PWM API framework also provides a sysfs interface to PWM
> +devices, which is adequate for basic application needs and testing.
> +
> +Driver authors fill out a pwm_device_ops structure, which describes
> +the capabilities of the PWM hardware being utilized. =A0They then in=
voke
> +pwm_register() (usually from within their device's probe() handler) =
to
> +make the PWM API aware of their device. =A0The framework will call b=
ack
> +to the methods described in the pwm_device_ops structure as users
> +begin to configure and utilize the hardware.
> +
> +Many PWM-capable peripherals provide two, three, or more channels of
> +PWM output. =A0The driver author calls pwm_register() once for each
> +channel they wish to be supported by the Generic PWM API.
> +
> +Note that PWM signals can be produced by a variety of peripherals,
> +beyond the true PWM peripherals offered by many system-on-chip
> +devices. =A0Other possibilities include timer/counters with
> +compare-match capabilities, carefully-programmed synchronous serial
> +ports (e.g. SPI), and GPIO pins driven by kernel interval timers.
> +With a proper pwm_device structure, these devices and pseudo-devices
> +can be accommodated by the Generic PWM Device API framework.
> +
> +The following paragraphs describe the basic functions provided by th=
e
> +Generic PWM API framework. =A0See the kerneldoc in drivers/pwm/pwm.c=
 for
> +the most detailed documentation.
> +
> +
> +Using the API to Generate PWM Signals -- Basic Kernel Functions
> +
> +pwm_request() -- Returns a pwm_device pointer, which is subsequently
> +passed to the other user-related PWM functions. =A0Once requested, a=
 PWM
> +channel is marked as in-use and subsequent requests prior to
> +pwm_release() will fail.
> +
> +The names used to refer to PWM devices are defined by driver authors=
=2E
> +Typically they are platform device bus identifiers, and this
> +convention is encouraged for consistency.
> +
> +pwm_release() -- Marks a PWM channel as no longer in use. =A0The PWM
> +device is stopped before it is released by the API.
> +
> +pwm_period_ns() -- Specifies the PWM signal's period, in nanoseconds=
=2E
> +
> +pwm_duty_ns() -- Specifies the PWM signal's active duration, in nano=
seconds.
> +
> +pwm_duty_percent() -- Specifies the PWM signal's active duration, as=
 a
> +percentage of the current period of the signal. =A0NOTE: this value =
is
> +not recalculated if the period of the signal is subsequently changed=
=2E
> +
> +pwm_start(), pwm_stop() -- Turns the PWM signal on and off. =A0Excep=
t
> +where stated otherwise by a driver author, signals are stopped at th=
e
> +end of the current period, at which time the output is set to its
> +inactive state.
> +
> +pwm_polarity() -- Defines whether the PWM signal output's active
> +region is "1" or "0". =A0A 10% duty-cycle, polarity=3D1 signal will
> +conventionally be at 5V (or 3.3V, or 1000V, or whatever the platform
> +hardware does) for 10% of the period. =A0The same configuration of a
> +polarity=3D0 signal will be at 5V (or 3.3V, or ...) for 90% of the
> +period.

API looks mostly sane, but more comments on it below at the actual decl=
aration.

> +
> +
> +Using the Sysfs Interface to Generate PWM Signals from Userspace
> +
> +The Generic PWM API provides the following attributes under
> +/sys/class/pwm/<device>/ to allow user applications to control
> +and/or monitor PWM signal generation. =A0Except for the 'export'
> +attribute, all attributes are read-only if the PWM device is not
> +exported to userspace.
> +
> +export (rw) -- write a label to this attribute to request that the P=
WM
> +device be exported to userspace; returns the length of the label on
> +success (for compatibilty with echo/cat), or -EBUSY if the device is
> +already in use by the kernel or has already been exported to
> +userspace. Read from this attribute to obtain the label of the curre=
nt
> +PWM device owner, if any.
> +
> +unexport (w) -- write a non-null string to this attribute to release
> +the PWM device; the device then becomes available for reexport and/o=
r
> +requests. =A0Returns -EBUSY if the device is not currently exported,
> +-EINVAL if the device is not currently in use, or the length of the
> +string on success.
> +
> +polarity (rw) -- write an ascii '1' to set active high, or a '0' for
> +active low. =A0Read to obtain the current polarity.
> +
> +period_ns (rw) -- write an ascii decimal number to set the period of
> +the PWM device, in nanoseconds. =A0Value written must not be less th=
an
> +duty_ns or -EINVAL is returned. =A0Read to determine the current per=
iod
> +of the PWM device, which might be slightly different than the value
> +requested due to hardware limitations.
> +
> +duty_ns (rw) -- write an ascii decimal number to set the duration of
> +the active portion of the PWM period, in nanoseconds; value written
> +must not exceed period_ns. =A0Read to obtain current duty_ns, which =
may
> +be slightly different than the value requested due to hardware
> +limitations.
> +
> +tick_hz (r) -- indicates the base tick rate of the underlying
> +hardware, in nanoseconds. =A0Returns '0' if the rate is not yet know=
n,
> +which might be the case if the device has not been requested yet (so=
me
> +drivers don't initialize this value until the hardware is requested,
> +because the value is dynamic).
> +
> +run (rw) -- write '1' to start PWM signal generation, '0' to stop.
> +Read to determine whether the PWM device is running or not.

I'm not convinced that a sysfs interface is the right thing to do.
The more I look at gpio, the more I wish it didn't have the sysfs
mechanism.  sysfs has abi stability issues and it's difficult to
ensure it isn't racy when using it to control more than one thing.
I'd prefer the sysfs code to be split into a separate .c file and a
separate patch so it can be reviewed as a separate piece.

Need to be particularly careful about it since this creates a new
user-space ABI which must be preserved for all time.  It cannot be
taken lightly.

> +
> +
> +Using the API to Generate PWM Signals -- Advanced Functions
> +
> +pwm_config() -- Passes a pwm_config structure to the associated devi=
ce
> +driver. =A0This function is invoked by pwm_start(), pwm_duty_ns(),
> +etc. and is one of two main entry points to the PWM driver for the
> +hardware being used. =A0The configuration change is guaranteed atomi=
c if
> +multiple configuration changes are specified by the config structure=
=2E
> +This function might sleep, depending on what the device driver has t=
o
> +do to satisfy the request. =A0All PWM device drivers must support th=
is
> +entry point.
> +
> +pwm_config_nosleep() -- Passes a pwm_config structure to the
> +associated device driver. =A0If the driver must sleep in order to
> +implement the requested configuration change, -EWOULDBLOCK is
> +returned. =A0Users may call this function from interrupt handlers, t=
imer
> +handlers, and other interrupt contexts, but must confine their
> +configuration changes to only those that the driver can implement
> +without sleeping. =A0This is the other main entry point into the PWM
> +hardware driver, but not all device drivers support this entry point=
=2E
> +
> +pwm_synchronize(), pwm_unsynchronize() -- "Synchronizes" two or more
> +PWM channels, if the underlying hardware permits. =A0(If it doesn't,=
 the
> +framework facilitates emulating this capability but it is not yet
> +implemented). =A0Synchronized channels will start and stop
> +simultaneously when any single channel in the group is started or
> +stopped. =A0Use pwm_unsynchronize(..., NULL) to completely detach a
> +channel from any other synchronized channels. =A0By default, all PWM
> +channels are unsynchronized.
> +
> +
> +Implementing a PWM Device API Driver -- Functions for Driver Authors
> +
> +
> +request -- (optional) Invoked each time a user requests a channel.
> +Use to turn on clocks, clean up register states, etc. =A0The framewo=
rk
> +takes care of device locking/unlocking; you will see only successful
> +requests.
> +
> +release -- (optional) Invoked each time a user relinquishes a channe=
l.
> +The framework will have already stopped, unsynchronized and un-handl=
ed
> +the channel. =A0Use to turn off clocks, etc. as necessary.
> +
> +config -- Invoked to change the device configuration, always from a
> +sleep-compatible context. =A0All the changes indicated must be perfo=
rmed
> +atomically, ideally synchronized to an end-of-period event (so that
> +you avoid short or long output pulses). =A0You may sleep, etc. as
> +necessary within this function.
> +
> +config_nosleep -- (optional) Invoked to change device configuration
> +from within a context that is not allowed to sleep. =A0If you cannot
> +perform the requested configuration changes without sleeping, return
> +-EWOULDBLOCK.
> +
> +
> +FAQs and Additional Notes
> +
> +The Atmel PWMC pwm_config() function tries to satisfy the user's
> +configuration request by first invoking pwm_config_nosleep(). =A0If =
that
> +operation fails, then the PWM peripheral is brought to a synchronize=
d
> +stop, the configuration changes are made, and the device is restarte=
d.
> +
> +The Atmel PWMC's use of pwm_config_nosleep() from pwm_config()
> +minimizes redundant code between the two functions, and relieves the
> +pwm_config() function of the need to explicitly test whether a
> +requested configuration change can be carried out while the PWM devi=
ce
> +is in its current mode.
> +
> +PWM API driver authors are encouraged to adopt the Atmel PWMC's
> +pwm_config()-vs.-pwm_config_nosleep() strategy in implementations fo=
r
> +other devices as well.
> +
> +
> +Acknowledgements
> +
> +The author expresses his gratitude to the countless developers who
> +have reviewed and submitted feedback on the various versions of the
> +Generic PWM Device API code, and those who have submitted drivers an=
d
> +applications that use the framework. =A0You know who you are. =A0;)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b4b9cd..fe55958 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5051,6 +5051,14 @@ S: =A0 =A0 =A0 Maintained
> =A0F: =A0 =A0 Documentation/video4linux/README.pvrusb2
> =A0F: =A0 =A0 drivers/media/video/pvrusb2/
>
> +PWM DEVICE API
> +M: =A0 =A0 Bill Gatliff <bgat@billgatliff.com>
> +L: =A0 =A0 linux-embedded@vger.kernel.org
> +T: =A0 =A0 git git://git.billgatliff.com/pwm.git
> +S: =A0 =A0 Maintained
> +F: =A0 =A0 Documentation/pwm.txt
> +F: =A0 =A0 drivers/pwm/
> +
> =A0PXA2xx/PXA3xx SUPPORT
> =A0M: =A0 =A0 Eric Miao <eric.y.miao@gmail.com>
> =A0M: =A0 =A0 Russell King <linux@arm.linux.org.uk>
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 177c7d1..bc75da5 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -56,6 +56,8 @@ source "drivers/pps/Kconfig"
>
> =A0source "drivers/gpio/Kconfig"
>
> +source "drivers/pwm/Kconfig"
> +
> =A0source "drivers/w1/Kconfig"
>
> =A0source "drivers/power/Kconfig"
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 3f135b6..132a823 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -6,6 +6,8 @@
> =A0#
>
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D gpio=
/
> +obj-$(CONFIG_GENERIC_PWM) =A0 =A0 =A0+=3D pwm/
> +
> =A0obj-$(CONFIG_PCI) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D pci/
> =A0obj-$(CONFIG_PARISC) =A0 =A0 =A0 =A0 =A0 +=3D parisc/
> =A0obj-$(CONFIG_RAPIDIO) =A0 =A0 =A0 =A0 =A0+=3D rapidio/
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> new file mode 100644
> index 0000000..bc550f7
> --- /dev/null
> +++ b/drivers/pwm/Kconfig
> @@ -0,0 +1,10 @@
> +#
> +# PWM infrastructure and devices
> +#
> +
> +menuconfig GENERIC_PWM
> + =A0 =A0 =A0 tristate "PWM Support"
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Enables PWM device support implemented via a generi=
c
> + =A0 =A0 =A0 =A0 framework. =A0If unsure, say N.
> +
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> new file mode 100644
> index 0000000..7baa201
> --- /dev/null
> +++ b/drivers/pwm/Makefile
> @@ -0,0 +1,4 @@
> +#
> +# Makefile for pwm devices
> +#
> +obj-$(CONFIG_GENERIC_PWM) :=3D pwm.o
> diff --git a/drivers/pwm/pwm.c b/drivers/pwm/pwm.c
> new file mode 100644
> index 0000000..9a08fea
> --- /dev/null
> +++ b/drivers/pwm/pwm.c
> @@ -0,0 +1,580 @@
> +/*
> + * PWM API implementation
> + *
> + * Copyright (C) 2011 Bill Gatliff <bgat@billgatliff.com>
> + * Copyright (C) 2011 Arun Murthy <arun.murthy@stericsson.com>
> + *
> + * This program is free software; you may redistribute and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, b=
ut
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the G=
NU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-13=
07
> + * USA
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/sched.h>
> +#include <linux/pwm/pwm.h>
> +
> +static const char *REQUEST_SYSFS =3D "sysfs";
> +static struct class pwm_class;
> +
> +void pwm_set_drvdata(struct pwm_device *p, void *data)
> +{
> + =A0 =A0 =A0 dev_set_drvdata(&p->dev, data);
> +}
> +EXPORT_SYMBOL(pwm_set_drvdata);
> +
> +void *pwm_get_drvdata(const struct pwm_device *p)
> +{
> + =A0 =A0 =A0 return dev_get_drvdata(&p->dev);
> +}
> +EXPORT_SYMBOL(pwm_get_drvdata);

Are the set/get drvdata hooks really needed?  Wouldn't a driver
registering pwm_devices simply wrap the structure with its own private
data?  drvdata is typically only needed when the device registration
code is separate from the device driver code.

> +
> +static inline struct pwm_device *to_pwm_device(struct device *dev)
> +{
> + =A0 =A0 =A0 return container_of(dev, struct pwm_device, dev);
> +}
> +
> +static int pwm_match_name(struct device *dev, void *name)
> +{
> + =A0 =A0 =A0 return !strcmp(name, dev_name(dev));
> +}
> +
> +static int __pwm_request(struct pwm_device *p, const char *label)
> +{
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 if (!try_module_get(p->ops->owner))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> +
> + =A0 =A0 =A0 ret =3D test_and_set_bit(PWM_FLAG_REQUESTED, &p->flags)=
;
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_flag_requested;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 p->label =3D label;
> +
> + =A0 =A0 =A0 if (p->ops->request) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D p->ops->request(p);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_request_ops;
> +
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +
> +err_request_ops:
> + =A0 =A0 =A0 clear_bit(PWM_FLAG_REQUESTED, &p->flags);
> +
> +err_flag_requested:
> + =A0 =A0 =A0 module_put(p->ops->owner);
> + =A0 =A0 =A0 return ret;
> +}
> +
> +/**
> + * pwm_request - request a PWM device by name

Nit: kerneldoc format has () after the function name.

> + *
> + * @name: name of PWM device
> + * @label: label that identifies requestor
> + *
> + * The @name format is driver-specific, but is typically of the form
> + * "<bus_id>:<chan>". =A0For example, "atmel_pwmc:1" identifies the
> + * second ATMEL PWMC peripheral channel.
> + *
> + * Returns a pointer to the requested PWM device on success, -EINVAL
> + * otherwise.
> + */
> +struct pwm_device *pwm_request(const char *name, const char *label)
> +{

So, the last time I actually was able to look at these patches was
almost a year ago.  At that time I had two major concerns.  First, I
don't at all think this should be a new subsystem.  I know you
disagree, but I strongly think that pwm management is sufficiently
similar to gpio management that it needs to be the same subsystem.
All of the things that need to be done for request, release and
enumeration are essentially the same, and conceptually they I think
they need to be managed within the same namespace.

Second, I deeply dislike the model of matching devices by name
(string).  My opinion is it is too easy to break, and it depends on
the having control over how a device is actually going to get named
(which may be true for the current users, but it won't be true for pwm
devices on add-in or hot plugged devices).  Basically, in order to be
dynamic-registration friendly, the API needs to assume that any device
names/ids are dynamically assigned by the kernel.  A better mechanism
is something like a direct pointer to the pwm instance, or an explicit
reference like a phandle in a device tree (required for powerpc).

It may be fine to have a lookup-by-name mechanism on top of the api,
but it should not be the primary interface for referencing a specific
device.

> + =A0 =A0 =A0 struct device *d;
> + =A0 =A0 =A0 struct pwm_device *p;
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 d =3D class_find_device(&pwm_class, NULL, (char*)name, =
pwm_match_name);
> + =A0 =A0 =A0 if (!d)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-EINVAL);
> +
> + =A0 =A0 =A0 p =3D to_pwm_device(d);
> + =A0 =A0 =A0 ret =3D __pwm_request(p, label);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 put_device(d);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(ret);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return p;
> +}
> +EXPORT_SYMBOL(pwm_request);

EXPORT_SYMBOL_GPL()

> +static struct class pwm_class =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pwm",
> + =A0 =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 .dev_attrs =A0 =A0 =A0=3D pwm_dev_attrs,
> +};

=46rom my understanding, class is deprecated.  I believe you should be
using bus_type directly now.  Check with Greg and Kay.

> +
> +static void __pwm_release(struct device *dev)
> +{
> + =A0 =A0 =A0 struct pwm_device *p =3D container_of(dev, struct pwm_d=
evice, dev);
> + =A0 =A0 =A0 kfree(p);
> +}
> +
> +/**
> + * pwm_register - registers a PWM device
> + *
> + * @ops: PWM device operations
> + * @parent: reference to parent device, if any
> + * @fmt: printf-style format specifier for device name
> + */
> +struct pwm_device *pwm_register(const struct pwm_device_ops *ops,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
device *parent, const char *fmt, ...)
> +{
> + =A0 =A0 =A0 struct pwm_device *p;
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 va_list vargs;
> +
> + =A0 =A0 =A0 if (!ops || !ops->config)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-EINVAL);
> +
> + =A0 =A0 =A0 p =3D kzalloc(sizeof(*p), GFP_KERNEL);
> + =A0 =A0 =A0 if (!p)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-ENOMEM);

I'd rather see the caller responsible for allocating the pwm_devices
so that it can wrap is with its own structure as needed.

> +
> + =A0 =A0 =A0 p->ops =3D ops;
> +
> + =A0 =A0 =A0 p->dev.class =3D &pwm_class;
> + =A0 =A0 =A0 p->dev.parent =3D parent;
> + =A0 =A0 =A0 p->dev.release =3D __pwm_release;
> +
> + =A0 =A0 =A0 va_start(vargs, fmt);
> + =A0 =A0 =A0 ret =3D kobject_set_name_vargs(&p->dev.kobj, fmt, vargs=
);
> +
> + =A0 =A0 =A0 ret =3D device_register(&p->dev);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> +
> + =A0 =A0 =A0 return p;
> +
> +err:
> + =A0 =A0 =A0 put_device(&p->dev);
> + =A0 =A0 =A0 return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(pwm_register);
> +
> +void pwm_unregister(struct pwm_device *p)
> +{
> + =A0 =A0 =A0 device_unregister(&p->dev);
> +}
> +EXPORT_SYMBOL(pwm_unregister);
> +
> +static int __init pwm_init(void)
> +{
> + =A0 =A0 =A0 return class_register(&pwm_class);
> +}
> +
> +static void __exit pwm_exit(void)
> +{
> + =A0 =A0 =A0 class_unregister(&pwm_class);
> +}
> +
> +postcore_initcall(pwm_init);
> +module_exit(pwm_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Bill Gatliff <bgat@billgatliff.com>");
> +MODULE_DESCRIPTION("Generic PWM device API implementation");
> diff --git a/include/linux/pwm/pwm.h b/include/linux/pwm/pwm.h
> new file mode 100644
> index 0000000..64707a7
> --- /dev/null
> +++ b/include/linux/pwm/pwm.h
> @@ -0,0 +1,140 @@
> +/*
> + * Copyright (C) 2011 Bill Gatliff <bgat@billgatliff.com>
> + * Copyright (C) 2011 Arun Murthy <arun.murth@stericsson.com>
> + *
> + * This program is free software; you may redistribute and/or modify
> + * it under the terms of the GNU General Public License version 2, a=
s
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, b=
ut
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the G=
NU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-13=
07
> + * USA
> + */
> +#ifndef __LINUX_PWM_H
> +#define __LINUX_PWM_H
> +
> +#include <linux/device.h>
> +
> +enum {
> + =A0 =A0 =A0 PWM_FLAG_REQUESTED =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 PWM_FLAG_STOP =A0 =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 PWM_FLAG_RUNNING =A0 =A0 =A0 =A0=3D 2,
> + =A0 =A0 =A0 PWM_FLAG_EXPORTED =A0 =A0 =A0 =3D 3,
> +};
> +
> +enum {
> + =A0 =A0 =A0 PWM_CONFIG_DUTY_TICKS =A0 =3D 0,
> + =A0 =A0 =A0 PWM_CONFIG_PERIOD_TICKS =3D 1,
> + =A0 =A0 =A0 PWM_CONFIG_POLARITY =A0 =A0 =3D 2,
> + =A0 =A0 =A0 PWM_CONFIG_START =A0 =A0 =A0 =A0=3D 3,
> + =A0 =A0 =A0 PWM_CONFIG_STOP =A0 =A0 =A0 =A0 =3D 4,
> +};
> +
> +struct pwm_config;
> +struct pwm_device;
> +
> +struct pwm_device_ops {
> + =A0 =A0 =A0 struct module *owner;
> +
> + =A0 =A0 =A0 int =A0 =A0 (*request) =A0 =A0 =A0 =A0 =A0 =A0 =A0(stru=
ct pwm_device *p);
> + =A0 =A0 =A0 void =A0 =A0(*release) =A0 =A0 =A0 =A0 =A0 =A0 =A0(stru=
ct pwm_device *p);
> + =A0 =A0 =A0 int =A0 =A0 (*config) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (stru=
ct pwm_device *p,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct pwm_config *c);
> + =A0 =A0 =A0 int =A0 =A0 (*config_nosleep) =A0 =A0 =A0 (struct pwm_d=
evice *p,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct pwm_config *c);
> + =A0 =A0 =A0 int =A0 =A0 (*synchronize) =A0 =A0 =A0 =A0 =A0(struct p=
wm_device *p,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct pwm_device *to_p);
> + =A0 =A0 =A0 int =A0 =A0 (*unsynchronize) =A0 =A0 =A0 =A0(struct pwm=
_device *p,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct pwm_device *from_p);
> +};
> +
> +/**
> + * struct pwm_config - configuration data for a PWM device
> + *
> + * @config_mask: which fields are valid
> + * @duty_ticks: requested duty cycle, in ticks
> + * @period_ticks: requested period, in ticks
> + * @polarity: active high (1), or active low (0)
> + */
> +struct pwm_config {
> + =A0 =A0 =A0 unsigned long =A0 config_mask;
> + =A0 =A0 =A0 unsigned long =A0 duty_ticks;
> + =A0 =A0 =A0 unsigned long =A0 period_ticks;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 polarity;
> +};
> +
> +/**
> + * struct pwm_device - represents a PWM device
> + *
> + * @dev: device model reference
> + * @ops: operations supported by the PWM device
> + * @label: requestor of the PWM device, or NULL
> + * @flags: PWM device state, see FLAG_*
> + * @tick_hz: base tick rate of PWM device, in HZ
> + * @polarity: active high (1), or active low (0)
> + * @period_ticks: PWM device's current period, in ticks
> + * @duty_ticks: duration of PWM device's active cycle, in ticks
> + */
> +struct pwm_device {
> + =A0 =A0 =A0 struct device =A0 dev;
> + =A0 =A0 =A0 const struct pwm_device_ops *ops;
> + =A0 =A0 =A0 const char =A0 =A0 =A0*label;
> + =A0 =A0 =A0 unsigned long =A0 flags;
> + =A0 =A0 =A0 unsigned long =A0 tick_hz;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 polarity;
> + =A0 =A0 =A0 unsigned long =A0 period_ticks;
> + =A0 =A0 =A0 unsigned long =A0 duty_ticks;
> +};
> +
> +struct pwm_device *pwm_request(const char *name, const char *label);
> +void pwm_release(struct pwm_device *p);

Missing 'extern' in front of all the forward declarations.

> +
> +static inline int pwm_is_requested(const struct pwm_device *p)
> +{
> + =A0 =A0 =A0 return test_bit(PWM_FLAG_REQUESTED, &p->flags);
> +}
> +
> +static inline int pwm_is_running(const struct pwm_device *p)
> +{
> + =A0 =A0 =A0 return test_bit(PWM_FLAG_RUNNING, &p->flags);
> +}
> +
> +static inline int pwm_is_exported(const struct pwm_device *p)
> +{
> + =A0 =A0 =A0 return test_bit(PWM_FLAG_EXPORTED, &p->flags);
> +}
> +
> +struct pwm_device *pwm_register(const struct pwm_device_ops *ops, st=
ruct device *parent,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const c=
har *fmt, ...);
> +void pwm_unregister(struct pwm_device *p);
> +
> +void pwm_set_drvdata(struct pwm_device *p, void *data);
> +void *pwm_get_drvdata(const struct pwm_device *p);
> +
> +int pwm_set(struct pwm_device *p, unsigned long period_ns,
> + =A0 =A0 =A0 =A0 =A0 unsigned long duty_ns, int polarity);
> +
> +int pwm_set_period_ns(struct pwm_device *p, unsigned long period_ns)=
;
> +unsigned long pwm_get_period_ns(struct pwm_device *p);
> +
> +int pwm_set_duty_ns(struct pwm_device *p, unsigned long duty_ns);
> +unsigned long pwm_get_duty_ns(struct pwm_device *p);
> +
> +int pwm_set_polarity(struct pwm_device *p, int polarity);
> +
> +int pwm_start(struct pwm_device *p);
> +int pwm_stop(struct pwm_device *p);
> +
> +int pwm_config_nosleep(struct pwm_device *p, struct pwm_config *c);
> +int pwm_config(struct pwm_device *p, struct pwm_config *c);
> +
> +int pwm_synchronize(struct pwm_device *p, struct pwm_device *to_p);
> +int pwm_unsynchronize(struct pwm_device *p, struct pwm_device *from_=
p);
> +
> +#endif
> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
