From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: LZMA inclusion
Date: Sun, 7 Dec 2008 17:01:41 +0100
Message-ID: <20081207160140.GA13387@logfs.org>
References: <492BA3FA.9010204@openwrt.org> <200812032348.36921.lasse.collin@tukaani.org> <Pine.LNX.4.64.0812050914380.8749@vixen.sonytel.be> <200812062356.50734.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200812062356.50734.lasse.collin@tukaani.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

On Sat, 6 December 2008 23:56:50 +0200, Lasse Collin wrote:
>=20
> Since you are improving the crypto API, maybe it would be a good idea=
 to=20
> add a flag to tell the decoder that the whole output buffer will be=20
> kept available to the multi-call decoder.

I'm not convinced this is the right direction.  One of the constraints
of kernel programming is that large contiguous are hard to come by.  Th=
e
mm subsystem makes no guarantees that you will be able to allocate 1MiB
or contiguous memory.  On a 32bit system with highmem, it may even
become hard to get 1MiB from vmalloc.

So another approach would be to ignore the one-shot debate and
concentrate on taking a pagevec instead of a buffer (as in a void *
pointer).  That would certainly be useful for other compressed
filesystems and without checking the code (I forgot where the squashfs
git tree was) I claim it should be useful for squashfs as well.

J=C3=B6rn

--=20
It's not whether you win or lose, it's how you place the blame.
-- unknown
