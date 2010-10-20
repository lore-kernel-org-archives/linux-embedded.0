From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Wed, 20 Oct 2010 13:13:34 -0500
Message-ID: <AANLkTikLnoAiZpZpA-aUPa3kSW7ZO=542wLgzFUqiL_4@mail.gmail.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
	<20101016074240.GC653@angua.secretlab.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20101016074240.GC653@angua.secretlab.ca>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-embedded@vger.kernel.org

Grant:

> I'm not hugely keen on the naming approach, and I'd rather see the
> pwm core be responsible for the namespace.

The problem with that, as I see it, is that then the channel
identifiers become dependent on the order of device initialization.
By allowing driver authors to assign names, however, users are capable
of pinning their channel requests to specific devices and channels
with confidence that those names will remain valid regardless of the
sequence they compile their kernel in.

> Nitpick: putting the filename into the file itself I find tends to be
> useless

Agreed.  Those tend to sneak in during my early development, and then
I get so used to seeing them that I forget to take them out.

>> +static int __pwm_create_sysfs(struct pwm_device *pwm);
>
> If you order the functions in this file correct, the forward
> declaration should not be necessary.

In theory, I agree completely with you.  In this specific instance,
however, I haven't been able to structure things in a way that
eliminates at least one forward declaration.

One possibility would be to move all the sysfs-related stuff out to a
separate file altogether.  Depending on what the class attribute
rework ends up doing to the code, I just might do that.  Of course,
that wouldn't eliminate the forward declaration--- it would just move
it.  :)

>> + =A0 =A0 for (wchan =3D 0; wchan < pwm->nchan; wchan++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev =3D class_find_device(&pwm_class, NULL=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &pwm->channels[wchan],
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 __match_device);
>
> If the pwm_channel structure carried a pointer to its device
> structure, then this lookup wouldn't be needed.

This comment, combined with your other one on the class attributes
(below) convince me that the device model isn't quite right yet.  I
will rework this until seems correct.

> The above 8 functions are so tiny that they should probably be static
> inlines in the header file.

Agreed.

> Rather than open coding the registration of sysfs files, I believe th=
e
> right thing to do is to use class attributes so that the files get
> automatically registered for you and are immediately advertised to
> userspace (very important for correct interaction with udev).

I think I'm either still a little weak on my device model
understanding, or things have been changing there lately and I haven't
had the time to notice.  Regardless, this code always seemed a little
awkward--- you seem to agree, so I'll do some research and come back
with something better.

> Also, sysfs_create_group() should not be called directly when working
> with devices.

Probably necessary because I'm not doing something right elsewhere.  :)

>> + =A0 =A0 /* TODO: how to deal with devices that register very early=
? */
>
> Same thing we always do for bootstrapping. =A0If it *must* be early,
> then we do a simple direct access to get things running in platform
> code, and then take over in the driver when it finally gets probed.
> The driver model helps with many things, but really early stuff isn't
> one of them.

I _think_ you and I are saying the same thing: that the device model
only works well with late-registering devices.  I'm not sure I
understand your suggestion for how to deal with must-be-early devices.



b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
