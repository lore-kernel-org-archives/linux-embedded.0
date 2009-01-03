From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 13:46:00 -0600
Message-ID: <200901031346.01325.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901020513.19593.rob@landley.net> <495E3AF8.6000006@parrot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <495E3AF8.6000006@parrot.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matthieu CASTET <matthieu.castet@parrot.com>
Cc: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Friday 02 January 2009 10:04:08 Matthieu CASTET wrote:
> Rob Landley a =C3=A9crit :
> > On Friday 02 January 2009 03:26:37 Arkadiusz Miskiewicz wrote:
> >> On Friday 02 of January 2009, Rob Landley wrote:
> >>
> >> Heh,
> >
> > I believe all three scripts run under dash and busybox ash.  (The
> > timeconst.sh one needs 64 bit math which dash only provides on 64 b=
it
> > hosts, which is a regression from Red Hat 9 in 2003 by the way.
>
> With dash 0.5.4-12 (from debian sid), I seems I got the 64 bit math f=
or
> 32 bit hosts :
> $ uname -m
> i686
> $ dash -c 'echo $((1<<32))'
> 4294967296

Cool.

The "relatively recent" 32 bit image I have lying around for testing pu=
rposes=20
is xubuntu 7.10, and when dash was first introduced into ubuntu it had=20
_buckets_ of bugs.  (If you backgrounded a task with & and then hit ctr=
l-z on=20
the command line, it would suspend the backgrounded task.  It was Not R=
eady=20
for Prime Time in a big way.)  Lack of 64 bit math could easily be one =
more. =20
(It _is_ a regression vs Red Hat 9.)

The dash in ubuntu 8.10 seems to have a lot of the more obvious problem=
s=20
worked out.  Good to know. :)

That said, while testing the new round of patches against various shell=
s and=20
making it reproduce the full set of time constants that the old perl sc=
ript=20
kept cached values for (24, 32, 48, 64, 100, 122, 128, 200, 250, 256, 3=
00,=20
512, 1000, 1024, and 1200 hz), I found a bug.

The first patch is  miscalculating USEC_TO_HZ_ADJ32 for 24 HZ and 122 H=
Z.  All=20
the other values are fine.)  It's an integer overflow.  The GCD of 24 a=
nd=20
1000000 is 8, so that's 17 significant bits with a shift of 47... which=
 is=20
exactly 64 bits, but the math is _signed_, so it goes boing.

=46or the record, the reason I can't just pregenerate all these suckers=
 on a=20
system that's got an arbitrary precision calculator (ala dc) and then j=
ust=20
ship the resulting header files (more or less the what the first versio=
n of=20
that first patch did) is that some architectures (arm omap and and arm =
at91)=20
allow you to enter arbitrary HZ values in kconfig.  (Their help text sa=
ys that=20
in many cases values that aren't powers of two won't work, but nothing=20
enforces this.)  So if we didn't have the capability to dynamically gen=
erate=20
these, you could enter a .config value that would break the build.

I'd be willing to use dc in the script if A) it was mentioned in SUSv3 =
(it's=20
not, although bc is), B) the version of dc in busybox wasn't crap (it's=
=20
floating point rather than arbitrary precision, and doesn't implement t=
he left=20
shift operator).  The reason I'm not looking more closely at what SUSv3=
 has to=20
say about bc is that A) it claims to be an entire programming language,=
 which=20
is definitely overkill for this B) busybox hasn't bothered to implement=
 it so=20
it can't be all that widely used anymore.

I'll fix this and resubmit, it just wasn't ready last night.  (If the m=
erge=20
window is closing soon I could resubmit the other two with Sam's sugges=
tions=20
and resubmit this one next time 'round, but it was only a couple days t=
o write=20
in the first place, once I finally figured out what the perl version wa=
s=20
trying to _do_...)

I believe ADJ32 is the only operation with any potential to overflow.  =
The=20
pathological case for SHIFT is HZ 1, which for USEC conversions would g=
ive a=20
shift around 52 (32 significant bits plus 20 bits to divide by 1000000)=
, but=20
MUL32 still wouldn't overflow because the shift loop stops when it find=
s 32=20
significant bits, and any larger HZ value would produce a smaller shift=
=2E  The=20
problem with ADJ32 is it uses the MUL32 shift value, so a small $TO (24=
 HZ)=20
with a big $FROM (1000000 USEC, 19 signficant bits) and a small Greates=
t=20
Common Denominator (in this case 8) can overflow 64 bits.  Pathological=
 case=20
is still HZ 1.  (Or any other smallish prime number.)  If I make that w=
ork,=20
everything else has to.

So anyway, it's not _arbitrary_ precision math.  It's more like 32+20+2=
0=3D72=20
bits, and I can probably fake that pretty easily by breaking a couple o=
f=20
operations into two stages...

=46allen a bit behind on the thread since I noticed this and went off t=
o code,=20
I'll try to catch up later today.

Rob
