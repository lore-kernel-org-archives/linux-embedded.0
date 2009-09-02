From: Marc Andre Tanner <mat@brain-dump.org>
Subject: Re: [RFC|PATCH] Compile time printk verbosity
Date: Wed, 2 Sep 2009 11:47:37 +0200
Message-ID: <20090902094343.GC2736@debbook.brain-dump.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
 <8bd0f97a0909011637p1d97b3cft91708225c7514f9f@mail.gmail.com>
 <20090902085749.GA2736@debbook.brain-dump.org>
 <8bd0f97a0909020211m5636880cp6d9c0a63b7fe71e3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8bd0f97a0909020211m5636880cp6d9c0a63b7fe71e3@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
content-type: text/plain
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Sep 02, 2009 at 05:11:12AM -0400, Mike Frysinger wrote:
> On Wed, Sep 2, 2009 at 04:57, Marc Andre Tanner wrote:
> > On Tue, Sep 01, 2009 at 07:37:27PM -0400, Mike Frysinger wrote:
> >> On Tue, Sep 1, 2009 at 18:31, Marc Andre Tanner wrote:
> >> > This series adds a configuration option to selectively compile o=
ut
> >> > printk message strings based on a verbosity level.
> >> >
> >> > This works by wrapping printk with a macro which evaluates to a
> >> > constant if condition which the compiler will be able to optimiz=
e
> >> > out.
> >> >
> >> > However because printk might be wrapped by a macro it no longer =
has
> >> > a return value. This means that constructs like the following on=
es
> >> > don't work:
> >> >
> >> > =A0 ((void)(SOME_RANDOM_DEBUG_FLAG && printk(...));
> >> >
> >> > =A0 some_random_variable =3D printk(...);
> >> >
> >> > Therefore printk_unfiltered is introduced which is just an alias
> >> > to the standard printk function but not wrapped by a macro.
> >>
> >> why dont you return 0 if it gets optimized away ? =A0then you wont=
 have
> >> to screw with external code at all and things "just work".
> >
> > This won't work because it would for example also return from funct=
ions
> > which call printk but aren't checking for the return value (which i=
s
> > the common case).
>=20
> why would it matter ?
>=20
> ({
>     int __printk_ret =3D 0;
>     if (crazy stuff you're adding)
>         __printk_ret =3D printk(.....);
>     __printk_ret;
> })

Yes I missunderstood your "return 0" statement in the first mail.=20
The same effect could also be achieved by:

((crazy stuff) ? printk(...) : 0;=20

Marc

--=20
 Marc Andre Tanner >< http://www.brain-dump.org/ >< GPG key: CF7D56C0
