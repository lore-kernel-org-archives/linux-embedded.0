From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: XZ (LZMA2) decoder
Date: Thu, 26 Mar 2009 16:36:18 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903261634220.22320@vixen.sonytel.be>
References: <200903221557.33588.lasse.collin@tukaani.org> <c384c5ea0903251439k2ba46bffq729c013a48e2d6b9@mail.gmail.com> <200903261534.41887.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200903261534.41887.lasse.collin@tukaani.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="ks_c_5601-1987"
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, 26 Mar 2009, Lasse Collin wrote:
> On 2009-03-25 Leon Woestenberg wrote:
> > Is this something the linux-embedded community must pick up, or may=
be
> > even the LKML?
>=20
> In December, there was some discussion on linux-embedded about gettin=
g=20
> LZMA decoder into Linux. I understood that some of the existing patch=
es=20
> had trouble meeting the kernel quality standards. There were also=20
> requirements like support for multi-call decoding, which should be=20
> useful at least in Squashfs. I promised to write a nice-looking .xz f=
ile=20
> format decoder for Linux (.xz will replace the .lzma format) and post=
 to=20
> linux-embedded when I have something to show.

Yes, this is interesting work!

> Assuming there still is interest like there was in December, hope I w=
ill=20
> get some feedback to know if my code looks promising and possibly how=
 it=20
> should be improved to be good for in-kernel use. This is my first Lin=
ux=20
> kernel related coding project, so there probably are things (other th=
an=20
> plain bugs) that need to be fixed before the code can be considered f=
or=20
> inclusion.

I gave it a quick test on ppc64, and the kernel part built fine with sp=
arse
checking enabled (make C=3D1), without any warnings.

> If linux-embedded is not the best list for this, I can post to LKML t=
oo.=20
> However, since I promised to post at least to linux-embedded, and the=
=20
> discussion on this list in December was very helpful for me to=20
> understand what is required from an in-kernel decompressor, starting =
a=20
> new discussion first on linux-embedded sounded obvious to me.

Ccing lkml wouldn't hurt, I think.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
