From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Expose regulator:set_consumer_device_supply()?
Date: Tue, 26 Apr 2011 17:15:16 +0100
Message-ID: <20110426161516.GC11848@opensource.wolfsonmicro.com>
References: <BANLkTi=dCHXEtv+=+sRaDp_Pt3zQy5o7ug@mail.gmail.com>
 <20110426083350.GA20595@sirena.org.uk>
 <BANLkTimmpx5ZThXj705Yn_wRQ6bF7VzwPw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTimmpx5ZThXj705Yn_wRQ6bF7VzwPw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 26, 2011 at 10:33:29AM -0500, Bill Gatliff wrote:
> On Tue, Apr 26, 2011 at 3:33 AM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:

> > You can specify the device by either dev_name() or a dev pointer. =A0=
You
> > can use dev_name() at any time without the device having been
> > instantiated, it would be unusal to use a struct device.

> When a consumer e.g. i2c chip driver is trying to get a handle for it=
s
> own regulator, the only function I see is:
>=20
> struct regulator* regulator_get(struct device *dev, const char *id)

There's also regulator_get_exclusive() but it's almost exactly the same
thing.

> In order for there to be a regulator with a matching device:id
> combination, someone must have previously provided a struct
> regulator_consumer_supply with the identical device pointer to
> regulator_register().  That means that I have to call
> regulator_register() AFTER I register the i2c chip driver, so that I
> have a struct device pointer to place in the regulator_consumer_suppl=
y
> list.  Right?

No.  As I said in the text you've quoted above you can also specify the
device mapping using the dev_name() of the device.  As you will have
seen when looking through the regulator_get() implementation the
matching is actually done on the dev_name(), if the mapping is set up
with a struct device we always do matches based on the dev_name()
string, not by comparing pointers.
 =20
> > This would facilitate abuse of the API, we already have enough prob=
lems
> > with people trying to pass regulators as platform data.

> But I think you'll agree that regulators are pretty important platfor=
m data, no?

No, the set of power supplies the device has is not platform data, it's
a physical property of the device.

> What specifically is the breakage that comes from allowing consumers
> to add themselves to regulator consumer lists at a time after
> regulator_register() is complete?  Why is passing a regulator pointer
> as platform data such a problem?

It means you get reams of code in drivers conditionally using the
regulator API, all of which adds needless complexity all over the tree
as people invariably make everything conditional on the regulator not
being there when they shouldn't.  This then means you also end up with
no meaningful error handling, all errors just get silently eaten.
