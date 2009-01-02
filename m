From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 05:15:32 -0600
Message-ID: <200901020515.33703.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <20090102094934.GB17841@infradead.org> <495DE995.1070002@opensde.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <495DE995.1070002@opensde.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alejandro Mery <amery@opensde.org>
Cc: Christoph Hellwig <hch@infradead.org>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Friday 02 January 2009 04:16:53 Alejandro Mery wrote:
> Christoph Hellwig escribi=C3=B3:
> > On Fri, Jan 02, 2009 at 10:26:37AM +0100, Arkadiusz Miskiewicz wrot=
e:
> >> On Friday 02 of January 2009, Rob Landley wrote:
> >>> Before 2.6.25 (specifically git
> >>> bdc807871d58285737d50dc6163d0feb72cb0dc2 ) building a Linux kerne=
l
> >>> never required perl to be installed on the build system.  (Variou=
s
> >>> development and debugging scripts were written in perl and python=
 and
> >>> such, but they weren't involved in actually building a kernel.)
> >>> Building a kernel before 2.6.25 could be done with a minimal syst=
em
> >>> built from gcc, binutils, bash, make, busybox, uClibc, and the Li=
nux
> >>> kernel, and nothing else.
> >>
> >> And now bash is going to be required... while some distros don't
> >> need/have bash. /bin/sh should be enough.
> >
> > *nod*  bash is in many ways a worse requirement than perl.  strict =
posix
> > /bin/sh + awk + sed would be nicest, but if that's too much work pe=
rl
> > seems reasonable.
>
> well, bash is not worse as bash is trivial to cross-compile to run on=
 a
> constrained sandbox and perl is a nightmare, but I agree bash should =
be
> avoided too.
>
> I think the $(( ... )) bash-ism can be replaced with a simple .c help=
er
> toy.

No, $[ ] is the bashism, $(( )) is susv3:
http://www.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html=
#tag_18_06_04

I intentionally switched from $[ ] to $(( )) to make dash work.

Rob
