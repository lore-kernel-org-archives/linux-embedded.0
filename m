From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Fri, 13 Nov 2009 13:35:03 +0200
Message-ID: <1258112103.21596.1217.camel@localhost>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
	 <1258049211.10621.40.camel@calx>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1258049211.10621.40.camel@calx>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matt Mackall <mpm@selenic.com>
Cc: David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, paul.gortmaker@windriver.com

On Thu, 2009-11-12 at 12:06 -0600, Matt Mackall wrote:
> On Wed, 2009-11-11 at 21:13 -0500, David VomLehn wrote:
> > Allows annotation of panics to include platform information. It's n=
o big
> > deal to collect information, but way helpful when you are collectin=
g
> > failure reports from a eventual base of millions of systems deploye=
d in
> > other people's homes.
>=20
> I'd like to hear a bit more use case motivation on this feature. Also=
,
> why do you want more than a page?

We also need this kind of functionality. The use case is very simple.
Every time the kernel oopeses, we save the oops information on the flas=
h
using mtdoops module. There is even core support, which should be merge=
d
to 2.6.33, see this patch:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/832c3d00e=
82f267316a2b53634631a1821eebae8

(and there was a corresponding discussion on lkml).

And what we want is to dump information about the user-space environmen=
t
at the same time to the oops. Specifically, we want to dump information
about what was the SW build number.

And we want this information to be printed at the same time, because we
cannot run any user-space at the panic time. This information is later
read from the flash and sent via the network to the central place. And
by the time it is sent, the user may have already re-flashed his device
with something else.

So I very much appreciate this patch, although I think it should use th=
e
panic notifiers instead of calling a function directly from the panic.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
