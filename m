From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: LZMA inclusion
Date: Tue, 9 Dec 2008 11:37:46 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812091136080.7244@vixen.sonytel.be>
References: <492BA3FA.9010204@openwrt.org> <200812082023.23450.lasse.collin@tukaani.org>
 <493D6EB9.4040907@lougher.demon.co.uk> <200812091220.29616.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200812091220.29616.lasse.collin@tukaani.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

On Tue, 9 Dec 2008, Lasse Collin wrote:
> Phillip Lougher wrote:
> > The issue that moving to 4 KiB output buffers solves is it reduces
> > significantly the number of 1 MiB (or 128 KiB for the default block
> > size) buffers that need to be vmalloced.  Squashfs caches the last =
3
> > fragment buffers read, and moving to 4 KiB buffers eliminates these
> > vmallocs.
> >
> > Obviously moving to 4 KiB output buffers will require a 1 MiB
> > dictionary workspace to be vmalloced, but this is still much less
> > than the 3 buffers that currently need to be vmalloced.
>=20
> Thanks for explaining.
>=20
> Is it OK that the decoder allocates memory in the middle of decoding,=
 or=20
> must all the memory be preallocated when the decoder is initialized? =
If=20
> everything has to be preallocated, then the initialization function=20
> needs an argument to specify how big dictionary must be supported. It=
=20
> doesn't make sense to allocate 1 MiB just in case if the caller knows=
=20
> that 128 KiB dictionary is the maximum that will ever be needed.

If you want to make it available through the crypto API, you cannot all=
ocate
memory in the (de)compression routines theirselves, only in the initial=
ization
function.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =C2=B7 Da Vincilaan 7-D1 =C2=B7 B-1935 Zaventem =C2=
=B7 Belgium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =C2=B7 RPR Brussels
=46ortis =C2=B7 BIC GEBABEBB =C2=B7 IBAN BE41293037680010
