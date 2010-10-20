From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common
 user and kernel interface
Date: Wed, 20 Oct 2010 12:34:35 -0600
Message-ID: <20101020183435.GA12480@angua.secretlab.ca>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
 <20101016074240.GC653@angua.secretlab.ca>
 <AANLkTikLnoAiZpZpA-aUPa3kSW7ZO=542wLgzFUqiL_4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikLnoAiZpZpA-aUPa3kSW7ZO=542wLgzFUqiL_4@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Oct 20, 2010 at 01:13:34PM -0500, Bill Gatliff wrote:
> Grant:
>=20
> > I'm not hugely keen on the naming approach, and I'd rather see the
> > pwm core be responsible for the namespace.
>=20
> The problem with that, as I see it, is that then the channel
> identifiers become dependent on the order of device initialization.

Correct, just like on all other subsystems.

> By allowing driver authors to assign names, however, users are capabl=
e
> of pinning their channel requests to specific devices and channels
> with confidence that those names will remain valid regardless of the
> sequence they compile their kernel in.

Identify by name tends to be a horrible interface in my opinion. The
lesson has been learned in the network and block layers that names
change over time and trying to lock them down to something that a user
finds 'sane' ends up in a mess of workarounds and bad assumptions in
the code.

=46or in-kernel users, either platform_data or notifier hooks can be us=
ed
by one device to have explicit knowledge about the device. No need to
muck about with name encoding.

In userspace, the correct solution is to expose real information about
the device (how the instance is connected to the system plus any other
identifying data) in the sysfs tree and let udev (or a trivial
replacement) decode to a stable user-friendly name.

Essentially, identifying by name attempts to expose real information
about which device it is, but the process of encoding a name is lossy
and so it fails to be robust in the long term.

>=20
> > Nitpick: putting the filename into the file itself I find tends to =
be
> > useless
>=20
> Agreed.  Those tend to sneak in during my early development, and then
> I get so used to seeing them that I forget to take them out.

:-)

>=20
> >> +static int __pwm_create_sysfs(struct pwm_device *pwm);
> >
> > If you order the functions in this file correct, the forward
> > declaration should not be necessary.
>=20
> In theory, I agree completely with you.  In this specific instance,
> however, I haven't been able to structure things in a way that
> eliminates at least one forward declaration.

=46air enough, sometimes that is necessary.  I didn't look that closely=
=2E

> One possibility would be to move all the sysfs-related stuff out to a
> separate file altogether.  Depending on what the class attribute
> rework ends up doing to the code, I just might do that.  Of course,
> that wouldn't eliminate the forward declaration--- it would just move
> it.  :)

Yeah, by changing to using class attributes, a lot of this could end
up going away.

>=20
> >> + =A0 =A0 for (wchan =3D 0; wchan < pwm->nchan; wchan++) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 dev =3D class_find_device(&pwm_class, NU=
LL,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 &pwm->channels[wchan],
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 __match_device);
> >
> > If the pwm_channel structure carried a pointer to its device
> > structure, then this lookup wouldn't be needed.
>=20
> This comment, combined with your other one on the class attributes
> (below) convince me that the device model isn't quite right yet.  I
> will rework this until seems correct.

:-)

>=20
> > The above 8 functions are so tiny that they should probably be stat=
ic
> > inlines in the header file.
>=20
> Agreed.
>=20
> > Rather than open coding the registration of sysfs files, I believe =
the
> > right thing to do is to use class attributes so that the files get
> > automatically registered for you and are immediately advertised to
> > userspace (very important for correct interaction with udev).
>=20
> I think I'm either still a little weak on my device model
> understanding, or things have been changing there lately and I haven'=
t
> had the time to notice.  Regardless, this code always seemed a little
> awkward--- you seem to agree, so I'll do some research and come back
> with something better.
>=20
> > Also, sysfs_create_group() should not be called directly when worki=
ng
> > with devices.
>=20
> Probably necessary because I'm not doing something right elsewhere.  =
:)
>=20
> >> + =A0 =A0 /* TODO: how to deal with devices that register very ear=
ly? */
> >
> > Same thing we always do for bootstrapping. =A0If it *must* be early=
,
> > then we do a simple direct access to get things running in platform
> > code, and then take over in the driver when it finally gets probed.
> > The driver model helps with many things, but really early stuff isn=
't
> > one of them.
>=20
> I _think_ you and I are saying the same thing: that the device model
> only works well with late-registering devices.  I'm not sure I
> understand your suggestion for how to deal with must-be-early devices=
=2E

My experience has been there are very few things that cannot be
deferred to module_initcall() time if the device model is handled
well.  Typically the things that fall outside of that model are core
infrastructure things like irq controllers which need to be ready to
go before many of the subsystems are initialized.

Basically I'm saying that for things that *really do* need to be setup
before the initcalls, you either don't use the device model at all, or
you figure out how to hand off control from early bootstrap code once
the driver model is set up.  Kind of like the early console code.
Scary stuff.

g.
