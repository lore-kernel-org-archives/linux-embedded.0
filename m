From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 12:44:30 +0100
Message-ID: <20090102114430.GA4883@uranus.ravnborg.org>
References: <200901020207.30359.rob@landley.net> <20090102094934.GB17841@infradead.org> <495DE995.1070002@opensde.org> <200901020515.33703.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200901020515.33703.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Landley <rob@landley.net>
Cc: Alejandro Mery <amery@opensde.org>, Christoph Hellwig <hch@infradead.org>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>

On Fri, Jan 02, 2009 at 05:15:32AM -0600, Rob Landley wrote:
> On Friday 02 January 2009 04:16:53 Alejandro Mery wrote:
> > Christoph Hellwig escribi=F3:
> > > On Fri, Jan 02, 2009 at 10:26:37AM +0100, Arkadiusz Miskiewicz wr=
ote:
> > >> On Friday 02 of January 2009, Rob Landley wrote:
> > >>> Before 2.6.25 (specifically git
> > >>> bdc807871d58285737d50dc6163d0feb72cb0dc2 ) building a Linux ker=
nel
> > >>> never required perl to be installed on the build system.  (Vari=
ous
> > >>> development and debugging scripts were written in perl and pyth=
on and
> > >>> such, but they weren't involved in actually building a kernel.)
> > >>> Building a kernel before 2.6.25 could be done with a minimal sy=
stem
> > >>> built from gcc, binutils, bash, make, busybox, uClibc, and the =
Linux
> > >>> kernel, and nothing else.
> > >>
> > >> And now bash is going to be required... while some distros don't
> > >> need/have bash. /bin/sh should be enough.
> > >
> > > *nod*  bash is in many ways a worse requirement than perl.  stric=
t posix
> > > /bin/sh + awk + sed would be nicest, but if that's too much work =
perl
> > > seems reasonable.
> >
> > well, bash is not worse as bash is trivial to cross-compile to run =
on a
> > constrained sandbox and perl is a nightmare, but I agree bash shoul=
d be
> > avoided too.
> >
> > I think the $(( ... )) bash-ism can be replaced with a simple .c he=
lper
> > toy.
>=20
> No, $[ ] is the bashism, $(( )) is susv3:
> http://www.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.ht=
ml#tag_18_06_04
>=20
> I intentionally switched from $[ ] to $(( )) to make dash work.
The focus on this patch is to create a minimal set of
dependencies so please document what dependencies / compatibility
this patch introduces.

It is not obvious for me for example if the script
requires sh, bash or dash or whatever.

The shebang is so often wrong that this is not docuemnting such
things.

	Sam
