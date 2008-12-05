From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: LZMA inclusion
Date: Fri, 5 Dec 2008 09:31:58 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812050914380.8749@vixen.sonytel.be>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com>
 <20081203195852.GB8563@mx.loc> <200812032348.36921.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200812032348.36921.lasse.collin@tukaani.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

On Wed, 3 Dec 2008, Lasse Collin wrote:
> Once the stable release of the xz package is out, I could be willing =
to=20
> write an easy-to-use .xz decoder that is suitable for inclusion to=20
> Linux (including proper coding style with comments). I have understoo=
d,=20
> that for kernel and initramfs compression as well as for SquashFS, it=
=20
> would be enough to support single-call buffer-to-buffer decoding=20
> (comparable to uncompress() in zlib). Such code can be significantly=20
> simpler than stateful multi-call implementation.

SquashFS does not do one-shot decompression, it calls the decompressor =
multiple
times, after reading each block. I guess that can be changed, but it wi=
ll
increase memory pressure, as blocks cannot be released until the decomp=
ression
has finished.

Other compressed file systems that use (de)compression through the cryp=
to API
do use one-shot (de)compression, as the current crypto API doesn't supp=
ort
partial (de)compression. That includes Ubifs. Note that I'm working on
enhancing the crypto API to relax this limitation.

So please provide a stateful multi-call implementation ;-)

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
