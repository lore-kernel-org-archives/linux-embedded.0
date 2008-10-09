From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: RFC - size tool for kernel build system
Date: Thu, 9 Oct 2008 18:03:47 +0200
Message-ID: <20081009160347.GB17179@logfs.org>
References: <48EBD268.50208@am.sony.com> <20081009152151.GB17013@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757281AbYJIQET@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081009152151.GB17013@cs181140183.pp.htv.fi>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Adrian Bunk <bunk@kernel.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Thu, 9 October 2008 18:21:51 +0300, Adrian Bunk wrote:
>=20
> The building blocks that would be useful are IMHO:
> - a make target that generates a report for one kernel
>   (like the checkstack or export_report targets)
> - a script that compares two such reports and outputs the
>   size differences
>=20
> That's also easy to do, and if that's what's wanted I can send a patc=
h=20
> that does it.
>=20
> Everything else is IMHO overdesigned.

Please do.

> The real problem is that dumping some scripts into the kernel sources=
=20
> or publishing some data on a webpage doesn't make people use them.
>=20
> Like if you run "make checkstack" on the kernel today you can see tha=
t=20
> drivers allocate arrays > 1 kB on the stack despite checkstack being=20
> available...

=46unny you should mention that.  Yesterday I noticed that make checkst=
ack
had been ported to five more architectures since my last look at the
code.  It doesn't seem likely that those ports were required by some
pointy-haired boss for feature-completeness.  Someone must actually be
using it.

The very beauty of make checkstack is that you don't even notice whethe=
r
it is being used or not.  You point to some drivers that apparently
didn't use it, which is fine.  But how many drivers _did_ use it?  How
many problems have been solved before the patches have ever been posted
for review?  Noone knows.  And that is a good thing.  We want the
problems to get solved and not become visible in the first place.

Bloatwatch imo has the design flaw that it is a central tool hosted on
some server somewhere and only documents the damage once it has
happened.  It would be much better if every developer could run
something simple locally and clean up the mess before anyone else
notices.

I partially agree with you in one point.  It would be even better if
checkstack, bloatcheck, etc. were run automatically on every kernel
compile and developers were forced to look at any problems that come up=
=2E
But that would increase compile time, which is bad.  So there needs to
be an off button as well, as there is for sparse - where off is the
default.

J=C3=B6rn

--=20
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
