From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 16 Jan 2009 00:11:09 -0600
Message-ID: <200901160011.11679.rob@landley.net>
References: <495FEEAF.5020005@zytor.com> <20090112103820.GF28564@linux-sh.org> <20090114025115.GB22154@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090114025115.GB22154@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Lokier <jamie@shareable.org>
Cc: Paul Mundt <lethal@linux-sh.org>, Sam Ravnborg <sam@ravnborg.org>, "Mark A. Miller" <mark@mirell.org>, Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tuesday 13 January 2009 20:51:16 Jamie Lokier wrote:
> Paul Mundt wrote:
> > This happens in a lot of places, like embedded gentoo ports, where =
almost
> > all of the work is sent across distcc to a cross-compilation machin=
e. In
> > systems that use package management, it is done on the host through
> > emulation, or painfully cross-compiled.
>
> Ah yes, I remember using embedded Gentoo.
>
> 95% of the time in ./configure scripts, 5% in compilations.

With SMP becoming commonplace, expect this to become the norm everywher=
e. =20
Once you get to around quad processor, any C program with a ./configure=
 step=20
is probably going to take longer to configure than to compile.  (Of cou=
rse C++=20
manages to remain slow enough that autoconf isn't so obvious a bottlene=
ck.)

> And this is on x86! =A0I dread to think how slow it gets on something
> slow.

My friend Mark's been experimenting with the amazon "cloud" thing, feed=
ing in=20
an image with a qemu instance and distcc+cross-compiler, and running bu=
ilds=20
under that.  Renting an 8-way ~2.5 ghz server with 7 gigabytes of ram a=
nd 1.6=20
terabytes of disk is 80 cents/hour through them plus another few cents/=
day for=20
bandwidth and persistent storage and such.  That's likely to get cheape=
r as=20
time goes on.

We're still planning to buy a build server of our own to have something=
 in-
house, but for running nightly builds it's almost to the point where=20
depreciation on the hardware is more than buying time from a server far=
m. =20
Just _one_ of those 8-way servers is enough hardware to build an entire=
 distro=20
in an hour or so.

What this really allows us to do is experiment with "how parallel can w=
e get=20
our build"?  Because renting ten 8-way servers in a cluster is $8/hour,=
 and=20
distcc already scales trivially over that.  Down the road what Firmware=
 Linux=20
is working towards is multiple qemu instances running in parallel with =
a=20
central instance distributing builds to each one, so each can do its ow=
n=20
=2E/configure in parallel, distribute compilation to the distccd instan=
ces as it=20
has stuff to compile, and then package up the resulting binary into one=
 of=20
those portage tarballs and send it back to the central node to install =
on a=20
network mount that the lot of 'em can mount as build context, so the pa=
ckages=20
can get their dependencies right.  (You don't want your build taking pl=
ace in=20
a network mount, but your OS being on one you never write to isn't so b=
ad as=20
long as you have local storage to build in.)

We'll probably leverage the heck out of Portage for this, and might win=
d up=20
modifying it heavily.  Dunno yet.  (We can even force dependencies on p=
ortage=20
so it doesn't need to calculate 'em, the central node can do that and t=
hen say=20
"you have these packages, _build_"...)

But yeah, hobbyists with a laptop, network access, and a monthly budget=
 of $20=20
can do cluster builds these days.

Rob

P.S.  I still hope autoconf dies off and the world wakes up and moves a=
way=20
from that.  And from makefiles for that matter.  But in the meantime, I=
 can=20
work around it with enough effort.
