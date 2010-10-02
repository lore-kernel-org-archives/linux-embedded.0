From: Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Sat, 2 Oct 2010 00:13:30 -0500
Message-ID: <AANLkTin+VW5bCkxn0tYvy7A1oSswUtuxZnsjzQdKU4JX@mail.gmail.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
	<87eic97eum.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <87eic97eum.fsf@deeprootsystems.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kevin Hilman <khilman@deeprootsystems.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, Varun Jewalikar <varunjewalikar@hotmail.com>, scott@jumpnowtek.com

On Fri, Oct 1, 2010 at 5:00 PM, Kevin Hilman
<khilman@deeprootsystems.com> wrote:
> Bill Gatliff <bgat@billgatliff.com> writes:
>
>> Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
>
> Hi Bill,
>
> Any plans to post this to a broader audience? =A0maybe linux-arm-kern=
el?
>
> On davinci, I recently received a patch[1] for a davinci PWM layer wh=
ich
> allows the mulitple available PWM devices on davinci to make themselv=
es
> available by using the existing PWM API. =A0It just added a pwm_add()=
 and
> pwm_remove() function to the existing API to do this. =A0Not being
> terribly familiar with all the PWM implementations out there, I was
> suprised to see that something like this didn't exist.
>
> I will ask the author of the davinci PWM code to have a look at your
> stuff as well.

Also, Varun and Scott also have submitted PWM patches for OMAP [2] and
I hope they will look at this patch set and comment.  If I get a
chance, and I never do, I will try these myself.  I hope that baseline
PWM support is accepted soon.

[2] http://www.mail-archive.com/linux-embedded@vger.kernel.org/msg02851=
=2Ehtml

>
> Thanks,
>
> Kevin
>
> [1] http://linux.davincidsp.com/pipermail/davinci-linux-open-source/2=
010-September/020338.html
>
>> ---
>> =A0Documentation/pwm.txt =A0 | =A0260 +++++++++++++++++++
>> =A0drivers/pwm/pwm.c =A0 =A0 =A0 | =A0635 ++++++++++++++++++++++++++=
+++++++++++++++++++++
>> =A0include/linux/pwm.h =A0 =A0 | =A0 31 ---
>> =A0include/linux/pwm/pwm.h | =A0128 ++++++++++
>> =A04 files changed, 1023 insertions(+), 31 deletions(-)
>> =A0create mode 100644 Documentation/pwm.txt
>> =A0create mode 100644 drivers/pwm/pwm.c
>> =A0delete mode 100644 include/linux/pwm.h
>> =A0create mode 100644 include/linux/pwm/pwm.h
>>
>> diff --git a/Documentation/pwm.txt b/Documentation/pwm.txt
>> new file mode 100644
>> index 0000000..34b1e5a
>> --- /dev/null
>> +++ b/Documentation/pwm.txt
>> @@ -0,0 +1,260 @@
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Generic PWM Device API
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0August 5, 2010
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Bill Gatlif=
f
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<bgat@billgatliff.c=
om>
>> +
>> +
>> +
>> +The code in drivers/pwm and include/linux/pwm/ implements an API fo=
r
>> +applications involving pulse-width-modulation signals. =A0This docu=
ment
>> +describes how the API implementation facilitates both PWM-generatin=
g
>> +devices, and users of those devices.
>> +
>> +
>> +
>> +Motivation
>> +
>> +The primary goals for implementing the "generic PWM API" are to
>> +consolidate the various PWM implementations within a consistent and
>> +redundancy-reducing framework, and to facilitate the use of
>> +hotpluggable PWM devices.
>> +
>> +Previous PWM-related implementations within the Linux kernel achiev=
ed
>> +their consistency via cut-and-paste, but did not need to (and didn'=
t)
>> +facilitate more than one PWM-generating device within the system---
>> +hotplug or otherwise. =A0The Generic PWM Device API might be most
>> +appropriately viewed as an update to those implementations, rather
>> +than a complete rewrite.
>> +
>> +
>> +
>> +Challenges
>> +
>> +One of the difficulties in implementing a generic PWM framework is =
the
>> +fact that pulse-width-modulation applications involve real-world
>> +signals, which often must be carefully managed to prevent destructi=
on
>> +of hardware that is linked to those signals. =A0A DC motor that
>> +experiences a brief interruption in the PWM signal controlling it
>> +might destructively overheat; it could suddenly change speed, losin=
g
>> +synchronization with a sensor; it could even suddenly change direct=
ion
>> +or torque, breaking the mechanical device connected to it.
>> +
>> +(A generic PWM device framework is not directly responsible for
>> +preventing the above scenarios: that responsibility lies with the
>> +hardware designer, and the application and driver authors. =A0But i=
t
>> +must to the greatest extent possible make it easy to avoid such
>> +problems).
>> +
>> +A generic PWM device framework must accommodate the substantial
>> +differences between available PWM-generating hardware devices, with=
out
>> +becoming sub-optimal for any of them.
>> +
>> +Finally, a generic PWM device framework must be relatively
>> +lightweight, computationally speaking. =A0Some PWM users demand
>> +high-speed outputs, plus the ability to regulate those outputs
>> +quickly. =A0A device framework must be able to "keep up" with such
>> +hardware, while still leaving time to do real work.
>> +
>> +The Generic PWM Device API is an attempt to meet all of the above
>> +requirements. =A0At its initial publication, the API was already in=
 use
