From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: Expose regulator:set_consumer_device_supply()?
Date: Tue, 26 Apr 2011 10:33:29 -0500
Message-ID: <BANLkTimmpx5ZThXj705Yn_wRQ6bF7VzwPw@mail.gmail.com>
References: <BANLkTi=dCHXEtv+=+sRaDp_Pt3zQy5o7ug@mail.gmail.com>
	<20110426083350.GA20595@sirena.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110426083350.GA20595@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

Mark:


Thanks for the response.  But now I'm even more confused than I was bef=
ore!

On Tue, Apr 26, 2011 at 3:33 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:

> You can specify the device by either dev_name() or a dev pointer. =A0=
You
> can use dev_name() at any time without the device having been
> instantiated, it would be unusal to use a struct device.

When a consumer e.g. i2c chip driver is trying to get a handle for its
own regulator, the only function I see is:

struct regulator* regulator_get(struct device *dev, const char *id)

My understanding, even after looking at the implementation of
regulator_get(), is that the dev pointer refers to the device
structure of the consumer itself.  The regulator returned is one that
matches the combination of that device structure pointer plus the name
of the regulator.  In other words, I get back the regulator that is
unambiguously associated with the consumer.

In order for there to be a regulator with a matching device:id
combination, someone must have previously provided a struct
regulator_consumer_supply with the identical device pointer to
regulator_register().  That means that I have to call
regulator_register() AFTER I register the i2c chip driver, so that I
have a struct device pointer to place in the regulator_consumer_supply
list.  Right?

The alternative is to not indicate any regulator_consumer_supply
devices when I register a regulator, and then do the regulator_get()
by matching on name alone.  But then I have to pass the regulator name
as platform data to the i2c chip driver, because that regulator's name
is bound to change across boards.  And I also lose the strong
relationship between regulators and their downstream devices that
regulator_consumer_supply offers.  If I can keep that association,
then consumers need only ask for "the regulator tied to my VCC pin,
whatever regulator that is".

Maybe I'm misunderstanding the utility of the dev pointer in regulator_=
get()?

>> Any reason why we couldn't expose set_consumer_device_supply(), so
>> that I can add a device as a regulator consumer after a regulator is
>> already registered?
>
> This would facilitate abuse of the API, we already have enough proble=
ms
> with people trying to pass regulators as platform data.

But I think you'll agree that regulators are pretty important platform =
data, no?

What specifically is the breakage that comes from allowing consumers
to add themselves to regulator consumer lists at a time after
regulator_register() is complete?  Why is passing a regulator pointer
as platform data such a problem?


Confused,


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
