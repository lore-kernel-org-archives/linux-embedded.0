From: Marc Andre Tanner <mat@brain-dump.org>
Subject: Re: [RFC|PATCH] Compile time printk verbosity
Date: Wed, 2 Sep 2009 10:57:49 +0200
Message-ID: <20090902085749.GA2736@debbook.brain-dump.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
 <8bd0f97a0909011637p1d97b3cft91708225c7514f9f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8bd0f97a0909011637p1d97b3cft91708225c7514f9f@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
content-type: text/plain
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Tue, Sep 01, 2009 at 07:37:27PM -0400, Mike Frysinger wrote:
> On Tue, Sep 1, 2009 at 18:31, Marc Andre Tanner wrote:
> > This series adds a configuration option to selectively compile out
> > printk message strings based on a verbosity level.
> >
> > This works by wrapping printk with a macro which evaluates to a
> > constant if condition which the compiler will be able to optimize
> > out.
> >
> > However because printk might be wrapped by a macro it no longer has
> > a return value. This means that constructs like the following ones
> > don't work:
> >
> > =A0 ((void)(SOME_RANDOM_DEBUG_FLAG && printk(...));
> >
> > =A0 some_random_variable =3D printk(...);
> >
> > Therefore printk_unfiltered is introduced which is just an alias
> > to the standard printk function but not wrapped by a macro.
>=20
> why dont you return 0 if it gets optimized away ?  then you wont have
> to screw with external code at all and things "just work".

This won't work because it would for example also return from functions
which call printk but aren't checking for the return value (which is
the common case).

Or am I missing something?

> -mike

Marc

--=20
 Marc Andre Tanner >< http://www.brain-dump.org/ >< GPG key: CF7D56C0