>> +managing small DC motors, sensors and solenoids through a
>> +custom-designed, optically-isolated H-bridge driver.
>> +
>> +
>> +
>> +Functional Overview
>> +
>> +The Generic PWM Device API framework is implemented in
>> +include/linux/pwm/pwm.h and drivers/pwm/pwm.c. =A0The functions the=
rein
>> +use information from pwm_device, pwm_channel and pwm_channel_config
>> +structures to invoke services in PWM peripheral device drivers.
>> +Consult drivers/pwm/atmel-pwm.c for an example driver.
>> +
>> +There are two classes of adopters of the PWM framework:
>> +
>> + =A0"Users" -- those wishing to employ the API merely to produce PW=
M
>> + =A0signals; once they have identified the appropriate physical out=
put
>> + =A0on the platform in question, they don't care about the details =
of
>> + =A0the underlying hardware
>> +
>> + =A0"Driver authors" -- those wishing to bind devices that can gene=
rate
>> + =A0PWM signals to the Generic PWM Device API, so that the services=
 of
>> + =A0those devices become available to users. Assuming the hardware =
can
>> + =A0support the needs of a user, driver authors don't care about th=
e
>> + =A0details of the user's application
>> +
>> +Generally speaking, users will first invoke pwm_request() to obtain=
 a
>> +handle to a PWM device. =A0They will then pass that handle to funct=
ions
>> +like pwm_duty_ns() and pwm_period_ns() to set the duty cycle and
>> +period of the PWM signal, respectively. =A0They will also invoke
>> +pwm_start() and pwm_stop() to turn the signal on and off.
>> +
>> +The Generic PWM API framework also provides a sysfs interface to PW=
M
>> +devices, which is adequate for basic application needs and testing.
>> +
>> +Driver authors fill out a pwm_device structure, which describes the
>> +capabilities of the PWM hardware being constructed--- including the
>> +number of distinct output "channels" the peripheral offers. =A0They=
 then
>> +invoke pwm_register() (usually from within their device's probe()
>> +handler) to make the PWM API aware of their device. =A0The framewor=
k
>> +will call back to the methods described in the pwm_device structure=
 as
>> +users begin to configure and utilize the hardware.
>> +
>> +Note that PWM signals can be produced by a variety of peripherals,
>> +beyond the true "PWM hardware" offered by many system-on-chip devic=
es.
>> +Other possibilities include timer/counters with compare-match
>> +capabilities, carefully-programmed synchronous serial ports
>> +(e.g. SPI), and GPIO pins driven by kernel interval timers. =A0With=
 a
>> +proper pwm_device structure, these devices and pseudo-devices can a=
ll
>> +be accommodated by the Generic PWM Device API framework.
>> +
>> +
>> +
>> +Using the API to Generate PWM Signals -- Basic Functions for Users
>> +
>> +
>> +pwm_request() -- Returns a pwm_channel pointer, which is subsequent=
ly
>> +passed to the other user-related PWM functions. =A0Once requested, =
a PWM
>> +channel is marked as in-use and subsequent requests prior to
>> +pwm_release() will fail.
>> +
>> +The names used to refer to PWM devices are defined by driver author=
s.
>> +Typically they are platform device bus identifiers, and this
>> +convention is encouraged for consistency.
>> +
>> +
>> +pwm_release() -- Marks a PWM channel as no longer in use. =A0The PW=
M
>> +device is stopped before it is released by the API.
>> +
>> +
>> +pwm_period_ns() -- Specifies the PWM signal's period, in nanosecond=
s.
>> +
>> +
>> +pwm_duty_ns() -- Specifies the PWM signal's active duration, in nan=
oseconds.
>> +
>> +
>> +pwm_duty_percent() -- Specifies the PWM signal's active duration, a=
s a
>> +percentage of the current period of the signal. =A0NOTE: this value=
 is
>> +not recalculated if the period of the signal is subsequently change=
d.
>> +
>> +
>> +pwm_start(), pwm_stop() -- Turns the PWM signal on and off. =A0Exce=
pt
>> +where stated otherwise by a driver author, signals are stopped at t=
he
>> +end of the current period, at which time the output is set to its
>> +inactive state.
>> +
>> +
>> +pwm_polarity() -- Defines whether the PWM signal output's active
>> +region is "1" or "0". =A0A 10% duty-cycle, polarity=3D1 signal will
>> +conventionally be at 5V (or 3.3V, or 1000V, or whatever the platfor=
m
>> +hardware does) for 10% of the period. =A0The same configuration of =
a
>> +polarity=3D0 signal will be at 5V (or 3.3V, or ...) for 90% of the
>> +period.
>> +
>> +
>> +
>> +Using the API to Generate PWM Signals -- Advanced Functions
>> +
>> +
>> +pwm_config() -- Passes a pwm_channel_config structure to the
>> +associated device driver. =A0This function is invoked by pwm_start(=
),
>> +pwm_duty_ns(), etc. and is one of two main entry points to the PWM
>> +driver for the hardware being used. =A0The configuration change is
>> +guaranteed atomic if multiple configuration changes are specified.
>> +This function might sleep, depending on what the device driver has =
to
>> +do to satisfy the request. =A0All PWM device drivers must support t=
his
>> +entry point.
>> +
>> +
>> +pwm_config_nosleep() -- Passes a pwm_channel_config structure to th=
e
>> +associated device driver. =A0If the driver must sleep in order to
>> +implement the requested configuration change, -EWOULDBLOCK is
>> +returned. =A0Users may call this function from interrupt handlers, =
for
>> +example. =A0This is the other main entry point into the PWM hardwar=
e
>> +driver, but not all device drivers support this entry point.
>> +
>> +
>> +pwm_synchronize(), pwm_unsynchronize() -- "Synchronizes" two or mor=
e
>> +PWM channels, if the underlying hardware permits. =A0(If it doesn't=
, the
>> +framework facilitates emulating this capability but it is not yet
>> +implemented). =A0Synchronized channels will start and stop
>> +simultaneously when any single channel in the group is started or
>> +stopped. =A0Use pwm_unsynchronize(..., NULL) to completely detach a
>> +channel from any other synchronized channels. =A0By default, all PW=
M
>> +channels are unsynchronized.
>> +
>> +
>> +pwm_set_handler() -- Defines an end-of-period callback. =A0The indi=
cated
>> +function will be invoked in a worker thread at the end of each PWM
>> +period, and can subsequently invoke pwm_config(), etc. =A0Must be u=
sed
>> +with extreme care for high-speed PWM outputs. =A0Set the handler
>> +function to NULL to un-set the handler.
>> +
>> +
>> +
>> +Implementing a PWM Device API Driver -- Functions for Driver Author=
s
>> +
>> +
>> +Fill out the appropriate fields in a pwm_device structure, and subm=
it
>> +to pwm_register():
>> +
>> +
>> +bus_id -- the plain-text name of the device. =A0Users will bind to =
a
>> +channel on the device using this name plus the channel number. =A0F=
or
>> +example, the Atmel PWMC's bus_id is "atmel_pwmc", the same as used =
by
>> +the platform device driver (recommended). =A0The first device regis=
tered
>> +thereby receives bus_id "atmel_pwmc.0", which is what you put in
>> +pwm_device.bus_id. =A0Channels are then named "atmel_pwmc.0:[0-3]".
>> +(Hint: just use pdev->dev.bus_id in your probe() method).
>> +
>> +
>> +nchan -- the number of distinct output channels provided by the dev=
ice.
>> +
>> +
>> +request -- (optional) Invoked each time a user requests a channel.
>> +Use to turn on clocks, clean up register states, etc. =A0The framew=
ork
>> +takes care of device locking/unlocking; you will see only successfu=
l
>> +requests.
>> +
>> +
>> +free -- (optional) Callback for each time a user relinquishes a
>> +channel. =A0The framework will have already stopped, unsynchronized=
 and
