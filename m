From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: LZMA inclusion
Date: Mon, 8 Dec 2008 23:15:30 +0100
Message-ID: <20081208221530.GB4069@logfs.org>
References: <492BA3FA.9010204@openwrt.org> <200812032348.36921.lasse.collin@tukaani.org> <Pine.LNX.4.64.0812050914380.8749@vixen.sonytel.be> <200812062356.50734.lasse.collin@tukaani.org> <20081207160140.GA13387@logfs.org> <493C5D10.1040604@lougher.demon.co.uk> <20081208201734.GA4069@logfs.org> <493D95F9.7080004@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <493D95F9.7080004@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Lasse Collin <lasse.collin@tukaani.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

On Mon, 8 December 2008 21:47:37 +0000, Phillip Lougher wrote:
>=20
> Yes, I'm aware of the issues with vmalloc on older hardware.

It's not even limited to older hardware.  Blue Gene supercomputers are
large clusters of ppc440 machines.  Iirc each node consists of two 32bi=
t
cpus and up to 4GB of RAM.  Not likely to run squashfs, but hardly old
hardware either.

Or for a living room example, take a barebone with a VIA C7.  And maybe
fairly soon a large number of mobile phones will have close to 4GB RAM,
yet still run on 32bit ARM processors.  I fear those troubles are far
from gone.

J=C3=B6rn

--=20
All art is but imitation of nature.
-- Lucius Annaeus Seneca