>> +un-handled the channel. =A0Use to turn off clocks, etc. as necessar=
y.
>> +
>> +
>> +synchronize, unsynchronize -- (optional) Callbacks to
>> +synchronize/unsynchronize channels. =A0Some devices provide this
>> +capability in hardware; for others, it can be emulated (see
>> +atmel_pwmc.c's sync_mask for an example).
>> +
>> +
>> +set_callback -- (optional) Invoked when a user requests a handler. =
=A0If
>> +the hardware supports an end-of-period interrupt, invoke the functi=
on
>> +indicated during your interrupt handler. =A0The callback function i=
tself
>> +is always internal to the API, and does not map directly to the use=
r's
>> +callback function.
>> +
>> +
>> +config -- Invoked to change the device configuration, always from a
>> +sleep-capable context. =A0All the changes indicated must be perform=
ed
>> +atomically, ideally synchronized to an end-of-period event (so that
>> +you avoid short or long output pulses). =A0You may sleep, etc. as
>> +necessary within this function.
>> +
>> +
>> +config_nosleep -- (optional) Invoked to change device configuration
>> +from within a context that is not allowed to sleep. =A0If you canno=
t
>> +perform the requested configuration changes without sleeping, retur=
n
>> +-EWOULDBLOCK.
>> +
>> +
>> +
>> +Acknowledgements
>> +
>> +
>> +The author expresses his gratitude to the countless developers who
>> +have reviewed and submitted feedback on the various versions of the
>> +Generic PWM Device API code, and those who have submitted drivers a=
nd
>> +applications that use the framework. =A0You know who you are. =A0;)
>> +
>> diff --git a/drivers/pwm/pwm.c b/drivers/pwm/pwm.c
>> new file mode 100644
>> index 0000000..2774116
>> --- /dev/null
>> +++ b/drivers/pwm/pwm.c
>> @@ -0,0 +1,635 @@
>> +/*
>> + * drivers/pwm/pwm.c
>> + *
>> + * Copyright (C) 2010 Bill Gatliff <bgat@billgatliff.com>
>> + *
>> + * This program is free software; you may redistribute and/or modif=
y
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, =
but
>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the =
GNU
>> + * General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public Licens=
e
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1=
307
>> + * USA
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/slab.h>
>> +#include <linux/device.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/fs.h>
>> +#include <linux/completion.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/list.h>
>> +#include <linux/sched.h>
>> +#include <linux/pwm/pwm.h>
>> +
>> +static int __pwm_create_sysfs(struct pwm_device *pwm);
>> +
>> +static const char *REQUEST_SYSFS =3D "sysfs";
>> +static LIST_HEAD(pwm_device_list);
>> +static DEFINE_MUTEX(device_list_mutex);
>> +static struct class pwm_class;
>> +static struct workqueue_struct *pwm_handler_workqueue;
>> +
>> +int pwm_register(struct pwm_device *pwm)
>> +{
>> + =A0 =A0 struct pwm_channel *p;
>> + =A0 =A0 int wchan;
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 spin_lock_init(&pwm->list_lock);
>> +
>> + =A0 =A0 p =3D kcalloc(pwm->nchan, sizeof(*p), GFP_KERNEL);
>> + =A0 =A0 if (!p)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> +
>> + =A0 =A0 for (wchan =3D 0; wchan < pwm->nchan; wchan++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_init(&p[wchan].lock);
>> + =A0 =A0 =A0 =A0 =A0 =A0 init_completion(&p[wchan].complete);
>> + =A0 =A0 =A0 =A0 =A0 =A0 p[wchan].chan =3D wchan;
>> + =A0 =A0 =A0 =A0 =A0 =A0 p[wchan].pwm =3D pwm;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 pwm->channels =3D p;
>> +
>> + =A0 =A0 mutex_lock(&device_list_mutex);
>> +
>> + =A0 =A0 list_add_tail(&pwm->list, &pwm_device_list);
>> + =A0 =A0 ret =3D __pwm_create_sysfs(pwm);
>> + =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&device_list_mutex);
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_create_sysfs;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 mutex_unlock(&device_list_mutex);
>> +
>> + =A0 =A0 dev_info(pwm->dev, "%d channel%s\n", pwm->nchan,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0pwm->nchan > 1 ? "s" : "");
>> + =A0 =A0 return 0;
>> +
>> +err_create_sysfs:
>> + =A0 =A0 kfree(p);
>> +
>> + =A0 =A0 return ret;
>> +}
>> +EXPORT_SYMBOL(pwm_register);
>> +
>> +static int __match_device(struct device *dev, void *data)
>> +{
>> + =A0 =A0 return dev_get_drvdata(dev) =3D=3D data;
>> +}
>> +
>> +int pwm_unregister(struct pwm_device *pwm)
>> +{
>> + =A0 =A0 int wchan;
>> + =A0 =A0 struct device *dev;
>> +
>> + =A0 =A0 mutex_lock(&device_list_mutex);
>> +
>> + =A0 =A0 for (wchan =3D 0; wchan < pwm->nchan; wchan++) {
>> + =A0 =A0 =A0 if (pwm->channels[wchan].flags & BIT(FLAG_REQUESTED)) =
{
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&device_list_=
mutex);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 for (wchan =3D 0; wchan < pwm->nchan; wchan++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev =3D class_find_device(&pwm_class, NULL=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &pwm->channels[wchan],
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __match_device);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (dev) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 put_device(dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_unregister(dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 kfree(pwm->channels);
>> + =A0 =A0 list_del(&pwm->list);
>> + =A0 =A0 mutex_unlock(&device_list_mutex);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +EXPORT_SYMBOL(pwm_unregister);
>> +
>> +static struct pwm_device *
>> +__pwm_find_device(const char *bus_id)
>> +{
>> + =A0 =A0 struct pwm_device *p;
>> +
>> + =A0 =A0 list_for_each_entry(p, &pwm_device_list, list) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!strcmp(bus_id, p->bus_id))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return p;
>> + =A0 =A0 }
>> + =A0 =A0 return NULL;
>> +}
>> +
>> +static int
>> +__pwm_request_channel(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *requester)
>> +{
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 if (test_and_set_bit(FLAG_REQUESTED, &p->flags))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
>> +
>> + =A0 =A0 if (p->pwm->request) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D p->pwm->request(p);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clear_bit(FLAG_REQUESTED, =
&p->flags);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 p->requester =3D requester;
>> + =A0 =A0 if (!strcmp(requester, REQUEST_SYSFS))
>> + =A0 =A0 =A0 =A0 =A0 =A0 p->pid =3D current->pid;
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +struct pwm_channel *
>> +pwm_request(const char *bus_id,
>> + =A0 =A0 =A0 =A0 int chan,
>> + =A0 =A0 =A0 =A0 const char *requester)
>> +{
>> + =A0 =A0 struct pwm_device *p;
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 mutex_lock(&device_list_mutex);
>> +
>> + =A0 =A0 p =3D __pwm_find_device(bus_id);
>> + =A0 =A0 if (!p || chan >=3D p->nchan)
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_no_device;
>> +
>> + =A0 =A0 if (!try_module_get(p->owner))
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_module_get_failed;
>> +
>> + =A0 =A0 ret =3D __pwm_request_channel(&p->channels[chan], requeste=
r);
>> + =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_request_failed;
>> +
>> + =A0 =A0 mutex_unlock(&device_list_mutex);
>> + =A0 =A0 return &p->channels[chan];
>> +
>> +err_request_failed:
>> + =A0 =A0 module_put(p->owner);
>> +err_module_get_failed:
>> +err_no_device:
>> + =A0 =A0 mutex_unlock(&device_list_mutex);
>> + =A0 =A0 return NULL;
>> +}
>> +EXPORT_SYMBOL(pwm_request);
>> +
>> +void pwm_release(struct pwm_channel *p)
>> +{
>> + =A0 =A0 mutex_lock(&device_list_mutex);
>> +
>> + =A0 =A0 if (!test_and_clear_bit(FLAG_REQUESTED, &p->flags))
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto done;
>> +
>> + =A0 =A0 pwm_stop(p);
>> + =A0 =A0 pwm_unsynchronize(p, NULL);
>> + =A0 =A0 pwm_set_handler(p, NULL, NULL);
>> +
>> + =A0 =A0 if (p->pwm->release)
>> + =A0 =A0 =A0 =A0 =A0 =A0 p->pwm->release(p);
>> + =A0 =A0 module_put(p->pwm->owner);
>> +done:
>> + =A0 =A0 mutex_unlock(&device_list_mutex);
>> +}
>> +EXPORT_SYMBOL(pwm_release);
>> +
>> +unsigned long pwm_ns_to_ticks(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long =
nsecs)
>> +{
>> + =A0 =A0 unsigned long long ticks;
>> +
>> + =A0 =A0 ticks =3D nsecs;
>> + =A0 =A0 ticks *=3D p->tick_hz;
>> + =A0 =A0 do_div(ticks, 1000000000);
>> + =A0 =A0 return ticks;
>> +}
>> +EXPORT_SYMBOL(pwm_ns_to_ticks);
>> +
>> +unsigned long pwm_ticks_to_ns(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long =
ticks)
>> +{
>> + =A0 =A0 unsigned long long ns;
>> +
>> + =A0 =A0 if (!p->tick_hz)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> +
>> + =A0 =A0 ns =3D ticks;
>> + =A0 =A0 ns *=3D 1000000000UL;
>> + =A0 =A0 do_div(ns, p->tick_hz);
>> + =A0 =A0 return ns;
>> +}
>> +EXPORT_SYMBOL(pwm_ticks_to_ns);
>> +
>> +static void
>> +pwm_config_ns_to_ticks(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct pwm_channel_config *=
c)
>> +{
>> + =A0 =A0 if (c->config_mask & PWM_CONFIG_PERIOD_NS) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->period_ticks =3D pwm_ns_to_ticks(p, c->=
period_ns);
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->config_mask &=3D ~PWM_CONFIG_PERIOD_NS;
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->config_mask |=3D PWM_CONFIG_PERIOD_TICK=
S;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (c->config_mask & PWM_CONFIG_DUTY_NS) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->duty_ticks =3D pwm_ns_to_ticks(p, c->du=
ty_ns);
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->config_mask &=3D ~PWM_CONFIG_DUTY_NS;
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->config_mask |=3D PWM_CONFIG_DUTY_TICKS;
>> + =A0 =A0 }
>> +}
>> +
>> +static void
>> +pwm_config_percent_to_ticks(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pwm_channel=
_config *c)
>> +{
>> + =A0 =A0 if (c->config_mask & PWM_CONFIG_DUTY_PERCENT) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (c->config_mask & PWM_CONFIG_PERIOD_TIC=
KS)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c->duty_ticks =3D c->perio=
d_ticks;
>> + =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c->duty_ticks =3D p->perio=
d_ticks;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->duty_ticks *=3D c->duty_percent;
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->duty_ticks /=3D 100;
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->config_mask &=3D ~PWM_CONFIG_DUTY_PERCE=
NT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 c->config_mask |=3D PWM_CONFIG_DUTY_TICKS;
>> + =A0 =A0 }
>> +}
>> +
>> +int pwm_config_nosleep(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct pwm_channel_config *=
c)
>> +{
>> + =A0 =A0 if (!p->pwm->config_nosleep)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 pwm_config_ns_to_ticks(p, c);
>> + =A0 =A0 pwm_config_percent_to_ticks(p, c);
>> +
>> + =A0 =A0 return p->pwm->config_nosleep(p, c);
>> +}
>> +EXPORT_SYMBOL(pwm_config_nosleep);
>> +
>> +int pwm_config(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0struct pwm_channel_config *c)
>> +{
>> + =A0 =A0 int ret =3D 0;
>> +
>> + =A0 =A0 if (unlikely(!p->pwm->config))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 pwm_config_ns_to_ticks(p, c);
>> + =A0 =A0 pwm_config_percent_to_ticks(p, c);
>> +
>> + =A0 =A0 switch (c->config_mask & (PWM_CONFIG_PERIOD_TICKS
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | PWM_=
CONFIG_DUTY_TICKS)) {
>> + =A0 =A0 case PWM_CONFIG_PERIOD_TICKS:
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (p->duty_ticks > c->period_ticks) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 case PWM_CONFIG_DUTY_TICKS:
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (p->period_ticks < c->duty_ticks) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 case PWM_CONFIG_DUTY_TICKS | PWM_CONFIG_PERIOD_TICKS:
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (c->duty_ticks > c->period_ticks) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 }
>> +
>> +err:
>> + =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 return p->pwm->config(p, c);
>> +}
>> +EXPORT_SYMBOL(pwm_config);
>> +
>> +int pwm_set_period_ns(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long period_ns)
>> +{
>> + =A0 =A0 struct pwm_channel_config c =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .config_mask =3D PWM_CONFIG_PERIOD_TICKS,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .period_ticks =3D pwm_ns_to_ticks(p, perio=
d_ns),
>> + =A0 =A0 };
>> +
>> + =A0 =A0 return pwm_config(p, &c);
>> +}
>> +EXPORT_SYMBOL(pwm_set_period_ns);
>> +
>> +unsigned long pwm_get_period_ns(struct pwm_channel *p)
>> +{
>> + =A0 =A0 return pwm_ticks_to_ns(p, p->period_ticks);
>> +}
>> +EXPORT_SYMBOL(pwm_get_period_ns);
>> +
>> +int pwm_set_duty_ns(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long duty_ns)
>> +{
>> + =A0 =A0 struct pwm_channel_config c =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .config_mask =3D PWM_CONFIG_DUTY_TICKS,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .duty_ticks =3D pwm_ns_to_ticks(p, duty_ns=
),
>> + =A0 =A0 };
>> + =A0 =A0 return pwm_config(p, &c);
>> +}
>> +EXPORT_SYMBOL(pwm_set_duty_ns);
>> +
>> +unsigned long pwm_get_duty_ns(struct pwm_channel *p)
>> +{
>> + =A0 =A0 return pwm_ticks_to_ns(p, p->duty_ticks);
>> +}
>> +EXPORT_SYMBOL(pwm_get_duty_ns);
>> +
>> +int pwm_set_duty_percent(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int percent)
>> +{
>> + =A0 =A0 struct pwm_channel_config c =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .config_mask =3D PWM_CONFIG_DUTY_PERCENT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .duty_percent =3D percent,
>> + =A0 =A0 };
>> + =A0 =A0 return pwm_config(p, &c);
>> +}
>> +EXPORT_SYMBOL(pwm_set_duty_percent);
>> +
>> +int pwm_set_polarity(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int active_high)
>> +{
>> + =A0 =A0 struct pwm_channel_config c =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .config_mask =3D PWM_CONFIG_POLARITY,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .polarity =3D !!active_high,
>> + =A0 =A0 };
>> + =A0 =A0 return pwm_config(p, &c);
>> +}
>> +EXPORT_SYMBOL(pwm_set_polarity);
>> +
>> +int pwm_start(struct pwm_channel *p)
>> +{
>> + =A0 =A0 struct pwm_channel_config c =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .config_mask =3D PWM_CONFIG_START,
>> + =A0 =A0 };
>> + =A0 =A0 return pwm_config(p, &c);
>> +}
>> +EXPORT_SYMBOL(pwm_start);
>> +
>> +int pwm_stop(struct pwm_channel *p)
>> +{
>> + =A0 =A0 struct pwm_channel_config c =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .config_mask =3D PWM_CONFIG_STOP,
>> + =A0 =A0 };
>> + =A0 =A0 return pwm_config(p, &c);
>> +}
>> +EXPORT_SYMBOL(pwm_stop);
>> +
>> +int pwm_synchronize(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pwm_channel *to_p)
>> +{
>> + =A0 =A0 if (p->pwm !=3D to_p->pwm) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* TODO: support cross-device synchronizat=
ion */
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (!p->pwm->synchronize)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 return p->pwm->synchronize(p, to_p);
>> +}
>> +EXPORT_SYMBOL(pwm_synchronize);
>> +
>> +int pwm_unsynchronize(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pwm_channel *from_p)
>> +{
>> + =A0 =A0 if (from_p && (p->pwm !=3D from_p->pwm)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* TODO: support cross-device synchronizat=
ion */
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (!p->pwm->unsynchronize)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 return p->pwm->unsynchronize(p, from_p);
>> +}
>> +EXPORT_SYMBOL(pwm_unsynchronize);
>> +
>> +static void pwm_handler(struct work_struct *w)
>> +{
>> + =A0 =A0 struct pwm_channel *p =3D container_of(w, struct pwm_chann=
el,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0handler_work);
>> + =A0 =A0 if (p->handler && p->handler(p, p->handler_data))
>> + =A0 =A0 =A0 =A0 =A0 =A0 pwm_stop(p);
>> +}
>> +
>> +static void __pwm_callback(struct pwm_channel *p)
>> +{
>> + =A0 =A0 queue_work(pwm_handler_workqueue, &p->handler_work);
>> +}
>> +
>> +int pwm_set_handler(struct pwm_channel *p,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pwm_handler_t handler,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *data)
>> +{
>> + =A0 =A0 if (p->pwm->set_callback) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 p->handler_data =3D data;
>> + =A0 =A0 =A0 =A0 =A0 =A0 p->handler =3D handler;
>> + =A0 =A0 =A0 =A0 =A0 =A0 INIT_WORK(&p->handler_work, pwm_handler);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return p->pwm->set_callback(p, handler ? _=
_pwm_callback : NULL);
>> + =A0 =A0 }
>> + =A0 =A0 return -EINVAL;
>> +}
>> +EXPORT_SYMBOL(pwm_set_handler);
>> +
>> +static ssize_t pwm_run_store(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct device_a=
ttribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *buf=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t len)
>> +{
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> + =A0 =A0 if (sysfs_streq(buf, "1"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 pwm_start(p);
>> + =A0 =A0 else if (sysfs_streq(buf, "0"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 pwm_stop(p);
>> + =A0 =A0 return len;
>> +}
>> +static DEVICE_ATTR(run, 0200, NULL, pwm_run_store);
>> +
>> +static ssize_t pwm_duty_ns_show(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct dev=
ice_attribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char *buf)
>> +{
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> + =A0 =A0 return sprintf(buf, "%lu\n", pwm_get_duty_ns(p));
>> +}
>> +
>> +static ssize_t pwm_duty_ns_store(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct =
device_attribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const c=
har *buf,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t =
len)
>> +{
>> + =A0 =A0 unsigned long duty_ns;
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> +
>> + =A0 =A0 if (1 =3D=3D sscanf(buf, "%lu", &duty_ns))
>> + =A0 =A0 =A0 =A0 =A0 =A0 pwm_set_duty_ns(p, duty_ns);
>> + =A0 =A0 return len;
>> +}
>> +static DEVICE_ATTR(duty_ns, 0644, pwm_duty_ns_show, pwm_duty_ns_sto=
re);
>> +
>> +static ssize_t pwm_period_ns_show(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct=
 device_attribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char *=
buf)
>> +{
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> + =A0 =A0 return sprintf(buf, "%lu\n", pwm_get_period_ns(p));
>> +}
>> +
>> +static ssize_t pwm_period_ns_store(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0str=
uct device_attribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0con=
st char *buf,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0siz=
e_t len)
>> +{
>> + =A0 =A0 unsigned long period_ns;
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> +
>> + =A0 =A0 if (1 =3D=3D sscanf(buf, "%lu", &period_ns))
>> + =A0 =A0 =A0 =A0 =A0 =A0 pwm_set_period_ns(p, period_ns);
>> + =A0 =A0 return len;
>> +}
>> +static DEVICE_ATTR(period_ns, 0644, pwm_period_ns_show, pwm_period_=
ns_store);
>> +
>> +static ssize_t pwm_polarity_show(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct =
device_attribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *b=
uf)
>> +{
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> + =A0 =A0 return sprintf(buf, "%d\n", !!p->active_high);
>> +}
>> +
>> +static ssize_t pwm_polarity_store(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct=
 device_attribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const =
char *buf,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t=
 len)
>> +{
>> + =A0 =A0 int polarity;
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> +
>> + =A0 =A0 if (1 =3D=3D sscanf(buf, "%d", &polarity))
>> + =A0 =A0 =A0 =A0 =A0 =A0 pwm_set_polarity(p, polarity);
>> + =A0 =A0 return len;
>> +}
>> +static DEVICE_ATTR(polarity, 0644, pwm_polarity_show, pwm_polarity_=
store);
>> +
>> +static ssize_t pwm_request_show(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct dev=
ice_attribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char *buf)
>> +{
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> + =A0 =A0 mutex_lock(&device_list_mutex);
>> + =A0 =A0 __pwm_request_channel(p, REQUEST_SYSFS);
>> + =A0 =A0 mutex_unlock(&device_list_mutex);
>> +
>> + =A0 =A0 if (p->pid)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return sprintf(buf, "%s %d\n", p->requeste=
r, p->pid);
>> + =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 return sprintf(buf, "%s\n", p->requester);
>> +}
>> +
>> +static ssize_t pwm_request_store(struct device *dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct =
device_attribute *attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const c=
har *buf,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t =
len)
>> +{
>> + =A0 =A0 struct pwm_channel *p =3D dev_get_drvdata(dev);
>> + =A0 =A0 pwm_release(p);
>> + =A0 =A0 return len;
>> +}
>> +static DEVICE_ATTR(request, 0644, pwm_request_show, pwm_request_sto=
re);
>> +
>> +static const struct attribute *pwm_attrs[] =3D
>> +{
>> + =A0 =A0 &dev_attr_run.attr,
>> + =A0 =A0 &dev_attr_polarity.attr,
>> + =A0 =A0 &dev_attr_duty_ns.attr,
>> + =A0 =A0 &dev_attr_period_ns.attr,
>> + =A0 =A0 &dev_attr_request.attr,
>> + =A0 =A0 NULL,
>> +};
>> +
>> +static const struct attribute_group pwm_device_attr_group =3D {
>> + =A0 =A0 .attrs =3D (struct attribute **)pwm_attrs,
>> +};
>> +
>> +static int __pwm_create_sysfs(struct pwm_device *pwm)
>> +{
>> + =A0 =A0 int ret =3D 0;
>> + =A0 =A0 struct device *dev;
>> + =A0 =A0 int wchan;
>> +
>> + =A0 =A0 for (wchan =3D 0; wchan < pwm->nchan; wchan++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev =3D device_create(&pwm_class, pwm->dev=
, MKDEV(0, 0),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pw=
m->channels + wchan,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "%=
s:%d", pwm->bus_id, wchan);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!dev)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_dev_create;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D sysfs_create_group(&dev->kobj, &pw=
m_device_attr_group);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_dev_create;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return ret;
>> +
>> +err_dev_create:
>> + =A0 =A0 for (wchan =3D 0; wchan < pwm->nchan; wchan++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev =3D class_find_device(&pwm_class, NULL=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &pwm->channels[wchan],
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __match_device);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (dev) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 put_device(dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_unregister(dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return ret;
>> +}
>> +
>> +static struct class_attribute pwm_class_attrs[] =3D {
>> + =A0 =A0 __ATTR_NULL,
>> +};
>> +
>> +static struct class pwm_class =3D {
>> + =A0 =A0 .name =3D "pwm",
>> + =A0 =A0 .owner =3D THIS_MODULE,
>> +
>> + =A0 =A0 .class_attrs =3D pwm_class_attrs,
>> +};
>> +
>> +static int __init pwm_init(void)
>> +{
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 /* TODO: how to deal with devices that register very early=
? */
>> + =A0 =A0 ret =3D class_register(&pwm_class);
>> + =A0 =A0 if (ret < 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> +
>> + =A0 =A0 pwm_handler_workqueue =3D create_workqueue("pwmd");
>> +
>> + =A0 =A0 return 0;
>> +}
>> +postcore_initcall(pwm_init);
>> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
>> deleted file mode 100644
>> index 7c77575..0000000
>> --- a/include/linux/pwm.h
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -#ifndef __LINUX_PWM_H
>> -#define __LINUX_PWM_H
>> -
>> -struct pwm_device;
>> -
>> -/*
>> - * pwm_request - request a PWM device
>> - */
>> -struct pwm_device *pwm_request(int pwm_id, const char *label);
>> -
>> -/*
>> - * pwm_free - free a PWM device
>> - */
>> -void pwm_free(struct pwm_device *pwm);
>> -
>> -/*
>> - * pwm_config - change a PWM device configuration
>> - */
>> -int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns);
>> -
>> -/*
>> - * pwm_enable - start a PWM output toggling
>> - */
>> -int pwm_enable(struct pwm_device *pwm);
>> -
>> -/*
>> - * pwm_disable - stop a PWM output toggling
>> - */
>> -void pwm_disable(struct pwm_device *pwm);
>> -
>> -#endif /* __LINUX_PWM_H */
>> diff --git a/include/linux/pwm/pwm.h b/include/linux/pwm/pwm.h
>> new file mode 100644
>> index 0000000..a10824c
>> --- /dev/null
>> +++ b/include/linux/pwm/pwm.h
>> @@ -0,0 +1,128 @@
>> +/*
>> + * include/linux/pwm.h
>> + *
>> + * Copyright (C) 2010 Bill Gatliff < bgat@billgatliff.com>
>> + *
>> + * This program is free software; you may redistribute and/or modif=
y
>> + * it under the terms of the GNU General Public License version 2, =
as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, =
but
>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the =
GNU
>> + * General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public Licens=
e
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1=
307
>> + * USA
>> + */
>> +#ifndef __LINUX_PWM_H
>> +#define __LINUX_PWM_H
>> +
>> +enum {
>> + =A0 =A0 PWM_CONFIG_DUTY_TICKS =3D BIT(0),
>> + =A0 =A0 PWM_CONFIG_PERIOD_TICKS =3D BIT(1),
>> + =A0 =A0 PWM_CONFIG_POLARITY =3D BIT(2),
>> + =A0 =A0 PWM_CONFIG_START =3D BIT(3),
>> + =A0 =A0 PWM_CONFIG_STOP =3D BIT(4),
>> +
>> + =A0 =A0 PWM_CONFIG_HANDLER =3D BIT(5),
>> +
>> + =A0 =A0 PWM_CONFIG_DUTY_NS =3D BIT(6),
>> + =A0 =A0 PWM_CONFIG_DUTY_PERCENT =3D BIT(7),
>> + =A0 =A0 PWM_CONFIG_PERIOD_NS =3D BIT(8),
>> +};
>> +
>> +struct pwm_channel;
>> +struct work_struct;
>> +
>> +typedef int (*pwm_handler_t)(struct pwm_channel *p, void *data);
>> +typedef void (*pwm_callback_t)(struct pwm_channel *p);
>> +
>> +struct pwm_channel_config {
>> + =A0 =A0 int config_mask;
>> + =A0 =A0 unsigned long duty_ticks;
>> + =A0 =A0 unsigned long period_ticks;
>> + =A0 =A0 int polarity;
>> +
>> + =A0 =A0 pwm_handler_t handler;
>> +
>> + =A0 =A0 unsigned long duty_ns;
>> + =A0 =A0 unsigned long period_ns;
>> + =A0 =A0 int duty_percent;
>> +};
>> +
>> +struct pwm_device {
>> + =A0 =A0 struct list_head list;
>> + =A0 =A0 spinlock_t list_lock;
>> + =A0 =A0 struct device *dev;
>> + =A0 =A0 struct module *owner;
>> + =A0 =A0 struct pwm_channel *channels;
>> +
>> + =A0 =A0 const char *bus_id;
>> + =A0 =A0 int nchan;
>> +
>> + =A0 =A0 int =A0 =A0 (*request) =A0 =A0 =A0(struct pwm_channel *p);
>> + =A0 =A0 void =A0 =A0(*release) =A0 =A0 =A0(struct pwm_channel *p);
>> + =A0 =A0 int =A0 =A0 (*config) =A0 =A0 =A0 (struct pwm_channel *p, =
struct pwm_channel_config *c);
>> + =A0 =A0 int =A0 =A0 (*config_nosleep)(struct pwm_channel *p, struc=
t pwm_channel_config *c);
>> + =A0 =A0 int =A0 =A0 (*synchronize) =A0(struct pwm_channel *p, stru=
ct pwm_channel *to_p);
>> + =A0 =A0 int =A0 =A0 (*unsynchronize)(struct pwm_channel *p, struct=
 pwm_channel *from_p);
>> + =A0 =A0 int =A0 =A0 (*set_callback) (struct pwm_channel *p, pwm_ca=
llback_t callback);
>> +};
>> +
>> +int pwm_register(struct pwm_device *pwm);
>> +int pwm_unregister(struct pwm_device *pwm);
>> +
>> +enum {
>> + =A0 =A0 FLAG_REQUESTED =3D 0,
>> + =A0 =A0 FLAG_STOP =3D 1,
>> +};
>> +
>> +struct pwm_channel {
>> + =A0 =A0 struct list_head list;
>> + =A0 =A0 struct pwm_device *pwm;
>> + =A0 =A0 const char *requester;
>> + =A0 =A0 pid_t pid;
>> + =A0 =A0 int chan;
>> + =A0 =A0 unsigned long flags;
>> + =A0 =A0 unsigned long tick_hz;
>> +
>> + =A0 =A0 spinlock_t lock;
>> + =A0 =A0 struct completion complete;
>> +
>> + =A0 =A0 pwm_callback_t callback;
>> +
>> + =A0 =A0 struct work_struct handler_work;
>> + =A0 =A0 pwm_handler_t handler;
>> + =A0 =A0 void *handler_data;
>> +
>> + =A0 =A0 int active_high;
>> + =A0 =A0 unsigned long period_ticks;
>> + =A0 =A0 unsigned long duty_ticks;
>> +};
>> +
>> +struct gpio_pwm_platform_data {
>> + =A0 =A0 int gpio;
>> +};
>> +
>> +struct pwm_channel *pwm_request(const char *bus_id, int chan, const=
 char *requester);
>> +void pwm_release(struct pwm_channel *pwm);
>> +int pwm_config_nosleep(struct pwm_channel *pwm, struct pwm_channel_=
config *c);
>> +int pwm_config(struct pwm_channel *pwm, struct pwm_channel_config *=
c);
>> +unsigned long pwm_ns_to_ticks(struct pwm_channel *pwm, unsigned lon=
g nsecs);
>> +unsigned long pwm_ticks_to_ns(struct pwm_channel *pwm, unsigned lon=
g ticks);
>> +int pwm_set_period_ns(struct pwm_channel *pwm, unsigned long period=
_ns);
>> +unsigned long pwm_get_period_ns(struct pwm_channel *pwm);
>> +int pwm_set_duty_ns(struct pwm_channel *pwm, unsigned long duty_ns)=
;
>> +int pwm_set_duty_percent(struct pwm_channel *pwm, int percent);
>> +unsigned long pwm_get_duty_ns(struct pwm_channel *pwm);
>> +int pwm_set_polarity(struct pwm_channel *pwm, int active_high);
>> +int pwm_start(struct pwm_channel *pwm);
>> +int pwm_stop(struct pwm_channel *pwm);
>> +int pwm_set_handler(struct pwm_channel *pwm, pwm_handler_t handler,=
 void *data);
>> +int pwm_synchronize(struct pwm_channel *p, struct pwm_channel *to_p=
);
>> +int pwm_unsynchronize(struct pwm_channel *p, struct pwm_channel *fr=
om_p);
>> +
>> +#endif /* __LINUX_PWM_H */
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
